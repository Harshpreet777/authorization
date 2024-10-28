import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/constants/font_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_text_widget.dart';

class CommonMenuCard extends StatelessWidget {
  CommonMenuCard(
      {super.key, required this.image, required this.desc, required this.name});
  final FontConstants fontConstants = FontConstants();
  final AppColor appColor = AppColor();
  final StringConstants stringConstants = StringConstants();
  final String image;
  final String desc;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          height: 100,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CommonTextWidget(
                    name,
                    style: TextStyle(
                        color: appColor.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontConstants.gilroy),
                  ),
                ),
                Flexible(
                  child: CommonTextWidget(
                    desc,
                    style: TextStyle(
                        color: appColor.black.withOpacity(0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: fontConstants.gilroy),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35, right: 20),
          child: CommonTextWidget(
            stringConstants.price,
            style: TextStyle(
                fontSize: 13,
                color: appColor.black,
                fontWeight: FontWeight.w500,
                fontFamily: fontConstants.gilroy),
          ),
        )
      ],
    );
  }
}
