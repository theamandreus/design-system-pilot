import 'package:flutter/material.dart';

/// Abstract theme contract - all themes must implement this
abstract class AppTheme {
  String get name;

  // Colors - Primary
  Color get primary;
  Color get primaryLight;
  Color get onPrimary;

  // Colors - Semantic
  Color get success;
  Color get successLight;
  Color get error;
  Color get errorLight;
  Color get warning;
  Color get warningLight;

  // Colors - Neutral
  Color get background;
  Color get surface;
  Color get surfaceVariant;
  Color get textPrimary;
  Color get textSecondary;
  Color get textDisabled;
  Color get border;
  Color get borderLight;

  // Typography
  TextStyle get h1;
  TextStyle get h2;
  TextStyle get headlineBold;
  TextStyle get headlineMedium;
  TextStyle get subtitleBold;
  TextStyle get subtitleMedium;
  TextStyle get subtitleRegular;
  TextStyle get bodyBold;
  TextStyle get bodyMedium;
  TextStyle get bodyRegular;
  TextStyle get caption;

  // Spacing
  double get spacingXS => 4;
  double get spacingSM => 8;
  double get spacingMD => 16;
  double get spacingLG => 24;
  double get spacingXL => 32;

  // Radius
  double get radiusSM => 4;
  double get radiusMD => 8;
  double get radiusLG => 12;
  double get radiusXL => 16;
  double get radiusFull => 100;

  // Effects
  BoxShadow get cardShadow;
  BoxShadow get focusShadow;

  // Button specific
  double get buttonHeight => 52;
  double get buttonHeightMedium => 48;
  double get buttonRadius => 12;
}
