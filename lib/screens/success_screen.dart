import 'package:flutter/material.dart';
import '../ds_button.dart';

/// Success Screen from Design System
class SuccessScreen extends StatelessWidget {
  final VoidCallback? onButtonTap;

  const SuccessScreen({
    super.key,
    this.onButtonTap,
  });

  // Colors
  static const _bgColor = Color(0xFFF5F5F5);
  static const _bottomBarColor = Color(0xFFFFFFFF);
  static const _textPrimary = Color(0xFF1C1B1F);
  static const _textSecondary = Color(0xFF6B6B6B);
  static const _successColor = Color(0xFF6200EE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: Column(
        children: [
          // Content
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Success Icon
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: _successColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        size: 64,
                        color: _successColor,
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Title
                    const Text(
                      'Verification Successful!',
                      style: TextStyle(
                        fontFamily: 'Satoshi Variable',
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        height: 1.333,
                        letterSpacing: -0.1,
                        color: _textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    
                    // Description
                    const Text(
                      'Your purchase has been verified successfully. You can now access your investment.',
                      style: TextStyle(
                        fontFamily: 'Satoshi Variable',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.35,
                        letterSpacing: -0.1,
                        color: _textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Button Container
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: _bottomBarColor,
            child: DSButton(
              label: 'Go to Dashboard',
              variant: DSButtonVariant.filled,
              width: double.infinity,
              borderRadius: 24,
              onTap: onButtonTap,
            ),
          ),
        ],
      ),
    );
  }
}
