import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:keep_in_touch/translations.dart';
import 'package:keep_in_touch/utils/authentication_utils.dart';
import 'package:path/path.dart';

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

String translate(BuildContext context, String key) {
  return Translations.of(context).text(key);
}

exitDialog({BuildContext context, String title, String message}) {
  return showDialog<bool>(
    context: context,
    builder: (context) => SimpleDialog(
          contentPadding: EdgeInsets.all(20.0),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          handleSignOut(context);
                          //SystemNavigator.pop();
                        },
                        child: Text(
                          "yes",
                        ),
                      ),
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text("no"),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
  );
}
/*
* Perderás todos los datos que tienes hasta ahora
*
* Text('Estás seguro que quieres salir de la aplicación?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600)),
* */
