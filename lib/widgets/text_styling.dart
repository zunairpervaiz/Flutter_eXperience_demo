import 'package:flutter/material.dart';

Widget customText({
  String? text,
  double? size,
}) {
  return Text(
    text!,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: size,
    ),
  );
}

Widget underlineText({
  String? text,
  double? size,
}) {
  return Text(
    text!,
    style: TextStyle(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w600,
      fontSize: size,
    ),
  );
}
