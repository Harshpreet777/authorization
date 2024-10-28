import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/font_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/utils/helper/responsive_helper.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_text_widget.dart';

class CommonButton extends StatelessWidget {
  CommonButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isDisable = false});
  final AppColor appColor = AppColor();
  final String text;
  final void Function()? onPressed;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive().screenWidth(context),
      child: TextButton(
          style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              backgroundColor:
                  isDisable ? appColor.primary200 : appColor.secondary100),
          onPressed: isDisable ? null : onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: CommonTextWidget(
              text,
              style: TextStyle(
                  color: appColor.black,
                  fontSize: 16,
                  fontFamily: FontConstants().gilroy,
                  fontWeight: FontWeight.w700),
            ),
          )),
    );
  }
}
