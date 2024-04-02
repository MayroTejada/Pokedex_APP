import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants.dart';

final ThemeData pokedexTheme = ThemeData(
  primaryColor: pokeRed,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: pokeRed, systemNavigationBarColor: pokeRed),
    backgroundColor: pokeRed,
    toolbarTextStyle: const TextStyle(color: Colors.white),
    actionsIconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
        color: Colors.white, fontFamily: 'Pokemon', fontSize: 15),
  ), // Gris claro
  bottomAppBarTheme: BottomAppBarTheme(color: pokeRed),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  fontFamily: 'Pokemon', // Fuente predeterminada
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333)), // Texto grande y negrita
    displayMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333)), // Texto grande y negrita
    displaySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333)), // Texto grande y negrita
    headlineMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333)), // Texto grande y negrita
    headlineSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333)), // Texto grande y negrita
    titleLarge: TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333)), // Texto grande y negrita
    bodyLarge:
        TextStyle(fontSize: 16, color: Color(0xFF333333)), // Texto normal
    bodyMedium:
        TextStyle(fontSize: 14, color: Color(0xFF333333)), // Texto normal
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF29B6F6)),
);
