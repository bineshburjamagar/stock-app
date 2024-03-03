class WatchListModel {
  final String? ticker;
  final String? indices;
  final String? tickerName;
  final num ltp;
  final num ltv;
  final num pointChange;
  final num percentageChange;
  final num open;
  final num high;
  final num low;
  final num volume;
  final num previousClosing;
  final DateTime? calculatedOn;
  final num amount;
  final String? datasource;
  final String? icon;
  final List<ChartDatum> chartData;

  WatchListModel({
    required this.ticker,
    required this.indices,
    required this.tickerName,
    required this.ltp,
    required this.ltv,
    required this.pointChange,
    required this.percentageChange,
    required this.open,
    required this.high,
    required this.low,
    required this.volume,
    required this.previousClosing,
    required this.calculatedOn,
    required this.amount,
    required this.datasource,
    required this.icon,
    required this.chartData,
  });

  factory WatchListModel.fromJson(Map<String, dynamic> json) => WatchListModel(
        ticker: json["ticker"],
        indices: json["indices"],
        tickerName: json["ticker_name"],
        ltp: json["ltp"]?.toDouble(),
        ltv: json["ltv"],
        pointChange: json["point_change"].toDouble(),
        percentageChange: json["percentage_change"]?.toDouble(),
        open: json["open"],
        high: json["high"]?.toDouble(),
        low: json["low"],
        volume: json["volume"],
        previousClosing: json["previousClosing"]?.toDouble(),
        calculatedOn: DateTime.parse(json["calculated_on"]),
        amount: json["amount"]?.toDouble(),
        datasource: json["datasource"],
        icon: json["icon"],
        chartData: List<ChartDatum>.from(json["chartData"] != null
            ? json["chartData"].map((x) => ChartDatum.fromJson(x))
            : []),
      );
}

class ChartDatum {
  final value;
  final DateTime timestamp;

  ChartDatum({
    required this.value,
    required this.timestamp,
  });

  factory ChartDatum.fromJson(Map<String, dynamic> json) => ChartDatum(
        value: json["value"]?.toDouble(),
        timestamp: DateTime.parse(json["timestamp"]),
      );
}
