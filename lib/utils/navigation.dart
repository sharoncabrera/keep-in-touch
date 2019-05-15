import 'package:flutter/material.dart';
import 'package:keep_in_touch/routes/chat_route.dart';
import 'package:keep_in_touch/routes/chats_room_route.dart';
import 'package:keep_in_touch/routes/login_route.dart';
import 'package:keep_in_touch/routes/menu_chat_route.dart';
import 'package:keep_in_touch/routes/settings_route.dart';

navigateToChat(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ChatRoute()),
  );
}

navigateToChatRoom(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ChatRoomRoute()),
  );
}

navigateToMenuChat(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MenuChatRoute()),
  );
}

navigateToLogin(BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false);
}

navigateToSttings(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SettingsRoute()));
}

popNavigation(BuildContext context) {
  Navigator.maybePop(context);
}
