import 'package:flutter/material.dart';

class MyTheme {
  static var getTheme = ThemeData(
      buttonColor: Colors.yellow[300],    
      backgroundColor: Colors.yellow[100],
      iconTheme: IconThemeData(color: Color.fromARGB(200, 0, 0, 0)),
      inputDecorationTheme: InputDecorationTheme(),
      buttonTheme: ButtonThemeData(buttonColor: Colors.red,splashColor: Colors.black54),
      textTheme: TextTheme(
        title: TextStyle(
          wordSpacing: 2,
          fontSize: 26,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        subtitle: TextStyle(
          wordSpacing: 1,
          letterSpacing: 1,
          fontSize: 20,
          color: Colors.black87,
          fontWeight: FontWeight.w300,
        ),
      ),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black54),
          textTheme: TextTheme(
              title: TextStyle(
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2,
                  fontSize: 30,
                  color: Colors.black87)),
          color: Colors.yellow[300]));
}
