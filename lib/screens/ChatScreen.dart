import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wildfire/constants.dart';

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // TODO:  Implement logout functionality
              }),
        ],
        title: getTitleRow(25),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.amberAccent, width: 2),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        // TODO: Do something with the user input.
                      },
                      decoration:
                          getInputDecoration("Type your message here..."),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      // TODO: Implement send functionality.
                    },
                    shape: StadiumBorder(),
                    child: Icon(FontAwesomeIcons.solidPaperPlane),
                    color: primaryColor,
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
