import 'package:flutter/material.dart';

class CommonTextWidget extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? width;

  const CommonTextWidget(
    this.data, {
    super.key,
    this.maxLines,
    this.overflow,
    this.style,
    this.textAlign,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.displayMedium,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines ?? 20,
      textAlign: textAlign ?? TextAlign.start,
      softWrap: true,
    );
  }
}
