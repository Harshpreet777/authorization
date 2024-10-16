import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0071789, size.height * -0.0065200);
    path_0.lineTo(size.width * 0.9978439, size.height * -0.0065200);
    path_0.quadraticBezierTo(
      size.width * 1.0016545,
      size.height * 0.5178797,
      size.width * 1.0010155,
      size.height * 0.6469247,
    );
    path_0.cubicTo(
      size.width * 1.0018500,
      size.height * 0.8024000,
      size.width * 0.8369000,
      size.height * 0.6472400,
      size.width * 0.7844750,
      size.height * 0.8730800,
    );
    path_0.cubicTo(
      size.width * 0.7516000,
      size.height * 1.0286400,
      size.width * 0.6435751,
      size.height * 1.0093998,
      size.width * 0.6446402,
      size.height * 1.0127516,
    );
    path_0.quadraticBezierTo(
      size.width * 0.4776122,
      size.height * 1.0163428,
      size.width * -0.0007974,
      size.height * 1.0129511,
    );
    path_0.lineTo(size.width * 0.0071789, size.height * -0.0065200);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
