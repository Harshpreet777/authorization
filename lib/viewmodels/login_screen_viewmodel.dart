import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/models/widgets/common_icon_button_model.dart';
import 'package:flutter_boilerplate/utils/validation/validation_functions.dart';
import 'package:flutter_boilerplate/viewmodels/base_viewmodel.dart';

class LoginScreenViewModel extends BaseViewModel {
  final ImageConstant imageConstant = ImageConstant();
  final formKey = GlobalKey<FormState>();
  final TextEditingController numberController = TextEditingController();
  bool rememberMe = false;
  bool isDisable = true;

  late List<CommonIconButtonModel> iconButtonList = [
    CommonIconButtonModel(
      image: imageConstant.googleIcon,
      onTap: () async {},
    ),
    CommonIconButtonModel(
      image: imageConstant.facebookIcon,
      onTap: () async {},
    ),
    CommonIconButtonModel(
      image: imageConstant.twitterIcon,
      onTap: () async {},
    )
  ];
  String? numberValidation(String value) {
    if (numberController.text.isNotEmpty) {
      return Validations().validatePhone(value);
    }
    return null;
  }

  void buttonDisable() {
    if (numberController.text.length == 10) {
      isDisable = false;
      updateUI();
    } else {
      isDisable = true;
      updateUI();
    }
  }

  void onSumbit() {
    if (formKey.currentState?.validate() ?? false) {}
  }
}