import 'package:flutter/material.dart';

Widget gameButton(
    void Function()? onTap, String str, double width, double height) {
  return GestureDetector(
    onTap: onTap,
    child: Image.asset(
      str,
      width: width,
      height: height,
    ),
  );
}
