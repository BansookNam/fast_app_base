import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../common/common.dart';
import 'result.dart';

class ApiError {
  int? statusCode;
  bool isApplicationError;
  String message;

  ApiError({
    this.statusCode,
    this.isApplicationError = false,
    required this.message,
  });

  static createErrorResult(e) {
    if (e is DioError) {
      if (!kReleaseMode) {
        return Result.failure(ApiError(
            message: e.error?.toString() ?? e.message ?? 'message is empty', isApplicationError: e.response == null));
      } else {
        return Result.failure(ApiError(message: 'api_error'.tr(), statusCode: e.response?.statusCode));
      }
    }

    return Result.failure(ApiError(message: 'api_error'.tr()));
  }
}
