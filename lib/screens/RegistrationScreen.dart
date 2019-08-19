import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:wildfire/PaddedButton.dart';
import 'package:wildfire/constants.dart';
import 'package:wildfire/screens/ChatScreen.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String eMail, psswd;
  final key = new GlobalKey<ScaffoldState>();

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: ModalProgressHUD(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              getIconHero(175),
              SizedBox(height: 40),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) => eMail = value,
                decoration: getInputDecoration("Enter your email..."),
              ),
              SizedBox(height: 7.5),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) => psswd = value,
                decoration: getInputDecoration("Enter your password..."),
              ),
              SizedBox(height: 15),
              PaddedButton(
                'Register',
                () async {
                  if (eMail == null || eMail == "") {
                    showToast(key, "Please specify an eMail");
                    return;
                  }
                  if (psswd == null || psswd == "") {
                    showToast(key, "Please specify a password");
                    return;
                  }
                  setState(() => showSpinner = true);
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: eMail,
                      password: psswd,
                    );
                    if (newUser != null) {
                      setState(() => showSpinner = false);
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    setState(() => showSpinner = false);
                    showToast(key, e.toString());
                  }
                },
              ),
            ],
          ),
        ),
        inAsyncCall: showSpinner,
      ),
    );
  }
}
