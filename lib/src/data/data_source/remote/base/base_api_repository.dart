import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_clean_app/src/utils/resource/data_satate.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/retrofit.dart';

abstract class BaseApiRepository {
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusMessage == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        throw DioException(
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions);
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }
}
