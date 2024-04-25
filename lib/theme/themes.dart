import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';

ThemeData lightTheme(BuildContext context) {
  final appColor = AppColor();
  return ThemeData(
      // sliderTheme: const SliderThemeData(
      //   showValueIndicator: ShowValueIndicator.never,
      // ),
      // dividerColor: appColor.black,
      // fontFamily: 'blisspro',
      // colorScheme: ColorScheme(
      //     brightness: Brightness.light,
      //     primary: AppColor.lightBrown,
      //     onPrimary: AppColor.black,
      //     secondary: AppColor.white,
      //     onSecondary: AppColor.black,
      //     error: AppColor.red,
      //     onError: AppColor.white,
      //     background: AppColor.white,
      //     onBackground: AppColor.black,
      //     surface: AppColor.lightBrown,
      //     onSurface: AppColor.black),
      // textTheme: TextTheme(
      //   displayLarge: TextStyleConstants.headingStyleBold(context, 0.0),
      //   headlineLarge: TextStyleConstants.headingStyle(context, 0.0),
      //   displayMedium: TextStyleConstants.descriptionStyleBold(context),
      //   labelMedium: TextStyleConstants.labelTextStyle(context),
      //   displaySmall: TextStyleConstants.smallStyle(context),
      //   labelSmall: TextStyleConstants.smallStyleW500(
      //     context,
      //   ),
      //   labelLarge: TextStyleConstants.smallStyleW700(
      //     context,
      //   ),
      //   titleSmall: TextStyleConstants.smallStyleW400(
      //     context,
      //   ),
      //   titleMedium: TextStyleConstants.smallStyleW300(
      //     context,
      //   ),
      //   bodyLarge: TextStyleConstants.labelLargeTextStyle(context),
      //   titleLarge: TextStyleConstants.smallStyleW500F14(context),
      //   bodyMedium: TextStyleConstants.labelLargeTextStyleW800F18(context),
      //   bodySmall: TextStyleConstants.textFieldLableF16W400(context),
      //   headlineMedium: TextStyleConstants.heading4Style(context),
      //   headlineSmall: TextStyleConstants.headingStyleLarge(context),
      //)
      );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
      // sliderTheme: const SliderThemeData(
      //   showValueIndicator: ShowValueIndicator.never,
      // ),
      // colorScheme: ColorScheme(
      //     brightness: Brightness.light,
      //     primary: AppColor.lightBrown,
      //     onPrimary: AppColor.black,
      //     secondary: AppColor.white,
      //     onSecondary: AppColor.black,
      //     error: AppColor.red,
      //     onError: AppColor.white,
      //     background: AppColor.white,
      //     onBackground: AppColor.black,
      //     surface: AppColor.lightBrown,
      //     onSurface: AppColor.black),
      // textTheme: TextTheme(
      //     displayLarge: TextStyleConstants.headingStyleBold(context, 0.0),
      //     headlineLarge: TextStyleConstants.headingStyle(context, 0.0),
      //     displayMedium: TextStyleConstants.descriptionStyleBold(context),
      //     labelMedium: TextStyleConstants.labelTextStyle(context),
      //     displaySmall: TextStyleConstants.smallStyle(context),
      //     labelSmall: TextStyleConstants.smallStyleW500(
      //       context,
      //     ),
      //     labelLarge: TextStyleConstants.smallStyleW700(
      //       context,
      //     ),
      //     titleSmall: TextStyleConstants.smallStyleW400(
      //       context,
      //     ),
      //     titleMedium: TextStyleConstants.smallStyleW300(
      //       context,
      //     ),
      //     bodyMedium: TextStyleConstants.labelLargeTextStyleW800F18(context),
      //     bodyLarge: TextStyleConstants.labelLargeTextStyle(context),
      //     bodySmall: TextStyleConstants.textFieldLableF16W400(context),
      //     titleLarge: TextStyleConstants.smallStyleW500F14(context),
      //headlineMedium: TextStyleConstants.heading4Style(context))
      );
}
