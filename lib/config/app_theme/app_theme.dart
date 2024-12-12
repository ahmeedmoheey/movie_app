import 'package:flutter/material.dart';
import 'package:movie_app/config/app_styles/app_styles.dart';
import 'package:movie_app/core/colors_manager.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: AppStyles.browserCategories.copyWith(fontSize: 25),
      actionsIconTheme: IconThemeData(
        color: ColorsManager.white
      ),
      color: ColorsManager.blackAcc
    ),
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