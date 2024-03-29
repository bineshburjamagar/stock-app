import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:stock_app/core/apis/apis.dart';
import 'package:stock_app/core/models/models.dart';
import 'package:stock_app/widgets/widgets.dart';

class WatchListDetailPage extends ConsumerWidget {
  const WatchListDetailPage({
    super.key,
    required this.watchListModel,
  });

  final WatchListModel watchListModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartModel = ref.watch(chartProvider);

    final chartType = ref.watch(activeChart);
    final secStats =
        ref.watch(secStatsModelProvider(ticker: watchListModel.ticker ?? ''));
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: const Text('Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        children: [
          Text(
            watchListModel.ticker ?? '',
            style: const TextStyle(fontSize: 18.0),
          ),
          Text(
            NumberFormat.currency(locale: 'en_US', decimalDigits: 2, name: '')
                .format(watchListModel.amount),
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Text(
                "${watchListModel.percentageChange}%",
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(width: 20.0),
              Row(
                children: [
                  Text(
                    "${watchListModel.pointChange}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 30.0,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_outward_rounded,
                    color: Colors.green,
                    size: 30.0,
                  )
                ],
              ),
            ],
          ),
          Text(
            "As on ${DateFormat('d MMM, yyyy').format(watchListModel.calculatedOn ?? DateTime.now())} | ${DateFormat('hh:mm').format(
              watchListModel.calculatedOn ?? DateTime.now(),
            )}",
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 20.0),
          if (chartModel != null) ...[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 200.0,
                  child: WatchListChartWidget(
                    chartDatum: chartModel.chartData,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...chartTypeModelList.map((e) {
                      return InkWell(
                        onTap: () {
                          ref
                              .read(
                            chartModelProvider(
                                    chartType: e.title,
                                    ticker: watchListModel.ticker ?? "")
                                .future,
                          )
                              .then((value) {
                            BotToast.closeAllLoading();
                            ref
                                .read(chartProvider.notifier)
                                .update((state) => value);

                            ref
                                .read(activeChart.notifier)
                                .update((state) => e.chartType);
                          }).onError((error, stackTrace) {
                            BotToast.closeAllLoading();
                            BotToast.showText(text: 'Something went wrong');
                          });
                        },
                        child: Container(
                          color: chartType == e.chartType
                              ? Colors.black.withOpacity(0.2)
                              : null,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Text(
                            e.title.toUpperCase(),
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                      );
                    }),
                  ],
                )
              ],
            ),
          ],
          const SizedBox(height: 20.0),
          secStats.when(data: (data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatsData(
                      title: 'Shares Traded',
                      data: data.sharesTraded,
                    ),
                    _buildStatsData(
                      title: 'Volume',
                      data: int.tryParse("${data.volume.toInt()}") ?? 0,
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                _buildStatsData(
                  title: 'Market Cap',
                  data: data.marketCap,
                )
              ],
            );
          }, error: (e, r) {
            return Text(e.toString());
          }, loading: () {
            return const SizedBox();
          }),
        ],
      ),
    );
  }

  Widget _buildStatsData({
    required String title,
    required num data,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18.0),
        ),
        Text(
          NumberFormat.currency(locale: 'en_US', decimalDigits: 0, name: '')
              .format(data),
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
