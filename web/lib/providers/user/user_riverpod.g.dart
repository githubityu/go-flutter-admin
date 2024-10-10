// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginHash() => r'47e2aa5dbfc415064f14ae5a14278e1ebb4f30c6';

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

/// See also [login].
@ProviderFor(login)
const loginProvider = LoginFamily();

/// See also [login].
class LoginFamily extends Family<AsyncValue<void>> {
  /// See also [login].
  const LoginFamily();

  /// See also [login].
  LoginProvider call(
    Map<String, dynamic> params,
  ) {
    return LoginProvider(
      params,
    );
  }

  @override
  LoginProvider getProviderOverride(
    covariant LoginProvider provider,
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
  String? get name => r'loginProvider';
}

/// See also [login].
class LoginProvider extends AutoDisposeFutureProvider<void> {
  /// See also [login].
  LoginProvider(
    Map<String, dynamic> params,
  ) : this._internal(
          (ref) => login(
            ref as LoginRef,
            params,
          ),
          from: loginProvider,
          name: r'loginProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginHash,
          dependencies: LoginFamily._dependencies,
          allTransitiveDependencies: LoginFamily._allTransitiveDependencies,
          params: params,
        );

  LoginProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final Map<String, dynamic> params;

  @override
  Override overrideWith(
    FutureOr<void> Function(LoginRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoginProvider._internal(
        (ref) => create(ref as LoginRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _LoginProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `params` of this provider.
  Map<String, dynamic> get params;
}

class _LoginProviderElement extends AutoDisposeFutureProviderElement<void>
    with LoginRef {
  _LoginProviderElement(super.provider);

  @override
  Map<String, dynamic> get params => (origin as LoginProvider).params;
}

String _$getUserInfoHash() => r'23b6a9a71d9efca1997d042feed0b0b898c17f0c';

/// See also [getUserInfo].
@ProviderFor(getUserInfo)
final getUserInfoProvider = AutoDisposeFutureProvider<UserModel?>.internal(
  getUserInfo,
  name: r'getUserInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getUserInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetUserInfoRef = AutoDisposeFutureProviderRef<UserModel?>;
String _$captchaHash() => r'0e7f37d8e820ce0bd75a4de0b6a126b3d0698cea';

/// See also [captcha].
@ProviderFor(captcha)
final captchaProvider = AutoDisposeFutureProvider<SimpleModel?>.internal(
  captcha,
  name: r'captchaProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$captchaHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CaptchaRef = AutoDisposeFutureProviderRef<SimpleModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
