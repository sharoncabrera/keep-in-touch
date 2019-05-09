import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keep_in_touch/routes/main_menu.dart';
import 'package:keep_in_touch/utils/global_utils.dart';
import 'package:keep_in_touch/utils/mock_data.dart';
import 'package:keep_in_touch/utils/theme_utils.dart';
import 'package:keep_in_touch/widgets/app_bar_widget.dart';
import 'package:keep_in_touch/widgets/friends_widget.dart';

class MenuChatRoute extends StatefulWidget {
  MenuChatRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MenuChatRouteState createState() => _MenuChatRouteState();
}

class _MenuChatRouteState extends State<MenuChatRoute> {
  @override
  void initState() {
    super.initState();
  }

  /* Widget getFriendsList() {
    return Container(
      child: StreamBuilder(
        stream: Firestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(themeColor),
              ),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemBuilder: (context, index) => buildItem(context, snapshot.data.documents[index]),
              itemCount: snapshot.data.documents.length,
            );
          }
        },
      ),
    );
  }*/

  Future<bool> onBackPress() {
    exitDialog();
    return Future.value(false);
  }

  Widget _getBody(BuildContext context) => WillPopScope(
        onWillPop: () {},
        child: Scaffold(
          appBar: appBar(isChatMenu: true, isleading: true, context: context),
          backgroundColor: greyBackgroundColor,
          drawer: Drawer(
            elevation: 0.0,
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: greyBottomLettersColor,
                  ),
                  accountName: Text("Sharon Cabrera"),
                  accountEmail: Text("Test@test.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: mainBlueColor,
                    backgroundImage: NetworkImage(
                        "http://pluspng.com/img-png/kawaii-transparent-png-kawaii-kitty-i-by-riair-d41q2nj-png-501.png"),
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Container(
                    height: getScreenHeight(context) - 500, //300
                  ),
                ),
                Divider(
                  height: 3.0,
                ),
                ListTile(
                  title: Text("New Group"),
                  leading: Icon(Icons.people),
                ),
                ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {
                    exitDialog(
                        context: context, message: "test", title: "Test");
                  },
                ),
                ListTile(
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    //  exitDialog(context);
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: Container(
                child: ListView.builder(
              itemCount: mocksUsers.length,
              itemBuilder: (context, index) {
                return friendWidget(index, context);
              },
            )),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MainMenu(_getBody(context));
  }
}
