import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Observable for theme state
  var isDarkTheme = false.obs;

  // Getter for current theme mode
  ThemeMode get theme => isDarkTheme.value ? ThemeMode.dark : ThemeMode.light;

  // Method to toggle theme
  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
  }

  // Define the light theme
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
      bodyText1: TextStyle(fontSize: 18, color: Colors.black87),
    ),
    cardColor: Colors.white,
    scaffoldBackgroundColor: Color(0xFFF3F4F6),  // Light grey background
  );

  // Define the dark theme
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      bodyText1: TextStyle(fontSize: 18, color: Colors.white70),
    ),
    cardColor: Color(0xFF1E1F28),
    scaffoldBackgroundColor: Color(0xFF121212),  // Dark grey background
  );
}
