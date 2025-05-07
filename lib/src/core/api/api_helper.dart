import 'dart:io';

import 'package:cleanarcjh/src/core/api/api_exception.dart';
import 'package:cleanarcjh/src/core/api/api_exception_convert_message.dart';
import 'package:cleanarcjh/src/core/util/logger.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  final Dio _dio;
  ApiHelper(this._dio);

  Future<Map<String, dynamic>> execute({
    required Method method,
    required String url,
    dynamic params,
    dynamic data,
    Options? options,
  }) async {
    try {
      Response? response;
      switch (method) {
        case Method.get:
          response = await _dio.get(
            url,
            queryParameters: params,
            options: options,
          );
          break;
        case Method.post:
          response = await _dio.post(url, data: data, queryParameters: params);
          break;
        case Method.put:
          response = await _dio.put(url, data: data);
          break;
        case Method.patch:
          response = await _dio.patch(url, data: data);
          break;
        case Method.delete:
          response = await _dio.delete(url, data: data);
          break;
      }

      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      return _returnResponse(e.response!);
    }
  }

  Map<String, dynamic> _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        if (response.data is String) {
          // Convert to map
          return {"data": response.data};
        }
        return response.data;
      case 204:
        // No content
        return {"data": 'No content'};
      case 400:
        logger.e('=======400==== ${response.data}');
        if (response.data is String) {
          throw ApiExceptionHelper.convertMessage(response.data);
        } else {
          throw BadRequestException(response.data["message"].toString());
        }
      case 401:
        throw UnauthorizedException(response.data["message"].toString());
      case 403:
        logger.e('=======403==== ${response.data}');
        if (response.data != null && response.data.toString().isNotEmpty) {
          throw ForbiddenException(response.data["message"].toString());
        } else {
          throw ForbiddenException('Forbiden Exception');
        }
      case 404:
        throw NotFoundException(response.data["message"].toString());
      case 422:
        throw UnprocessableContentException(
          response.data["message"].toString(),
        );
      case 500:
        throw InternalServerException(response.data["message"].toString());
      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}

enum Method { get, post, put, patch, delete }
