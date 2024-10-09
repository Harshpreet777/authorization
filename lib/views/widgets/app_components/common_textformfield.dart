import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';

class CommonTextFormField extends StatelessWidget {
  CommonTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.isObscure});
  final String hintText;
  final TextEditingController controller;
  final bool isObscure;
  final AppColor appColor = AppColor();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: TextFormField(
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
            fillColor: appColor.white,
            filled: true,
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: appColor.white))),
      ),
    );
  }
}
