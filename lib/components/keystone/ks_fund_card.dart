import 'package:flutter/material.dart';
import '../../themes/keystone_theme.dart';

/// Fund Card State
enum KsFundCardState { normal, insufficientFunds, success }

/// Keystone Fund Card Component
/// 
/// Displays account info with available funds.
/// Supports insufficient funds error state.
class KsFundCard extends StatelessWidget {
  final String accountNumber;
  final String accountName;
  final String availableFunds;
  final KsFundCardState state;
  final String? errorMessage;
  final VoidCallback? onRefreshTap;

  const KsFundCard({
    super.key,
    required this.accountNumber,
    required this.accountName,
    required this.availableFunds,
    this.state = KsFundCardState.normal,
    this.errorMessage,
    this.onRefreshTap,
  });

  Color get _borderColor {
    switch (state) {
      case KsFundCardState.insufficientFunds:
        return KeystoneTheme.red10;
      case KsFundCardState.success:
        return KeystoneTheme.green10;
      case KsFundCardState.normal:
        return KeystoneTheme.lightGrey;
    }
  }

  Color get _iconBgColor {
    switch (state) {
      case KsFundCardState.insufficientFunds:
        return KeystoneTheme.red10;
      case KsFundCardState.success:
        return KeystoneTheme.green10;
      case KsFundCardState.normal:
        return KeystoneTheme.brandBlue10;
    }
  }

  Color get _iconColor {
    switch (state) {
      case KsFundCardState.insufficientFunds:
        return KeystoneTheme.red;
      case KsFundCardState.success:
        return KeystoneTheme.green;
      case KsFundCardState.normal:
        return KeystoneTheme.brandBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = KeystoneTheme();

    return Container(
      decoration: BoxDecoration(
        color: KeystoneTheme.white,
        borderRadius: BorderRadius.circular(KeystoneTheme.radiusLGVal),
        border: Border.all(
          color: _borderColor,
          width: KeystoneTheme.borderThin,
        ),
      ),
      child: Column(
        children: [
          // Top section
          Padding(
            padding: EdgeInsets.all(KeystoneTheme.spacingMDVal),
            child: Row(
              children: [
                // Icon
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: _iconBgColor,
                    shape: BoxShape.circle,
                    boxShadow: state == KsFundCardState.insufficientFunds
                        ? [
                            BoxShadow(
                              color: KeystoneTheme.red.withOpacity(0.12),
                              offset: const Offset(0, 1.6),
                              blurRadius: 1.6,
                            ),
                          ]
                        : null,
                  ),
                  child: Icon(
                    state == KsFundCardState.insufficientFunds
                        ? Icons.error_outline
                        : Icons.account_balance,
                    size: 16,
                    color: _iconColor,
                  ),
                ),
                SizedBox(width: KeystoneTheme.spacingSMVal),
                
                // Account details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Account row
                      Row(
                        children: [
                          Icon(
                            Icons.account_balance,
                            size: 12,
                            color: KeystoneTheme.grey,
                          ),
                          SizedBox(width: KeystoneTheme.spacingXSVal),
                          Text(
                            accountNumber,
                            style: theme.bodyRegular.copyWith(color: KeystoneTheme.grey),
                          ),
                          SizedBox(width: KeystoneTheme.spacingXSVal),
                          Container(
                            width: 1,
                            height: 11.5,
                            color: _borderColor,
                          ),
                          SizedBox(width: KeystoneTheme.spacingXSVal),
                          Text(
                            accountName,
                            style: theme.bodyRegular.copyWith(color: KeystoneTheme.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Available funds row
                      Row(
                        children: [
                          Text(
                            'Available Funds:',
                            style: theme.subtitleRegular.copyWith(color: KeystoneTheme.black),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '₹',
                            style: theme.subtitleRegular.copyWith(color: KeystoneTheme.black),
                          ),
                          Text(
                            availableFunds,
                            style: theme.subtitleBold.copyWith(color: KeystoneTheme.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Refresh button
                GestureDetector(
                  onTap: onRefreshTap,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: KeystoneTheme.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: KeystoneTheme.softGrey,
                        width: 0.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 0.86),
                          blurRadius: 2.58,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.refresh,
                      size: 14,
                      color: KeystoneTheme.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Error message section
          if (state == KsFundCardState.insufficientFunds && errorMessage != null) ...[
            // Dashed divider
            Padding(
              padding: EdgeInsets.symmetric(horizontal: KeystoneTheme.spacingMDVal),
              child: CustomPaint(
                size: const Size(double.infinity, 1),
                painter: _DashedLinePainter(color: KeystoneTheme.red10),
              ),
            ),
            // Error message
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: KeystoneTheme.spacingSMVal,
                vertical: KeystoneTheme.spacingXXS,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    KeystoneTheme.red10,
                    KeystoneTheme.white.withOpacity(0),
                  ],
                  stops: const [0.5, 1.0],
                ),
              ),
              child: Text(
                errorMessage!,
                style: theme.bodyMedium.copyWith(color: KeystoneTheme.red),
              ),
            ),
            SizedBox(height: KeystoneTheme.spacingSMVal),
          ],
        ],
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;

  _DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + 2, 0), paint);
      startX += 4;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
