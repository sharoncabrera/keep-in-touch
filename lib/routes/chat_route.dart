import 'package:flutter/material.dart';


class ChatRoute extends StatefulWidget {
  @override
  _ChatRouteState createState() => _ChatRouteState();
}
class _ChatRouteState extends State<ChatRoute> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Keep in touch"),
          automaticallyImplyLeading: true,
          centerTitle: true,
        ),
        body: Container(
          height: height - 40.0,
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Text("El teclado va maaaaaaaaaal!!!!!!")
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
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
        ),
      ),
    );
  }
}
