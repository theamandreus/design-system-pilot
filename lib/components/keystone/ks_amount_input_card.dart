import 'package:flutter/material.dart';
import '../../themes/keystone_theme.dart';

/// Amount Input Card State
enum KsAmountInputState { normal, error, success }

/// Keystone Amount Input Card Component
/// 
/// Large amount display card with optional units approximation.
/// Supports normal, error, and success states.
class KsAmountInputCard extends StatelessWidget {
  final String label;
  final String amount;
  final String? unitsApprox;
  final KsAmountInputState state;
  final VoidCallback? onTap;

  const KsAmountInputCard({
    super.key,
    this.label = 'ENTER INVESTMENT AMOUNT',
    required this.amount,
    this.unitsApprox,
    this.state = KsAmountInputState.normal,
    this.onTap,
  });

  Color get _borderColor {
    switch (state) {
      case KsAmountInputState.error:
        return KeystoneTheme.red;
      case KsAmountInputState.success:
        return KeystoneTheme.green;
      case KsAmountInputState.normal:
        return KeystoneTheme.lightGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = KeystoneTheme();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: KeystoneTheme.spacingLGVal,
          vertical: KeystoneTheme.spacing3XL,
        ),
        decoration: BoxDecoration(
          color: KeystoneTheme.white,
          borderRadius: BorderRadius.circular(KeystoneTheme.radiusXLVal),
          border: Border.all(
            color: _borderColor,
            width: KeystoneTheme.borderRegular,
          ),
          boxShadow: [theme.cardShadow],
        ),
        child: Column(
          children: [
            // Label
            Text(
              label,
              style: theme.bodyRegular.copyWith(color: KeystoneTheme.grey),
            ),
            SizedBox(height: KeystoneTheme.spacing2XL),
            
            // Amount row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '₹',
                  style: TextStyle(
                    fontFamily: 'Satoshi Variable',
                    fontWeight: FontWeight.w400,
                    fontSize: 28,
                    color: KeystoneTheme.grey,
                  ),
                ),
                SizedBox(width: KeystoneTheme.spacingXSVal),
                Text(
                  amount,
                  style: TextStyle(
                    fontFamily: 'Satoshi Variable',
                    fontWeight: FontWeight.w600,
                    fontSize: 36,
                    color: KeystoneTheme.black,
                  ),
                ),
              ],
            ),
            
            // Units approximation
            if (unitsApprox != null) ...[
              SizedBox(height: KeystoneTheme.spacingMDVal),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '≈',
                    style: theme.subtitleRegular.copyWith(color: KeystoneTheme.grey),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    unitsApprox!,
                    style: theme.subtitleMedium.copyWith(color: KeystoneTheme.grey),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
