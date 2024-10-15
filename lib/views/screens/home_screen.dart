import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/font_constant.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/viewmodels/home_screen_viewmodel.dart';
import 'package:flutter_boilerplate/views/screens/base_view.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_text_widget.dart';
import 'package:flutter_boilerplate/views/widgets/components/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final StringConstants stringConstants = StringConstants();
  final AppColor appColor = AppColor();
  final ImageConstant imageConstant = ImageConstant();
  final FontConstants fontConstants = FontConstants();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScreenViewModel>(
      onModelReady: (viewModel) {},
      viewModel: HomeScreenViewModel(),
      builder: (context, viewModel, child) {
        return CustomScaffold(
          showAppBar: false,
          body: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextWidget(
                          stringConstants.deliverTo,
                          style: TextStyle(
                              fontSize: 20,
                              color: appColor.black,
                              fontWeight: FontWeight.w600),
                        ),
                        CommonTextWidget(
                          stringConstants.address,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: fontConstants.gilroy,
                              color: appColor.black500,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18)),
                          color: appColor.secondary300.withOpacity(0.4)),
                      child: Image.asset(
                        imageConstant.profileIcon,
                        fit: BoxFit.contain,
                        width: 24,
                        height: 24,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 30),
                        child: Image.asset(
                          imageConstant.searchIcon,
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                      fillColor: appColor.black.withOpacity(0.1),
                      filled: true,
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: appColor.red),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(23))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: appColor.red),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(23))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(23))),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(23))),
                      hintText: stringConstants.searchBarText,
                      hintStyle: TextStyle(
                          color: appColor.black,
                          fontFamily: fontConstants.gilroy,
                          fontSize: 13)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonTextWidget(
                      stringConstants.popularRestaurants,
                      style: TextStyle(
                          color: appColor.black,
                          fontFamily: fontConstants.gilroy,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    CommonTextWidget(
                      stringConstants.viewAll,
                      style: TextStyle(
                        color: appColor.black500,
                        fontSize: 13,
                        fontFamily: fontConstants.gilroy,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    child: Column(
                  children: [
                    Stack(clipBehavior: Clip.none, children: [
                      ClipPath(
                        clipper: MyCustomClipper(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            imageConstant.pizzaImg,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        right: -10,
                        bottom: -20,
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: appColor.black,
                              borderRadius: BorderRadius.circular(50)),
                          child: Image.asset(
                            imageConstant.arrowIcon,
                            height: 20,
                            width: 20,
                            color: appColor.white,
                          ),
                        ),
                      )
                    ])
                  ],
                )),
              )
            ],
          )),
        );
      },
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint = Offset(size.width / 2, size.height / 2);
    var endPoint = Offset(size.width, size.height);
    double radius = 90;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - radius)
      ..arcToPoint(
        Offset(size.width - radius, size.height),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
