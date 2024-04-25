import 'package:flutter_boilerplate/models/response/error_response_model.dart';

class LoginResponseModel {
  String? accessToken;
  String? refreshToken;
  bool? isSuccess;
  ErrorResponseModel? error;

  LoginResponseModel(
      {this.accessToken, this.refreshToken, this.error, this.isSuccess});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
          error: json["error"] == null
              ? null
              : ErrorResponseModel.fromJson(json["error"]),
          accessToken: json["accessToken"],
          refreshToken: json["refreshToken"],
          isSuccess: json["statusCode"] == 200 || json["statusCode"] == 201);
}
