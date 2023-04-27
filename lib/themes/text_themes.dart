import 'package:flutter/material.dart';
import 'package:loginpage_tz3/main.dart';

TextStyle get headingStyle {
  return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: containersColorOnTaskPage);
}

TextStyle get subHeadingStyle {
  return const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey);
}

TextStyle get monthTextStyle {
  return const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey);
}

TextStyle get dateTextStyle {
  return const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey);
}

TextStyle get dayTextStyle {
  return const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey);
}

TextStyle get titleStyle {
  return const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black);
}

TextStyle get subTitleStyle {
  return  TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[600]);
}