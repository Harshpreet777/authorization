import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/constants/font_constant.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/message_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/viewmodels/menu_screen_viewmodel.dart';
import 'package:flutter_boilerplate/views/screens/base_view.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/common_text_button.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_image_widget.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_single_child_scrollview.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_text_widget.dart';
import 'package:flutter_boilerplate/views/widgets/components/custom_scaffold.dart';

class PizzaItemDetailScreen extends StatelessWidget {
  PizzaItemDetailScreen({super.key});
  final ImageConstant imageConstant = ImageConstant();
  final StringConstants stringConstants = StringConstants();
  final AppColor appColor = AppColor();
  final FontConstants fontConstants = FontConstants();
  final MessageConstant messageConstant = MessageConstant();

  @override
  Widget build(BuildContext context) {
    return BaseView<MenuScreenViewModel>(
      onModelReady: (viewModel) {},
      viewModel: MenuScreenViewModel(),
      builder: (context, viewModel, child) {
        return CustomScaffold(
            appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 200),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                        color: appColor.black.withOpacity(0.1),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                    CommonTextWidget(
                      stringConstants.kingsDeal,
                      style: TextStyle(
                          fontFamily: fontConstants.gilroy,
                          fontSize: 20,
                          color: appColor.black,
                          fontWeight: FontWeight.w500),
                    ),
                    CommonTextWidget(
                      stringConstants.price,
                      style: TextStyle(
                          fontFamily: fontConstants.gilroy,
                          fontSize: 20,
                          color: appColor.secondary300,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            body: CommonSingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: CommonImageWidget(
                      imageSource: imageConstant.pizza1Img,
                      isNetworkImage: false,
                      height: 300,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      containerBtn(stringConstants.large),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: containerBtn(stringConstants.medium),
                      ),
                      containerBtn(stringConstants.small)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonTextWidget(
                          stringConstants.price,
                          style: TextStyle(
                              fontFamily: fontConstants.gilroy,
                              fontSize: 23,
                              color: appColor.secondary300,
                              fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(13)),
                              onTap: () {
                                viewModel.decreaseCount();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(13)),
                                    border: Border.all(
                                        color: viewModel.count == 1
                                            ? appColor.black.withOpacity(0.2)
                                            : appColor.black500,
                                        width: 1)),
                                child: CommonTextWidget(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: viewModel.count == 1
                                          ? appColor.black.withOpacity(0.2)
                                          : appColor.black,
                                      fontFamily: fontConstants.gilroy,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: CommonTextWidget(
                                "${viewModel.count}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: fontConstants.gilroy,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(13)),
                              onTap: () {
                                viewModel.increaseCount();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(13)),
                                    border: Border.all(
                                        color: appColor.black500, width: 1)),
                                child: CommonTextWidget(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: fontConstants.gilroy,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: CommonTextWidget(
                      messageConstant.kingsDeal,
                      style: TextStyle(
                          color: appColor.black.withOpacity(0.6),
                          fontSize: 15,
                          fontFamily: fontConstants.gilroy,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 22, right: 22, top: 35),
                      child: CommonTextWidget(
                        messageConstant.selectVariant,
                        style: TextStyle(
                            color: appColor.black.withOpacity(0.42),
                            fontSize: 14,
                            fontFamily: fontConstants.gilroy,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    child: Wrap(
                      children: List.generate(
                          viewModel.classicPizzaList.length,
                          (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: containerBtn(
                                    viewModel.classicPizzaList[index].name),
                              )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 22, right: 22, top: 15),
                      child: CommonTextWidget(
                        messageConstant.selectPetDrink,
                        style: TextStyle(
                            color: appColor.black.withOpacity(0.42),
                            fontSize: 14,
                            fontFamily: fontConstants.gilroy,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    child: Wrap(
                        children: List.generate(
                            viewModel.petDrinkList.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: containerBtn(
                                      viewModel.petDrinkList[index]),
                                ))),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 22, right: 22, bottom: 30),
                    child: CommonButton(
                      text: stringConstants.addToBag,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }

  Container containerBtn(String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          border: Border.all(color: appColor.black500, width: 1.2)),
      child: CommonTextWidget(
        text,
        style: TextStyle(
            color: appColor.black500,
            fontSize: 15,
            fontFamily: fontConstants.gilroy,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
