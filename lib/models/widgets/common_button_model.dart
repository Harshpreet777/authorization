import 'package:flutter/material.dart';

class CommonButtonModel {
  final String title;
  final String image;
  final VoidCallback onPressed;
  CommonButtonModel(
      {required this.title, required this.image, required this.onPressed});
}
