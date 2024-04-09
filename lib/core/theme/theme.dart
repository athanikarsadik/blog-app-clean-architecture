import 'package:blog_app/core/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: 3));

  static final darkThemeMode = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppPallete.backgroundColor,
      appBarTheme:
          const AppBarTheme(backgroundColor: AppPallete.backgroundColor),
      chipTheme: const ChipThemeData(
          color: MaterialStatePropertyAll(AppPallete.backgroundColor),
          side: BorderSide.none),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(22),
          enabledBorder: _border(),
          errorBorder: _border(AppPallete.errorColor),
          border: _border(),
          focusedBorder: _border(AppPallete.gradient2)));
}
