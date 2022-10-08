import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      primaryColor: Color(0xFF0066FF),
      primaryColorDark: Color(0xFF3782F5),
      primaryColorLight: Color(0xFFADD8E6),
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Color(0xFFF2F2F2),
      fontFamily: 'Futura',
      textTheme: TextTheme(
          headline1: TextStyle(
            color: Color(0xFF1B070B),
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        headline2: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        headline3: TextStyle(
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        headline4: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        headline5: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        headline6: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        bodyText1: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
          fontSize: 12
        ),
        bodyText2: TextStyle(
            color: Color(0xFF1B070B),
            fontWeight: FontWeight.normal,
            fontSize: 10
        ),
      )
  );
}
