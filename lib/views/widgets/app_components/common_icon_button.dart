import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';

class CommonIconButton extends StatelessWidget {
  CommonIconButton({super.key, required this.image, required this.onTap});

  final AppColor appColor = AppColor();
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: appColor.neutral40, width: 1.5)),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: 22,
        ),
      ),
    );
  }
}
