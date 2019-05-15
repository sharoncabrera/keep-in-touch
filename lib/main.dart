import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:keep_in_touch/routes/splash_screen_route.dart';
import 'package:keep_in_touch/utils/app_state.dart';
import './translations.dart';

void main() => runApp(AppStateContainer(child: MyApp()));

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppStateContainerState container;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    container = AppStateContainer.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter app",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenRoute(),
      supportedLocales: [
        const Locale('es', ''),
        const Locale('ca', ''),
      ],
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
