import 'package:flutter/material.dart';
import '../../themes/keystone_theme.dart';

/// Keystone Basket Header Component
/// 
/// Displays basket/fund icon with name and value.
class KsBasketHeader extends StatelessWidget {
  final String name;
  final String value;
  final IconData icon;
  final Color? iconBackgroundColor;
  final Color? iconColor;

  const KsBasketHeader({
    super.key,
    required this.name,
    required this.value,
    this.icon = Icons.shield_outlined,
    this.iconBackgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = KeystoneTheme();

    return Padding(
      padding: EdgeInsets.fromLTRB(
        KeystoneTheme.spacingMDVal,
        KeystoneTheme.spacingXLVal,
        KeystoneTheme.spacingMDVal,
        KeystoneTheme.spacingLGVal,
      ),
      child: Row(
        children: [
          // Icon container
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBackgroundColor ?? KeystoneTheme.brandBlue10,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 20,
              color: iconColor ?? KeystoneTheme.brandBlue,
            ),
          ),
          SizedBox(width: KeystoneTheme.spacingSMVal),
          
          // Info column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: theme.h2.copyWith(color: KeystoneTheme.black),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: theme.subtitleRegular.copyWith(color: KeystoneTheme.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
