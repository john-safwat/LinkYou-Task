import 'package:flutter/material.dart';
import 'package:linkyou_task/Core/Colors/colors_manager.dart';

class AppTheme {
  static final ThemeData _appTheme = ThemeData(
      scaffoldBackgroundColor: ColorsManager.white,
      primaryColor: ColorsManager.darkBlue,
      secondaryHeaderColor: Colors.blue,
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 24, color: ColorsManager.darkBlue),
        bodyMedium: TextStyle(fontSize: 20, color: ColorsManager.darkBlue),
        bodySmall: TextStyle(fontSize: 16, color: ColorsManager.darkBlue),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            color: ColorsManager.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          foregroundColor: ColorsManager.white,
          backgroundColor: ColorsManager.darkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(width: 2, color: ColorsManager.darkBlue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(width: 2, color: ColorsManager.darkBlue),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(width: 2, color: ColorsManager.darkBlue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(width: 2, color: ColorsManager.darkBlue),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(width: 2, color: ColorsManager.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(width: 2, color: ColorsManager.red),
          )),
      dialogBackgroundColor: ColorsManager.white,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: ColorsManager.darkBlue,
      ));

  static ThemeData get appTheme => _appTheme;
}
