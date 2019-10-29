
import 'package:dio/dio.dart';

import 'log_util.dart';

class CustomLogInterceptor extends LogInterceptor {
  CustomLogInterceptor({
    request = true,
    requestHeader = true,
    requestBody = false,
    responseHeader = true,
    responseBody = false,
    error = true,
    logSize = 9999999,
  }) : super(
            request: request,
            requestHeader: requestHeader,
            requestBody: requestBody,
            responseHeader: responseHeader,
            responseBody: responseBody,
            error: error,
            logSize: logSize);

  @override
  printKV(String key, Object v) {
    LogUtil.e('$key: $v');
  }
  @override
  printAll(msg) {
    LogUtil.e('$msg');
  }
}
