import 'package:flutter/material.dart';
import 'package:keep_in_touch/utils/navigation.dart';
import 'package:keep_in_touch/utils/theme_utils.dart';

Widget bottomAppBar({BuildContext context}) {
  BottomAppBar(
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.home,
            size: 32.0,
            color: context.widget.toString() == "MenuChatRoute"
                ? mainBlueColor
                : Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.near_me,
            size: 30.0,
            color: context.widget.toString() == "ChatRoomRoute"
                ? mainBlueColor
                : Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    ),
  );

  return BottomAppBar(
    color: mainGreenColor,
    elevation: 1.0,
    child: Container(
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.people,
                size: 32.0,
                color: context.widget.toString() == "MenuChatRoute"
                    ? mainBlueColor
                    : Colors.white,
              ),
              splashColor: secondaryGreenColor,
              highlightColor: secondaryGreenColor,
              onPressed: () {
                context.widget.toString() == "MenuChatRoute"
                    ? null
                    : navigateToMenuChat(context);
              }),
          Container(
            height: 35.0,
            child: Text(
              "|",
              style: TextStyle(fontSize: 30.0, color: Colors.white),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.chat,
                size: 30.0,
                color: context.widget.toString() == "ChatRoomRoute"
                    ? mainBlueColor
                    : Colors.white,
              ),
              splashColor: secondaryGreenColor,
              highlightColor: secondaryGreenColor,
              onPressed: () {
                context.widget.toString() == "ChatRoomRoute"
                    ? null
                    : navigateToChatRoom(context);
              }), // context.widget.toString() == "MenuChatRoute" ? null: navigateToMenuChat(context)),
        ],
      ),
    ),
  );
}
