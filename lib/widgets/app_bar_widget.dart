import 'package:flutter/material.dart';
import 'package:keep_in_touch/utils/theme_utils.dart';

AppBar appBar({bool isChatMenu = false, isleading = false}){
  return AppBar(
    title: Text("Keep in touch"),
    backgroundColor: mainGreenColor,
    automaticallyImplyLeading: isleading,
    centerTitle: true,
    actions: <Widget>[
      isChatMenu?
      IconButton(icon: Icon(Icons.search), onPressed: (){print("Bucando");}):
      IconButton(icon: Icon(Icons.group_add),
          onPressed: (){print("Hola");}),

    ],
  );
}