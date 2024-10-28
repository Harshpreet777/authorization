import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/font_constant.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/message_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/viewmodels/menu_screen_viewmodel.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/menu_screen/common_menu_card.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_single_child_scrollview.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_text_widget.dart';

class ComboDealsTab extends StatelessWidget {
  ComboDealsTab({super.key, required this.viewModel});
  final ImageConstant imageConstant = ImageConstant();
  final StringConstants stringConstants = StringConstants();
  final AppColor appColor = AppColor();
  final FontConstants fontConstants = FontConstants();
  final MessageConstant messageConstant = MessageConstant();
  final MenuScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return CommonSingleChildScrollView(
      child: Column(
        children: [
          CommonMenuCard(
            image: imageConstant.pizza1Img,
            desc: messageConstant.kingsDeal,
            name: stringConstants.kingsDeal,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CommonTextWidget(
                stringConstants.classicPizza,
                style: TextStyle(
                  color: appColor.black.withOpacity(0.4),
                  fontFamily: fontConstants.gilroy,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          ...viewModel.classicPizzaList.map((pizza) {
            return CommonMenuCard(
              image: pizza.image,
              desc: pizza.desc,
              name: pizza.name,
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CommonTextWidget(
                stringConstants.premiumPizza,
                style: TextStyle(
                  color: appColor.black.withOpacity(0.4),
                  fontFamily: fontConstants.gilroy,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          ...viewModel.premiumPizzaList.map((pizza) {
            return CommonMenuCard(
              image: pizza.image,
              desc: pizza.desc,
              name: pizza.name,
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CommonTextWidget(
                stringConstants.sides,
                style: TextStyle(
                  color: appColor.black.withOpacity(0.4),
                  fontFamily: fontConstants.gilroy,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          ...viewModel.sidesList.map((pizza) {
            return CommonMenuCard(
              image: pizza.image,
              desc: pizza.desc,
              name: pizza.name,
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CommonTextWidget(
                stringConstants.drinks,
                style: TextStyle(
                  color: appColor.black.withOpacity(0.4),
                  fontFamily: fontConstants.gilroy,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          ...viewModel.drinksList.map((pizza) {
            return CommonMenuCard(
              image: pizza.image,
              desc: pizza.desc,
              name: pizza.name,
            );
          }),
        ],
      ),
    );
  }
}
