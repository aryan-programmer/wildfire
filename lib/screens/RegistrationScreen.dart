import 'package:flutter/material.dart';
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
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Material(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                elevation: 10,
                child: MaterialButton(
                  onPressed: () {
                    // TODO: Implement registration functionality.
                  },
                  minWidth: 200,
                  height: 50,
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 25),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
