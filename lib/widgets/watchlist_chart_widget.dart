import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../core/apis/apis.dart';
import '../core/models/models.dart';

final chartProvider = StateProvider<ChartModel?>((ref) {
  return null;
});
final activeChart = StateProvider<ChartType>((ref) {
  return ChartType.oneDay;
});

class WatchListChartWidget extends ConsumerWidget {
  const WatchListChartWidget(
      {super.key,
      required this.chartModel,
      required this.chartType,
      required this.ticker});
  final ChartModel chartModel;
  final ChartType chartType;
  final String ticker;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200.0,
          child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            backgroundColor: Colors.blue.withOpacity(0.1),
            primaryXAxis: const DateTimeAxis(
              isVisible: false,
              majorGridLines: MajorGridLines(width: 0),
              edgeLabelPlacement: EdgeLabelPlacement.hide,
              interactiveTooltip: InteractiveTooltip(),
            ),
            primaryYAxis: const NumericAxis(
              axisLine: AxisLine(width: 0),
              isVisible: false,
              majorTickLines: MajorTickLines(width: 0),
            ),
            series: getDefaultCrossHairSeries(data: chartModel.chartData),
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
                    chartModelProvider(chartType: e.title, ticker: ticker)
                        .future,
                  )
                      .then((value) {
                    BotToast.closeAllLoading();
                    ref.read(chartProvider.notifier).update((state) => value);

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
        ),
      ],
    );
  }

  List<LineSeries<ChartDatum, DateTime>> getDefaultCrossHairSeries({
    required List<ChartDatum> data,
  }) {
    return <LineSeries<ChartDatum, DateTime>>[
      LineSeries<ChartDatum, DateTime>(
          dataSource: data,
          xValueMapper: (ChartDatum sales, _) => sales.timestamp,
          yValueMapper: (ChartDatum sales, _) => sales.value)
    ];
  }
}
