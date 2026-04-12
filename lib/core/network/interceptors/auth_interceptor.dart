import 'package:dio/dio.dart';
import 'package:frontend/core/storage/access_token.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.ref);

  final Ref ref;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = ref.read(accessTokenProvider);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
