import 'package:flutter_boilerplate/models/response/error_response_model.dart';

class APIResponse<T> {
  final bool? isSuccess;

  final T? data;

  final ErrorResponseModel? error;

  APIResponse({
    this.isSuccess,
    this.data,
    this.error,
  });
}
