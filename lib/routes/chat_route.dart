import 'package:flutter/material.dart';
import 'package:keep_in_touch/widgets/app_bar_widget.dart';
import 'package:keep_in_touch/widgets/bottom_app_bar_widget.dart';


class ChatRoute extends StatefulWidget {
  @override
  _ChatRouteState createState() => _ChatRouteState();
}
class _ChatRouteState extends State<ChatRoute> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Container(
          height: height - 40.0,
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Text("Salió de rumba"),
            ],
          ),
        ),
        bottomNavigationBar: bottomAppBar(context: context),
      ),
    );
  }
}
