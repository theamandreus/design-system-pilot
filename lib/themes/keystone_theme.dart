import 'package:flutter/material.dart';
import 'app_theme.dart';

/// Keystone 2025 Design System
/// MarketFeed's new design language
/// 
/// Tokens extracted from Figma Variables:
/// - primitives.tokens.json (spacing, radius, border)
/// - colors.tokens.json (brand, semantic, neutral)
/// - Mode_1.tokens.json (typography)
class KeystoneTheme extends AppTheme {
  @override
  String get name => 'Keystone';

  // ============================================
  // BRAND COLORS (from colors.tokens.json)
  // ============================================
  
  /// brand-blue: #2554D4
  static const brandBlue = Color(0xFF2554D4);
  
  /// brand-yellow: #FFC400
  static const brandYellow = Color(0xFFFFC400);
  
  /// brand-blue-10: 10% opacity
  static final brandBlue10 = brandBlue.withOpacity(0.1);
  
  /// brand-yellow-10: 10% opacity
  static final brandYellow10 = brandYellow.withOpacity(0.1);

  // ============================================
  // SEMANTIC COLORS (from colors.tokens.json)
  // ============================================
  
  /// green: #34A853
  static const green = Color(0xFF34A853);
  static final green10 = green.withOpacity(0.1);
  
  /// red: #EA4335
  static const red = Color(0xFFEA4335);
  static final red10 = red.withOpacity(0.1);
  
  /// orange: #FF9B05
  static const orange = Color(0xFFFF9B05);
  static final orange10 = orange.withOpacity(0.1);

  // ============================================
  // NEUTRAL COLORS (from colors.tokens.json)
  // ============================================
  
  /// black: #081433
  static const black = Color(0xFF081433);
  
  /// white: #FFFFFF
  static const white = Color(0xFFFFFFFF);
  
  /// grey: #6B7285
  static const grey = Color(0xFF6B7285);
  
  /// grey-50: 50% opacity
  static final grey50 = grey.withOpacity(0.5);
  
  /// light-grey: #E6E7EB
  static const lightGrey = Color(0xFFE6E7EB);
  
  /// soft-grey: #F5F6F7
  static const softGrey = Color(0xFFF5F6F7);

  // ============================================
  // THEME IMPLEMENTATION
  // ============================================

  @override
  Color get primary => brandBlue;
  @override
  Color get primaryLight => brandBlue10;
  @override
  Color get onPrimary => white;

  @override
  Color get success => green;
  @override
  Color get successLight => green10;
  @override
  Color get error => red;
  @override
  Color get errorLight => red10;
  @override
  Color get warning => orange;
  @override
  Color get warningLight => orange10;

  @override
  Color get background => softGrey;
  @override
  Color get surface => white;
  @override
  Color get surfaceVariant => softGrey;
  @override
  Color get textPrimary => black;
  @override
  Color get textSecondary => grey;
  @override
  Color get textDisabled => grey50;
  @override
  Color get border => lightGrey;
  @override
  Color get borderLight => softGrey;

  // ============================================
  // SPACING (from primitives.tokens.json)
  // spacing-xxxs: 2, xxs: 4, xs: 8, sm: 12, 
  // md: 16, lg: 20, xl: 24, 2xl: 32, 
  // 3xl: 40, 4xl: 48, 5xl: 64
  // ============================================
  
  static const double spacingXXXS = 2;
  static const double spacingXXS = 4;
  static const double spacingXSVal = 8;
  static const double spacingSMVal = 12;
  static const double spacingMDVal = 16;
  static const double spacingLGVal = 20;
  static const double spacingXLVal = 24;
  static const double spacing2XL = 32;
  static const double spacing3XL = 40;
  static const double spacing4XL = 48;
  static const double spacing5XL = 64;
  
  @override
  double get spacingXS => spacingXXS; // 4
  @override
  double get spacingSM => spacingXSVal; // 8
  @override
  double get spacingMD => spacingMDVal; // 16
  @override
  double get spacingLG => spacingXLVal; // 24
  @override
  double get spacingXL => spacing2XL; // 32

  // ============================================
  // RADIUS (from primitives.tokens.json)
  // radius-xs: 4, sm: 8, md: 12, lg: 16, xl: 20, full: 999
  // ============================================
  
  static const double radiusXS = 4;
  static const double radiusSMVal = 8;
  static const double radiusMDVal = 12;
  static const double radiusLGVal = 16;
  static const double radiusXLVal = 20;
  static const double radiusFullVal = 999;
  
  @override
  double get radiusSM => radiusXS; // 4
  @override
  double get radiusMD => radiusSMVal; // 8
  @override
  double get radiusLG => radiusMDVal; // 12
  @override
  double get radiusXL => radiusLGVal; // 16
  @override
  double get radiusFull => radiusFullVal; // 999

  // ============================================
  // BORDER WIDTH (from primitives.tokens.json)
  // none: 0, thin: 1, regular: 1.5, thick: 2
  // ============================================
  
  static const double borderNone = 0;
  static const double borderThin = 1;
  static const double borderRegular = 1.5;
  static const double borderThick = 2;

  // ============================================
  // TYPOGRAPHY (from Mode_1.tokens.json)
  // Family: Satoshi Variable
  // Weights: regular(420), medium(500), bold(700), extra-bold(800)
  // Sizes: 10, 12, 14, 16, 20, 24
  // Line Heights: xs(12), sm(16), md(20), lg(24), xl(28), 2xl(32)
  // Letter Spacing: Normal(0), Tight(-0.1)
  // ============================================
  
  static const _fontFamily = 'Satoshi Variable';
  static const _spacingTight = -0.1;

  /// H1: 24px, 800, line-height 32
  @override
  TextStyle get h1 => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w800,
        fontSize: 24,
        height: 32 / 24,
        letterSpacing: _spacingTight,
      );

  /// H2: 20px, 700, line-height 28
  @override
  TextStyle get h2 => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: 28 / 20,
      );

  /// Headline Bold: 16px, 700, line-height 24
  @override
  TextStyle get headlineBold => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 24 / 16,
        letterSpacing: _spacingTight,
      );

  /// Headline Medium: 16px, 500, line-height 24
  @override
  TextStyle get headlineMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 24 / 16,
        letterSpacing: _spacingTight,
      );

  /// Subtitle Bold: 14px, 700, line-height 20
  @override
  TextStyle get subtitleBold => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: _spacingTight,
      );

  /// Subtitle Medium: 14px, 500, line-height 20
  @override
  TextStyle get subtitleMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: _spacingTight,
      );

  /// Subtitle Regular: 14px, 420, line-height 20
  @override
  TextStyle get subtitleRegular => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: _spacingTight,
      );

  /// Body Bold: 12px, 700, line-height 16
  @override
  TextStyle get bodyBold => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: 16 / 12,
        letterSpacing: _spacingTight,
      );

  /// Body Medium: 12px, 500, line-height 16
  @override
  TextStyle get bodyMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 16 / 12,
        letterSpacing: _spacingTight,
      );

  /// Body Regular: 12px, 420, line-height 16
  @override
  TextStyle get bodyRegular => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 16 / 12,
        letterSpacing: _spacingTight,
      );

  /// Caption: 10px, 420, line-height 12
  @override
  TextStyle get caption => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        height: 12 / 10,
      );

  // ============================================
  // EFFECTS
  // ============================================
  
  @override
  BoxShadow get cardShadow => BoxShadow(
        color: grey.withOpacity(0.02),
        offset: const Offset(0, 4),
        blurRadius: 4,
      );

  @override
  BoxShadow get focusShadow => BoxShadow(
        color: brandBlue.withOpacity(0.1),
        offset: Offset.zero,
        blurRadius: 0,
        spreadRadius: 3,
      );

  BoxShadow get focusRedShadow => BoxShadow(
        color: red.withOpacity(0.1),
        offset: Offset.zero,
        blurRadius: 0,
        spreadRadius: 3,
      );

  // ============================================
  // COMPONENT TOKENS
  // ============================================
  
  @override
  double get buttonRadius => radiusMDVal; // 12
  
  @override
  double get buttonHeight => 52;
  
  @override
  double get buttonHeightMedium => 48;
  
  Border get secondaryButtonBorder => Border.all(
        color: brandBlue10,
        width: borderRegular,
      );
}
