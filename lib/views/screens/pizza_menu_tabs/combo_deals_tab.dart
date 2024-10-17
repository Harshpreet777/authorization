import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/constants/font_constant.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/message_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/viewmodels/menu_screen_viewmodel.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/menu_screen/common_menu_card.dart';
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
    return Expanded(
      child: Column(
        children: [
          CommonMenuCard(
              image: imageConstant.pizza1Img,
              desc: messageConstant.kingsDeal,
              name: stringConstants.kingsDeal),
          Flexible(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: CommonTextWidget(
                      stringConstants.classicPizza,
                      style: TextStyle(
                          color: appColor.black.withOpacity(0.4),
                          fontFamily: fontConstants.gilroy,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    children: List.generate(
                        viewModel.classicPizzaList.length,
                        (index) => CommonMenuCard(
                            image: viewModel.classicPizzaList[index].image,
                            desc: viewModel.classicPizzaList[index].desc,
                            name: viewModel.classicPizzaList[index].name)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
