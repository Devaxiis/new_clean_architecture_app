import 'package:flutter/material.dart';

abstract class Apptheme{
  static ThemeData get light{
    return ThemeData(
      appBarTheme:const AppBarTheme(
        elevation: 0,
        color: Colors.white
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      splashColor: Colors.transparent,
      fontFamily: "IBM",
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black)
    );
  }
}