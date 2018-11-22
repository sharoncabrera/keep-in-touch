import 'package:flutter/material.dart';

AppBar appBar({bool isChatMenu = false}){
  return AppBar(
    title: Text("Keep in touch"),
    automaticallyImplyLeading: true,
    leading: isChatMenu? IconButton(icon: Icon(Icons.menu, color: Colors.white,), onPressed: null): null,
    centerTitle: true,
    actions: <Widget>[
      isChatMenu?
      IconButton(icon: Icon(Icons.search), onPressed: (){print("Bucando");}):
      IconButton(icon: Icon(Icons.group_add),
          onPressed: (){print("Hola");}),

    ],
  );
}