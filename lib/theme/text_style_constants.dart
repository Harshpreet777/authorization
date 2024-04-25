import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';

class TextStyleConstants {
  TextStyle extraSmallTextStyle =
      TextStyle(fontFamily: 'blisspro', fontSize: 10, color: AppColor().black);

  TextStyle smallTextStyle() {
    return TextStyle(
        fontFamily: 'blisspro', fontSize: 12, color: AppColor().black);
  }

  TextStyle mediumTextStyle() {
    return TextStyle(
        fontFamily: 'blisspro', fontSize: 14, color: AppColor().black);
  }

  TextStyle largeTextStyle() {
    return TextStyle(
        fontFamily: 'blisspro', fontSize: 16, color: AppColor().black);
  }

  TextStyle extraLargeTextStyle() {
    return TextStyle(
        fontFamily: 'blisspro', fontSize: 20, color: AppColor().black);
  }
}
