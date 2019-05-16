import 'package:flutter/material.dart';
import 'package:keep_in_touch/routes/chat_route.dart';
import 'package:keep_in_touch/routes/chats_room_route.dart';
import 'package:keep_in_touch/routes/login_route.dart';
import 'package:keep_in_touch/routes/menu_chat_route.dart';
import 'package:keep_in_touch/routes/settings_route.dart';

navigateToChat(BuildContext context, document) {
//  Navigator.push(
//    context,
//    MaterialPageRoute(
//        builder: (context) => ChatRoute(
//              peerId: null,
//              peerAvatar: null,
//            )),
//  );

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ChatRoute(
            peerId: document.documentID,
            peerAvatar: document['photoUrl'],
          ),
    ),
  );
}

navigateToChatRoom(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => ChatRoomRoute()),
  );
}

navigateToMenuChat(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => MenuChatRoute()),
  );
}

navigateToLogin(BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false);
}

navigateToSettings(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SettingsRoute()));
}

popNavigation(BuildContext context) {
  Navigator.maybePop(context);
}
