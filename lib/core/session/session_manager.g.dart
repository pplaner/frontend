// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sessionManager)
final sessionManagerProvider = SessionManagerProvider._();

final class SessionManagerProvider
    extends $FunctionalProvider<SessionManager, SessionManager, SessionManager>
    with $Provider<SessionManager> {
  SessionManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionManagerHash();

  @$internal
  @override
  $ProviderElement<SessionManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SessionManager create(Ref ref) {
    return sessionManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionManager>(value),
    );
  }
}

String _$sessionManagerHash() => r'f570fbc7f47e68c83fd9fdac6d0d719051c1de7e';

@ProviderFor(authSession)
final authSessionProvider = AuthSessionProvider._();

final class AuthSessionProvider
    extends $FunctionalProvider<AuthSession, AuthSession, AuthSession>
    with $Provider<AuthSession> {
  AuthSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authSessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authSessionHash();

  @$internal
  @override
  $ProviderElement<AuthSession> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthSession create(Ref ref) {
    return authSession(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthSession value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthSession>(value),
    );
  }
}

String _$authSessionHash() => r'dd9c26738c27af90e7e33dc4d7745b08b4e03b6c';

@ProviderFor(cryptoSession)
final cryptoSessionProvider = CryptoSessionProvider._();

final class CryptoSessionProvider
    extends $FunctionalProvider<CryptoSession, CryptoSession, CryptoSession>
    with $Provider<CryptoSession> {
  CryptoSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cryptoSessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cryptoSessionHash();

  @$internal
  @override
  $ProviderElement<CryptoSession> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CryptoSession create(Ref ref) {
    return cryptoSession(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CryptoSession value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CryptoSession>(value),
    );
  }
}

String _$cryptoSessionHash() => r'03ebc6fb2ad2953b11c1b84fce453c7a04554e67';

@ProviderFor(sessionController)
final sessionControllerProvider = SessionControllerProvider._();

final class SessionControllerProvider
    extends
        $FunctionalProvider<
          SessionController,
          SessionController,
          SessionController
        >
    with $Provider<SessionController> {
  SessionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionControllerHash();

  @$internal
  @override
  $ProviderElement<SessionController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SessionController create(Ref ref) {
    return sessionController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionController>(value),
    );
  }
}

String _$sessionControllerHash() => r'e0e8e55baa9e2e47dd238f27ae0563c8d2b43314';
