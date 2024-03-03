// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_apis.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tickersModelHash() => r'e82bf9d57e37cf0cec90f4f7b46529125d527997';

/// See also [tickersModel].
@ProviderFor(tickersModel)
final tickersModelProvider =
    AutoDisposeFutureProvider<List<TickersModel>>.internal(
  tickersModel,
  name: r'tickersModelProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tickersModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TickersModelRef = AutoDisposeFutureProviderRef<List<TickersModel>>;
String _$watchlistModelHash() => r'd7949027981bb50f7a33ea8a307892e8cbb7dd6e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [watchlistModel].
@ProviderFor(watchlistModel)
const watchlistModelProvider = WatchlistModelFamily();

/// See also [watchlistModel].
class WatchlistModelFamily extends Family<AsyncValue<List<WatchListModel>>> {
  /// See also [watchlistModel].
  const WatchlistModelFamily();

  /// See also [watchlistModel].
  WatchlistModelProvider call({
    required Map<String, dynamic> data,
  }) {
    return WatchlistModelProvider(
      data: data,
    );
  }

  @override
  WatchlistModelProvider getProviderOverride(
    covariant WatchlistModelProvider provider,
  ) {
    return call(
      data: provider.data,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchlistModelProvider';
}

/// See also [watchlistModel].
class WatchlistModelProvider
    extends AutoDisposeFutureProvider<List<WatchListModel>> {
  /// See also [watchlistModel].
  WatchlistModelProvider({
    required Map<String, dynamic> data,
  }) : this._internal(
          (ref) => watchlistModel(
            ref as WatchlistModelRef,
            data: data,
          ),
          from: watchlistModelProvider,
          name: r'watchlistModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchlistModelHash,
          dependencies: WatchlistModelFamily._dependencies,
          allTransitiveDependencies:
              WatchlistModelFamily._allTransitiveDependencies,
          data: data,
        );

  WatchlistModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final Map<String, dynamic> data;

  @override
  Override overrideWith(
    FutureOr<List<WatchListModel>> Function(WatchlistModelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchlistModelProvider._internal(
        (ref) => create(ref as WatchlistModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        data: data,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<WatchListModel>> createElement() {
    return _WatchlistModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchlistModelProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchlistModelRef on AutoDisposeFutureProviderRef<List<WatchListModel>> {
  /// The parameter `data` of this provider.
  Map<String, dynamic> get data;
}

class _WatchlistModelProviderElement
    extends AutoDisposeFutureProviderElement<List<WatchListModel>>
    with WatchlistModelRef {
  _WatchlistModelProviderElement(super.provider);

  @override
  Map<String, dynamic> get data => (origin as WatchlistModelProvider).data;
}

String _$chartModelHash() => r'f8ff93cbfc29bad249a6217b804c471e63d7ed34';

/// See also [chartModel].
@ProviderFor(chartModel)
const chartModelProvider = ChartModelFamily();

/// See also [chartModel].
class ChartModelFamily extends Family<AsyncValue<ChartModel>> {
  /// See also [chartModel].
  const ChartModelFamily();

  /// See also [chartModel].
  ChartModelProvider call({
    required String ticker,
    required String chartType,
  }) {
    return ChartModelProvider(
      ticker: ticker,
      chartType: chartType,
    );
  }

  @override
  ChartModelProvider getProviderOverride(
    covariant ChartModelProvider provider,
  ) {
    return call(
      ticker: provider.ticker,
      chartType: provider.chartType,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chartModelProvider';
}

/// See also [chartModel].
class ChartModelProvider extends AutoDisposeFutureProvider<ChartModel> {
  /// See also [chartModel].
  ChartModelProvider({
    required String ticker,
    required String chartType,
  }) : this._internal(
          (ref) => chartModel(
            ref as ChartModelRef,
            ticker: ticker,
            chartType: chartType,
          ),
          from: chartModelProvider,
          name: r'chartModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chartModelHash,
          dependencies: ChartModelFamily._dependencies,
          allTransitiveDependencies:
              ChartModelFamily._allTransitiveDependencies,
          ticker: ticker,
          chartType: chartType,
        );

  ChartModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ticker,
    required this.chartType,
  }) : super.internal();

  final String ticker;
  final String chartType;

  @override
  Override overrideWith(
    FutureOr<ChartModel> Function(ChartModelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChartModelProvider._internal(
        (ref) => create(ref as ChartModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ticker: ticker,
        chartType: chartType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ChartModel> createElement() {
    return _ChartModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChartModelProvider &&
        other.ticker == ticker &&
        other.chartType == chartType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ticker.hashCode);
    hash = _SystemHash.combine(hash, chartType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChartModelRef on AutoDisposeFutureProviderRef<ChartModel> {
  /// The parameter `ticker` of this provider.
  String get ticker;

  /// The parameter `chartType` of this provider.
  String get chartType;
}

class _ChartModelProviderElement
    extends AutoDisposeFutureProviderElement<ChartModel> with ChartModelRef {
  _ChartModelProviderElement(super.provider);

  @override
  String get ticker => (origin as ChartModelProvider).ticker;
  @override
  String get chartType => (origin as ChartModelProvider).chartType;
}

String _$secStatsModelHash() => r'32945f4292bbf472d296481725a1914013aa8a78';

/// See also [secStatsModel].
@ProviderFor(secStatsModel)
const secStatsModelProvider = SecStatsModelFamily();

/// See also [secStatsModel].
class SecStatsModelFamily extends Family<AsyncValue<SecuritiesStatsModel>> {
  /// See also [secStatsModel].
  const SecStatsModelFamily();

  /// See also [secStatsModel].
  SecStatsModelProvider call({
    required String ticker,
  }) {
    return SecStatsModelProvider(
      ticker: ticker,
    );
  }

  @override
  SecStatsModelProvider getProviderOverride(
    covariant SecStatsModelProvider provider,
  ) {
    return call(
      ticker: provider.ticker,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'secStatsModelProvider';
}

/// See also [secStatsModel].
class SecStatsModelProvider
    extends AutoDisposeFutureProvider<SecuritiesStatsModel> {
  /// See also [secStatsModel].
  SecStatsModelProvider({
    required String ticker,
  }) : this._internal(
          (ref) => secStatsModel(
            ref as SecStatsModelRef,
            ticker: ticker,
          ),
          from: secStatsModelProvider,
          name: r'secStatsModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$secStatsModelHash,
          dependencies: SecStatsModelFamily._dependencies,
          allTransitiveDependencies:
              SecStatsModelFamily._allTransitiveDependencies,
          ticker: ticker,
        );

  SecStatsModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ticker,
  }) : super.internal();

  final String ticker;

  @override
  Override overrideWith(
    FutureOr<SecuritiesStatsModel> Function(SecStatsModelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SecStatsModelProvider._internal(
        (ref) => create(ref as SecStatsModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ticker: ticker,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SecuritiesStatsModel> createElement() {
    return _SecStatsModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SecStatsModelProvider && other.ticker == ticker;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ticker.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SecStatsModelRef on AutoDisposeFutureProviderRef<SecuritiesStatsModel> {
  /// The parameter `ticker` of this provider.
  String get ticker;
}

class _SecStatsModelProviderElement
    extends AutoDisposeFutureProviderElement<SecuritiesStatsModel>
    with SecStatsModelRef {
  _SecStatsModelProviderElement(super.provider);

  @override
  String get ticker => (origin as SecStatsModelProvider).ticker;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
