import 'package:flutter/material.dart';
import 'package:wildfire/constants.dart';
import 'package:wildfire/screens/ChatScreen.dart';
import 'package:wildfire/screens/LoginScreen.dart';
import 'package:wildfire/screens/RegistrationScreen.dart';
import 'package:wildfire/screens/WelcomeScreen.dart';

void main() => runApp(WildFireApp());

class WildFireApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: primaryColor,
        backgroundColor: primaryColor[200],
        scaffoldBackgroundColor: primaryColor[100],
        accentColor: Colors.green,
        buttonTheme: ButtonThemeData(
          buttonColor: primaryColor[400],
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          foregroundColor: Colors.black,
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
