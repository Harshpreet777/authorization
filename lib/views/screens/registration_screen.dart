import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/constants/routes_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/viewmodels/registration_screen_viewmodel.dart';
import 'package:flutter_boilerplate/views/screens/base_view.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/common_icon_button.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/common_text_button.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/common_textformfield.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_text_widget.dart';
import 'package:flutter_boilerplate/views/widgets/components/custom_scaffold.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});
  final StringConstants stringConstants = StringConstants();
  final AppColor appColor = AppColor();

  @override
  Widget build(BuildContext context) {
    return BaseView<RegistrationScreenViewModel>(
      viewModel: RegistrationScreenViewModel(),
      onModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        WidgetsBinding.instance.addPostFrameCallback((v) {
          viewModel.buttonDisable();
        });
        return CustomScaffold(
            showAppBar: false, body: buildBody(viewModel, context));
      },
    );
  }

  Widget buildBody(
      RegistrationScreenViewModel viewModel, BuildContext context) {
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
                        stringConstants.registration,
                        style: TextStyle(
                            color: appColor.primary400,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      child: CommonTextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            return viewModel.numberValidation(value ?? '');
                          },
                          isFlag: true,
                          hintText: stringConstants.numberHint,
                          textEditingController: viewModel.numberController)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: CommonTextFormField(
                        hintText: stringConstants.email,
                        validator: (value) {
                          return viewModel.emailValidation(value ?? '');
                        },
                        iconData: Icons.mail,
                        textEditingController: viewModel.emailController),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: CommonTextFormField(
                        validator: (value) {
                          return viewModel.nameValidation(value ?? '');
                        },
                        hintText: stringConstants.fullName,
                        iconData: Icons.person,
                        textEditingController: viewModel.nameController),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          activeColor: appColor.primary500,
                          side: BorderSide(
                              color: appColor.neutral100, width: 1.5),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          value: viewModel.rememberMe,
                          onChanged: (value) {
                            viewModel.rememberMe = value ?? false;
                            viewModel.updateUI();
                          },
                        ),
                      ),
                      CommonTextWidget(stringConstants.rememberMe,
                          style: TextStyle(
                              color: appColor.neutral900,
                              fontSize: 16,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: CommonButton(
                isDisable: viewModel.isDisable,
                text: stringConstants.register,
                onPressed: () {
                  viewModel.onSumbit();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
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
                    stringConstants.alreadyHaveAcc,
                    style: TextStyle(
                        color: appColor.neutral900,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.loginRoute,
                      );
                    },
                    child: CommonTextWidget(
                      stringConstants.signIn,
                      style: TextStyle(
                          color: appColor.primary500,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
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
