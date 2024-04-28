import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/theme/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'router/app_router.dart';
import 'views/screens/demo_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale? currentLocale = Locale('en');
  String localeName = "es";

  void setLocale(Locale value) {
    setState(() {
      currentLocale = value;
      localeName = value.languageCode;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

        LocalJsonLocalization.delegate,
      ],
      onGenerateRoute: PageRouter.generateRoute,
      theme: lightTheme(context),
      supportedLocales: [
        Locale('en'),
        Locale('es'),
      ],
      darkTheme: darkTheme(context),
      locale: currentLocale,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
