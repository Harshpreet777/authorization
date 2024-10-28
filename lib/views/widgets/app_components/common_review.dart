import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/font_constant.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_text_widget.dart';

class CommonReviewWidget extends StatelessWidget {
  CommonReviewWidget({super.key, required this.distance, this.size = 20});
  final AppColor appColor = AppColor();
  final ImageConstant imageConstant = ImageConstant();
  final StringConstants stringConstants = StringConstants();
  final FontConstants fontConstants = FontConstants();
  final String distance;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: List.generate(
              5,
              (index) => Icon(
                    Icons.star_rounded,
                    size: size,
                    color: appColor.starColor,
                  )),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              imageConstant.locationIcon,
              color: appColor.black.withOpacity(0.4),
              fit: BoxFit.contain,
              height: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        CommonTextWidget(
          '$distance${stringConstants.distance}',
          style: TextStyle(
              color: appColor.black.withOpacity(0.4),
              fontSize: 15,
              fontFamily: fontConstants.gilroy,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
