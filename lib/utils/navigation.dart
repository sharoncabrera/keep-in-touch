
import 'package:flutter/material.dart';
import 'package:keep_in_touch/routes/chat_route.dart';
import 'package:keep_in_touch/routes/chats_room_route.dart';
import 'package:keep_in_touch/routes/menu_chat_route.dart';

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