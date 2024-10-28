import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/font_constant.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/message_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/viewmodels/menu_screen_viewmodel.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/menu_screen/common_menu_card.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_single_child_scrollview.dart';

class DrinksTab extends StatelessWidget {
  DrinksTab({super.key, required this.viewModel});
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
