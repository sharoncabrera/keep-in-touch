import 'package:flutter/material.dart';
import 'package:keep_in_touch/utils/navigation.dart';

class SplashScreenRoute extends StatefulWidget {
  SplashScreenRoute();

  _SplashScreenRouteState createState() => _SplashScreenRouteState();
}

class _SplashScreenRouteState extends State<SplashScreenRoute> {
  @override
  void initState() {
    super.initState();

    // The delay fixes it
    Future.delayed(Duration(milliseconds: 1000)).then((_) {
      //navigateToMenuChat(context);
      navigateToLogin(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Icon(Icons.ac_unit)),
    );
  }
}
