import 'package:flutter/material.dart';
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
            Container(
              height: 175,
              child: Image.asset('src/icon.png'),
            ),
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
                    // TODO:  Implement login functionality.
                  },
                  minWidth: 200,
                  height: 50,
                  child: Text(
                    'Login',
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
