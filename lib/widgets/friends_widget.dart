import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keep_in_touch/utils/navigation.dart';
import 'package:keep_in_touch/utils/theme_utils.dart';

Widget friendWidget(BuildContext context, DocumentSnapshot document) {
  return Container(
    child: FlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Material(
            child: CachedNetworkImage(
              placeholder: (context, url) => Container(
                    child: CircularProgressIndicator(
                      strokeWidth: 1.0,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(lightGreenColor),
                    ),
                    width: 50.0,
                    height: 50.0,
                    padding: EdgeInsets.all(15.0),
                  ),
              imageUrl: document['photoUrl'],
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            clipBehavior: Clip.hardEdge,
          ),
          Flexible(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Nickname: ${document['nickname']}',
                      style: mainText,
                    ),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                  ),
                  Container(
                    child: Text(
                      'About me: ${document['aboutMe'] ?? 'Not available'}',
                      style: regularText,
                    ),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  )
                ],
              ),
              margin: EdgeInsets.only(left: 20.0),
            ),
          ),
        ],
      ),
      onPressed: () {
        navigateToChat(context, document);
      },
      //color: mainBlueColor,
      padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
    ),
    margin: EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
    foregroundDecoration: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: Colors.black12,
      ),
      insets: EdgeInsets.only(left: 65.0, right: 20.0),
    ),
  );
}
