import 'package:flutter/material.dart';
import '../../themes/keystone_theme.dart';

/// Keystone Secondary Button Component
/// 
/// Outlined button variant using Keystone design tokens.
class KsSecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isDisabled;
  final IconData? icon;
  final bool iconOnRight;

  const KsSecondaryButton({
    super.key,
    required this.label,
    this.onTap,
    this.isDisabled = false,
    this.icon,
    this.iconOnRight = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = KeystoneTheme();

    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(KeystoneTheme.radiusMDVal),
          border: Border.all(
            color: KeystoneTheme.brandBlue10,
            width: KeystoneTheme.borderRegular,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Left icon
            if (icon != null && !iconOnRight) ...[
              Icon(
                icon,
                size: 24,
                color: KeystoneTheme.brandBlue,
              ),
              SizedBox(width: KeystoneTheme.spacingXSVal),
            ],
            
            // Label
            Text(
              label,
              style: theme.headlineBold.copyWith(
                color: isDisabled ? KeystoneTheme.grey50 : KeystoneTheme.brandBlue,
              ),
            ),
            
            // Right icon
            if (icon != null && iconOnRight) ...[
              SizedBox(width: KeystoneTheme.spacingXSVal),
              Icon(
                icon,
                size: 24,
                color: KeystoneTheme.brandBlue,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
