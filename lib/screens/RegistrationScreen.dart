import 'package:flutter/material.dart';
import 'package:wildfire/PaddedButton.dart';
import 'package:wildfire/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              'Register',
              () {
                // TODO:  Implement registration functionality.
              },
            ),
          ],
        ),
      ),
    );
  }
}
