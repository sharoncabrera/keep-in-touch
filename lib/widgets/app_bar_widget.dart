import 'package:flutter/material.dart';
import 'package:keep_in_touch/translations.dart';
import 'package:keep_in_touch/utils/navigation.dart';
import 'package:keep_in_touch/utils/theme_utils.dart';

AppBar appBar({bool isChatMenu = false, isleading = false, BuildContext context}){
  return AppBar(
    title: Text(Translations.of(context).text('main_title')),
    backgroundColor: mainGreenColor,
    automaticallyImplyLeading: isleading,
    centerTitle: true,
    actions: <Widget>[
      isChatMenu?
      IconButton(icon: Icon(Icons.search), onPressed: (){null;}):
      IconButton(icon: Icon(Icons.group_add),
          onPressed: (){print("Hola");}),

    ],
  );
}