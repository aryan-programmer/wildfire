import 'package:flutter/material.dart';
import 'package:wildfire/PaddedButton.dart';
import 'package:wildfire/constants.dart';
import 'package:wildfire/screens/LoginScreen.dart';
import 'package:wildfire/screens/RegistrationScreen.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInCubic);
    controller.forward();
    controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Opacity(
                child: Hero(
                  tag: iconHeroTag,
                  child: Image.asset("src/icon.png"),
                ),
                opacity: animation.value,
              ),
              height: animation.value * 270,
            ),
            SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(child: Image.asset("src/icon.png"), height: 60),
                Text(
                  'WildFire',
                  style: TextStyle(fontSize: 60),
                ),
              ],
            ),
            SizedBox(height: 30),
            PaddedButton(
              'Login',
              () => Navigator.pushNamed(context, LoginScreen.id),
            ),
            PaddedButton(
              'Register',
              () => Navigator.pushNamed(context, RegistrationScreen.id),
            ),
          ],
        ),
      ),
    );
  }
}
