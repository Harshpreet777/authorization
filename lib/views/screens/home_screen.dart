import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/viewmodels/home_screen_viewmodel.dart';
import 'package:flutter_boilerplate/views/screens/base_view.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/common_button.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/common_textformfield.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final StringConstants stringConstants = StringConstants();
  final ImageConstant imageConstant = ImageConstant();
  final AppColor appColor = AppColor();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScreenViewModel>(
        viewModel: HomeScreenViewModel(),
        onModelReady: (viewModel) {},
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: appColor.black,
            body: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    stringConstants.signIn,
                    style: TextStyle(
                      fontSize: 50,
                      color: appColor.white,
                    ),
                  ),
                  CommonTextFormField(
                      controller: viewModel.emailController,
                      hintText: stringConstants.email,
                      isObscure: false),
                  CommonTextFormField(
                      controller: viewModel.passController,
                      hintText: stringConstants.pass,
                      isObscure: true),
                  CommonButton(
                      title: stringConstants.signUp,
                      image: imageConstant.userIcon,
                      onPressed: () async {
                        await viewModel.signUpWithEmailPass();
                        viewModel.emailController.text = "";
                        viewModel.passController.text = "";
                        viewModel.updateUI();
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Divider(
                      color: appColor.white,
                    ),
                  ),
                  GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      padding: EdgeInsets.zero,
                      childAspectRatio: 2.4,
                      children: List.generate(
                          viewModel.buttonList.length,
                          (index) => CommonButton(
                              title: viewModel.buttonList[index].title,
                              onPressed: viewModel.buttonList[index].onPressed,
                              image: viewModel.buttonList[index].image))),
                ],
              ),
            ),
          );
        });
  }
}
