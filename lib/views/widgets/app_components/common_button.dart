import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/utils/helper/responsive_helper.dart';

class CommonButton extends StatelessWidget {
  CommonButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.image,
      this.color});
  final AppColor appColor = AppColor();
  final String title;
  final VoidCallback onPressed;
  final String image;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      width: Responsive().givenWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: appColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              color: color,
              width: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: appColor.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
