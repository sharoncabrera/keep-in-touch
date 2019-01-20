import 'package:flutter/material.dart';
import 'package:keep_in_touch/utils/mock_data.dart';
import 'package:keep_in_touch/utils/navigation.dart';
import 'package:keep_in_touch/utils/theme_utils.dart';

Widget friendWidget(int index, BuildContext context){
  return  Container(
    foregroundDecoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black12,), insets: EdgeInsets.only(left: 65.0, right: 20.0)),
    child: ListTile(
      onTap: () {
        navigateToChat(context);
        },
      contentPadding: EdgeInsets.all(8.0),
        leading: CircleAvatar(
          child: Image.network(mocksUsers[index].url),
          backgroundColor: mainBlueColor,
        ),
        title: Text(mocksUsers[index].nickname),
        subtitle: Text("Quizás algo más quedaría bien"),
    ),
  );

}