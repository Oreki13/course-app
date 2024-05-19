import 'package:course_app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'app_pallete.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppPallet.primary,
      // textTheme: GoogleFonts.interTextTheme(TextThemes.textTheme),
      primaryTextTheme: TextThemes.primaryTextTheme,
      scaffoldBackgroundColor: AppPallet.white,
      splashColor: AppPallet.primary,
      colorScheme: const ColorScheme.light(
        surface: AppPallet.white,
        primary: AppPallet.primary,
        secondary: AppPallet.lightGrey,
        error: AppPallet.error,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppPallet.primary,
      ),
    );
  }
}

