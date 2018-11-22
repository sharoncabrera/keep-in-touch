
import 'package:flutter/material.dart';
import 'package:keep_in_touch/routes/chat_route.dart';

navigateToChat(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ChatRoute()),
  );
}