import 'package:flutter/material.dart';
import '../../themes/keystone_theme.dart';

/// Keystone Help Button Component
/// 
/// A small outlined button with icon and label.
/// Typically used for "Need Help?" actions.
class KsHelpButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  const KsHelpButton({
    super.key,
    this.label = 'Need Help?',
    this.icon = Icons.chat_bubble_outline,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = KeystoneTheme();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(horizontal: KeystoneTheme.spacingSMVal),
        decoration: BoxDecoration(
          color: KeystoneTheme.white,
          borderRadius: BorderRadius.circular(KeystoneTheme.radiusSMVal),
          border: Border.all(
            color: KeystoneTheme.brandBlue10,
            width: KeystoneTheme.borderThin,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: KeystoneTheme.brandBlue,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: theme.bodyMedium.copyWith(color: KeystoneTheme.brandBlue),
            ),
          ],
        ),
      ),
    );
  }
}
