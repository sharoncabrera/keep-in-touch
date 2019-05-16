import 'package:flutter/material.dart';
import 'package:keep_in_touch/utils/navigation.dart';

class MainMenu extends StatelessWidget {
  final Widget body;
  final String contextScreen;

  MainMenu(this.body, this.contextScreen);

  Widget _getInfoBarWorkaround() => PreferredSize(
        child: Container(),
        preferredSize: Size(30.0, 0.0),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _getInfoBarWorkaround(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                size: 32.0,
                color: contextScreen == "MenuChatRoute"
                    ? Colors.blue
                    : Colors.black,
              ),
              onPressed: () {
                if (contextScreen == "ChatFriendsRoute")
                  navigateToMenuChat(context);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.near_me,
                size: 30.0,
                color: contextScreen == "ChatFriendsRoute"
                    ? Colors.blue
                    : Colors.black,
              ),
              onPressed: () {
                if (contextScreen == "MenuChatRoute")
                  navigateToChatRoom(context);
              },
            ),
          ],
        ),
      ),
      //BottomNavBar(),
      body: body,
    );
  }
}
