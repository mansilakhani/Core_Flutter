import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static bool isDark = false;

  // Light_Theme
  static ThemeData lighttheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColor.primarycolor_light,
      secondary: AppColor.secondarycolor_light,
      brightness: Brightness.light,
    ),
  );

  // Dark_Theme
  static ThemeData darktheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: AppColor.primarycolor_dark,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColor.primarycolor_dark,
      secondary: AppColor.secondarycolor_dark,
      brightness: Brightness.dark,
    ),
  );
}
