import 'package:flutter/material.dart';
import 'package:keep_in_touch/utils/mock_data.dart';
import 'package:keep_in_touch/utils/navigation.dart';
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


//        Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            InkWell(
//              onTap: (){
//                navigateToChat(context);
//              },
//              child: Text(
//                'Hola',
//                style: Theme.of(context).textTheme.display1,
//              ),
//            ),
//
//          ],
//
//        ),