import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/utils/helper/responsive_helper.dart';
import 'package:flutter_boilerplate/viewmodels/home_screen_viewmodel.dart';
import 'package:flutter_boilerplate/views/screens/base_view.dart';

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
                  buildTextformField(
                      controller: viewModel.emailController,
                      hintText: stringConstants.email,
                      isObscure: false),
                  buildTextformField(
                      controller: viewModel.passController,
                      hintText: stringConstants.pass,
                      isObscure: true),
                  buildButtons(
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
                    children: [
                      buildButtons(
                          title: stringConstants.google,
                          image: imageConstant.googleIcon,
                          onPressed: () async {
                            await viewModel.signInWithGoogle();
                          }),
                      buildButtons(
                          title: stringConstants.facebook,
                          image: imageConstant.facebookIcon,
                          onPressed: () async {
                            await viewModel.signInWithFacebook();
                          }),
                      buildButtons(
                          title: stringConstants.anonymous,
                          image: imageConstant.anonymousIcon,
                          onPressed: () async {
                            await viewModel.signInAnonymous();
                          }),
                      buildButtons(
                          title: stringConstants.mobileNo,
                          image: imageConstant.phoneIcon,
                          onPressed: () async {
                            await viewModel.verifyPhoneNumber("+918510913274");
                          }),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Padding buildTextformField(
      {required TextEditingController controller,
      required String hintText,
      required bool isObscure}) {
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

  Container buildButtons(
      {required String title,
      required VoidCallback onPressed,
      required String image,
      Color? color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      width: Responsive().givenWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: appColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              color: color,
              width: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: appColor.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
