import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:keep_in_touch/utils/theme_utils.dart';
import 'package:keep_in_touch/widgets/app_bar_widget.dart';

const String defaultUserName = "Sharon Cabrera"; // TODO: tesing chat Room

class ChatRoute extends StatefulWidget {
  @override
  State createState() => new ChatWindow();
}

class ChatWindow extends State<ChatRoute> with TickerProviderStateMixin {
  final List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isWriting = false;

  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
      appBar: appBar(isleading: true, context: context),
      body: new Column(children: <Widget>[
        new Flexible(
            child: new ListView.builder(
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
              reverse: true,
              padding: new EdgeInsets.all(6.0),
            )),
        new Divider(height: 3.0),
        new Container(
          foregroundDecoration: ShapeDecoration(shape: Border.all(color: mainBlueColor),),
          height: 55.0,
          child: _buildComposer(),
          decoration: new BoxDecoration(color: Colors.white,),
        ),
      ]),
    );
  }


  Widget _buildComposer() {
    return  IconTheme(
      data:  IconThemeData(color: mainBlueColor),
      child:  Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
               Flexible(
                child: TextField(
                  style: TextStyle(fontSize: 20.0, color: Colors.pink), // size and color Message
                  controller: _textController,
                  onChanged: (String txt) {
                    setState(() {
                      _isWriting = txt.length > 0;
                    });
                  },
                  onSubmitted: _submitMsg,
                  decoration:
                   InputDecoration.collapsed(hintText: "Message"),
                ),
              ),
               Container(
                  margin:  EdgeInsets.symmetric(horizontal: 3.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? new CupertinoButton(
                      child: new Text("Submit"),
                      onPressed: _isWriting ? () => _submitMsg(_textController.text)
                          : null
                  )
                      : new IconButton(
                    icon: new Icon(Icons.message),
                    onPressed: _isWriting
                        ? () => _submitMsg(_textController.text)
                        : null,
                  )
              ),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
              border:
              new Border(top: new BorderSide(color: Colors.brown))) :
          null
      ),
    );
  }

  void _submitMsg(String txt) {
    _textController.clear();
    setState(() {
      _isWriting = false;
    });
    Msg msg = new Msg(
      txt: txt,
      animationController: new AnimationController(
          vsync: this,
          duration: new Duration(milliseconds: 400)
      ),
    );
    setState(() {
      _messages.insert(0, msg);
    });
    msg.animationController.forward();
  }

  @override
  void dispose() {
    for (Msg msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }
}

class Msg extends StatelessWidget {
  Msg({this.txt, this.animationController});
  final String txt;
  final AnimationController animationController;

  @override
  Widget build(BuildContext ctx) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             Container(
              margin: const EdgeInsets.only(right: 18.0),
              child: CircleAvatar(child: Text(defaultUserName[0],style: TextStyle(color: Colors.pink),),backgroundColor: mainBlueColor,),
            ),
            new Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Text(defaultUserName, style: TextStyle(color:  Colors.black,fontSize: 20.0)), //User's bubble
                   Container(
                    margin: const EdgeInsets.only(top: 6.0),
                    child: Text(txt,style: TextStyle(fontSize: 20.0),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}