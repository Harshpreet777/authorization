import 'package:flutter_boilerplate/viewmodels/base_viewmodel.dart';

class MyBagViewModel extends BaseViewModel {
  int count = 1;

  void increaseCount() {
    count = count + 1;
    updateUI();
  }

  void decreaseCount() {
    if (count > 1) {
      count = count - 1;
      updateUI();
    }
  }
}
