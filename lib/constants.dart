import 'package:flutter/material.dart';

const primaryColor = Colors.amber;
const iconHeroTag = "Icon";

Row getTitleRow(double sz) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      getIconHero(sz),
      Text('WildFire', style: TextStyle(fontSize: sz, fontFamily: 'monospace')),
    ],
  );
}

Hero getIconHero(double sz) {
  return Hero(
    tag: iconHeroTag,
    child: Container(child: Image.asset("src/icon.png"), height: sz),
  );
}

InputDecoration getInputDecoration(String msg) {
  return InputDecoration(
    hintText: msg,
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(35)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.amberAccent, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(35)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.amberAccent, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(35)),
    ),
  );
}
