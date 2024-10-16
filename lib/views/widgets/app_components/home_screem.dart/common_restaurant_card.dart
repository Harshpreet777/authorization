import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/font_constant.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/models/response/restaurants_repsonse_model.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/utils/helper/responsive_helper.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/home_screem.dart/custom_clipper.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_text_widget.dart';

class CommonRestaurantCard extends StatelessWidget {
  CommonRestaurantCard({super.key, required this.model});
  final ImageConstant imageConstant = ImageConstant();
  final AppColor appColor = AppColor();
  final StringConstants stringConstants = StringConstants();
  final FontConstants fontConstants = FontConstants();
  final RestaurantResponseModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            ClipPath(
              clipper: MyCustomClipper(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  model.image,
                  width: Responsive().givenWidth,
                  height: 250,
                  fit: BoxFit.cover,
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
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CommonTextWidget(
                model.name,
                style: TextStyle(
                    fontFamily: fontConstants.gilroy,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: appColor.black),
              ),
            ),
          ),
          Row(
            children: [
              Row(
                children: List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          size: 20,
                          color: appColor.starColor,
                        )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 140, right: 10),
                child: Image.asset(
                  imageConstant.locationIcon,
                  color: appColor.black.withOpacity(0.4),
                  fit: BoxFit.contain,
                  height: 20,
                ),
              ),
              Flexible(
                child: CommonTextWidget(
                  '${model.distance}${stringConstants.distance}',
                  style: TextStyle(
                      color: appColor.black.withOpacity(0.4),
                      fontSize: 15,
                      fontFamily: fontConstants.gilroy,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
