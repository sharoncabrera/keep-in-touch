import 'package:flutter/material.dart';
import 'package:keep_in_touch/utils/mock_data.dart';

Widget userBuble(String message) {
  return ListTile(
    leading: CircleAvatar(child: Image.network("")),
    title: Text(mocksUsers[0].nickname),
    subtitle: Text(message),
  );
}
