import 'package:flutter_boilerplate/constants/api_constant.dart';
import 'package:flutter_boilerplate/controllers/base_api_controllers.dart';
import 'package:flutter_boilerplate/models/request/login_request_model.dart';

class AuthRepository {
  final _apiRoutes = APIRoutes();
  final _apiBase = APIBase();

  Future login(LoginRequestModel requestModel) async {
    return await _apiBase.postRequest(_apiRoutes.demoRoute,
        data: requestModel.toJson());
  }
}
