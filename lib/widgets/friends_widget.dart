import 'package:flutter/material.dart';
import 'package:keep_in_touch/utils/mock_data.dart';
import 'package:keep_in_touch/utils/theme_utils.dart';

Widget friendWidget(int index){
  return Card(
    child: ListTile(
      leading: CircleAvatar(
        child: Image.network(mocksUsers[index].url),
        backgroundColor: mainBlueColor,
      ),
      title: Text(mocksUsers[index].nickname),
      subtitle: Text("Quizás algo más quedaría bien"),
    ),
  );

}