import 'package:flutter/material.dart';
import 'app_font.dart';
import 'app_color.dart';

class AppTheme{
  AppTheme._(); // インスタンス化防止の private コンストラクタ

  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primary,
      brightness: Brightness.dark, // ダークテーマ
      fontFamily: AppFonts.MPlusRounded1c ?? null,
      textTheme: TextTheme(
        bodyMedium: TextStyle(fontWeight: FontWeight.w400), // Regular
        titleMedium: TextStyle(fontWeight: FontWeight.w500), // Medium
        headlineSmall: TextStyle(fontWeight: FontWeight.w700), // Bold
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.primary),
          foregroundColor: MaterialStateProperty.all(AppColors.text),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

}