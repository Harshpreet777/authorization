import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../constants/api_constant.dart';
import '../models/response/base_response_model.dart';

class APIBase {
  Dio? _dio;
  //final _apiRoutes = APIRoutes();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Duration timeoutDuration = const Duration(seconds: 180);

  Dio? getDio({bool? isAuthorizationRequired = false}) {
    _dio = Dio(BaseOptions(
      baseUrl: APIRoutes.baseUrl,
      connectTimeout: timeoutDuration,
      receiveTimeout: timeoutDuration,
    ));

    if (isAuthorizationRequired == true) {
      _dio?.interceptors.add(authorizationInterceptor);
    } else {
      _dio?.interceptors.add(noAuthorizationInterceptor);
    }

    return _dio;
  }

  // Interceptor for non authorized API calls
  var noAuthorizationInterceptor = InterceptorsWrapper(
    onRequest: (options, handler) async {
      options.headers['Content-Type'] = "application/json";
      options.headers['Accept'] = "*/*";
      options.headers['Connection'] = "keep-alive";

      return handler.next(options);
    },
    onError: (error, handler) async {
      return handler.next(error);
    },
  );

  // Interceptor for authorized API calls
  var authorizationInterceptor = InterceptorsWrapper(
    onRequest: (options, handler) async {
      options.headers["Accept"] = "application/json";
      String? token = ""; // Code to get the access token
      options.headers['Content-Type'] = "application/json";
      options.headers['Accept'] = "*/*";
      options.headers['Connection'] = "keep-alive";
      options.headers['Authorization'] = "Bearer $token";

      return handler.next(options);
    },
    onError: (error, handler) async {
      if (error.response?.statusCode == 401) {
        // Handle refresh token here.
      } else {
        return handler.next(error);
      }
    },
  );

// GET Request
  Future<APIResponse?> getRequest(
    String url, {
    bool isAuthorizationRequired = false,
  }) async {
    Response response;
    APIResponse? apiResponse;
    Dio dio = getDio(
          isAuthorizationRequired: isAuthorizationRequired,
        ) ??
        Dio();

    try {
      response = await dio
          .get(
            APIRoutes.baseUrl + url,
          )
          .timeout(timeoutDuration);

      apiResponse = await returnResponse(response);
    } catch (err) {
      apiResponse = exceptionHandler(err);
    } finally {}

    return apiResponse;
  }

// POST Request
  Future<APIResponse?> postRequest(
    String url, {
    dynamic data,
    bool isAuthorizationRequired = false,
  }) async {
    APIResponse? apiResponse;

    if (data == null ||
        data == "" ||
        data == '' ||
        data == " " ||
        data == ' ') {
      data = {};
    }
    Response response;
    Dio dio = getDio(
          isAuthorizationRequired: isAuthorizationRequired,
        ) ??
        Dio();

    try {
      response = await dio
          .post(
            APIRoutes.baseUrl + url,
            data: data,
          )
          .timeout(timeoutDuration);

      apiResponse = apiResponse ?? await returnResponse(response);
    } catch (err) {
      apiResponse = exceptionHandler(err);
    } finally {}

    return apiResponse;
  }

  // Patch Request
  Future<APIResponse?> patchRequest(
    String url,
    dynamic data, {
    bool isAuthorizationRequired = false,
  }) async {
    if (data == null ||
        data == "" ||
        data == '' ||
        data == " " ||
        data == ' ') {
      data = {};
    }
    Response response;
    APIResponse? apiResponse;
    Dio dio = getDio(
          isAuthorizationRequired: isAuthorizationRequired,
        ) ??
        Dio();

    //Start new relic interaction

    try {
      response = await dio
          .patch(
            APIRoutes.baseUrl + url,
            data: data,
          )
          .timeout(timeoutDuration);
      apiResponse = await returnResponse(response);
    } catch (err) {
      apiResponse = exceptionHandler(
        err,
      );
    } finally {}

    return apiResponse;
  }

// PUT Request
  Future<APIResponse?> putRequest(
    String url,
    dynamic data, {
    bool isAuthorizationRequired = false,
  }) async {
    if (data == null ||
        data == "" ||
        data == '' ||
        data == " " ||
        data == ' ') {
      data = {};
    }
    Response response;
    APIResponse? apiResponse;
    Dio dio = getDio(
          isAuthorizationRequired: isAuthorizationRequired,
        ) ??
        Dio();

    //Start new relic interaction

    try {
      response = await dio
          .put(
            APIRoutes.baseUrl + url,
            data: data,
          )
          .timeout(timeoutDuration);
      apiResponse = await returnResponse(response);
    } catch (err) {
      apiResponse = exceptionHandler(err);
    } finally {}

    return apiResponse;
  }

// DELETE Request
  Future<APIResponse?> deleteRequest(
    String url, {
    dynamic data,
    Map<String, dynamic>? header,
    dynamic id,
    bool? isAuthorizationRequired,
  }) async {
    if (data == null ||
        data == "" ||
        data == '' ||
        data == " " ||
        data == ' ') {
      data = {};
    }
    Response response;
    APIResponse? apiResponse;

    try {
      Dio dio =
          getDio(isAuthorizationRequired: isAuthorizationRequired) ?? Dio();

      response = await dio
          .delete(
            APIRoutes.baseUrl + url,
            data: data,
          )
          .timeout(timeoutDuration);
      apiResponse = await returnResponse(response);
    } catch (err) {
      apiResponse = exceptionHandler(
        err,
      );
    } finally {}

    return apiResponse;
  }

  Future<APIResponse?> returnResponse(Response? response) async {
    try {
      Response resp = response ?? Response(requestOptions: RequestOptions());

      return APIResponse(
        data: resp.data,
        isSuccess:
            (resp.data['statusCode'] == 200 || resp.data['statusCode'] == 201)
                ? true
                : resp.statusCode == 200
                    ? true
                    : false,
      );
    } on SocketException {
      return APIResponse(
        isSuccess: false,
        data: {},
      );
    } on DioException catch (error) {
      return APIResponse(
        // commit

        data: (error.response?.data ?? {})['data'] ?? {},
        isSuccess: error.response?.statusCode == 200 ? true : false,
      );
    }
  }

  dynamic exceptionHandler(ex) {
    if (ex is DioException) {
      return APIResponse(
        isSuccess: ex.response?.statusCode == 200 ? true : false,
        data: ex.response,
      );
    } else if (ex is SocketException) {
      return APIResponse(
        isSuccess: false,
        data: {},
      );
    } else if (ex is TimeoutException) {
      return APIResponse(
        isSuccess: false,
        data: {},
      );
    } else {
      return APIResponse(
        isSuccess: false,
        data: {},
      );
    }
  }
}

typedef ResponseCallback = Future<Response> Function();
