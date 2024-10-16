import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/firebase_options.dart';
import 'package:flutter_boilerplate/theme/themes.dart';
import 'package:flutter_boilerplate/viewmodels/material_app_viewmodel.dart';
import 'package:flutter_boilerplate/views/screens/base_view.dart';
import 'package:flutter_boilerplate/views/screens/menu_screen.dart';

import 'router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
  static MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MaterialAppViewModel>(
        onModelReady: (viewmodel) {},
        viewModel: MaterialAppViewModel(),
        builder: (context, viewmodel, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            onGenerateRoute: PageRouter.generateRoute,
            theme: lightTheme(context),
            darkTheme: darkTheme(context),
            home:  MenuScreen(),
          );
        });
  }
}
