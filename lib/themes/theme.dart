import 'package:flutter/material.dart';

class AppTheme {
    static final ThemeData LIGHT = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.blue,
        textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'SourceSerif',
        ),
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme( border: OutlineInputBorder() ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ))
    );

    static final ThemeData DARK = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'SourceSerif',
      ),
      scaffoldBackgroundColor: Color(0xCD051864),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder()
      ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ))
    );

}