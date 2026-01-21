import 'package:flutter/material.dart';
import 'app_theme.dart';

/// Original Design System Pilot theme
/// Used in current PlanCard, DSButton components
class PilotTheme extends AppTheme {
  @override
  String get name => 'Pilot';

  // Colors - Primary (Purple)
  @override
  Color get primary => const Color(0xFF6200EE);
  @override
  Color get primaryLight => const Color(0xFF6200EE).withOpacity(0.1);
  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  // Colors - Semantic
  @override
  Color get success => const Color(0xFF198754);
  @override
  Color get successLight => const Color(0xFF198754).withOpacity(0.1);
  @override
  Color get error => const Color(0xFFB3261E);
  @override
  Color get errorLight => const Color(0xFFB3261E).withOpacity(0.1);
  @override
  Color get warning => const Color(0xFFFF9800);
  @override
  Color get warningLight => const Color(0xFFFF9800).withOpacity(0.1);

  // Colors - Neutral
  @override
  Color get background => const Color(0xFFF5F5F5);
  @override
  Color get surface => const Color(0xFFFFFFFF);
  @override
  Color get surfaceVariant => const Color(0xFFF5F5F5);
  @override
  Color get textPrimary => const Color(0xFF1C1B1F);
  @override
  Color get textSecondary => const Color(0xFF6B6B6B);
  @override
  Color get textDisabled => const Color(0xFFE0E0E0);
  @override
  Color get border => const Color(0xFFE0E0E0);
  @override
  Color get borderLight => const Color(0xFFE0E0E0);

  // Typography - Using Inter/Satoshi
  static const _fontFamily = 'Satoshi Variable';

  @override
  TextStyle get h1 => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w800,
        fontSize: 24,
        height: 1.333,
        letterSpacing: -0.1,
      );

  @override
  TextStyle get h2 => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: 1.4,
      );

  @override
  TextStyle get headlineBold => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 1.5,
        letterSpacing: -0.1,
      );

  @override
  TextStyle get headlineMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.5,
        letterSpacing: -0.1,
      );

  @override
  TextStyle get subtitleBold => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 1.43,
        letterSpacing: -0.1,
      );

  @override
  TextStyle get subtitleMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1.43,
        letterSpacing: -0.1,
      );

  @override
  TextStyle get subtitleRegular => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.43,
        letterSpacing: -0.1,
      );

  @override
  TextStyle get bodyBold => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: 1.33,
        letterSpacing: -0.1,
      );

  @override
  TextStyle get bodyMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 1.33,
        letterSpacing: -0.1,
      );

  @override
  TextStyle get bodyRegular => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.33,
        letterSpacing: -0.1,
      );

  @override
  TextStyle get caption => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        height: 1.2,
      );

  // Effects
  @override
  BoxShadow get cardShadow => BoxShadow(
        color: const Color(0xFF6B7285).withOpacity(0.02),
        offset: const Offset(0, 4),
        blurRadius: 4,
      );

  @override
  BoxShadow get focusShadow => BoxShadow(
        color: primary.withOpacity(0.1),
        offset: Offset.zero,
        blurRadius: 0,
        spreadRadius: 3,
      );

  // Button overrides
  @override
  double get buttonRadius => 4;
}
