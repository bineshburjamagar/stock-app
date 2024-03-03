import 'package:stock_app/core/models/models.dart';

class ChartModel {
  final String ticker;
  final double percentageChange;
  final List<ChartDatum> chartData;

  ChartModel({
    required this.ticker,
    required this.percentageChange,
    required this.chartData,
  });

  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
        ticker: json["ticker"],
        percentageChange: json["percentageChange"]?.toDouble(),
        chartData: List<ChartDatum>.from(
            json["chartData"].map((x) => ChartDatum.fromJson(x))),
      );
}

enum ChartType {
  oneDay,
  oneMonth,
  threeMonth,
  oneYear,
  fiveYear,
}

class ChatTypeModel {
  final ChartType chartType;
  final String title;

  ChatTypeModel({required this.chartType, required this.title});
}

List<ChatTypeModel> chartTypeModelList = [
  ChatTypeModel(
    chartType: ChartType.oneDay,
    title: '1d',
  ),
  ChatTypeModel(
    chartType: ChartType.oneMonth,
    title: '1m',
  ),
  ChatTypeModel(
    chartType: ChartType.threeMonth,
    title: '3m',
  ),
  ChatTypeModel(
    chartType: ChartType.oneYear,
    title: '1y',
  ),
  ChatTypeModel(
    chartType: ChartType.fiveYear,
    title: '5y',
  ),
];
