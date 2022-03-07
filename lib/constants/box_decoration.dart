import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
  filled: true,
  fillColor: Colors.white30,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide.none,
  ),
);