import 'package:flutter_boilerplate/controllers/auth/auth_repository.dart';
import 'package:flutter_boilerplate/models/response/base_response_model.dart';
import 'package:flutter_boilerplate/viewmodels/base_viewmodel.dart';
import '../models/request/login_request_model.dart';
import '../models/response/login_response_model.dart';

class AuthViewModel extends BaseViewModel {
  final _authRepo = AuthRepository();

  Future<LoginResponseModel?> login(LoginRequestModel request) async {
    APIResponse response = await _authRepo.login(request);

    if (response.isSuccess == true) {
      // Any logic that needs to be implemented after successful login.
      return LoginResponseModel.fromJson(response.data);
    } else {
      // Any logic that needs to be implemented after un-successful login.
      return null;
    }
  }
}
