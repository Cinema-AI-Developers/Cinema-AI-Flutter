import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ThemeColors {
  ThemeColors();

  // Primary actions, emphasizing navigation elements,
  // backgrounds, text, etc.
  Color get primary => const Color(0xFF246BFD);
  Color get secondary => const Color(0xFFC25FFF);

  // Backgrounds
  Color get background01 => const Color.fromARGB(255, 25, 28, 35);
  Color get background02 => const Color.fromARGB(255, 14, 16, 20);
  Color get background03 => const Color.fromARGB(255, 13, 14, 18);

  // Colorful
  Color get colorful01 => const Color.fromARGB(255, 151, 81, 255);
  Color get colorful02 => const Color(0xFFDBE9F7);
  Color get colorful03 => const Color(0xFF0B1E51);
  Color get colorful04 => const Color(0xFF94F0F0);
  Color get colorful05 => const Color(0xFFA5F59C);
  Color get colorful06 => const Color(0xFFFFDD72);
  Color get colorful07 => const Color(0xFFFF968E);

  Color get white => const Color(0xFFFFFFFF);

  // States
  Color get active => const Color(0xFFFFFFFF);
  Color get deactive => const Color(0xFF5E6272);
  Color get activeLightMode => const Color(0xFF200745);
  Color get deactiveDarker => const Color(0xFF3A3D46);

  LinearGradient get gradient07 =>
      const LinearGradient(colors: [Color(0xFFBBFFE7), Color(0xFF86FFCA)]);
}

class LightThemeColors extends ThemeColors {
  LightThemeColors();

  // Backgrounds
  @override
  Color get background01 => const Color(0xFFF5F5F5);
  @override
  Color get background02 => const Color(0xFFFFFFFF);
  @override
  Color get background03 => const Color(0xFFF8F8F8);

  // States
  @override
  Color get active => const Color(0xFF0D0D0D);
  @override
  Color get deactive => const Color(0xFF5E6272);
  @override
  Color get activeLightMode => const Color(0xFF200745);
  @override
  Color get deactiveDarker => const Color(0xFF3A3D46);

  @override
  LinearGradient get gradient07 =>
      const LinearGradient(colors: [Color(0xFFBBFFE7), Color(0xFF86FFCA)]);
}
