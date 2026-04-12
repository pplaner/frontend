import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/core/network/interceptors/auth_interceptor.dart';
import 'package:frontend/core/storage/cookie_jar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final options = BaseOptions(
    // TO-DO: change the baseUrl to env variable
    baseUrl: 'localhost',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
    contentType: Headers.jsonContentType,
  );

  final dio = Dio(options);

  final cookieManager = CookieManager(ref.watch(cookieJarProvider));

  dio.interceptors.addAll([
    cookieManager,
    AuthInterceptor(ref),
    if (kDebugMode) LogInterceptor(requestBody: true, responseBody: true),
  ]);

  return dio;
}
