class SecuritiesStatsModel {
  final String ticker;
  final int ltp;
  final double pointChange;
  final double percentageChange;
  final double volume;
  final int sharesTraded;
  final int marketCap;
  final String updatedOn;

  SecuritiesStatsModel({
    required this.ticker,
    required this.ltp,
    required this.pointChange,
    required this.percentageChange,
    required this.volume,
    required this.sharesTraded,
    required this.marketCap,
    required this.updatedOn,
  });

  factory SecuritiesStatsModel.fromJson(Map<String, dynamic> json) =>
      SecuritiesStatsModel(
        ticker: json["ticker"],
        ltp: json["ltp"],
        pointChange: json["point_change"]?.toDouble(),
        percentageChange: json["percentage_change"]?.toDouble(),
        volume: json["volume"]?.toDouble(),
        sharesTraded: json["shares_traded"],
        marketCap: json["market_cap"],
        updatedOn: json["updated_on"],
      );

  Map<String, dynamic> toJson() => {
        "ticker": ticker,
        "ltp": ltp,
        "point_change": pointChange,
        "percentage_change": percentageChange,
        "volume": volume,
        "shares_traded": sharesTraded,
        "market_cap": marketCap,
        "updated_on": updatedOn,
      };
}
