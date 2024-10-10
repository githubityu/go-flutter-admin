// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAuthorityListHash() => r'a46bf5d9da23d99acb7856d2e1cd7e1cff8eb151';

///用户
///
/// Copied from [getAuthorityList].
@ProviderFor(getAuthorityList)
final getAuthorityListProvider =
    AutoDisposeFutureProvider<List<ListItemAuthority>>.internal(
  getAuthorityList,
  name: r'getAuthorityListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAuthorityListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAuthorityListRef
    = AutoDisposeFutureProviderRef<List<ListItemAuthority>>;
String _$getApiListHash() => r'14ab9cf9e1d794cef69ead48e376208b37be3d99';

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

/// See also [getApiList].
@ProviderFor(getApiList)
const getApiListProvider = GetApiListFamily();

/// See also [getApiList].
class GetApiListFamily extends Family<AsyncValue<PageListData?>> {
  /// See also [getApiList].
  const GetApiListFamily();

  /// See also [getApiList].
  GetApiListProvider call(
    GetApiListParams params,
  ) {
    return GetApiListProvider(
      params,
    );
  }

  @override
  GetApiListProvider getProviderOverride(
    covariant GetApiListProvider provider,
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
  String? get name => r'getApiListProvider';
}

/// See also [getApiList].
class GetApiListProvider extends AutoDisposeFutureProvider<PageListData?> {
  /// See also [getApiList].
  GetApiListProvider(
    GetApiListParams params,
  ) : this._internal(
          (ref) => getApiList(
            ref as GetApiListRef,
            params,
          ),
          from: getApiListProvider,
          name: r'getApiListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getApiListHash,
          dependencies: GetApiListFamily._dependencies,
          allTransitiveDependencies:
              GetApiListFamily._allTransitiveDependencies,
          params: params,
        );

  GetApiListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final GetApiListParams params;

  @override
  Override overrideWith(
    FutureOr<PageListData?> Function(GetApiListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetApiListProvider._internal(
        (ref) => create(ref as GetApiListRef),
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
  AutoDisposeFutureProviderElement<PageListData?> createElement() {
    return _GetApiListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetApiListProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetApiListRef on AutoDisposeFutureProviderRef<PageListData?> {
  /// The parameter `params` of this provider.
  GetApiListParams get params;
}

class _GetApiListProviderElement
    extends AutoDisposeFutureProviderElement<PageListData?> with GetApiListRef {
  _GetApiListProviderElement(super.provider);

  @override
  GetApiListParams get params => (origin as GetApiListProvider).params;
}

String _$getMenusHash() => r'537917328a8abf5f81f75b936f82cc21d021aef9';

///菜单
///
/// Copied from [getMenus].
@ProviderFor(getMenus)
final getMenusProvider =
    AutoDisposeFutureProvider<List<DataMenusItem>>.internal(
  getMenus,
  name: r'getMenusProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getMenusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMenusRef = AutoDisposeFutureProviderRef<List<DataMenusItem>>;
String _$getMenusPageHash() => r'eb2dddaba62f411452120f27934b0d36ff228b2f';

/// See also [getMenusPage].
@ProviderFor(getMenusPage)
final getMenusPageProvider =
    AutoDisposeFutureProvider<List<DataMenusItem>>.internal(
  getMenusPage,
  name: r'getMenusPageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getMenusPageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMenusPageRef = AutoDisposeFutureProviderRef<List<DataMenusItem>>;
String _$getElTreeMenusHash() => r'e156ba42b26fff8cd7bc6cc3098b56da08d0cc8c';

/// See also [getElTreeMenus].
@ProviderFor(getElTreeMenus)
const getElTreeMenusProvider = GetElTreeMenusFamily();

/// See also [getElTreeMenus].
class GetElTreeMenusFamily extends Family<AsyncValue<TreeMenusModel?>> {
  /// See also [getElTreeMenus].
  const GetElTreeMenusFamily();

  /// See also [getElTreeMenus].
  GetElTreeMenusProvider call({
    int? authorityId,
  }) {
    return GetElTreeMenusProvider(
      authorityId: authorityId,
    );
  }

  @override
  GetElTreeMenusProvider getProviderOverride(
    covariant GetElTreeMenusProvider provider,
  ) {
    return call(
      authorityId: provider.authorityId,
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
  String? get name => r'getElTreeMenusProvider';
}

/// See also [getElTreeMenus].
class GetElTreeMenusProvider
    extends AutoDisposeFutureProvider<TreeMenusModel?> {
  /// See also [getElTreeMenus].
  GetElTreeMenusProvider({
    int? authorityId,
  }) : this._internal(
          (ref) => getElTreeMenus(
            ref as GetElTreeMenusRef,
            authorityId: authorityId,
          ),
          from: getElTreeMenusProvider,
          name: r'getElTreeMenusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getElTreeMenusHash,
          dependencies: GetElTreeMenusFamily._dependencies,
          allTransitiveDependencies:
              GetElTreeMenusFamily._allTransitiveDependencies,
          authorityId: authorityId,
        );

  GetElTreeMenusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authorityId,
  }) : super.internal();

  final int? authorityId;

  @override
  Override overrideWith(
    FutureOr<TreeMenusModel?> Function(GetElTreeMenusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetElTreeMenusProvider._internal(
        (ref) => create(ref as GetElTreeMenusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authorityId: authorityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TreeMenusModel?> createElement() {
    return _GetElTreeMenusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetElTreeMenusProvider && other.authorityId == authorityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authorityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetElTreeMenusRef on AutoDisposeFutureProviderRef<TreeMenusModel?> {
  /// The parameter `authorityId` of this provider.
  int? get authorityId;
}

class _GetElTreeMenusProviderElement
    extends AutoDisposeFutureProviderElement<TreeMenusModel?>
    with GetElTreeMenusRef {
  _GetElTreeMenusProviderElement(super.provider);

  @override
  int? get authorityId => (origin as GetElTreeMenusProvider).authorityId;
}

String _$getAllApisHash() => r'b2abcd0c0a4855bc0ba30e068d6b458e34751805';

/// See also [getAllApis].
@ProviderFor(getAllApis)
const getAllApisProvider = GetAllApisFamily();

/// See also [getAllApis].
class GetAllApisFamily extends Family<AsyncValue<TreeApisModel?>> {
  /// See also [getAllApis].
  const GetAllApisFamily();

  /// See also [getAllApis].
  GetAllApisProvider call({
    int? authorityId,
  }) {
    return GetAllApisProvider(
      authorityId: authorityId,
    );
  }

  @override
  GetAllApisProvider getProviderOverride(
    covariant GetAllApisProvider provider,
  ) {
    return call(
      authorityId: provider.authorityId,
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
  String? get name => r'getAllApisProvider';
}

/// See also [getAllApis].
class GetAllApisProvider extends AutoDisposeFutureProvider<TreeApisModel?> {
  /// See also [getAllApis].
  GetAllApisProvider({
    int? authorityId,
  }) : this._internal(
          (ref) => getAllApis(
            ref as GetAllApisRef,
            authorityId: authorityId,
          ),
          from: getAllApisProvider,
          name: r'getAllApisProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllApisHash,
          dependencies: GetAllApisFamily._dependencies,
          allTransitiveDependencies:
              GetAllApisFamily._allTransitiveDependencies,
          authorityId: authorityId,
        );

  GetAllApisProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authorityId,
  }) : super.internal();

  final int? authorityId;

  @override
  Override overrideWith(
    FutureOr<TreeApisModel?> Function(GetAllApisRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllApisProvider._internal(
        (ref) => create(ref as GetAllApisRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authorityId: authorityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TreeApisModel?> createElement() {
    return _GetAllApisProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllApisProvider && other.authorityId == authorityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authorityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAllApisRef on AutoDisposeFutureProviderRef<TreeApisModel?> {
  /// The parameter `authorityId` of this provider.
  int? get authorityId;
}

class _GetAllApisProviderElement
    extends AutoDisposeFutureProviderElement<TreeApisModel?>
    with GetAllApisRef {
  _GetAllApisProviderElement(super.provider);

  @override
  int? get authorityId => (origin as GetAllApisProvider).authorityId;
}

String _$updateCasbinHash() => r'2af91d067cb5fd49c33c296f5a7fe15a18382ddc';

/// See also [updateCasbin].
@ProviderFor(updateCasbin)
const updateCasbinProvider = UpdateCasbinFamily();

/// See also [updateCasbin].
class UpdateCasbinFamily extends Family<AsyncValue<bool>> {
  /// See also [updateCasbin].
  const UpdateCasbinFamily();

  /// See also [updateCasbin].
  UpdateCasbinProvider call(
    int authorityId,
    List<ApiPathModel> paths,
  ) {
    return UpdateCasbinProvider(
      authorityId,
      paths,
    );
  }

  @override
  UpdateCasbinProvider getProviderOverride(
    covariant UpdateCasbinProvider provider,
  ) {
    return call(
      provider.authorityId,
      provider.paths,
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
  String? get name => r'updateCasbinProvider';
}

/// See also [updateCasbin].
class UpdateCasbinProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [updateCasbin].
  UpdateCasbinProvider(
    int authorityId,
    List<ApiPathModel> paths,
  ) : this._internal(
          (ref) => updateCasbin(
            ref as UpdateCasbinRef,
            authorityId,
            paths,
          ),
          from: updateCasbinProvider,
          name: r'updateCasbinProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCasbinHash,
          dependencies: UpdateCasbinFamily._dependencies,
          allTransitiveDependencies:
              UpdateCasbinFamily._allTransitiveDependencies,
          authorityId: authorityId,
          paths: paths,
        );

  UpdateCasbinProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authorityId,
    required this.paths,
  }) : super.internal();

  final int authorityId;
  final List<ApiPathModel> paths;

  @override
  Override overrideWith(
    FutureOr<bool> Function(UpdateCasbinRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCasbinProvider._internal(
        (ref) => create(ref as UpdateCasbinRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authorityId: authorityId,
        paths: paths,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _UpdateCasbinProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCasbinProvider &&
        other.authorityId == authorityId &&
        other.paths == paths;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authorityId.hashCode);
    hash = _SystemHash.combine(hash, paths.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateCasbinRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `authorityId` of this provider.
  int get authorityId;

  /// The parameter `paths` of this provider.
  List<ApiPathModel> get paths;
}

class _UpdateCasbinProviderElement
    extends AutoDisposeFutureProviderElement<bool> with UpdateCasbinRef {
  _UpdateCasbinProviderElement(super.provider);

  @override
  int get authorityId => (origin as UpdateCasbinProvider).authorityId;
  @override
  List<ApiPathModel> get paths => (origin as UpdateCasbinProvider).paths;
}

String _$createAuthorityHash() => r'db03e8fe238db8741265eceb390cfe95e5906ae1';

/// See also [createAuthority].
@ProviderFor(createAuthority)
const createAuthorityProvider = CreateAuthorityFamily();

/// See also [createAuthority].
class CreateAuthorityFamily extends Family<AsyncValue<bool>> {
  /// See also [createAuthority].
  const CreateAuthorityFamily();

  /// See also [createAuthority].
  CreateAuthorityProvider call(
    CreateAuthorityParams params,
  ) {
    return CreateAuthorityProvider(
      params,
    );
  }

  @override
  CreateAuthorityProvider getProviderOverride(
    covariant CreateAuthorityProvider provider,
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
  String? get name => r'createAuthorityProvider';
}

/// See also [createAuthority].
class CreateAuthorityProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [createAuthority].
  CreateAuthorityProvider(
    CreateAuthorityParams params,
  ) : this._internal(
          (ref) => createAuthority(
            ref as CreateAuthorityRef,
            params,
          ),
          from: createAuthorityProvider,
          name: r'createAuthorityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createAuthorityHash,
          dependencies: CreateAuthorityFamily._dependencies,
          allTransitiveDependencies:
              CreateAuthorityFamily._allTransitiveDependencies,
          params: params,
        );

  CreateAuthorityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final CreateAuthorityParams params;

  @override
  Override overrideWith(
    FutureOr<bool> Function(CreateAuthorityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateAuthorityProvider._internal(
        (ref) => create(ref as CreateAuthorityRef),
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
    return _CreateAuthorityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateAuthorityProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateAuthorityRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `params` of this provider.
  CreateAuthorityParams get params;
}

class _CreateAuthorityProviderElement
    extends AutoDisposeFutureProviderElement<bool> with CreateAuthorityRef {
  _CreateAuthorityProviderElement(super.provider);

  @override
  CreateAuthorityParams get params =>
      (origin as CreateAuthorityProvider).params;
}

String _$editRoleMenuHash() => r'16f1de7341f70a7582e85868ec77bd2e9074df15';

/// See also [editRoleMenu].
@ProviderFor(editRoleMenu)
const editRoleMenuProvider = EditRoleMenuFamily();

/// See also [editRoleMenu].
class EditRoleMenuFamily extends Family<AsyncValue<bool>> {
  /// See also [editRoleMenu].
  const EditRoleMenuFamily();

  /// See also [editRoleMenu].
  EditRoleMenuProvider call(
    EditRoleMenuParams params,
  ) {
    return EditRoleMenuProvider(
      params,
    );
  }

  @override
  EditRoleMenuProvider getProviderOverride(
    covariant EditRoleMenuProvider provider,
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
  String? get name => r'editRoleMenuProvider';
}

/// See also [editRoleMenu].
class EditRoleMenuProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [editRoleMenu].
  EditRoleMenuProvider(
    EditRoleMenuParams params,
  ) : this._internal(
          (ref) => editRoleMenu(
            ref as EditRoleMenuRef,
            params,
          ),
          from: editRoleMenuProvider,
          name: r'editRoleMenuProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editRoleMenuHash,
          dependencies: EditRoleMenuFamily._dependencies,
          allTransitiveDependencies:
              EditRoleMenuFamily._allTransitiveDependencies,
          params: params,
        );

  EditRoleMenuProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final EditRoleMenuParams params;

  @override
  Override overrideWith(
    FutureOr<bool> Function(EditRoleMenuRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EditRoleMenuProvider._internal(
        (ref) => create(ref as EditRoleMenuRef),
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
    return _EditRoleMenuProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditRoleMenuProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditRoleMenuRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `params` of this provider.
  EditRoleMenuParams get params;
}

class _EditRoleMenuProviderElement
    extends AutoDisposeFutureProviderElement<bool> with EditRoleMenuRef {
  _EditRoleMenuProviderElement(super.provider);

  @override
  EditRoleMenuParams get params => (origin as EditRoleMenuProvider).params;
}

String _$deleteAuthorityHash() => r'4320ada69f38b53b1c26e0f4846cf65a06c673e8';

/// See also [deleteAuthority].
@ProviderFor(deleteAuthority)
const deleteAuthorityProvider = DeleteAuthorityFamily();

/// See also [deleteAuthority].
class DeleteAuthorityFamily extends Family<AsyncValue<bool>> {
  /// See also [deleteAuthority].
  const DeleteAuthorityFamily();

  /// See also [deleteAuthority].
  DeleteAuthorityProvider call(
    int authorityId,
  ) {
    return DeleteAuthorityProvider(
      authorityId,
    );
  }

  @override
  DeleteAuthorityProvider getProviderOverride(
    covariant DeleteAuthorityProvider provider,
  ) {
    return call(
      provider.authorityId,
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
  String? get name => r'deleteAuthorityProvider';
}

/// See also [deleteAuthority].
class DeleteAuthorityProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [deleteAuthority].
  DeleteAuthorityProvider(
    int authorityId,
  ) : this._internal(
          (ref) => deleteAuthority(
            ref as DeleteAuthorityRef,
            authorityId,
          ),
          from: deleteAuthorityProvider,
          name: r'deleteAuthorityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteAuthorityHash,
          dependencies: DeleteAuthorityFamily._dependencies,
          allTransitiveDependencies:
              DeleteAuthorityFamily._allTransitiveDependencies,
          authorityId: authorityId,
        );

  DeleteAuthorityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authorityId,
  }) : super.internal();

  final int authorityId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(DeleteAuthorityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteAuthorityProvider._internal(
        (ref) => create(ref as DeleteAuthorityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authorityId: authorityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DeleteAuthorityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteAuthorityProvider && other.authorityId == authorityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authorityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteAuthorityRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `authorityId` of this provider.
  int get authorityId;
}

class _DeleteAuthorityProviderElement
    extends AutoDisposeFutureProviderElement<bool> with DeleteAuthorityRef {
  _DeleteAuthorityProviderElement(super.provider);

  @override
  int get authorityId => (origin as DeleteAuthorityProvider).authorityId;
}

String _$updateAuthorityHash() => r'ce47c86c9d36de1a2cc52c4fc071be8e795c74ca';

/// See also [updateAuthority].
@ProviderFor(updateAuthority)
const updateAuthorityProvider = UpdateAuthorityFamily();

/// See also [updateAuthority].
class UpdateAuthorityFamily extends Family<AsyncValue<bool>> {
  /// See also [updateAuthority].
  const UpdateAuthorityFamily();

  /// See also [updateAuthority].
  UpdateAuthorityProvider call(
    CreateAuthorityParams params,
  ) {
    return UpdateAuthorityProvider(
      params,
    );
  }

  @override
  UpdateAuthorityProvider getProviderOverride(
    covariant UpdateAuthorityProvider provider,
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
  String? get name => r'updateAuthorityProvider';
}

/// See also [updateAuthority].
class UpdateAuthorityProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [updateAuthority].
  UpdateAuthorityProvider(
    CreateAuthorityParams params,
  ) : this._internal(
          (ref) => updateAuthority(
            ref as UpdateAuthorityRef,
            params,
          ),
          from: updateAuthorityProvider,
          name: r'updateAuthorityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateAuthorityHash,
          dependencies: UpdateAuthorityFamily._dependencies,
          allTransitiveDependencies:
              UpdateAuthorityFamily._allTransitiveDependencies,
          params: params,
        );

  UpdateAuthorityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final CreateAuthorityParams params;

  @override
  Override overrideWith(
    FutureOr<bool> Function(UpdateAuthorityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateAuthorityProvider._internal(
        (ref) => create(ref as UpdateAuthorityRef),
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
    return _UpdateAuthorityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateAuthorityProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateAuthorityRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `params` of this provider.
  CreateAuthorityParams get params;
}

class _UpdateAuthorityProviderElement
    extends AutoDisposeFutureProviderElement<bool> with UpdateAuthorityRef {
  _UpdateAuthorityProviderElement(super.provider);

  @override
  CreateAuthorityParams get params =>
      (origin as UpdateAuthorityProvider).params;
}

String _$getUserListHash() => r'811ec67c03acbd9d36183344db4c72a6ca18b787';

/// See also [getUserList].
@ProviderFor(getUserList)
const getUserListProvider = GetUserListFamily();

/// See also [getUserList].
class GetUserListFamily extends Family<AsyncValue<PageListData?>> {
  /// See also [getUserList].
  const GetUserListFamily();

  /// See also [getUserList].
  GetUserListProvider call(
    PageParams params,
  ) {
    return GetUserListProvider(
      params,
    );
  }

  @override
  GetUserListProvider getProviderOverride(
    covariant GetUserListProvider provider,
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
  String? get name => r'getUserListProvider';
}

/// See also [getUserList].
class GetUserListProvider extends AutoDisposeFutureProvider<PageListData?> {
  /// See also [getUserList].
  GetUserListProvider(
    PageParams params,
  ) : this._internal(
          (ref) => getUserList(
            ref as GetUserListRef,
            params,
          ),
          from: getUserListProvider,
          name: r'getUserListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserListHash,
          dependencies: GetUserListFamily._dependencies,
          allTransitiveDependencies:
              GetUserListFamily._allTransitiveDependencies,
          params: params,
        );

  GetUserListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final PageParams params;

  @override
  Override overrideWith(
    FutureOr<PageListData?> Function(GetUserListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserListProvider._internal(
        (ref) => create(ref as GetUserListRef),
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
  AutoDisposeFutureProviderElement<PageListData?> createElement() {
    return _GetUserListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserListProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserListRef on AutoDisposeFutureProviderRef<PageListData?> {
  /// The parameter `params` of this provider.
  PageParams get params;
}

class _GetUserListProviderElement
    extends AutoDisposeFutureProviderElement<PageListData?>
    with GetUserListRef {
  _GetUserListProviderElement(super.provider);

  @override
  PageParams get params => (origin as GetUserListProvider).params;
}

String _$setUserInfoHash() => r'25c3dbfd63f1420cae2f24a2eeea4074bf3c5b94';

/// See also [setUserInfo].
@ProviderFor(setUserInfo)
const setUserInfoProvider = SetUserInfoFamily();

/// See also [setUserInfo].
class SetUserInfoFamily extends Family<AsyncValue<bool>> {
  /// See also [setUserInfo].
  const SetUserInfoFamily();

  /// See also [setUserInfo].
  SetUserInfoProvider call(
    SetUserInfoParams params,
  ) {
    return SetUserInfoProvider(
      params,
    );
  }

  @override
  SetUserInfoProvider getProviderOverride(
    covariant SetUserInfoProvider provider,
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
  String? get name => r'setUserInfoProvider';
}

/// See also [setUserInfo].
class SetUserInfoProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [setUserInfo].
  SetUserInfoProvider(
    SetUserInfoParams params,
  ) : this._internal(
          (ref) => setUserInfo(
            ref as SetUserInfoRef,
            params,
          ),
          from: setUserInfoProvider,
          name: r'setUserInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setUserInfoHash,
          dependencies: SetUserInfoFamily._dependencies,
          allTransitiveDependencies:
              SetUserInfoFamily._allTransitiveDependencies,
          params: params,
        );

  SetUserInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final SetUserInfoParams params;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SetUserInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetUserInfoProvider._internal(
        (ref) => create(ref as SetUserInfoRef),
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
    return _SetUserInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetUserInfoProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SetUserInfoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `params` of this provider.
  SetUserInfoParams get params;
}

class _SetUserInfoProviderElement extends AutoDisposeFutureProviderElement<bool>
    with SetUserInfoRef {
  _SetUserInfoProviderElement(super.provider);

  @override
  SetUserInfoParams get params => (origin as SetUserInfoProvider).params;
}

String _$getFileListHash() => r'fa4c04a4472d8aa65161507b9b7e2b00972e0608';

///
///
/// Copied from [getFileList].
@ProviderFor(getFileList)
const getFileListProvider = GetFileListFamily();

///
///
/// Copied from [getFileList].
class GetFileListFamily extends Family<AsyncValue<PageListData<FileModel>>> {
  ///
  ///
  /// Copied from [getFileList].
  const GetFileListFamily();

  ///
  ///
  /// Copied from [getFileList].
  GetFileListProvider call(
    PageParams params,
  ) {
    return GetFileListProvider(
      params,
    );
  }

  @override
  GetFileListProvider getProviderOverride(
    covariant GetFileListProvider provider,
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
  String? get name => r'getFileListProvider';
}

///
///
/// Copied from [getFileList].
class GetFileListProvider
    extends AutoDisposeFutureProvider<PageListData<FileModel>> {
  ///
  ///
  /// Copied from [getFileList].
  GetFileListProvider(
    PageParams params,
  ) : this._internal(
          (ref) => getFileList(
            ref as GetFileListRef,
            params,
          ),
          from: getFileListProvider,
          name: r'getFileListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getFileListHash,
          dependencies: GetFileListFamily._dependencies,
          allTransitiveDependencies:
              GetFileListFamily._allTransitiveDependencies,
          params: params,
        );

  GetFileListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final PageParams params;

  @override
  Override overrideWith(
    FutureOr<PageListData<FileModel>> Function(GetFileListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetFileListProvider._internal(
        (ref) => create(ref as GetFileListRef),
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
  AutoDisposeFutureProviderElement<PageListData<FileModel>> createElement() {
    return _GetFileListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetFileListProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetFileListRef on AutoDisposeFutureProviderRef<PageListData<FileModel>> {
  /// The parameter `params` of this provider.
  PageParams get params;
}

class _GetFileListProviderElement
    extends AutoDisposeFutureProviderElement<PageListData<FileModel>>
    with GetFileListRef {
  _GetFileListProviderElement(super.provider);

  @override
  PageParams get params => (origin as GetFileListProvider).params;
}

String _$deleteFileHash() => r'64c1992855554fc33c9cd66bcd9aa7f74e36b260';

/// See also [deleteFile].
@ProviderFor(deleteFile)
const deleteFileProvider = DeleteFileFamily();

/// See also [deleteFile].
class DeleteFileFamily extends Family<AsyncValue<bool>> {
  /// See also [deleteFile].
  const DeleteFileFamily();

  /// See also [deleteFile].
  DeleteFileProvider call(
    String fileName,
  ) {
    return DeleteFileProvider(
      fileName,
    );
  }

  @override
  DeleteFileProvider getProviderOverride(
    covariant DeleteFileProvider provider,
  ) {
    return call(
      provider.fileName,
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
  String? get name => r'deleteFileProvider';
}

/// See also [deleteFile].
class DeleteFileProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [deleteFile].
  DeleteFileProvider(
    String fileName,
  ) : this._internal(
          (ref) => deleteFile(
            ref as DeleteFileRef,
            fileName,
          ),
          from: deleteFileProvider,
          name: r'deleteFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteFileHash,
          dependencies: DeleteFileFamily._dependencies,
          allTransitiveDependencies:
              DeleteFileFamily._allTransitiveDependencies,
          fileName: fileName,
        );

  DeleteFileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileName,
  }) : super.internal();

  final String fileName;

  @override
  Override overrideWith(
    FutureOr<bool> Function(DeleteFileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteFileProvider._internal(
        (ref) => create(ref as DeleteFileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileName: fileName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DeleteFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteFileProvider && other.fileName == fileName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteFileRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `fileName` of this provider.
  String get fileName;
}

class _DeleteFileProviderElement extends AutoDisposeFutureProviderElement<bool>
    with DeleteFileRef {
  _DeleteFileProviderElement(super.provider);

  @override
  String get fileName => (origin as DeleteFileProvider).fileName;
}

String _$downloadFileHash() => r'e35621d379ebb97ab686b759a139bf06f4e0fcd2';

/// See also [downloadFile].
@ProviderFor(downloadFile)
const downloadFileProvider = DownloadFileFamily();

/// See also [downloadFile].
class DownloadFileFamily extends Family<AsyncValue<Uint8List?>> {
  /// See also [downloadFile].
  const DownloadFileFamily();

  /// See also [downloadFile].
  DownloadFileProvider call(
    String fileName,
  ) {
    return DownloadFileProvider(
      fileName,
    );
  }

  @override
  DownloadFileProvider getProviderOverride(
    covariant DownloadFileProvider provider,
  ) {
    return call(
      provider.fileName,
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
  String? get name => r'downloadFileProvider';
}

/// See also [downloadFile].
class DownloadFileProvider extends AutoDisposeFutureProvider<Uint8List?> {
  /// See also [downloadFile].
  DownloadFileProvider(
    String fileName,
  ) : this._internal(
          (ref) => downloadFile(
            ref as DownloadFileRef,
            fileName,
          ),
          from: downloadFileProvider,
          name: r'downloadFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$downloadFileHash,
          dependencies: DownloadFileFamily._dependencies,
          allTransitiveDependencies:
              DownloadFileFamily._allTransitiveDependencies,
          fileName: fileName,
        );

  DownloadFileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileName,
  }) : super.internal();

  final String fileName;

  @override
  Override overrideWith(
    FutureOr<Uint8List?> Function(DownloadFileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DownloadFileProvider._internal(
        (ref) => create(ref as DownloadFileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileName: fileName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Uint8List?> createElement() {
    return _DownloadFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadFileProvider && other.fileName == fileName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DownloadFileRef on AutoDisposeFutureProviderRef<Uint8List?> {
  /// The parameter `fileName` of this provider.
  String get fileName;
}

class _DownloadFileProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List?> with DownloadFileRef {
  _DownloadFileProviderElement(super.provider);

  @override
  String get fileName => (origin as DownloadFileProvider).fileName;
}

String _$uploadFileHash() => r'806a399f07a516b543e4d7fadeaea8ba1e1c9bcf';

/// See also [uploadFile].
@ProviderFor(uploadFile)
const uploadFileProvider = UploadFileFamily();

/// See also [uploadFile].
class UploadFileFamily extends Family<AsyncValue<FileModel>> {
  /// See also [uploadFile].
  const UploadFileFamily();

  /// See also [uploadFile].
  UploadFileProvider call(
    File params,
  ) {
    return UploadFileProvider(
      params,
    );
  }

  @override
  UploadFileProvider getProviderOverride(
    covariant UploadFileProvider provider,
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
  String? get name => r'uploadFileProvider';
}

/// See also [uploadFile].
class UploadFileProvider extends AutoDisposeFutureProvider<FileModel> {
  /// See also [uploadFile].
  UploadFileProvider(
    File params,
  ) : this._internal(
          (ref) => uploadFile(
            ref as UploadFileRef,
            params,
          ),
          from: uploadFileProvider,
          name: r'uploadFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadFileHash,
          dependencies: UploadFileFamily._dependencies,
          allTransitiveDependencies:
              UploadFileFamily._allTransitiveDependencies,
          params: params,
        );

  UploadFileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final File params;

  @override
  Override overrideWith(
    FutureOr<FileModel> Function(UploadFileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadFileProvider._internal(
        (ref) => create(ref as UploadFileRef),
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
  AutoDisposeFutureProviderElement<FileModel> createElement() {
    return _UploadFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadFileProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadFileRef on AutoDisposeFutureProviderRef<FileModel> {
  /// The parameter `params` of this provider.
  File get params;
}

class _UploadFileProviderElement
    extends AutoDisposeFutureProviderElement<FileModel> with UploadFileRef {
  _UploadFileProviderElement(super.provider);

  @override
  File get params => (origin as UploadFileProvider).params;
}

String _$getCronListHash() => r'76b8d7501be9a3949a3e906c9fa23001b2b1871f';

/// See also [getCronList].
@ProviderFor(getCronList)
const getCronListProvider = GetCronListFamily();

/// See also [getCronList].
class GetCronListFamily extends Family<AsyncValue<PageListData<CronModel>>> {
  /// See also [getCronList].
  const GetCronListFamily();

  /// See also [getCronList].
  GetCronListProvider call(
    PageParams params,
  ) {
    return GetCronListProvider(
      params,
    );
  }

  @override
  GetCronListProvider getProviderOverride(
    covariant GetCronListProvider provider,
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
  String? get name => r'getCronListProvider';
}

/// See also [getCronList].
class GetCronListProvider
    extends AutoDisposeFutureProvider<PageListData<CronModel>> {
  /// See also [getCronList].
  GetCronListProvider(
    PageParams params,
  ) : this._internal(
          (ref) => getCronList(
            ref as GetCronListRef,
            params,
          ),
          from: getCronListProvider,
          name: r'getCronListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCronListHash,
          dependencies: GetCronListFamily._dependencies,
          allTransitiveDependencies:
              GetCronListFamily._allTransitiveDependencies,
          params: params,
        );

  GetCronListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final PageParams params;

  @override
  Override overrideWith(
    FutureOr<PageListData<CronModel>> Function(GetCronListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCronListProvider._internal(
        (ref) => create(ref as GetCronListRef),
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
  AutoDisposeFutureProviderElement<PageListData<CronModel>> createElement() {
    return _GetCronListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCronListProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCronListRef on AutoDisposeFutureProviderRef<PageListData<CronModel>> {
  /// The parameter `params` of this provider.
  PageParams get params;
}

class _GetCronListProviderElement
    extends AutoDisposeFutureProviderElement<PageListData<CronModel>>
    with GetCronListRef {
  _GetCronListProviderElement(super.provider);

  @override
  PageParams get params => (origin as GetCronListProvider).params;
}

String _$setCronInfoHash() => r'bb6b610c2ae5450eb1ac195ccff5698729702f08';

/// See also [setCronInfo].
@ProviderFor(setCronInfo)
const setCronInfoProvider = SetCronInfoFamily();

/// See also [setCronInfo].
class SetCronInfoFamily extends Family<AsyncValue<bool>> {
  /// See also [setCronInfo].
  const SetCronInfoFamily();

  /// See also [setCronInfo].
  SetCronInfoProvider call(
    SetCronParams params,
  ) {
    return SetCronInfoProvider(
      params,
    );
  }

  @override
  SetCronInfoProvider getProviderOverride(
    covariant SetCronInfoProvider provider,
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
  String? get name => r'setCronInfoProvider';
}

/// See also [setCronInfo].
class SetCronInfoProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [setCronInfo].
  SetCronInfoProvider(
    SetCronParams params,
  ) : this._internal(
          (ref) => setCronInfo(
            ref as SetCronInfoRef,
            params,
          ),
          from: setCronInfoProvider,
          name: r'setCronInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setCronInfoHash,
          dependencies: SetCronInfoFamily._dependencies,
          allTransitiveDependencies:
              SetCronInfoFamily._allTransitiveDependencies,
          params: params,
        );

  SetCronInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final SetCronParams params;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SetCronInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetCronInfoProvider._internal(
        (ref) => create(ref as SetCronInfoRef),
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
    return _SetCronInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetCronInfoProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SetCronInfoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `params` of this provider.
  SetCronParams get params;
}

class _SetCronInfoProviderElement extends AutoDisposeFutureProviderElement<bool>
    with SetCronInfoRef {
  _SetCronInfoProviderElement(super.provider);

  @override
  SetCronParams get params => (origin as SetCronInfoProvider).params;
}

String _$getOplListHash() => r'1db6f64575d3dffad70c7f3c6d56b1e5a1ef52da';

/// See also [getOplList].
@ProviderFor(getOplList)
const getOplListProvider = GetOplListFamily();

/// See also [getOplList].
class GetOplListFamily extends Family<AsyncValue<PageListData<OpLogModel>>> {
  /// See also [getOplList].
  const GetOplListFamily();

  /// See also [getOplList].
  GetOplListProvider call(
    OpLogParams params,
  ) {
    return GetOplListProvider(
      params,
    );
  }

  @override
  GetOplListProvider getProviderOverride(
    covariant GetOplListProvider provider,
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
  String? get name => r'getOplListProvider';
}

/// See also [getOplList].
class GetOplListProvider
    extends AutoDisposeFutureProvider<PageListData<OpLogModel>> {
  /// See also [getOplList].
  GetOplListProvider(
    OpLogParams params,
  ) : this._internal(
          (ref) => getOplList(
            ref as GetOplListRef,
            params,
          ),
          from: getOplListProvider,
          name: r'getOplListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOplListHash,
          dependencies: GetOplListFamily._dependencies,
          allTransitiveDependencies:
              GetOplListFamily._allTransitiveDependencies,
          params: params,
        );

  GetOplListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final OpLogParams params;

  @override
  Override overrideWith(
    FutureOr<PageListData<OpLogModel>> Function(GetOplListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOplListProvider._internal(
        (ref) => create(ref as GetOplListRef),
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
  AutoDisposeFutureProviderElement<PageListData<OpLogModel>> createElement() {
    return _GetOplListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOplListProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetOplListRef on AutoDisposeFutureProviderRef<PageListData<OpLogModel>> {
  /// The parameter `params` of this provider.
  OpLogParams get params;
}

class _GetOplListProviderElement
    extends AutoDisposeFutureProviderElement<PageListData<OpLogModel>>
    with GetOplListRef {
  _GetOplListProviderElement(super.provider);

  @override
  OpLogParams get params => (origin as GetOplListProvider).params;
}

String _$deleteOplHash() => r'20114485d9ecbddc50e026a254367b210560164f';

/// See also [deleteOpl].
@ProviderFor(deleteOpl)
const deleteOplProvider = DeleteOplFamily();

/// See also [deleteOpl].
class DeleteOplFamily extends Family<AsyncValue<bool>> {
  /// See also [deleteOpl].
  const DeleteOplFamily();

  /// See also [deleteOpl].
  DeleteOplProvider call(
    int id,
  ) {
    return DeleteOplProvider(
      id,
    );
  }

  @override
  DeleteOplProvider getProviderOverride(
    covariant DeleteOplProvider provider,
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
  String? get name => r'deleteOplProvider';
}

/// See also [deleteOpl].
class DeleteOplProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [deleteOpl].
  DeleteOplProvider(
    int id,
  ) : this._internal(
          (ref) => deleteOpl(
            ref as DeleteOplRef,
            id,
          ),
          from: deleteOplProvider,
          name: r'deleteOplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteOplHash,
          dependencies: DeleteOplFamily._dependencies,
          allTransitiveDependencies: DeleteOplFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteOplProvider._internal(
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
    FutureOr<bool> Function(DeleteOplRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteOplProvider._internal(
        (ref) => create(ref as DeleteOplRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DeleteOplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteOplProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteOplRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteOplProviderElement extends AutoDisposeFutureProviderElement<bool>
    with DeleteOplRef {
  _DeleteOplProviderElement(super.provider);

  @override
  int get id => (origin as DeleteOplProvider).id;
}

String _$deleteOplByIdsHash() => r'67e5dbae05b456b51a4da4408e0ca5dbce6d6c90';

/// See also [deleteOplByIds].
@ProviderFor(deleteOplByIds)
const deleteOplByIdsProvider = DeleteOplByIdsFamily();

/// See also [deleteOplByIds].
class DeleteOplByIdsFamily extends Family<AsyncValue<bool>> {
  /// See also [deleteOplByIds].
  const DeleteOplByIdsFamily();

  /// See also [deleteOplByIds].
  DeleteOplByIdsProvider call(
    List<int> id,
  ) {
    return DeleteOplByIdsProvider(
      id,
    );
  }

  @override
  DeleteOplByIdsProvider getProviderOverride(
    covariant DeleteOplByIdsProvider provider,
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
  String? get name => r'deleteOplByIdsProvider';
}

/// See also [deleteOplByIds].
class DeleteOplByIdsProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [deleteOplByIds].
  DeleteOplByIdsProvider(
    List<int> id,
  ) : this._internal(
          (ref) => deleteOplByIds(
            ref as DeleteOplByIdsRef,
            id,
          ),
          from: deleteOplByIdsProvider,
          name: r'deleteOplByIdsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteOplByIdsHash,
          dependencies: DeleteOplByIdsFamily._dependencies,
          allTransitiveDependencies:
              DeleteOplByIdsFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteOplByIdsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final List<int> id;

  @override
  Override overrideWith(
    FutureOr<bool> Function(DeleteOplByIdsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteOplByIdsProvider._internal(
        (ref) => create(ref as DeleteOplByIdsRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DeleteOplByIdsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteOplByIdsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteOplByIdsRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `id` of this provider.
  List<int> get id;
}

class _DeleteOplByIdsProviderElement
    extends AutoDisposeFutureProviderElement<bool> with DeleteOplByIdsRef {
  _DeleteOplByIdsProviderElement(super.provider);

  @override
  List<int> get id => (origin as DeleteOplByIdsProvider).id;
}

String _$setMenuInfoHash() => r'03b2efcfef7f9a52fc4b3a2c91d00090aae1a19d';

/// See also [setMenuInfo].
@ProviderFor(setMenuInfo)
const setMenuInfoProvider = SetMenuInfoFamily();

/// See also [setMenuInfo].
class SetMenuInfoFamily extends Family<AsyncValue<bool>> {
  /// See also [setMenuInfo].
  const SetMenuInfoFamily();

  /// See also [setMenuInfo].
  SetMenuInfoProvider call(
    SetMenuParams params,
  ) {
    return SetMenuInfoProvider(
      params,
    );
  }

  @override
  SetMenuInfoProvider getProviderOverride(
    covariant SetMenuInfoProvider provider,
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
  String? get name => r'setMenuInfoProvider';
}

/// See also [setMenuInfo].
class SetMenuInfoProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [setMenuInfo].
  SetMenuInfoProvider(
    SetMenuParams params,
  ) : this._internal(
          (ref) => setMenuInfo(
            ref as SetMenuInfoRef,
            params,
          ),
          from: setMenuInfoProvider,
          name: r'setMenuInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setMenuInfoHash,
          dependencies: SetMenuInfoFamily._dependencies,
          allTransitiveDependencies:
              SetMenuInfoFamily._allTransitiveDependencies,
          params: params,
        );

  SetMenuInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final SetMenuParams params;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SetMenuInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetMenuInfoProvider._internal(
        (ref) => create(ref as SetMenuInfoRef),
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
    return _SetMenuInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetMenuInfoProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SetMenuInfoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `params` of this provider.
  SetMenuParams get params;
}

class _SetMenuInfoProviderElement extends AutoDisposeFutureProviderElement<bool>
    with SetMenuInfoRef {
  _SetMenuInfoProviderElement(super.provider);

  @override
  SetMenuParams get params => (origin as SetMenuInfoProvider).params;
}

String _$setApiInfoHash() => r'89fbe4ec7a1b1eeb0d9832ec3af76168fc87a85b';

/// See also [setApiInfo].
@ProviderFor(setApiInfo)
const setApiInfoProvider = SetApiInfoFamily();

/// See also [setApiInfo].
class SetApiInfoFamily extends Family<AsyncValue<bool>> {
  /// See also [setApiInfo].
  const SetApiInfoFamily();

  /// See also [setApiInfo].
  SetApiInfoProvider call(
    SetApiInfoParams params,
  ) {
    return SetApiInfoProvider(
      params,
    );
  }

  @override
  SetApiInfoProvider getProviderOverride(
    covariant SetApiInfoProvider provider,
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
  String? get name => r'setApiInfoProvider';
}

/// See also [setApiInfo].
class SetApiInfoProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [setApiInfo].
  SetApiInfoProvider(
    SetApiInfoParams params,
  ) : this._internal(
          (ref) => setApiInfo(
            ref as SetApiInfoRef,
            params,
          ),
          from: setApiInfoProvider,
          name: r'setApiInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setApiInfoHash,
          dependencies: SetApiInfoFamily._dependencies,
          allTransitiveDependencies:
              SetApiInfoFamily._allTransitiveDependencies,
          params: params,
        );

  SetApiInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final SetApiInfoParams params;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SetApiInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetApiInfoProvider._internal(
        (ref) => create(ref as SetApiInfoRef),
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
    return _SetApiInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetApiInfoProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SetApiInfoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `params` of this provider.
  SetApiInfoParams get params;
}

class _SetApiInfoProviderElement extends AutoDisposeFutureProviderElement<bool>
    with SetApiInfoRef {
  _SetApiInfoProviderElement(super.provider);

  @override
  SetApiInfoParams get params => (origin as SetApiInfoProvider).params;
}

String _$getSysDictionaryListHash() =>
    r'b2250e214be2975e4c412a316cd5527ae449d9ad';

/// See also [getSysDictionaryList].
@ProviderFor(getSysDictionaryList)
final getSysDictionaryListProvider =
    AutoDisposeFutureProvider<List<SysDictionaryModel>>.internal(
  getSysDictionaryList,
  name: r'getSysDictionaryListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSysDictionaryListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSysDictionaryListRef
    = AutoDisposeFutureProviderRef<List<SysDictionaryModel>>;
String _$findSysDictionaryHash() => r'ca363ac7ce077df36b74ecc3e8773b27d1abf63f';

/// See also [findSysDictionary].
@ProviderFor(findSysDictionary)
const findSysDictionaryProvider = FindSysDictionaryFamily();

/// See also [findSysDictionary].
class FindSysDictionaryFamily extends Family<AsyncValue<SysDictionaryModel>> {
  /// See also [findSysDictionary].
  const FindSysDictionaryFamily();

  /// See also [findSysDictionary].
  FindSysDictionaryProvider call(
    int id,
  ) {
    return FindSysDictionaryProvider(
      id,
    );
  }

  @override
  FindSysDictionaryProvider getProviderOverride(
    covariant FindSysDictionaryProvider provider,
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
  String? get name => r'findSysDictionaryProvider';
}

/// See also [findSysDictionary].
class FindSysDictionaryProvider
    extends AutoDisposeFutureProvider<SysDictionaryModel> {
  /// See also [findSysDictionary].
  FindSysDictionaryProvider(
    int id,
  ) : this._internal(
          (ref) => findSysDictionary(
            ref as FindSysDictionaryRef,
            id,
          ),
          from: findSysDictionaryProvider,
          name: r'findSysDictionaryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findSysDictionaryHash,
          dependencies: FindSysDictionaryFamily._dependencies,
          allTransitiveDependencies:
              FindSysDictionaryFamily._allTransitiveDependencies,
          id: id,
        );

  FindSysDictionaryProvider._internal(
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
    FutureOr<SysDictionaryModel> Function(FindSysDictionaryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindSysDictionaryProvider._internal(
        (ref) => create(ref as FindSysDictionaryRef),
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
  AutoDisposeFutureProviderElement<SysDictionaryModel> createElement() {
    return _FindSysDictionaryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindSysDictionaryProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindSysDictionaryRef on AutoDisposeFutureProviderRef<SysDictionaryModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FindSysDictionaryProviderElement
    extends AutoDisposeFutureProviderElement<SysDictionaryModel>
    with FindSysDictionaryRef {
  _FindSysDictionaryProviderElement(super.provider);

  @override
  int get id => (origin as FindSysDictionaryProvider).id;
}

String _$getSysDictionaryDetailListHash() =>
    r'aad0dba2e66397e974f53bdd18d6e1cf6fe9cedf';

/// See also [getSysDictionaryDetailList].
@ProviderFor(getSysDictionaryDetailList)
const getSysDictionaryDetailListProvider = GetSysDictionaryDetailListFamily();

/// See also [getSysDictionaryDetailList].
class GetSysDictionaryDetailListFamily
    extends Family<AsyncValue<PageListData<SysDictionaryDetailModel>>> {
  /// See also [getSysDictionaryDetailList].
  const GetSysDictionaryDetailListFamily();

  /// See also [getSysDictionaryDetailList].
  GetSysDictionaryDetailListProvider call(
    GetSysDictionaryDetailListParams params,
  ) {
    return GetSysDictionaryDetailListProvider(
      params,
    );
  }

  @override
  GetSysDictionaryDetailListProvider getProviderOverride(
    covariant GetSysDictionaryDetailListProvider provider,
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
  String? get name => r'getSysDictionaryDetailListProvider';
}

/// See also [getSysDictionaryDetailList].
class GetSysDictionaryDetailListProvider
    extends AutoDisposeFutureProvider<PageListData<SysDictionaryDetailModel>> {
  /// See also [getSysDictionaryDetailList].
  GetSysDictionaryDetailListProvider(
    GetSysDictionaryDetailListParams params,
  ) : this._internal(
          (ref) => getSysDictionaryDetailList(
            ref as GetSysDictionaryDetailListRef,
            params,
          ),
          from: getSysDictionaryDetailListProvider,
          name: r'getSysDictionaryDetailListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSysDictionaryDetailListHash,
          dependencies: GetSysDictionaryDetailListFamily._dependencies,
          allTransitiveDependencies:
              GetSysDictionaryDetailListFamily._allTransitiveDependencies,
          params: params,
        );

  GetSysDictionaryDetailListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final GetSysDictionaryDetailListParams params;

  @override
  Override overrideWith(
    FutureOr<PageListData<SysDictionaryDetailModel>> Function(
            GetSysDictionaryDetailListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSysDictionaryDetailListProvider._internal(
        (ref) => create(ref as GetSysDictionaryDetailListRef),
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
  AutoDisposeFutureProviderElement<PageListData<SysDictionaryDetailModel>>
      createElement() {
    return _GetSysDictionaryDetailListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSysDictionaryDetailListProvider &&
        other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetSysDictionaryDetailListRef
    on AutoDisposeFutureProviderRef<PageListData<SysDictionaryDetailModel>> {
  /// The parameter `params` of this provider.
  GetSysDictionaryDetailListParams get params;
}

class _GetSysDictionaryDetailListProviderElement
    extends AutoDisposeFutureProviderElement<
        PageListData<SysDictionaryDetailModel>>
    with GetSysDictionaryDetailListRef {
  _GetSysDictionaryDetailListProviderElement(super.provider);

  @override
  GetSysDictionaryDetailListParams get params =>
      (origin as GetSysDictionaryDetailListProvider).params;
}

String _$findSysDictionaryDetailHash() =>
    r'e40a49831136a7d54bdf2f64399debea470b3554';

/// See also [findSysDictionaryDetail].
@ProviderFor(findSysDictionaryDetail)
const findSysDictionaryDetailProvider = FindSysDictionaryDetailFamily();

/// See also [findSysDictionaryDetail].
class FindSysDictionaryDetailFamily
    extends Family<AsyncValue<SysDictionaryDetailModel>> {
  /// See also [findSysDictionaryDetail].
  const FindSysDictionaryDetailFamily();

  /// See also [findSysDictionaryDetail].
  FindSysDictionaryDetailProvider call(
    int id,
  ) {
    return FindSysDictionaryDetailProvider(
      id,
    );
  }

  @override
  FindSysDictionaryDetailProvider getProviderOverride(
    covariant FindSysDictionaryDetailProvider provider,
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
  String? get name => r'findSysDictionaryDetailProvider';
}

/// See also [findSysDictionaryDetail].
class FindSysDictionaryDetailProvider
    extends AutoDisposeFutureProvider<SysDictionaryDetailModel> {
  /// See also [findSysDictionaryDetail].
  FindSysDictionaryDetailProvider(
    int id,
  ) : this._internal(
          (ref) => findSysDictionaryDetail(
            ref as FindSysDictionaryDetailRef,
            id,
          ),
          from: findSysDictionaryDetailProvider,
          name: r'findSysDictionaryDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findSysDictionaryDetailHash,
          dependencies: FindSysDictionaryDetailFamily._dependencies,
          allTransitiveDependencies:
              FindSysDictionaryDetailFamily._allTransitiveDependencies,
          id: id,
        );

  FindSysDictionaryDetailProvider._internal(
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
    FutureOr<SysDictionaryDetailModel> Function(
            FindSysDictionaryDetailRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindSysDictionaryDetailProvider._internal(
        (ref) => create(ref as FindSysDictionaryDetailRef),
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
  AutoDisposeFutureProviderElement<SysDictionaryDetailModel> createElement() {
    return _FindSysDictionaryDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindSysDictionaryDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindSysDictionaryDetailRef
    on AutoDisposeFutureProviderRef<SysDictionaryDetailModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FindSysDictionaryDetailProviderElement
    extends AutoDisposeFutureProviderElement<SysDictionaryDetailModel>
    with FindSysDictionaryDetailRef {
  _FindSysDictionaryDetailProviderElement(super.provider);

  @override
  int get id => (origin as FindSysDictionaryDetailProvider).id;
}

String _$setSysDictionaryInfoHash() =>
    r'74fce8fb015f14344f4ddfad7bc8dd502580364f';

/// See also [setSysDictionaryInfo].
@ProviderFor(setSysDictionaryInfo)
const setSysDictionaryInfoProvider = SetSysDictionaryInfoFamily();

/// See also [setSysDictionaryInfo].
class SetSysDictionaryInfoFamily extends Family<AsyncValue<bool>> {
  /// See also [setSysDictionaryInfo].
  const SetSysDictionaryInfoFamily();

  /// See also [setSysDictionaryInfo].
  SetSysDictionaryInfoProvider call(
    SetSysDictionaryParams params,
  ) {
    return SetSysDictionaryInfoProvider(
      params,
    );
  }

  @override
  SetSysDictionaryInfoProvider getProviderOverride(
    covariant SetSysDictionaryInfoProvider provider,
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
  String? get name => r'setSysDictionaryInfoProvider';
}

/// See also [setSysDictionaryInfo].
class SetSysDictionaryInfoProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [setSysDictionaryInfo].
  SetSysDictionaryInfoProvider(
    SetSysDictionaryParams params,
  ) : this._internal(
          (ref) => setSysDictionaryInfo(
            ref as SetSysDictionaryInfoRef,
            params,
          ),
          from: setSysDictionaryInfoProvider,
          name: r'setSysDictionaryInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setSysDictionaryInfoHash,
          dependencies: SetSysDictionaryInfoFamily._dependencies,
          allTransitiveDependencies:
              SetSysDictionaryInfoFamily._allTransitiveDependencies,
          params: params,
        );

  SetSysDictionaryInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final SetSysDictionaryParams params;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SetSysDictionaryInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetSysDictionaryInfoProvider._internal(
        (ref) => create(ref as SetSysDictionaryInfoRef),
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
    return _SetSysDictionaryInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetSysDictionaryInfoProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SetSysDictionaryInfoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `params` of this provider.
  SetSysDictionaryParams get params;
}

class _SetSysDictionaryInfoProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with SetSysDictionaryInfoRef {
  _SetSysDictionaryInfoProviderElement(super.provider);

  @override
  SetSysDictionaryParams get params =>
      (origin as SetSysDictionaryInfoProvider).params;
}

String _$setSysDictionaryDetailInfoHash() =>
    r'793f490857f4c04af4b889962dda282c6c0b6087';

/// See also [setSysDictionaryDetailInfo].
@ProviderFor(setSysDictionaryDetailInfo)
const setSysDictionaryDetailInfoProvider = SetSysDictionaryDetailInfoFamily();

/// See also [setSysDictionaryDetailInfo].
class SetSysDictionaryDetailInfoFamily extends Family<AsyncValue<bool>> {
  /// See also [setSysDictionaryDetailInfo].
  const SetSysDictionaryDetailInfoFamily();

  /// See also [setSysDictionaryDetailInfo].
  SetSysDictionaryDetailInfoProvider call(
    SetSysDictionaryDetailParams params,
  ) {
    return SetSysDictionaryDetailInfoProvider(
      params,
    );
  }

  @override
  SetSysDictionaryDetailInfoProvider getProviderOverride(
    covariant SetSysDictionaryDetailInfoProvider provider,
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
  String? get name => r'setSysDictionaryDetailInfoProvider';
}

/// See also [setSysDictionaryDetailInfo].
class SetSysDictionaryDetailInfoProvider
    extends AutoDisposeFutureProvider<bool> {
  /// See also [setSysDictionaryDetailInfo].
  SetSysDictionaryDetailInfoProvider(
    SetSysDictionaryDetailParams params,
  ) : this._internal(
          (ref) => setSysDictionaryDetailInfo(
            ref as SetSysDictionaryDetailInfoRef,
            params,
          ),
          from: setSysDictionaryDetailInfoProvider,
          name: r'setSysDictionaryDetailInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setSysDictionaryDetailInfoHash,
          dependencies: SetSysDictionaryDetailInfoFamily._dependencies,
          allTransitiveDependencies:
              SetSysDictionaryDetailInfoFamily._allTransitiveDependencies,
          params: params,
        );

  SetSysDictionaryDetailInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final SetSysDictionaryDetailParams params;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SetSysDictionaryDetailInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetSysDictionaryDetailInfoProvider._internal(
        (ref) => create(ref as SetSysDictionaryDetailInfoRef),
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
    return _SetSysDictionaryDetailInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetSysDictionaryDetailInfoProvider &&
        other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SetSysDictionaryDetailInfoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `params` of this provider.
  SetSysDictionaryDetailParams get params;
}

class _SetSysDictionaryDetailInfoProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with SetSysDictionaryDetailInfoRef {
  _SetSysDictionaryDetailInfoProviderElement(super.provider);

  @override
  SetSysDictionaryDetailParams get params =>
      (origin as SetSysDictionaryDetailInfoProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
