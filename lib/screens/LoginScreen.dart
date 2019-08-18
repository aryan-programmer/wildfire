import 'package:flutter/material.dart';
import 'package:wildfire/PaddedButton.dart';
import 'package:wildfire/constants.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            getIconHero(175),
            SizedBox(height: 40),
            TextField(
              onChanged: (value) {
                // TODO: Do something with the user input.
              },
              decoration: getInputDecoration("Enter your email..."),
            ),
            SizedBox(height: 7.5),
            TextField(
              onChanged: (value) {
                // TODO: Do something with the user input.
              },
              decoration: getInputDecoration("Enter your password..."),
            ),
            SizedBox(height: 15),
            PaddedButton(
              'Login',
              () {
                // TODO:  Implement login functionality.
              },
            ),
          ],
        ),
      ),
    );
  }
}
