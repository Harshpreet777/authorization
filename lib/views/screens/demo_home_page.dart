import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/main.dart';
import 'package:flutter_boilerplate/views/widgets/common_text_widget.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/material_app_viewmodel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    Provider.of<MaterialAppViewModel>(context, listen: false).count++;
    setState(() {});
  }

  void changeLanguage() {
    if (MyApp.of(context)!.localeName == 'en') {
      MyApp.of(context)!.setLocale(const Locale('es'));
    } else {
      MyApp.of(context)!.setLocale(const Locale('en'));
    }
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
                "${StringConstants().cartCount.i18n()}: ${Provider.of<MaterialAppViewModel>(context, listen: false).count}"),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _incrementCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              changeLanguage();
            },
            tooltip: 'Change Language',
            child: const Icon(Icons.language),
          ),
        ],
      ),
    );
  }
}
