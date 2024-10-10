import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/viewmodels/login_screen_viewmodel.dart';
import 'package:flutter_boilerplate/views/screens/base_view.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/common_icon_button.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/common_text_button.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/common_textformfield.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_text_widget.dart';
import 'package:flutter_boilerplate/views/widgets/components/custom_scaffold.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final StringConstants stringConstants = StringConstants();
  final AppColor appColor = AppColor();
  final ImageConstant imageConstant = ImageConstant();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginScreenViewModel>(
      viewModel: LoginScreenViewModel(),
      onModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return CustomScaffold(
            showAppBar: false,
            body: SafeArea(
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
                              stringConstants.login,
                              style: TextStyle(
                                  color: appColor.primary400,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: CommonTextFormField(
                              controller: TextEditingController(),
                              hintText: "number",
                              isObscure: false),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                side: BorderSide(
                                    color: appColor.neutral100, width: 1.5),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                value: false,
                                onChanged: (value) {},
                              ),
                            ),
                            CommonTextWidget(stringConstants.rememberMe,
                                style: TextStyle(
                                    color: appColor.neutral900,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: CommonButton(
                      text: stringConstants.signIn,
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Divider(
                              color: appColor.neutral200,
                            ),
                          ),
                        ),
                        CommonTextWidget(
                          stringConstants.orSignIn,
                          style: TextStyle(
                              color: appColor.neutral400,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Divider(
                              color: appColor.neutral200,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          viewModel.iconButtonList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                            child: CommonIconButton(
                                  image: viewModel.iconButtonList[index].image,
                                  onTap: viewModel.iconButtonList[index].onTap,
                                ),
                          ))),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonTextWidget(
                          stringConstants.dontHaveAcc,
                          style: TextStyle(
                              color: appColor.neutral900,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CommonTextWidget(
                          stringConstants.register,
                          style: TextStyle(
                              color: appColor.primary500,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
