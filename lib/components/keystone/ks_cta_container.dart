import 'package:flutter/material.dart';
import '../../themes/keystone_theme.dart';

/// Keystone CTA Container Component
/// 
/// Bottom fixed container for primary actions with optional help link.
class KsCtaContainer extends StatelessWidget {
  final Widget primaryButton;
  final String? helpText;
  final String? helpLinkText;
  final VoidCallback? onHelpTap;

  const KsCtaContainer({
    super.key,
    required this.primaryButton,
    this.helpText,
    this.helpLinkText,
    this.onHelpTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = KeystoneTheme();

    return Container(
      decoration: BoxDecoration(
        color: KeystoneTheme.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            offset: const Offset(0, -4),
            blurRadius: 4,
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            KeystoneTheme.spacingMDVal,
            KeystoneTheme.spacingXSVal,
            KeystoneTheme.spacingMDVal,
            KeystoneTheme.spacingXSVal,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Primary button
              primaryButton,
              
              // Help link
              if (helpText != null || helpLinkText != null) ...[
                SizedBox(height: KeystoneTheme.spacingSMVal),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: KeystoneTheme.spacingXSVal),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 16,
                        color: KeystoneTheme.grey,
                      ),
                      if (helpText != null) ...[
                        const SizedBox(width: 4),
                        Text(
                          helpText!,
                          style: theme.bodyMedium.copyWith(color: KeystoneTheme.grey),
                        ),
                      ],
                      if (helpLinkText != null) ...[
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: onHelpTap,
                          child: Text(
                            helpLinkText!,
                            style: theme.bodyMedium.copyWith(color: KeystoneTheme.brandBlue),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
