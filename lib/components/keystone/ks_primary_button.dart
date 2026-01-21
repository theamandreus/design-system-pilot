import 'package:flutter/material.dart';
import '../../themes/keystone_theme.dart';

/// Keystone Primary Button Size
enum KsButtonSize { large, medium }

/// Keystone Primary Button Component
/// 
/// Main CTA button using Keystone design tokens.
class KsPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final KsButtonSize size;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final bool iconOnRight;

  const KsPrimaryButton({
    super.key,
    required this.label,
    this.onTap,
    this.size = KsButtonSize.large,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.iconOnRight = true,
  });

  double get _height {
    switch (size) {
      case KsButtonSize.large:
        return 52;
      case KsButtonSize.medium:
        return 48;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = KeystoneTheme();
    final isActive = !isDisabled && !isLoading;

    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        width: double.infinity,
        height: _height,
        decoration: BoxDecoration(
          color: isDisabled ? KeystoneTheme.lightGrey : KeystoneTheme.brandBlue,
          borderRadius: BorderRadius.circular(KeystoneTheme.radiusMDVal),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Left icon
            if (icon != null && !iconOnRight && !isLoading) ...[
              Icon(
                icon,
                size: size == KsButtonSize.large ? 24 : 20,
                color: KeystoneTheme.white,
              ),
              SizedBox(width: KeystoneTheme.spacingXSVal),
            ],
            
            // Loading indicator
            if (isLoading) ...[
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(KeystoneTheme.white),
                ),
              ),
              SizedBox(width: KeystoneTheme.spacingXSVal),
            ],
            
            // Label
            Text(
              isLoading ? 'Loading...' : label,
              style: (size == KsButtonSize.large ? theme.headlineBold : theme.subtitleBold)
                  .copyWith(
                color: isDisabled ? KeystoneTheme.grey50 : KeystoneTheme.white,
              ),
            ),
            
            // Right icon
            if (icon != null && iconOnRight && !isLoading) ...[
              SizedBox(width: KeystoneTheme.spacingXSVal),
              Icon(
                icon,
                size: size == KsButtonSize.large ? 24 : 20,
                color: KeystoneTheme.white,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
