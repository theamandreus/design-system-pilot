import 'package:flutter/material.dart';
import '../themes/keystone_theme.dart';
import '../components/keystone/keystone_components.dart';

/// Invest Now - Investment Basket Screen
/// Built using Keystone Design System components
/// Figma: Design System - Pilot 2, node 36-4146
class InvestNowScreen extends StatelessWidget {
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
                      
                      // Nav Bar
                      KsNavBar(
                        title: 'Invest Now',
                        onBackTap: onBackTap,
                        action: KsHelpButton(
                          onTap: onNeedHelpTap,
                        ),
                      ),
                      
                      // Basket Header
                      const KsBasketHeader(
                        name: 'Conservative Model',
                        value: 'Basket Value: ₹5,176',
                        icon: Icons.shield_outlined,
                      ),
                      
                      // Amount Input Card
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: KeystoneTheme.spacingMDVal,
                        ),
                        child: const KsAmountInputCard(
                          amount: '3,60,000',
                          unitsApprox: '69 Units',
                          state: KsAmountInputState.error,
                        ),
                      ),
                      
                      SizedBox(height: KeystoneTheme.spacingLGVal),
                      
                      // Fund Card with insufficient funds
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: KeystoneTheme.spacingMDVal,
                        ),
                        child: const KsFundCard(
                          accountNumber: '882910',
                          accountName: 'Sijo M Peter',
                          availableFunds: '0.00',
                          state: KsFundCardState.insufficientFunds,
                          errorMessage: 'Insufficient funds. Add ₹3,60,000',
                        ),
                      ),
                      
                      SizedBox(height: KeystoneTheme.spacingMDVal),
                      
                      // Order Summary Section
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: KeystoneTheme.spacingMDVal,
                        ),
                        child: Column(
                          children: [
                            // Section Header
                            const KsSectionHeader(
                              title: 'ORDER SUMMARY',
                              icon: Icons.receipt_outlined,
                            ),
                            
                            SizedBox(height: KeystoneTheme.spacingLGVal),
                            
                            // Order Summary Card
                            const KsOrderSummaryCard(
                              items: [
                                KsOrderSummaryItem(
                                  label: 'Estimated Units:',
                                  value: '≈ 69 units',
                                ),
                                KsOrderSummaryItem(
                                  label: 'Estimated Charges (Included):',
                                  value: '₹234.00',
                                ),
                              ],
                              infoNote: 'Units shown are estimates based on current market prices and may change at execution',
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: KeystoneTheme.spacingXLVal),
                    ],
                  ),
                ),
              ),
              
              // CTA Container
              KsCtaContainer(
                primaryButton: KsPrimaryButton(
                  label: 'Add Funds & Retry',
                  onTap: onAddFundsTap,
                ),
                helpText: 'Not sure how to add funds?',
                helpLinkText: 'Need Help',
                onHelpTap: onNeedHelpTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
