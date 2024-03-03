import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:stock_app/core/apis/apis.dart';
import 'package:stock_app/core/models/models.dart';

final selectedTickerProvider = StateProvider<List<ValueItem<String>>>((ref) {
  return [];
});

final watchListDataProvider = StateProvider<List<WatchListModel>>((ref) {
  return [];
});

class TickersDropdownDialog extends ConsumerWidget {
  const TickersDropdownDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTicker = ref.watch(selectedTickerProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Ticker',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10.0),
          ref.watch(tickersModelProvider).when(
            data: (data) {
              return MultiSelectDropDown<String>(
                onOptionSelected: (List<ValueItem<String>> selectedOptions) {
                  ref
                      .read(selectedTickerProvider.notifier)
                      .update((state) => selectedOptions);
                },
                options: data
                    .map(
                      (e) => ValueItem(
                        label: e.tickerName ?? '',
                        value: e.ticker,
                      ),
                    )
                    .toList(),
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                dropdownHeight: 300,
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptionIcon: const Icon(Icons.check_circle),
                searchEnabled: true,
                selectedOptions: selectedTicker,
              );
            },
            error: (error, stackTrace) {
              return Text('$error');
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          const SizedBox(
            height: 50.0,
          ),
          Center(
            child: SizedBox(
              width: double.infinity,
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  log(selectedTicker.map((e) => e.value).toList().toString());
                  BotToast.showLoading();
                  ref
                      .read(watchlistModelProvider(data: {
                    "tickerList": selectedTicker.map((e) => e.value).toList()
                  }).future)
                      .then((value) {
                    BotToast.closeAllLoading();

                    ref
                        .read(watchListDataProvider.notifier)
                        .update((state) => value);
                    Navigator.pop(context);
                  }).onError((error, stackTrace) {
                    BotToast.closeAllLoading();

                    BotToast.showText(text: 'Something went wrong');
                  });
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
