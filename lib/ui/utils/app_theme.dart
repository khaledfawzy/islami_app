
import 'package:flutter/material.dart';
import 'package:islami_friday_c9/ui/utils/app_colors.dart';

abstract class AppTheme{
  static const TextStyle settingsTitleTextStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
      color: AppColors.accent);
  static const TextStyle settingsTileTextStyle = TextStyle(fontSize: 20,
      color: AppColors.accent);

  static ThemeData lightTheme = ThemeData(
    canvasColor: AppColors.primiary,
    primaryColor: AppColors.primiary,
    scaffoldBackgroundColor: AppColors.transparent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 30,
          color: AppColors.accent,
          fontWeight: FontWeight.bold),

    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.accent,
      selectedIconTheme: IconThemeData(size: 30),
      unselectedIconTheme: IconThemeData(size: 30),

    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 25,
            color: AppColors.accent,
            fontWeight: FontWeight.w600),
      displayMedium: settingsTitleTextStyle,
      displaySmall: settingsTileTextStyle,

    ),
    // switchTheme: SwitchThemeData(
    //   trackColor: MaterialStateProperty.all<Color>(AppColors.primiary)
    // )
  );
  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primiaryDark,
      scaffoldBackgroundColor: AppColors.transparent,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 30,
            color: AppColors.white,
            fontWeight: FontWeight.bold),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.accentDark,
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 30),

      ),
      textTheme:  TextTheme(
          bodyMedium: const TextStyle(fontSize: 25,
              color: AppColors.white,
              fontWeight: FontWeight.w600),
          displayMedium: settingsTitleTextStyle.copyWith(color: Colors.white),
          displaySmall: settingsTileTextStyle.copyWith(color: Colors.white)
      ),
      // switchTheme: SwitchThemeData(
      //     trackColor: MaterialStateProperty.all<Color>(AppColors.primiaryDark)
      //)
  );

}