import 'package:flutter/material.dart';

/// Button variant enumeration
enum DSButtonVariant {
  filled,
  outlined,
  destructive,
  inactive,
}

/// Button component from Design System
///
/// A customizable button with filled, outlined, destructive, and inactive variants.
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
  static const _destructiveBg = Color(0xFFF5F5F5);
  static const _destructiveColor = Color(0xFFB3261E);
  static const _inactiveColor = Color(0xFF6B6B6B);
  static const _inactiveTextColor = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    final isInactive = variant == DSButtonVariant.inactive;
    
    return GestureDetector(
      onTap: isInactive ? null : onTap,
      child: Container(
        width: width ?? _defaultWidth,
        height: _height,
        padding: const EdgeInsets.all(_padding),
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(_borderRadius),
          border: _getBorder(),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.125,
            color: _getTextColor(),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case DSButtonVariant.filled:
        return _primaryColor;
      case DSButtonVariant.outlined:
        return Colors.transparent;
      case DSButtonVariant.destructive:
        return _destructiveBg;
      case DSButtonVariant.inactive:
        return _inactiveColor;
    }
  }

  Border? _getBorder() {
    switch (variant) {
      case DSButtonVariant.filled:
        return null;
      case DSButtonVariant.outlined:
        return Border.all(color: _borderColor, width: 1);
      case DSButtonVariant.destructive:
        return Border.all(color: _destructiveColor, width: 1);
      case DSButtonVariant.inactive:
        return Border.all(color: _inactiveColor, width: 1);
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case DSButtonVariant.filled:
        return _textLight;
      case DSButtonVariant.outlined:
        return _primaryColor;
      case DSButtonVariant.destructive:
        return _destructiveColor;
      case DSButtonVariant.inactive:
        return _inactiveTextColor;
    }
  }
}
