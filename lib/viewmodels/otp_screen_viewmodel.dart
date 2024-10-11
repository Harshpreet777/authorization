import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/viewmodels/base_viewmodel.dart';

class OtpScreenViewModel extends BaseViewModel {
  bool isDisable = true;
  final formKey = GlobalKey<FormState>();
  final List<TextEditingController> controllerList =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusList = List.generate(4, (index) => FocusNode());

  int count = 45;
  late Timer timer;
  void timerStart() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (count > 0) {
        count = count - 1;
        updateUI();
      } else {
        timer.cancel();
      }
    });
  }

  void buttonDisable() {
    isDisable = controllerList.any((controller) => controller.text.isEmpty);
    updateUI();
  }

  void changeFocus(String value, BuildContext context, int index) {
      if (value.length == 1 && index != 3) {
        FocusScope.of(context).nextFocus();
      }
      if (value.isEmpty && index != 0) {
        FocusScope.of(context).previousFocus();
      }
    
  }

  void onSumbit() {
    if (formKey.currentState?.validate() ?? false) {}
  }
}
