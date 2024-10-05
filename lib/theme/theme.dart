import 'package:flutter/material.dart';

class AppColors {
  static const Color red = Color(0xFFE65541);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFF7F7F7);
  static const Color darkGray = Color(0xFFEBEBEB);
  static const Color strong = Color(0xCC000000);
  static const Color medium = Color(0x66000000);
  static const Color light = Color(0x33000000);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.red,
    colorScheme: const ColorScheme.light(
      primary: AppColors.red,
      surface: AppColors.white,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'GothamSSm',
          color: AppColors.strong), // Title 01
      headlineMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'GothamSSm',
          color: AppColors.strong), // Title 02
      headlineSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'GothamSSm',
          color: AppColors.medium), // Title 03

      bodyLarge: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          fontFamily: 'GothamSSm',
          color: AppColors.medium), // Body
      bodyMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          fontFamily: 'GothamSSm',
          color: AppColors.light), // Input
      bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          fontFamily: 'GothamSSm',
          color: AppColors.medium), // Hint

      titleSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          fontFamily: 'GothamSSm',
          color: AppColors.light), // Subtitle
      labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          fontFamily: 'GothamSSm',
          color: AppColors.medium), // Detail
    ),
  );
}
