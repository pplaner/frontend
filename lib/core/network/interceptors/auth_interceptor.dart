import 'package:dio/dio.dart';
import 'package:frontend/core/session/auth_session.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._authSession);

  final AuthSession _authSession;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _authSession.accessToken;

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
