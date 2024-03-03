import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:stock_app/core/apis/apis.dart';
import 'package:stock_app/core/models/models.dart';
import 'package:stock_app/screens/screens.dart';
import 'package:stock_app/widgets/widgets.dart';

class WatchListPage extends ConsumerWidget {
  const WatchListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchList = ref.watch(watchListDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Watchlist',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          _buildAddAndRemoveTicker(context, ref),
          const SizedBox(height: 20.0),
          if (watchList.isNotEmpty)
            ...watchList.map(
              (e) {
                return _buildWatchListTile(e, context, ref);
              },
            )
          else
            const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 200.0),
              child: Text(
                'No Selected Tickers',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )),
        ],
      ),
    );
  }

  Padding _buildWatchListTile(
      WatchListModel e, BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(10.0),
        child: ListTile(
          onTap: () {
            BotToast.showLoading();
            ref
                .read(
              chartModelProvider(chartType: '1d', ticker: e.ticker ?? '')
                  .future,
            )
                .then((value) {
              BotToast.closeAllLoading();
              ref.read(chartProvider.notifier).update((state) => value);

              ref.invalidate(activeChart);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WatchListDetailPage(watchListModel: e);
                  },
                ),
              );
              return null;
            }).onError((error, stackTrace) {
              BotToast.closeAllLoading();
              BotToast.showText(text: 'Something went wrong');
            });
          },
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          leading: SizedBox(
            width: 100.0,
            child: Row(
              children: [
                CircleAvatar(
                  child: Image.network(
                    'https://${e.icon}',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${e.ticker}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        '${e.tickerName}',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          title: SizedBox(
              width: 50.0,
              height: 50.0,
              child: WatchListChartWidget(
                chartDatum: e.chartData,
              )),
          trailing: SizedBox(
            width: 100.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  NumberFormat.currency(
                          locale: 'en_US', decimalDigits: 2, name: '')
                      .format(e.amount),
                  style: const TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.w600),
                  maxLines: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${e.pointChange}",
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      "${e.percentageChange}%",
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildAddAndRemoveTicker(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const TickersDropdownDialog();
                  });
            },
            icon: const Icon(Icons.add),
          ),
        ),
        CircleAvatar(
          child: IconButton(
            onPressed: () {
              ref.invalidate(watchListDataProvider);
              ref.invalidate(selectedTickerProvider);
            },
            icon: const Icon(Icons.close),
          ),
        ),
      ],
    );
  }
}
