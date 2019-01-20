import 'dart:io';

import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:keep_in_touch/translations.dart';
import 'package:path/path.dart';


double getScreenHeigh(BuildContext context){
  return MediaQuery.of(context).size.height;
}

String translate(BuildContext context, String key){
  return Translations.of(context).text(key);
}

Widget exitDialog(BuildContext context) {
  showDialog(
      context: context,builder: (_) => NetworkGiffyDialog(
    imageUrl:"https://media.giphy.com/media/3o6fIQJ2YWfsKjJd9m/giphy.gif",
    title: Text('Estás seguro que quieres salir de la aplicación?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600)),
    description:Text('Perderás todos los datos que tiemes hasta ahora',
      textAlign: TextAlign.center,
    ),
    onOkButtonPressed: () {
      exit(0);
    },
  ) );

}