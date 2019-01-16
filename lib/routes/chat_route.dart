import 'package:flutter/material.dart';
import 'package:keep_in_touch/utils/global_utils.dart';
import 'package:keep_in_touch/widgets/app_bar_widget.dart';
import 'package:keep_in_touch/widgets/bottom_app_bar_widget.dart';


class ChatRoute extends StatefulWidget {
  @override
  _ChatRouteState createState() => _ChatRouteState();
}
class _ChatRouteState extends State<ChatRoute> {
  //final List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isWriting = false;
  final TextEditingController _textEditingController = TextEditingController();
  bool _isComposingMessage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context: context),
        body: Column(
          children: <Widget>[
           /* Flexible(
                child: ListView.builder(
                  itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
                    reverse: true,
                padding: EdgeInsets.all(6.0),
                )
            ),*/
            Container(
              height: getScreenHeigh(context) -150.0, //- 40.0,
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  Text("CHAT"),
                ],
              ),
            ),
             Flexible(
              child: TextField(
                controller: _textEditingController,
                onChanged: (String messageText) {
                  setState(() {
                    _isComposingMessage = messageText.length > 0;
                  });
                },
                onSubmitted: _textMessageSubmitted,
                decoration:
                new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
          ],
        ),
       // bottomNavigationBar: bottomAppBar(context: context),
      ),
    );
  }

  Future<Null> _textMessageSubmitted(String text) async {
    _textEditingController.clear();

    setState(() {
      _isComposingMessage = false;
    });
    _sendMessage(messageText: text,);
  }

  void _sendMessage({String messageText}) {

  }

}