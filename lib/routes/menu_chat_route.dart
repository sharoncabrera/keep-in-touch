import 'dart:io';

import 'package:flutter/material.dart';
import 'package:keep_in_touch/utils/global_utils.dart';
import 'package:keep_in_touch/utils/mock_data.dart';
import 'package:keep_in_touch/utils/navigation.dart';
import 'package:keep_in_touch/utils/theme_utils.dart';
import 'package:keep_in_touch/widgets/app_bar_widget.dart';
import 'package:keep_in_touch/widgets/bottom_app_bar_widget.dart';
import 'package:keep_in_touch/widgets/friends_widget.dart';

class MenuChatRoute extends StatefulWidget {
  MenuChatRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MenuChatRouteState createState() => _MenuChatRouteState();
}
class _MenuChatRouteState extends State<MenuChatRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(isChatMenu: true),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: mainGreenColor,
              ),
                accountName: Text("Sharon Cabrera"),
                accountEmail: Text("Test@test.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: mainBlueColor,
                  backgroundImage: NetworkImage("http://pluspng.com/img-png/kawaii-transparent-png-kawaii-kitty-i-by-riair-d41q2nj-png-501.png"),
            ),
            ),
            Opacity(
              opacity: 0.0,
              child: Container(
                height: getScreenHeigh(context) - 300,//TODO: utilizar el tamaño del móvil
              ),
            ),
            Divider(height: 3.0,),
            ListTile(
              title: Text("New Group"),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.exit_to_app),
              onTap: ()=> exit(0),
            ),
          ],
        ),
      ),
      body: Center(
        child:
        Container(
          child:
          ListView.builder(
            itemCount: mocksUsers.length,
            itemBuilder: (context, index) {
              return friendWidget(index);
            },
          )
          ),
        ),
      bottomNavigationBar: bottomAppBar(context: context),
    );
  }
}
