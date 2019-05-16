import 'package:flutter/material.dart';
import 'package:keep_in_touch/routes/main_menu.dart';
import 'package:keep_in_touch/utils/theme_utils.dart';

class ChatRoomRoute extends StatefulWidget {
  @override
  _ChatRoomRouteState createState() => _ChatRoomRouteState();
}

class _ChatRoomRouteState extends State<ChatRoomRoute> {
  double height = 0.0;

  Widget _getBody() => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: bottomAppBarColor),
            elevation: 0.2,
            automaticallyImplyLeading: false,
            title: Text(
              "CHAT ROOM",
              style: TextStyle(color: strongGreyColor),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          backgroundColor: greyBackgroundColor,
          body: Container(
            height: height - 40.0,
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Text("CHAT ROOM"),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return MainMenu(_getBody(), 'ChatFriendsRoute');
  }
}
