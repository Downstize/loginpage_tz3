import 'package:flutter/material.dart';
import 'package:loginpage_tz3/main.dart';

const authBorderError = InputDecoration(
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide(color: Colors.grey)),
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide(color: focusedBorderLoginColor)),
);
