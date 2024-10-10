// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cms_riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getArticleListHash() => r'511615f627b6834aa3d98ecba8c65e3964096fe4';

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

///用户
///
/// Copied from [getArticleList].
@ProviderFor(getArticleList)
const getArticleListProvider = GetArticleListFamily();

///用户
///
/// Copied from [getArticleList].
class GetArticleListFamily
    extends Family<AsyncValue<PageListData<ArticleModel>>> {
  ///用户
  ///
  /// Copied from [getArticleList].
  const GetArticleListFamily();

  ///用户
  ///
  /// Copied from [getArticleList].
  GetArticleListProvider call(
    ArticleListParams params,
  ) {
    return GetArticleListProvider(
      params,
    );
  }

  @override
  GetArticleListProvider getProviderOverride(
    covariant GetArticleListProvider provider,
  ) {
    return call(
      provider.params,
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
  String? get name => r'getArticleListProvider';
}

///用户
///
/// Copied from [getArticleList].
class GetArticleListProvider
    extends AutoDisposeFutureProvider<PageListData<ArticleModel>> {
  ///用户
  ///
  /// Copied from [getArticleList].
  GetArticleListProvider(
    ArticleListParams params,
  ) : this._internal(
          (ref) => getArticleList(
            ref as GetArticleListRef,
            params,
          ),
          from: getArticleListProvider,
          name: r'getArticleListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getArticleListHash,
          dependencies: GetArticleListFamily._dependencies,
          allTransitiveDependencies:
              GetArticleListFamily._allTransitiveDependencies,
          params: params,
        );

  GetArticleListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final ArticleListParams params;

  @override
  Override overrideWith(
    FutureOr<PageListData<ArticleModel>> Function(GetArticleListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetArticleListProvider._internal(
        (ref) => create(ref as GetArticleListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PageListData<ArticleModel>> createElement() {
    return _GetArticleListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetArticleListProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetArticleListRef
    on AutoDisposeFutureProviderRef<PageListData<ArticleModel>> {
  /// The parameter `params` of this provider.
  ArticleListParams get params;
}

class _GetArticleListProviderElement
    extends AutoDisposeFutureProviderElement<PageListData<ArticleModel>>
    with GetArticleListRef {
  _GetArticleListProviderElement(super.provider);

  @override
  ArticleListParams get params => (origin as GetArticleListProvider).params;
}

String _$getArticleByIdHash() => r'a7e9ffb90d546b30305b4082131b0b4a179a29c6';

/// See also [getArticleById].
@ProviderFor(getArticleById)
const getArticleByIdProvider = GetArticleByIdFamily();

/// See also [getArticleById].
class GetArticleByIdFamily extends Family<AsyncValue<ArticleModel?>> {
  /// See also [getArticleById].
  const GetArticleByIdFamily();

  /// See also [getArticleById].
  GetArticleByIdProvider call(
    int id,
  ) {
    return GetArticleByIdProvider(
      id,
    );
  }

  @override
  GetArticleByIdProvider getProviderOverride(
    covariant GetArticleByIdProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getArticleByIdProvider';
}

/// See also [getArticleById].
class GetArticleByIdProvider extends AutoDisposeFutureProvider<ArticleModel?> {
  /// See also [getArticleById].
  GetArticleByIdProvider(
    int id,
  ) : this._internal(
          (ref) => getArticleById(
            ref as GetArticleByIdRef,
            id,
          ),
          from: getArticleByIdProvider,
          name: r'getArticleByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getArticleByIdHash,
          dependencies: GetArticleByIdFamily._dependencies,
          allTransitiveDependencies:
              GetArticleByIdFamily._allTransitiveDependencies,
          id: id,
        );

  GetArticleByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<ArticleModel?> Function(GetArticleByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetArticleByIdProvider._internal(
        (ref) => create(ref as GetArticleByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ArticleModel?> createElement() {
    return _GetArticleByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetArticleByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetArticleByIdRef on AutoDisposeFutureProviderRef<ArticleModel?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetArticleByIdProviderElement
    extends AutoDisposeFutureProviderElement<ArticleModel?>
    with GetArticleByIdRef {
  _GetArticleByIdProviderElement(super.provider);

  @override
  int get id => (origin as GetArticleByIdProvider).id;
}

String _$setArticleInfoHash() => r'a3c07691f52bfd8960a77ce69e8678c19bdde206';

/// See also [setArticleInfo].
@ProviderFor(setArticleInfo)
const setArticleInfoProvider = SetArticleInfoFamily();

/// See also [setArticleInfo].
class SetArticleInfoFamily extends Family<AsyncValue<bool>> {
  /// See also [setArticleInfo].
  const SetArticleInfoFamily();

  /// See also [setArticleInfo].
  SetArticleInfoProvider call(
    SetArticleParams params,
  ) {
    return SetArticleInfoProvider(
      params,
    );
  }

  @override
  SetArticleInfoProvider getProviderOverride(
    covariant SetArticleInfoProvider provider,
  ) {
    return call(
      provider.params,
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
  String? get name => r'setArticleInfoProvider';
}

/// See also [setArticleInfo].
class SetArticleInfoProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [setArticleInfo].
  SetArticleInfoProvider(
    SetArticleParams params,
  ) : this._internal(
          (ref) => setArticleInfo(
            ref as SetArticleInfoRef,
            params,
          ),
          from: setArticleInfoProvider,
          name: r'setArticleInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setArticleInfoHash,
          dependencies: SetArticleInfoFamily._dependencies,
          allTransitiveDependencies:
              SetArticleInfoFamily._allTransitiveDependencies,
          params: params,
        );

  SetArticleInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final SetArticleParams params;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SetArticleInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetArticleInfoProvider._internal(
        (ref) => create(ref as SetArticleInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SetArticleInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetArticleInfoProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SetArticleInfoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `params` of this provider.
  SetArticleParams get params;
}

class _SetArticleInfoProviderElement
    extends AutoDisposeFutureProviderElement<bool> with SetArticleInfoRef {
  _SetArticleInfoProviderElement(super.provider);

  @override
  SetArticleParams get params => (origin as SetArticleInfoProvider).params;
}

String _$getChannelListHash() => r'8001089186a12dc40447312453f1e2772a7de7ad';

/// See also [getChannelList].
@ProviderFor(getChannelList)
final getChannelListProvider =
    AutoDisposeFutureProvider<PageListData<ChannelModel>>.internal(
  getChannelList,
  name: r'getChannelListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getChannelListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetChannelListRef
    = AutoDisposeFutureProviderRef<PageListData<ChannelModel>>;
String _$setChannelInfoHash() => r'b766ab953b0e663c1da676a2b41f0261cd1ef1e8';

/// See also [setChannelInfo].
@ProviderFor(setChannelInfo)
const setChannelInfoProvider = SetChannelInfoFamily();

/// See also [setChannelInfo].
class SetChannelInfoFamily extends Family<AsyncValue<bool>> {
  /// See also [setChannelInfo].
  const SetChannelInfoFamily();

  /// See also [setChannelInfo].
  SetChannelInfoProvider call(
    SetChannelParams params,
  ) {
    return SetChannelInfoProvider(
      params,
    );
  }

  @override
  SetChannelInfoProvider getProviderOverride(
    covariant SetChannelInfoProvider provider,
  ) {
    return call(
      provider.params,
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
  String? get name => r'setChannelInfoProvider';
}

/// See also [setChannelInfo].
class SetChannelInfoProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [setChannelInfo].
  SetChannelInfoProvider(
    SetChannelParams params,
  ) : this._internal(
          (ref) => setChannelInfo(
            ref as SetChannelInfoRef,
            params,
          ),
          from: setChannelInfoProvider,
          name: r'setChannelInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setChannelInfoHash,
          dependencies: SetChannelInfoFamily._dependencies,
          allTransitiveDependencies:
              SetChannelInfoFamily._allTransitiveDependencies,
          params: params,
        );

  SetChannelInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final SetChannelParams params;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SetChannelInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetChannelInfoProvider._internal(
        (ref) => create(ref as SetChannelInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SetChannelInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetChannelInfoProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SetChannelInfoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `params` of this provider.
  SetChannelParams get params;
}

class _SetChannelInfoProviderElement
    extends AutoDisposeFutureProviderElement<bool> with SetChannelInfoRef {
  _SetChannelInfoProviderElement(super.provider);

  @override
  SetChannelParams get params => (origin as SetChannelInfoProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
