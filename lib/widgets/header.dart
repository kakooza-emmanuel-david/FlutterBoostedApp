import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar header({bool isAppTitle = false, String titleText = ""}) {
  return AppBar(
    title: Text(
      isAppTitle ? 'Internship Placement' : titleText,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 30.0,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.orange,
  );
}
