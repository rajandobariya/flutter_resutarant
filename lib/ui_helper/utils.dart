
import 'package:flutter/material.dart';

TextStyle mTextStyle22() {
  return TextStyle(
    fontFamily: 'SegoeBold',
    fontSize: 22,
    color: Colors.black,
  );
}

TextStyle mTextStyle18() {
  return TextStyle(
    fontFamily: 'SegoeBold',
    fontSize: 18,
    color: Colors.white,
  );
}
TextStyle mTextStyleIntro() {
  return TextStyle(
    fontFamily: 'SegoeSBold',
    fontSize: 18,
    color: Color(0xFFB6B6B6),
  );
}

AppBar appBar(String name) {
  return AppBar(
    backgroundColor: Colors.black,
    title: Text(
      name,
      style: mTextStyle18(),
    ),
  );
}
