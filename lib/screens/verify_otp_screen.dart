import 'package:flutter/material.dart';
import '../ds_button.dart';
import '../plan_card.dart';

/// Verify OTP Screen from Design System
///
/// Figma: https://www.figma.com/design/cmgj79bpLI0KBt9mpl5oJb/Design-System---Pilot?node-id=60-185
class VerifyOtpScreen extends StatelessWidget {
  final VoidCallback? onPrimaryButtonTap;

  const VerifyOtpScreen({
    super.key,
    this.onPrimaryButtonTap,
  });

  // Colors from Figma
  static const _bgColor = Color(0xFFF5F5F5);
  static const _topBarColor = Color(0xFFFFFFFF);
  static const _textPrimary = Color(0xFF1C1B1F);
  static const _textSecondary = Color(0xFF6B6B6B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: Column(
        children: [
          // Top Bar
          Container(
            width: double.infinity,
            height: 108,
            decoration: BoxDecoration(
              color: _topBarColor,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6B7285).withOpacity(0.02),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          
          // Content Container
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Text(
                    'Enter OTP to Verify',
                    style: TextStyle(
                      fontFamily: 'Satoshi Variable',
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      height: 1.333,
                      letterSpacing: -0.1,
                      color: _textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  
                  // Description
                  const Text(
                    'We has sent an OTP to your mobile number +91 9090909090 to verify your purchase.',
                    style: TextStyle(
                      fontFamily: 'Satoshi Variable',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.35,
                      letterSpacing: -0.1,
                      color: _textSecondary,
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // PlanCard 1
                  const Center(
                    child: PlanCard(
                      state: PlanCardState.populated,
                      title: 'Hybrid Fund',
                      amount: '₹12,450.00',
                      subtitle: '+12.4% returns this year',
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // PlanCard 2
                  const Center(
                    child: PlanCard(
                      state: PlanCardState.populated,
                      title: 'Moderate Fund',
                      amount: '₹8,250.00',
                      subtitle: '+9.2% returns this year',
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Button Container
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: _topBarColor,
            child: DSButton(
              label: 'Verify Now',
              variant: DSButtonVariant.filled,
              width: double.infinity,
              borderRadius: 24,
              onTap: onPrimaryButtonTap,
            ),
          ),
        ],
      ),
    );
  }
}
