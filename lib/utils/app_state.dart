import 'package:flutter/material.dart';
import 'package:keep_in_touch/classes/User.dart';

class AppState {
  User user;
  AppState({
    this.user,
  });
}

class _InheritedStateContainer extends InheritedWidget {
  final AppStateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}

class AppStateContainer extends StatefulWidget {
  final Widget child;
  final AppState appState;

  AppStateContainer({
    @required this.child,
    this.appState,
  });

  static AppStateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .data;
  }

  @override
  AppStateContainerState createState() => new AppStateContainerState();
}

class AppStateContainerState extends State<AppStateContainer> {
  AppState appState = AppState(user: User("", "", "", "", null));

  void updateAppUser({
    User user,
  }) {
    if (appState == null) {
      appState = AppState(user: user);

      setState(() {
        appState = appState;
        appState.user = user;
      });
    } else {
      setState(() {
        appState.user = user ?? appState.user;
      });
    }
  }

  void initializeAppState() {
    appState = new AppState();
    setState(() {
      appState = appState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}
