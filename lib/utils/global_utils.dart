import 'package:flutter/material.dart';
import 'package:keep_in_touch/translations.dart';
import 'package:path/path.dart';


double getScreenHeigh(BuildContext context){
  return MediaQuery.of(context).size.height;
}

String translate(BuildContext context, String key){
  return Translations.of(context).text(key);
}