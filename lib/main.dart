import 'package:flutter/material.dart';
import 'package:keep_in_touch/routes/menu_chat_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuChatRoute(title: 'Keep in touch'),
    );
  }
}

