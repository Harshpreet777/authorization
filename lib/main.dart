import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/theme/themes.dart';
import 'router/app_router.dart';
import 'views/screens/demo_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: PageRouter.generateRoute,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
