import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_app/res/app_colors.dart';
import 'package:todo_app/res/text_style.dart';

final lightMode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.lightColor,
  textTheme: TextTheme(
    bodyLarge: poppins22Bold(),
    bodyMedium: poppins18Bold(),
    bodySmall: poppins14Bold(),
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.blue,
    toolbarHeight: 110
  ),
 bottomNavigationBarTheme: const BottomNavigationBarThemeData(
   backgroundColor: Colors.transparent,
   elevation: 0,
   selectedItemColor: AppColors.blue
 ),
);

final darkMode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkColor,
  textTheme: TextTheme(
    bodyLarge: poppins22Bold(),
    bodyMedium: poppins18Bold(),
    bodySmall: poppins14Bold(),
  ),
  appBarTheme: const AppBarTheme(
      color: AppColors.blue,
      toolbarHeight: 110
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: AppColors.blue
  ),
);
