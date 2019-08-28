import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wildfire/constants.dart';

final _fireStore = Firestore.instance;

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  final msgBoxController = TextEditingController();
  final key = new GlobalKey<ScaffoldState>();

  String msg;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      showToast(key, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: getTitleRow(25),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesBuilder(
              currentUser: loggedInUser.email,
            ),
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
                      keyboardType: TextInputType.multiline,
                      controller: msgBoxController,
                      onChanged: (value) => msg = value,
                      decoration:
                          getInputDecoration("Type your message here..."),
                      maxLines: null,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      msgBoxController.clear();
                      await _fireStore.collection('messages').add({
                        'sender': this.loggedInUser.email,
                        'text': msg,
                        'timestamp':
                            DateTime.now().millisecondsSinceEpoch.toString()
                      });
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

class MessagesBuilder extends StatelessWidget {
  const MessagesBuilder({@required this.currentUser});

  final String currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection('messages').snapshots(),
      builder: (context, snp) {
        if (!snp.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snp.data.documents;
        messages.sort((a, b) =>
            (b.data['timestamp'] as String).compareTo(a.data['timestamp']));
        var texts = <Widget>[];
        for (var message in messages) {
          texts.add(MessageBubble(
            sender: message.data['sender'],
            text: message.data['text'],
            currentUser: currentUser,
          ));
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.all(5),
            children: texts,
            reverse: true,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    @required this.text,
    @required this.sender,
    @required this.currentUser,
  }) : isSenderMe = currentUser == sender;

  final String text;
  final String sender;
  final String currentUser;
  final isSenderMe;

  @override
  Widget build(BuildContext context) {
    if (isSenderMe) {
      return Padding(
        padding: EdgeInsets.all(7.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Material(
              elevation: 7.5,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              color: Colors.lightBlueAccent[100],
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(7.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              sender,
              style: TextStyle(fontSize: 12),
            ),
            Material(
              elevation: 7.5,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              color: Colors.greenAccent[200],
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
