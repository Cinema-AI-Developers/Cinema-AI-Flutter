import 'package:cinema_ai/scheme/AppTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ThemeColors.dart';

enum AppThemeType { light, dark }

class AppTheme {
  static ThemeColors darkThemeColors = ThemeColors();
  static ThemeColors lightThemeColors = LightThemeColors();

  static AppThemeType defaultThemeType = AppThemeType.dark;
  static ThemeMode defaultThemeMode = ThemeMode.dark;

  static ThemeData theme = AppTheme.getDataByThemeType();

  static final darkTheme = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: darkThemeColors.active,
          displayColor: darkThemeColors.active,
        ),
    scaffoldBackgroundColor: darkThemeColors.background01,
    appBarTheme: AppBarTheme(
      titleSpacing: 24,
      backgroundColor: darkThemeColors.background02,
      shadowColor: Colors.transparent,
      titleTextStyle:
          AppTextStyle.title.copyWith(color: darkThemeColors.active),
      iconTheme: IconThemeData(color: darkThemeColors.active),
    ),
    dialogBackgroundColor: darkThemeColors.background01,
    cardColor: darkThemeColors.background01,
    bottomNavigationBarTheme:
        ThemeData.dark().bottomNavigationBarTheme.copyWith(
              type: BottomNavigationBarType.shifting,
              backgroundColor: darkThemeColors.background03,
              selectedItemColor: darkThemeColors.active,
              unselectedItemColor: darkThemeColors.deactive,
              selectedLabelStyle: AppTextStyle.captionL,
              unselectedLabelStyle: AppTextStyle.captionS,
            ),
    colorScheme: ColorScheme(
      background: darkThemeColors.background01,
      brightness: Brightness.dark,
      primary: darkThemeColors.primary,
      secondary: darkThemeColors.background02,
      surface: darkThemeColors.background01,
      onBackground: darkThemeColors.active,
      onSurface: darkThemeColors.active,
      onError: darkThemeColors.active,
      onPrimary: lightThemeColors.white,
      onSecondary: darkThemeColors.active,
      error: darkThemeColors.colorful07,
    ).copyWith(background: lightThemeColors.background01),
  );

  static final lightTheme = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: lightThemeColors.active,
          displayColor: lightThemeColors.active,
        ),
    scaffoldBackgroundColor: lightThemeColors.background01,
    appBarTheme: AppBarTheme(
      titleSpacing: 24,
      backgroundColor: lightThemeColors.background02,
      shadowColor: Colors.transparent,
      titleTextStyle:
          AppTextStyle.title.copyWith(color: lightThemeColors.active),
      iconTheme: IconThemeData(color: lightThemeColors.active),
    ),
    dialogBackgroundColor: lightThemeColors.background01,
    cardColor: lightThemeColors.background01,
    bottomNavigationBarTheme:
        ThemeData.light().bottomNavigationBarTheme.copyWith(
              type: BottomNavigationBarType.shifting,
              backgroundColor: lightThemeColors.background03,
              selectedItemColor: lightThemeColors.active,
              unselectedItemColor: lightThemeColors.deactive,
              selectedLabelStyle: AppTextStyle.captionL,
              unselectedLabelStyle: AppTextStyle.captionS,
            ),
    colorScheme: ColorScheme(
      background: lightThemeColors.background01,
      brightness: Brightness.light,
      primary: lightThemeColors.primary,
      secondary: lightThemeColors.background02,
      surface: lightThemeColors.background01,
      onBackground: lightThemeColors.active,
      onSurface: lightThemeColors.active,
      onError: lightThemeColors.active,
      onPrimary: lightThemeColors.white,
      onSecondary: lightThemeColors.active,
      error: lightThemeColors.colorful07,
    ),
  );

  static ThemeData getDataByThemeType({AppThemeType? themeType}) {
    themeType ??= defaultThemeType;

    switch (themeType) {
      case AppThemeType.light:
        return lightTheme;
      case AppThemeType.dark:
        return darkTheme;
      default:
        return darkTheme;
    }
  }

  static ThemeMode getThemeModeByType({AppThemeType? themeType}) {
    themeType ??= defaultThemeType;

    switch (themeType) {
      case AppThemeType.light:
        return ThemeMode.light;
      case AppThemeType.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.dark;
    }
  }

  static void changeThemeType(AppThemeType? themeType) {
    defaultThemeType = themeType ?? AppThemeType.light;
    defaultThemeMode = getThemeModeByType(themeType: defaultThemeType);
    theme = AppTheme.getDataByThemeType();

    // deleting the system status bar color and updating navigation bar color
    // overlay
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppTheme.colors.background01));
  }

  static ThemeColors getColorsByMode({AppThemeType? themeType}) {
    themeType ??= defaultThemeType;

    switch (themeType) {
      case AppThemeType.light:
        return LightThemeColors();
      case AppThemeType.dark:
        return ThemeColors();
      default:
        return ThemeColors();
    }
  }

  /// Returns the current theme data. If the theme is changed, the data will be
  /// updated.
  static ThemeMode get themeMode => getThemeModeByType();

  /// Returns the current theme colors. If the theme is changed, the colors
  /// will be updated.
  static ThemeColors get colors => getColorsByMode();
}
