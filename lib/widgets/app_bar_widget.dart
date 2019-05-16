import 'package:flutter/material.dart';
import 'package:keep_in_touch/translations.dart';
import 'package:keep_in_touch/utils/app_state.dart';
import 'package:keep_in_touch/utils/navigation.dart';
import 'package:keep_in_touch/utils/theme_utils.dart';

AppBar appBar(
    {bool isChatMenu = false, isleading = false, BuildContext context}) {
  return AppBar(
    iconTheme: IconThemeData(color: bottomAppBarColor),
    elevation: 0.2,
    title: Text(
      Translations.of(context).text('main_title'),
      style: TextStyle(color: strongGreyColor),
    ),
    backgroundColor: Colors.white,
    leading: isChatMenu
        ?
        //  IconButton(icon: Icon(Icons.menu), color: bottomAppBarColor, onPressed: () {})
        null
        : IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              popNavigation(context);
            },
          ),
    centerTitle: true,
    actions: <Widget>[
      isChatMenu
          ? IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {},
            )
          : IconButton(
              icon: Icon(Icons.group_add),
              color: bottomAppBarColor,
              onPressed: () {
                print("Hola");
              },
            ),
    ],
  );
}

sliverAppBar(AppStateContainerState container) {
  return SliverAppBar(
    elevation: 0.2,
    iconTheme: IconThemeData(color: bottomAppBarColor),
    backgroundColor: Colors.white,
    expandedHeight: 256.0,
    pinned: true,
    flexibleSpace: new FlexibleSpaceBar(
      centerTitle: true,
      title: new Text(
        "SETTINGS",
        style: TextStyle(color: strongGreyColor),
      ),
      background: Container(
        child: CircleAvatar(
          backgroundImage: NetworkImage(container.appState.user.photoUrl),
          minRadius: 9,
          maxRadius: 15,
        ),
      ),
    ),
  );
}
