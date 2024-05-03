class LoginResponseModel {
  String? accessToken;
  String? refreshToken;
  bool? isSuccess;

  LoginResponseModel({this.accessToken, this.refreshToken, this.isSuccess});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
          accessToken: json["accessToken"],
          refreshToken: json["refreshToken"],
          isSuccess: json["statusCode"] == 200 || json["statusCode"] == 201);
}
