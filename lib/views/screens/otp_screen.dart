import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/routes_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/viewmodels/otp_screen_viewmodel.dart';
import 'package:flutter_boilerplate/views/screens/base_view.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/common_text_button.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/common_textformfield.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_text_widget.dart';
import 'package:flutter_boilerplate/views/widgets/components/custom_scaffold.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  final StringConstants stringConstants = StringConstants();
  final AppColor appColor = AppColor();
  final ImageConstant imageConstant = ImageConstant();
  @override
  Widget build(BuildContext context) {
    return BaseView<OtpScreenViewModel>(
      viewModel: OtpScreenViewModel(),
      onModelReady: (viewModel) {
        viewModel.timerStart();
      },
      builder: (context, viewModel, child) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          viewModel.buttonDisable();
        });
        return CustomScaffold(
            showAppBar: false, body: buildBody(viewModel, context));
      },
    );
  }

  Widget buildBody(OtpScreenViewModel viewModel, BuildContext context) {
    return SafeArea(
      child: Form(
        key: viewModel.formKey,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Align(
                      alignment: Alignment.center,
                      child: CommonTextWidget(
                        stringConstants.verification,
                        style: TextStyle(
                            color: appColor.primary400,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CommonTextWidget(
                      stringConstants.codeMsg,
                      style: TextStyle(
                          color: appColor.neutral900,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: List.generate(
                        viewModel.controllerList.length,
                        (index) => Flexible(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: CommonTextFormField(
                                  focusNode: viewModel.focusList[index],
                                  onTap: () {
                                    if (viewModel
                                        .controllerList[0].text.isEmpty) {
                                      FocusScope.of(context)
                                          .requestFocus(viewModel.focusList[0]);
                                    }
                                  },
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  onChanged: (value) {
                                    viewModel.changeFocus(
                                        value, context, index);
                                  },
                                  style: TextStyle(
                                      color: appColor.neutral900,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  textEditingController:
                                      viewModel.controllerList[index])),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CommonTextWidget(
                      stringConstants.didNotReceiveCode,
                      style: TextStyle(
                          color: appColor.neutral900,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          imageConstant.clockIcon,
                          width: 20,
                          fit: BoxFit.cover,
                          color: appColor.neutral900,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CommonTextWidget(
                          viewModel.count < 10
                              ? "00 : 0${viewModel.count}"
                              : "00 : ${viewModel.count}",
                          style: TextStyle(
                              color: appColor.neutral900,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      viewModel.count = 45;
                      viewModel.timerStart();
                      viewModel.updateUI();
                    },
                    child: CommonTextWidget(
                      stringConstants.resendCode,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: viewModel.count == 0
                              ? appColor.primary500
                              : appColor.neutral100),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: CommonButton(
                isDisable: viewModel.isDisable,
                text: stringConstants.verify,
                onPressed: () {
                  viewModel.onSumbit();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextWidget(
                    stringConstants.backTo,
                    style: TextStyle(
                        color: appColor.neutral900,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.loginRoute);
                    },
                    child: CommonTextWidget(
                      stringConstants.signIn,
                      style: TextStyle(
                          color: appColor.primary500,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
