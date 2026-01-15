import 'package:flutter/material.dart';

/// Button variant enumeration
enum DSButtonVariant {
  filled,
  outlined,
}

/// Button component from Design System
///
/// A customizable button with filled and outlined variants.
///
/// Figma: https://www.figma.com/design/cmgj79bpLI0KBt9mpl5oJb/Design-System---Pilot?node-id=19-10
class DSButton extends StatelessWidget {
  final String label;
  final DSButtonVariant variant;
  final VoidCallback? onTap;
  final double? width;

  const DSButton({
    super.key,
    required this.label,
    this.variant = DSButtonVariant.filled,
    this.onTap,
    this.width,
  });

  // Design tokens from Figma
  static const _defaultWidth = 288.0;
  static const _height = 48.0;
  static const _borderRadius = 4.0;
  static const _padding = 8.0;

  // Colors
  static const _primaryColor = Color(0xFF6200EE);
  static const _textLight = Color(0xFFFFFFFF);
  static const _borderColor = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? _defaultWidth,
        height: _height,
        padding: const EdgeInsets.all(_padding),
        decoration: BoxDecoration(
          color: variant == DSButtonVariant.filled ? _primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(_borderRadius),
          border: variant == DSButtonVariant.outlined
              ? Border.all(color: _borderColor, width: 1)
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.125,
            color: variant == DSButtonVariant.filled ? _textLight : _primaryColor,
          ),
        ),
      ),
    );
  }
}
