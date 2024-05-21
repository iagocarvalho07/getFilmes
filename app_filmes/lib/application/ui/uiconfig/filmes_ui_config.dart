import 'package:flutter/material.dart';

class FilmesUiConfig {
  FilmesUiConfig._();

  static String get Title => "Filmes App";

  static ThemeData get Theme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Color(0xff222222),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      );
}
