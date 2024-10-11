import 'package:flutter/material.dart';
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
              backgroundColor:
                  isDisable ? appColor.primary200 : appColor.primary500),
          onPressed: isDisable ? null : onPressed,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: CommonTextWidget(
              text,
              style: TextStyle(
                  color: appColor.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}
