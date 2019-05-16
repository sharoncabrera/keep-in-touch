import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keep_in_touch/routes/main_menu.dart';
import 'package:keep_in_touch/utils/global_utils.dart';
import 'package:keep_in_touch/utils/app_state.dart';
import 'package:keep_in_touch/utils/navigation.dart';
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
  AppStateContainerState container;

  @override
  void initState() {
    super.initState();
  }

  Widget buildItem(BuildContext context, DocumentSnapshot document) {
    if (document['id'] == container.appState.user.id) {
      return Container();
    } else {
      return friendWidget(context, document);
    }
  }

  Widget getFriendsList() {
    return Container(
      child: StreamBuilder(
        stream: Firestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
              ),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemBuilder: (context, index) =>
                  buildItem(context, snapshot.data.documents[index]),
              itemCount: snapshot.data.documents.length,
            );
          }
        },
      ),
    );
  }

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
                  accountName: Text(container.appState.user.nickname),
                  accountEmail:
                      Text(container.appState.user.aboutMe) ?? Text(""),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: mainBlueColor,
                    backgroundImage:
                        NetworkImage(container.appState.user.photoUrl),
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
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    navigateToSettings(context);
                    //  exitDialog(context);
                  },
                ),
                ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {
                    exitDialog(
                        context: context, message: "test", title: "Test");
                  },
                ),
              ],
            ),
          ),
          body: getFriendsList(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    container = AppStateContainer.of(context);
    return MainMenu(_getBody(context));
  }
}
