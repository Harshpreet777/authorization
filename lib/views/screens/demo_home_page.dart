import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/main.dart';
import 'package:flutter_boilerplate/views/widgets/common_text_widget.dart';
import 'package:provider/provider.dart';

import '../../constants/routes_constant.dart';
import '../../viewmodels/material_app_viewmodel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter(BuildContext context) {
    setState(() {
      _counter++;
    });

    if (MyApp.of(context)!.localeName == 'en') {
      MyApp.of(context)!.setLocale(const Locale('es'));
    } else {
      MyApp.of(context)!.setLocale(const Locale('en'));
    }

    Provider.of<MaterialAppViewModel>(context, listen: false).count++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CommonTextWidget(
              StringConstants().welcomeText,
            ),
            CommonTextWidget(
                "Cart Count: ${Provider.of<MaterialAppViewModel>(context, listen: false).count}"),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.demoPage);
              },
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
