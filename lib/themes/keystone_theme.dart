import 'package:flutter/material.dart';
import 'app_theme.dart';

/// Keystone 2025 Design System
/// MarketFeed's new design language
class KeystoneTheme extends AppTheme {
  @override
  String get name => 'Keystone';

  // ============================================
  // BRAND COLORS
  // ============================================
  
  /// MF Blue - Primary brand color
  static const mfBlue = Color(0xFF2554D4);
  
  /// MF Yellow - Accent/highlight
  static const mfYellow = Color(0xFFFFC400);
  
  /// MF Blue 10% - Loading states, light backgrounds
  static final mfBlue10 = mfBlue.withOpacity(0.1);
  
  /// MF Yellow 10%
  static final mfYellow10 = mfYellow.withOpacity(0.1);

  // ============================================
  // SEMANTIC COLORS
  // ============================================
  
  /// MF Green - Success states
  static const mfGreen = Color(0xFF34A853);
  static final mfGreen10 = mfGreen.withOpacity(0.1);
  
  /// MF Red - Error states
  static const mfRed = Color(0xFFEA4335);
  static final mfRed10 = mfRed.withOpacity(0.1);
  
  /// MF Orange - Warning states
  static const mfOrange = Color(0xFFFF9B05);
  static final mfOrange10 = mfOrange.withOpacity(0.1);

  // ============================================
  // NEUTRAL COLORS
  // ============================================
  
  /// MF Black - Primary text
  static const mfBlack = Color(0xFF081433);
  
  /// MF White - Backgrounds
  static const mfWhite = Color(0xFFFFFFFF);
  
  /// MF Grey - Secondary text (60% black)
  static final mfGrey = mfBlack.withOpacity(0.6);
  
  /// MF Light Grey - Borders (10% black)
  static final mfLightGrey = mfBlack.withOpacity(0.1);
  
  /// MF Soft Grey - Surface variant (4% black)
  static final mfSoftGrey = mfBlack.withOpacity(0.04);
  
  /// MF Disabled - Disabled states (50% black)
  static final mfDisabled = mfBlack.withOpacity(0.5);
  
  /// MF G-BG - Gradient background
  static const mfGBG = Color(0xFFF5F6F7);

  // ============================================
  // THEME IMPLEMENTATION
  // ============================================

  // Colors - Primary
  @override
  Color get primary => mfBlue;
  @override
  Color get primaryLight => mfBlue10;
  @override
  Color get onPrimary => mfWhite;

  // Colors - Semantic
  @override
  Color get success => mfGreen;
  @override
  Color get successLight => mfGreen10;
  @override
  Color get error => mfRed;
  @override
  Color get errorLight => mfRed10;
  @override
  Color get warning => mfOrange;
  @override
  Color get warningLight => mfOrange10;

  // Colors - Neutral
  @override
  Color get background => mfGBG;
  @override
  Color get surface => mfWhite;
  @override
  Color get surfaceVariant => mfSoftGrey;
  @override
  Color get textPrimary => mfBlack;
  @override
  Color get textSecondary => mfGrey;
  @override
  Color get textDisabled => mfDisabled;
  @override
  Color get border => mfLightGrey;
  @override
  Color get borderLight => mfSoftGrey;

  // ============================================
  // TYPOGRAPHY - Satoshi Variable
  // ============================================
  static const _fontFamily = 'Satoshi Variable';

  /// H1: 24px, Weight 800, LS -0.42%
  @override
  TextStyle get h1 => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w800,
        fontSize: 24,
        height: 1.333,
        letterSpacing: -0.1, // -0.42% of 24
      );

  /// H2: 20px, Weight 700
  @override
  TextStyle get h2 => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: 1.4,
      );

  /// Headline Bold: 16px, Weight 700, LS -0.625%
  @override
  TextStyle get headlineBold => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 1.5,
        letterSpacing: -0.1, // -0.625% of 16
      );

  /// Headline Medium: 16px, Weight 500, LS -0.625%
  @override
  TextStyle get headlineMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.5,
        letterSpacing: -0.1,
      );

  /// Subtitle Bold: 14px, Weight 700, LS -0.714%
  @override
  TextStyle get subtitleBold => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 1.43,
        letterSpacing: -0.1,
      );

  /// Subtitle Medium: 14px, Weight 500, LS -0.714%
  @override
  TextStyle get subtitleMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1.43,
        letterSpacing: -0.1,
      );

  /// Subtitle Regular: 14px, Weight 420, LS -0.714%
  @override
  TextStyle get subtitleRegular => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.43,
        letterSpacing: -0.1,
      );

  /// Body Bold: 12px, Weight 700, LS -0.833%
  @override
  TextStyle get bodyBold => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: 1.33,
        letterSpacing: -0.1,
      );

  /// Body Medium: 12px, Weight 500, LS -0.833%
  @override
  TextStyle get bodyMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 1.33,
        letterSpacing: -0.1,
      );

  /// Body Regular: 12px, Weight 420, LS -0.833%
  @override
  TextStyle get bodyRegular => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.33,
        letterSpacing: -0.1,
      );

  /// Caption: 10px, Weight 420
  @override
  TextStyle get caption => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        height: 1.2,
      );

  // ============================================
  // EFFECTS
  // ============================================
  
  /// Card Shadow: 0px 4px 4px rgba(107, 114, 133, 0.02)
  @override
  BoxShadow get cardShadow => BoxShadow(
        color: const Color(0xFF6B7285).withOpacity(0.02),
        offset: const Offset(0, 4),
        blurRadius: 4,
      );

  /// Focus Blue: 0px 0px 0px 3px rgba(37, 84, 212, 0.1)
  @override
  BoxShadow get focusShadow => BoxShadow(
        color: mfBlue.withOpacity(0.1),
        offset: Offset.zero,
        blurRadius: 0,
        spreadRadius: 3,
      );

  /// Focus Red: 0px 0px 0px 3px rgba(234, 67, 53, 0.1)
  BoxShadow get focusRedShadow => BoxShadow(
        color: mfRed.withOpacity(0.1),
        offset: Offset.zero,
        blurRadius: 0,
        spreadRadius: 3,
      );

  // ============================================
  // KEYSTONE SPECIFIC
  // ============================================
  
  @override
  double get buttonRadius => 12;
  
  /// Secondary button border
  Border get secondaryButtonBorder => Border.all(
        color: mfBlue10,
        width: 1.5,
      );
}
