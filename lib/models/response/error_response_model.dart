class ErrorResponseModel {
  Error? error;

  ErrorResponseModel({
    this.error,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      ErrorResponseModel(
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
      );
}

class Error {
  String? errorCode;
  String? errorDescription;

  Error({
    this.errorCode,
    this.errorDescription,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        errorCode: json["errorCode"],
        errorDescription: json["errorDescription"],
      );
}
