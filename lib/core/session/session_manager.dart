import 'package:drift/drift.dart';
import 'package:frontend/core/session/auth_session.dart';
import 'package:frontend/core/session/crypto_session.dart';
import 'package:frontend/core/session/session_controller.dart';
import 'package:frontend/core/session/session_exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_manager.g.dart';

class SessionManager implements AuthSession, CryptoSession, SessionController {
  String? _accessToken;
  Uint8List? _masterKey;

  @override
  String? get accessToken => _accessToken;

  @override
  Uint8List? get masterKey {
    if (_masterKey == null) throw const SessionLockedException();

    return _masterKey;
  }

  @override
  void setAuthToken(String token) => _accessToken = token;

  @override
  void setMasterKey(Uint8List key) => _masterKey = key;

  @override
  void clearSession() {
    _accessToken = null;

    if (_masterKey != null) {
      for (var i = 0; i < _masterKey!.length; i++) {
        _masterKey![i] = 0;
      }
      _masterKey = null;
    }
  }
}

@Riverpod(keepAlive: true)
SessionManager sessionManager(Ref ref) => SessionManager();

@Riverpod(keepAlive: true)
AuthSession authSession(Ref ref) => ref.watch(sessionManagerProvider);

@Riverpod(keepAlive: true)
CryptoSession cryptoSession(Ref ref) => ref.watch(sessionManagerProvider);

@Riverpod(keepAlive: true)
SessionController sessionController(Ref ref) =>
    ref.watch(sessionManagerProvider);
