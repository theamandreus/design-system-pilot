import 'package:flutter/material.dart';
import '../../themes/keystone_theme.dart';

/// Keystone Navigation Bar Component
/// 
/// A top navigation bar with back button, title, and optional action.
/// Uses Keystone design tokens.
class KsNavBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackTap;
  final Widget? action;
  final bool showBackButton;

  const KsNavBar({
    super.key,
    required this.title,
    this.onBackTap,
    this.action,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = KeystoneTheme();

    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: KeystoneTheme.spacingMDVal),
      child: Row(
        children: [
          // Back button
          if (showBackButton)
            GestureDetector(
              onTap: onBackTap,
              child: Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                  color: KeystoneTheme.brandBlue,
                ),
              ),
            ),
          if (showBackButton) SizedBox(width: KeystoneTheme.spacingSMVal),
          
          // Title
          Expanded(
            child: Text(
              title,
              style: theme.headlineBold.copyWith(color: KeystoneTheme.black),
            ),
          ),
          
          // Action widget
          if (action != null) action!,
        ],
      ),
    );
  }
}
