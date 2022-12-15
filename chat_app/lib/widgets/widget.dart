import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
      title: Image.asset(
    "assets/images/logo.png",
    height: 40,
  ));
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.orangeAccent,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  );
}

TextStyle textFieldStyle() {
  return TextStyle(color: Colors.orangeAccent);
}

TextStyle buttonText() {
  return TextStyle(
    color: Colors.white,
    fontSize: 15,
  );
}
