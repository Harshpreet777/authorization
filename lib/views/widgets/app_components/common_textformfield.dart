import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_text_widget.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField(
      {super.key,
      this.hintText,
      required this.textEditingController,
      this.iconData,
      this.validator,
      this.isObscure = false,
      this.inputFormatters,
      this.isFlag = false,
      this.style,
      this.textAlign = TextAlign.start,
      this.onChanged,
      this.contentPadding,
      this.focusNode,
      this.onTap,
      this.keyboardType});
  final String? hintText;
  final TextEditingController textEditingController;
  final bool isObscure;
  final IconData? iconData;
  final bool isFlag;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextStyle? style;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  final AppColor appColor = AppColor();

  final ImageConstant imageConstant = ImageConstant();

  final StringConstants stringConstants = StringConstants();

  String countryFlag = '🇮🇳';
  String countryCode = '91';
  String exampleText = '9123456789';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      onTap: widget.onTap,
      showCursor: false,
      onChanged: widget.onChanged,
      textAlign: widget.textAlign,
      style: widget.style,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.isObscure,
      controller: widget.textEditingController,
      decoration: InputDecoration(
          fillColor: appColor.fillColor,
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
          filled: true,
          hintText: widget.hintText??exampleText,
          prefixIcon: widget.isFlag == true
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: CommonTextWidget(
                          countryFlag,
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 18),
                        child: GestureDetector(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true,
                              onSelect: (Country country) {
                                countryFlag = country.flagEmoji;
                                countryCode = country.phoneCode;
                                exampleText = country.example;
                                setState(() {});
                              },
                            );
                          },
                          child: Image.asset(
                            imageConstant.arrowDownIcon,
                            fit: BoxFit.cover,
                            width: 15,
                          ),
                        ),
                      ),
                      CommonTextWidget(
                        "(+$countryCode)",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: appColor.neutral300),
                      )
                    ],
                  ),
                )
              : widget.iconData != null
                  ? Icon(
                      widget.iconData,
                      color: appColor.neutral100,
                    )
                  : null,
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: appColor.red),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: appColor.red),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: appColor.neutral200),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: appColor.neutral50),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: appColor.neutral100)),
    );
  }
}
