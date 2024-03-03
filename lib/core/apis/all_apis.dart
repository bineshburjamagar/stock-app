import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_app/core/apis/apis.dart';
import 'package:stock_app/core/models/models.dart';
part 'all_apis.g.dart';

final allApiProvider = Provider<AllApi>((ref) {
  return AllApi();
});

@riverpod
Future<List<TickersModel>> tickersModel(TickersModelRef ref) {
  ref.keepAlive();
  return ref.read(allApiProvider).getChapters();
}

@riverpod
Future<List<WatchListModel>> watchlistModel(WatchlistModelRef ref,
    {required Map<String, dynamic> data}) {
  ref.keepAlive();
  return ref.read(allApiProvider).getWatchList(data: data);
}

@riverpod
Future<ChartModel> chartModel(
  ChartModelRef ref, {
  required String ticker,
  required String chartType,
}) {
  ref.keepAlive();
  return ref
      .read(allApiProvider)
      .getChartModel(chartType: chartType, ticker: ticker);
}

@riverpod
Future<SecuritiesStatsModel> secStatsModel(
  SecStatsModelRef ref, {
  required String ticker,
}) {
  ref.keepAlive();
  return ref.read(allApiProvider).getSecStats(ticker: ticker);
}

class AllApi {
  Future<List<TickersModel>> getChapters() async {
    List<TickersModel> chapterModels = [];
    var res = await ApiBase.getRequest(path: Endpoint.tickers);

    for (var e in res.data['response']) {
      chapterModels.add(TickersModel.fromJson(e));
    }

    return chapterModels;
  }

  Future<List<WatchListModel>> getWatchList(
      {required Map<String, dynamic> data}) async {
    List<WatchListModel> watchlistModel = [];

    var res = await ApiBase.postRequest(path: Endpoint.watchList, data: data);

    for (var e in res.data['response']) {
      watchlistModel.add(WatchListModel.fromJson(e));
    }

    return watchlistModel;
  }

  Future<ChartModel> getChartModel({
    required String ticker,
    required String chartType,
  }) async {
    var res =
        await ApiBase.getRequest(path: "${Endpoint.chart}$ticker/$chartType/");

    return ChartModel.fromJson(res.data['response']);
  }

  Future<SecuritiesStatsModel> getSecStats({
    required String ticker,
  }) async {
    var res = await ApiBase.getRequest(path: "${Endpoint.secStats}$ticker/");

    return SecuritiesStatsModel.fromJson(res.data['response']);
  }
}
