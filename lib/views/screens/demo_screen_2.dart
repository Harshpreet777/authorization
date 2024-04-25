import 'package:flutter/material.dart';

import '../../constants/routes_constant.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, AppRoutes.homePageRoute,
                arguments: "Test");
          },
          child: const Placeholder()),
    );
  }
}
