// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'light_colors.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: LightColors.primary),
  // backgroundColor: LightColors.primary,
  scaffoldBackgroundColor: LightColors.background,
  primarySwatch: Colors.orange,
  useMaterial3: true,
  floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: LightColors.primary),
  // scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.black,
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
    actionsIconTheme: IconThemeData(color: Colors.black),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      // selectedItemColor: Clrs.defaultColor,
      elevation: 20.0,
  ),
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      )),
);
