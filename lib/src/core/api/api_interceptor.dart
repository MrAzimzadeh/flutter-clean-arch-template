import 'package:cleanarcjh/src/config/injector/injector_conf.dart';
import 'package:cleanarcjh/src/core/api/api_url.dart';
import 'package:cleanarcjh/src/core/cache/local_storage.dart';
import 'package:cleanarcjh/src/core/constants/auth_constants.dart';
import 'package:cleanarcjh/src/core/util/logger.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  final LocalStorage _localStorage;

  const ApiInterceptor(this._localStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    logger.i("Request: ${options.method} ${options.path}");
    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization": await _localStorage.load(key: AuthConstants.accessToken),
      "Accept-Language": "az",
    });
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(
      "Response: ${response.statusCode} ${response.requestOptions.path}",
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = await _localStorage.load(
        key: AuthConstants.refreshToken,
      );
      try {
        final dio = getIt<Dio>();
        final refreshResponse = await dio.post(
          ApiUrl.refreshToken,
          data: {'refreshToken': refreshToken, 'expiresInMins': 10},
        );

        ///
        ///  "accessToken": accessToken,
        // "refreshToken": refreshToken,

        final newAccessToken = refreshResponse.data['accessToken'];
        final newRefreshToken = refreshResponse.data["refreshToken"];

        if (newAccessToken != null) {
          _localStorage.save(
            key: AuthConstants.accessToken,
            value: newAccessToken,
          );
          _localStorage.save(
            key: AuthConstants.refreshToken,
            value: newRefreshToken,
          );

          final RequestOptions requestOptions = err.requestOptions;
          requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
          final response = await dio.fetch(requestOptions);

          return handler.resolve(response);
        }
      } catch (e) {
        logger.e('Refresh token failed: $e');
      }
    }

    super.onError(err, handler);
  }
}
