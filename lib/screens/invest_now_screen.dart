import 'package:flutter/material.dart';
import '../themes/keystone_theme.dart';

/// Invest Now - Investment Basket Screen
/// Built using Keystone Design System tokens only
/// Figma: Design System - Pilot 2, node 36-4146
class InvestNowScreen extends StatefulWidget {
  final VoidCallback? onBackTap;
  final VoidCallback? onAddFundsTap;
  final VoidCallback? onNeedHelpTap;

  const InvestNowScreen({
    super.key,
    this.onBackTap,
    this.onAddFundsTap,
    this.onNeedHelpTap,
  });

  @override
  State<InvestNowScreen> createState() => _InvestNowScreenState();
}

class _InvestNowScreenState extends State<InvestNowScreen> {
  final theme = KeystoneTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              KeystoneTheme.white,
              KeystoneTheme.softGrey,
            ],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Main scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      _buildNavBar(),
                      _buildBasketHeader(),
                      _buildAmountInputCard(),
                      const SizedBox(height: 20),
                      _buildFundCard(),
                      const SizedBox(height: 16),
                      _buildOrderSummarySection(),
                    ],
                  ),
                ),
              ),
              // CTA Container (fixed at bottom)
              _buildCTAContainer(),
            ],
          ),
        ),
      ),
    );
  }

  /// Nav Bar with back button, title, and help
  Widget _buildNavBar() {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: KeystoneTheme.spacingMDVal),
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: widget.onBackTap,
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
          SizedBox(width: KeystoneTheme.spacingSMVal),
          // Title
          Expanded(
            child: Text(
              'Invest Now',
              style: theme.headlineBold.copyWith(color: KeystoneTheme.black),
            ),
          ),
          // Help button
          Container(
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
                  Icons.chat_bubble_outline,
                  size: 16,
                  color: KeystoneTheme.brandBlue,
                ),
                const SizedBox(width: 4),
                Text(
                  'Need Help?',
                  style: theme.bodyMedium.copyWith(color: KeystoneTheme.brandBlue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Basket header with icon and info
  Widget _buildBasketHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        KeystoneTheme.spacingMDVal,
        KeystoneTheme.spacingXLVal,
        KeystoneTheme.spacingMDVal,
        KeystoneTheme.spacingLGVal,
      ),
      child: Row(
        children: [
          // Basket icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: KeystoneTheme.brandBlue10,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shield_outlined,
              size: 20,
              color: KeystoneTheme.brandBlue,
            ),
          ),
          SizedBox(width: KeystoneTheme.spacingSMVal),
          // Basket info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Conservative Model',
                style: theme.h2.copyWith(color: KeystoneTheme.black),
              ),
              const SizedBox(height: 4),
              Text(
                'Basket Value: ₹5,176',
                style: theme.subtitleRegular.copyWith(color: KeystoneTheme.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Amount input card with error state
  Widget _buildAmountInputCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: KeystoneTheme.spacingMDVal),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: KeystoneTheme.spacingLGVal,
          vertical: KeystoneTheme.spacing3XL,
        ),
        decoration: BoxDecoration(
          color: KeystoneTheme.white,
          borderRadius: BorderRadius.circular(KeystoneTheme.radiusXLVal),
          border: Border.all(
            color: KeystoneTheme.red,
            width: KeystoneTheme.borderRegular,
          ),
          boxShadow: [theme.cardShadow],
        ),
        child: Column(
          children: [
            // Label
            Text(
              'ENTER INVESTMENT AMOUNT',
              style: theme.bodyRegular.copyWith(color: KeystoneTheme.grey),
            ),
            SizedBox(height: KeystoneTheme.spacing2XL),
            // Amount input row
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
                  '3,60,000',
                  style: TextStyle(
                    fontFamily: 'Satoshi Variable',
                    fontWeight: FontWeight.w600,
                    fontSize: 36,
                    color: KeystoneTheme.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: KeystoneTheme.spacingMDVal),
            // Units approximation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '≈',
                  style: theme.subtitleRegular.copyWith(color: KeystoneTheme.grey),
                ),
                const SizedBox(width: 4),
                Text(
                  '69 Units',
                  style: theme.subtitleMedium.copyWith(color: KeystoneTheme.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Fund card showing insufficient funds error
  Widget _buildFundCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: KeystoneTheme.spacingMDVal),
      child: Container(
        decoration: BoxDecoration(
          color: KeystoneTheme.white,
          borderRadius: BorderRadius.circular(KeystoneTheme.radiusLGVal),
          border: Border.all(
            color: KeystoneTheme.red10,
            width: KeystoneTheme.borderThin,
          ),
        ),
        child: Column(
          children: [
            // Top section with account info
            Padding(
              padding: EdgeInsets.all(KeystoneTheme.spacingMDVal),
              child: Row(
                children: [
                  // Bank icon container
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: KeystoneTheme.red10,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: KeystoneTheme.red10,
                        width: 0.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: KeystoneTheme.red.withOpacity(0.12),
                          offset: const Offset(0, 1.6),
                          blurRadius: 1.6,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.error_outline,
                      size: 16,
                      color: KeystoneTheme.red,
                    ),
                  ),
                  SizedBox(width: KeystoneTheme.spacingSMVal),
                  // Account details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Account number and name row
                        Row(
                          children: [
                            Icon(
                              Icons.account_balance,
                              size: 12,
                              color: KeystoneTheme.grey,
                            ),
                            SizedBox(width: KeystoneTheme.spacingXSVal),
                            Text(
                              '882910',
                              style: theme.bodyRegular.copyWith(color: KeystoneTheme.grey),
                            ),
                            SizedBox(width: KeystoneTheme.spacingXSVal),
                            Container(
                              width: 1,
                              height: 11.5,
                              color: KeystoneTheme.red10,
                            ),
                            SizedBox(width: KeystoneTheme.spacingXSVal),
                            Text(
                              'Sijo M Peter',
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
                              '0.00',
                              style: theme.subtitleBold.copyWith(color: KeystoneTheme.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Refresh button
                  Container(
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
                ],
              ),
            ),
            // Dashed divider
            Container(
              margin: EdgeInsets.symmetric(horizontal: KeystoneTheme.spacingMDVal),
              child: CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLinePainter(color: KeystoneTheme.red10),
              ),
            ),
            // Error message row
            Container(
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
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(999),
                  bottomLeft: Radius.circular(999),
                ),
              ),
              child: Text(
                'Insufficient funds. Add ₹3,60,000',
                style: theme.bodyMedium.copyWith(color: KeystoneTheme.red),
              ),
            ),
            SizedBox(height: KeystoneTheme.spacingSMVal),
          ],
        ),
      ),
    );
  }

  /// Order summary section
  Widget _buildOrderSummarySection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: KeystoneTheme.spacingMDVal),
      child: Column(
        children: [
          // Section header with decorative lines
          Row(
            children: [
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
              Icon(
                Icons.receipt_outlined,
                size: 20,
                color: KeystoneTheme.lightGrey,
              ),
              SizedBox(width: KeystoneTheme.spacingXXS),
              Text(
                'ORDER SUMMARY',
                style: TextStyle(
                  fontFamily: 'Satoshi Variable',
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  letterSpacing: 3.0,
                  color: KeystoneTheme.black,
                ),
              ),
              SizedBox(width: KeystoneTheme.spacingXXS),
              Icon(
                Icons.receipt_outlined,
                size: 20,
                color: KeystoneTheme.lightGrey,
              ),
              SizedBox(width: KeystoneTheme.spacingXXS),
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
          ),
          SizedBox(height: KeystoneTheme.spacingLGVal),
          // Order summary card
          Container(
            decoration: BoxDecoration(
              color: KeystoneTheme.white,
              borderRadius: BorderRadius.circular(KeystoneTheme.radiusLGVal),
            ),
            child: Column(
              children: [
                // Summary rows
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    KeystoneTheme.spacingLGVal,
                    KeystoneTheme.spacingLGVal,
                    KeystoneTheme.spacingLGVal,
                    KeystoneTheme.spacingMDVal,
                  ),
                  child: Column(
                    children: [
                      // Estimated units row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Estimated Units:',
                            style: theme.subtitleRegular.copyWith(color: KeystoneTheme.grey),
                          ),
                          Text(
                            '≈ 69 units',
                            style: theme.subtitleRegular.copyWith(color: KeystoneTheme.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: KeystoneTheme.spacingSMVal),
                      // Estimated charges row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Estimated Charges (Included):',
                              style: theme.subtitleRegular.copyWith(color: KeystoneTheme.grey),
                            ),
                          ),
                          Text(
                            '₹234.00',
                            style: theme.subtitleRegular.copyWith(color: KeystoneTheme.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Dashed divider
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: KeystoneTheme.spacingLGVal),
                  child: CustomPaint(
                    size: const Size(double.infinity, 1),
                    painter: DashedLinePainter(color: KeystoneTheme.lightGrey),
                  ),
                ),
                // Info note
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    KeystoneTheme.spacingLGVal,
                    KeystoneTheme.spacingMDVal,
                    KeystoneTheme.spacingLGVal,
                    KeystoneTheme.spacingLGVal,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Icon(
                          Icons.info_outline,
                          size: 20,
                          color: KeystoneTheme.grey,
                        ),
                      ),
                      SizedBox(width: KeystoneTheme.spacingSMVal),
                      Expanded(
                        child: Text(
                          'Units shown are estimates based on current market prices and may change at execution',
                          style: theme.bodyRegular.copyWith(color: KeystoneTheme.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// CTA container with primary button
  Widget _buildCTAContainer() {
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
              GestureDetector(
                onTap: widget.onAddFundsTap,
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    color: KeystoneTheme.brandBlue,
                    borderRadius: BorderRadius.circular(KeystoneTheme.radiusMDVal),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Add Funds & Retry',
                    style: theme.headlineBold.copyWith(color: KeystoneTheme.white),
                  ),
                ),
              ),
              SizedBox(height: KeystoneTheme.spacingSMVal),
              // Help link row
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
                    const SizedBox(width: 4),
                    Text(
                      'Not sure how to add funds?',
                      style: theme.bodyMedium.copyWith(color: KeystoneTheme.grey),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onNeedHelpTap,
                      child: Text(
                        'Need Help',
                        style: theme.bodyMedium.copyWith(color: KeystoneTheme.brandBlue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Custom painter for dashed lines
class DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  DashedLinePainter({
    required this.color,
    this.dashWidth = 2,
    this.dashSpace = 2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
