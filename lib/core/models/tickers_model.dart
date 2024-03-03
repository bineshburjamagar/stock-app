class TickersModel {
  final String? ticker;
  final String? tickerName;
  final String? icon;
  final String? sector;
  final double? pointChange;
  final double? percentageChange;

  TickersModel({
    required this.ticker,
    required this.tickerName,
    required this.icon,
    required this.sector,
    required this.pointChange,
    required this.percentageChange,
  });

  factory TickersModel.fromJson(Map<String, dynamic> json) => TickersModel(
        ticker: json["ticker"],
        tickerName: json["ticker_name"],
        icon: json["icon"],
        sector: json["sector"],
        pointChange: json["point_change"]?.toDouble(),
        percentageChange: json["percentage_change"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "ticker": ticker,
        "ticker_name": tickerName,
        "icon": icon,
        "sector": sector,
        "point_change": pointChange,
        "percentage_change": percentageChange,
      };
}
