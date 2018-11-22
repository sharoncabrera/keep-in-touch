import 'package:flutter/material.dart';

Widget bottomAppBar({BuildContext context}) {
  return BottomAppBar(
    color: Colors.blue,
    elevation: 1.0,
    child: Container(
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.people, size: 32.0, color: Colors.white,),
          Container(height: 35.0,child: Text("|", style:TextStyle(fontSize: 30.0, color: Colors.white),),),
          Icon(Icons.chat, size: 30.0, color: Colors.white,)
        ],

      ),
    ),
  );

}