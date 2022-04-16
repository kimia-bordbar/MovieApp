import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color.fromARGB(255, 27, 27, 27),
    appBarTheme: const AppBarTheme(
      elevation: 8.0,
      titleTextStyle: TextStyle(color: Colors.black),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    scaffoldBackgroundColor: Colors.white60,
    textTheme: const TextTheme(
      headline6: TextStyle(
          fontSize: 20.0, color: Colors.black, fontStyle: FontStyle.italic),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 8.0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Color.fromARGB(255, 66, 66, 66),
      backgroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );

  final dartTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 8.0,
      iconTheme: IconThemeData(color: Colors.white),
      // titleTextStyle: TextStyle(color: Colors.white,height: 30),
      backgroundColor: Color.fromARGB(255, 27, 27, 27),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 66, 66, 66),
    textTheme: const TextTheme(
      headline6: TextStyle(
          fontSize: 20.0, color: Colors.white, fontStyle: FontStyle.italic),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      backgroundColor: Color.fromARGB(255, 27, 27, 27),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        primary: const Color.fromARGB(255, 255, 255, 255),
        backgroundColor: const Color.fromARGB(255, 27, 27, 27),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    ),
  );
}
