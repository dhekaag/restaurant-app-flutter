import 'package:flutter/material.dart';

import 'color.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: zBackgroundColor,
  primaryColor: zPrimaryColor,
  fontFamily: "Poppins",
  brightness: Brightness.light,
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ))),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 33,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    titleMedium: TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
  ),
);
