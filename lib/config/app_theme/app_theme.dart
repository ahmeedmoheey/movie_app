import 'package:flutter/material.dart';
import 'package:movie_app/core/colors_manager.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    primaryColor: ColorsManager.bottomNavBar,
  scaffoldBackgroundColor: ColorsManager.blackAcc,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        selectedIconTheme: IconThemeData(size: 30),
        unselectedItemColor: Colors.white,
        selectedItemColor: ColorsManager.selectedItem,
        showUnselectedLabels: true,
  )
  );
}