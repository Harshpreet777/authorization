import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/viewmodels/material_app_viewmodel.dart';
import 'package:flutter_boilerplate/views/widgets/common_text_widget.dart';
import 'package:provider/provider.dart';

import '../../constants/routes_constant.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () {
            Provider.of<MaterialAppViewModel>(context, listen: false).count++;
            Navigator.pushReplacementNamed(context, AppRoutes.homePageRoute,
                arguments: "Test");
          },
          child: Container(
            alignment: Alignment.center,
            child: CommonTextWidget(
                "Cart Count >> ${Provider.of<MaterialAppViewModel>(context, listen: false).count}"),
          )),
    );
  }
}
