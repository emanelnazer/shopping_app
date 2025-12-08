import 'package:flutter/material.dart';

abstract class Apptheme {
  static ThemeData light = ThemeData(
      scaffoldBackgroundColor: Color(0xffEBEBEB),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xffEBEBEB),
        elevation: 10,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xff212121)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff212121),
              textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffFFFFFF)))));
  static ThemeData dark = ThemeData();
}
