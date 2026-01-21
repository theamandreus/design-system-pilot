import 'package:flutter/material.dart';
import '../../themes/keystone_theme.dart';

/// Keystone Section Header Component
/// 
/// Decorative section header with optional icons and gradient lines.
class KsSectionHeader extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool showDecorations;

  const KsSectionHeader({
    super.key,
    required this.title,
    this.icon,
    this.showDecorations = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!showDecorations) {
      return Text(
        title,
        style: TextStyle(
          fontFamily: 'Satoshi Variable',
          fontWeight: FontWeight.w700,
          fontSize: 10,
          letterSpacing: 3.0,
          color: KeystoneTheme.black,
        ),
      );
    }

    return Row(
      children: [
        // Left gradient line
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  KeystoneTheme.lightGrey.withOpacity(0.4),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: KeystoneTheme.spacingXXS),
        
        // Left icon
        if (icon != null)
          Icon(
            icon,
            size: 20,
            color: KeystoneTheme.lightGrey,
          ),
        if (icon != null) SizedBox(width: KeystoneTheme.spacingXXS),
        
        // Title
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Satoshi Variable',
            fontWeight: FontWeight.w700,
            fontSize: 10,
            letterSpacing: 3.0,
            color: KeystoneTheme.black,
          ),
        ),
        
        // Right icon
        if (icon != null) SizedBox(width: KeystoneTheme.spacingXXS),
        if (icon != null)
          Icon(
            icon,
            size: 20,
            color: KeystoneTheme.lightGrey,
          ),
        
        SizedBox(width: KeystoneTheme.spacingXXS),
        // Right gradient line
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  KeystoneTheme.lightGrey.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
