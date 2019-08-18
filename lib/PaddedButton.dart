import 'package:flutter/material.dart';

class PaddedButton extends StatelessWidget {
  const PaddedButton(this.str, this.onPressed);

  final void Function() onPressed;
  final String str;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Material(
        elevation: 5,
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 50,
          child: Text(str, style: TextStyle(fontSize: 25)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
