import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/font_constant.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/viewmodels/menu_screen_viewmodel.dart';
import 'package:flutter_boilerplate/views/screens/base_view.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_single_child_scrollview.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_text_widget.dart';
import 'package:flutter_boilerplate/views/widgets/components/custom_scaffold.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});
  final ImageConstant imageConstant = ImageConstant();
  final StringConstants stringConstants = StringConstants();
  final AppColor appColor = AppColor();
  final FontConstants fontConstants = FontConstants();
  @override
  Widget build(BuildContext context) {
    return BaseView<MenuScreenViewModel>(
        viewModel: MenuScreenViewModel(),
        onModelReady: (viewModel) {},
        builder: (context, viewModel, child) {
          return CustomScaffold(
              showAppBar: false,
              body: CommonSingleChildScrollView(
                child: Column(
                  children: [
                    Stack(children: [
                      Image.asset(
                        imageConstant.pizzaImg,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        top: 65,
                        left: 25,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18)),
                              color: appColor.white.withOpacity(0.4)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back)),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 30,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: appColor.black.withOpacity(0.4)),
                          child: CommonTextWidget(
                            stringConstants.freeDelivery,
                            style: TextStyle(
                                color: appColor.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: fontConstants.gilroy),
                          ),
                        ),
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTextWidget(
                            stringConstants.thePizzaPlace,
                            style: TextStyle(
                                fontSize: 20,
                                color: appColor.black,
                                fontFamily: fontConstants.gilroy),
                          ),
                          CommonTextWidget(
                            stringConstants.deliveryTime,
                            style: TextStyle(
                                color: appColor.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: fontConstants.gilroy),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
