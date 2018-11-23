import 'package:flutter/material.dart';
import 'package:keep_in_touch/widgets/app_bar_widget.dart';
import 'package:keep_in_touch/widgets/bottom_app_bar_widget.dart';

class ChatRoomRoute extends StatefulWidget {
  @override
  _ChatRoomRouteState createState() => _ChatRoomRouteState();
}
class _ChatRoomRouteState extends State<ChatRoomRoute> {
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
              Text("CHAT ROOM"),
            ],
          ),
        ),
        bottomNavigationBar: bottomAppBar(context: context),
      ),
    );
  }
}