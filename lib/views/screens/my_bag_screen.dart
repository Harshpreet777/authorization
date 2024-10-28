import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/constants/font_constant.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/message_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/viewmodels/my_bag_viewmodel.dart';
import 'package:flutter_boilerplate/views/screens/base_view.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_image_widget.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_text_widget.dart';
import 'package:flutter_boilerplate/views/widgets/components/custom_scaffold.dart';

class MyBagScreen extends StatelessWidget {
  MyBagScreen({super.key});
  final ImageConstant imageConstant = ImageConstant();
  final StringConstants stringConstants = StringConstants();
  final AppColor appColor = AppColor();
  final FontConstants fontConstants = FontConstants();
  final MessageConstant messageConstant = MessageConstant();

  @override
  Widget build(BuildContext context) {
    return BaseView<MyBagViewModel>(
      onModelReady: (viewModel) {},
      viewModel: MyBagViewModel(),
      builder: (context, viewModel, child) {
        return CustomScaffold(
            showAppBar: false,
            body: SafeArea(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CommonTextWidget(
                        stringConstants.myBag,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: fontConstants.gilroy,
                            color: appColor.black),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 24),
                      child: CommonTextWidget(
                        stringConstants.thePizzaPlace,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: fontConstants.gilroy,
                            color: appColor.black.withOpacity(0.6)),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CommonImageWidget(
                          imageSource: imageConstant.pizza1Img,
                          isNetworkImage: false,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CommonTextWidget(
                                stringConstants.kingsDeal,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: fontConstants.gilroy,
                                    color: appColor.black),
                              ),
                              IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.close_rounded,
                                    size: 16,
                                    color: appColor.black,
                                  ))
                            ],
                          ),
                          CommonTextWidget(
                            "Size: Large  Variant: BBQ Chicken",
                            style: TextStyle(
                                fontFamily: fontConstants.gilroy,
                                fontSize: 12,
                                color: appColor.black.withOpacity(0.6)),
                          ),
                          Row(
                            children: [
                              CommonTextWidget(
                                stringConstants.price,
                                style: TextStyle(
                                    color: appColor.black.withOpacity(0.6),
                                    fontFamily: fontConstants.gilroy,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: appColor.black.withOpacity(0.1)),
                                child: CommonTextWidget(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: viewModel.count == 1
                                          ? appColor.black.withOpacity(0.2)
                                          : appColor.black,
                                      fontFamily: fontConstants.gilroy,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: CommonTextWidget(
                                  "${viewModel.count}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: fontConstants.gilroy,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: appColor.black.withOpacity(0.4)),
                                child: CommonTextWidget(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: appColor.black,
                                      fontFamily: fontConstants.gilroy,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
