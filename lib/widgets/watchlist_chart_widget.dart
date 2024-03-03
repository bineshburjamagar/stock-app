import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../core/models/models.dart';

final chartProvider = StateProvider<ChartModel?>((ref) {
  return null;
});
final activeChart = StateProvider<ChartType>((ref) {
  return ChartType.oneDay;
});

class WatchListChartWidget extends ConsumerWidget {
  const WatchListChartWidget({
    super.key,
    required this.chartDatum,
  });
  final List<ChartDatum> chartDatum;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: const DateTimeAxis(
        isVisible: false,
      ),
      primaryYAxis: const NumericAxis(
        isVisible: false,
      ),
      series: getDefaultCrossHairSeries(data: chartDatum),
    );
  }

  List<AreaSeries<ChartDatum, DateTime>> getDefaultCrossHairSeries({
    required List<ChartDatum> data,
  }) {
    return <AreaSeries<ChartDatum, DateTime>>[
      AreaSeries<ChartDatum, DateTime>(
          dataSource: data,
          borderColor: Colors.green,
          animationDelay: 0.1,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green.withOpacity(1),
              Colors.green.withOpacity(0),
            ],
          ),
          xValueMapper: (ChartDatum sales, _) => sales.timestamp,
          yValueMapper: (ChartDatum sales, _) => sales.value)
    ];
  }
}
