import 'package:flutter/material.dart';
import '../ds_button.dart';

/// Success Screen from Design System
/// 
/// Icon specs from Figma (node 64:7):
/// - Size: 80x80px
/// - Circle: #198754 (green)
/// - Checkmark: #FFFFFF, 3px stroke
class SuccessScreen extends StatefulWidget {
  final VoidCallback? onButtonTap;

  const SuccessScreen({
    super.key,
    this.onButtonTap,
  });

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circleAnimation;
  late Animation<double> _checkAnimation;

  // Colors from Figma
  static const _bgColor = Color(0xFFF5F5F5);
  static const _bottomBarColor = Color(0xFFFFFFFF);
  static const _textPrimary = Color(0xFF1C1B1F);
  static const _textSecondary = Color(0xFF6B6B6B);
  static const _successColor = Color(0xFF198754);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Circle scales in first (0.0 - 0.4)
    _circleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOutBack),
      ),
    );

    // Checkmark draws after circle (0.4 - 1.0)
    _checkAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                    // Animated Success Icon
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return SizedBox(
                          width: 80,
                          height: 80,
                          child: CustomPaint(
                            painter: _SuccessIconPainter(
                              circleProgress: _circleAnimation.value,
                              checkProgress: _checkAnimation.value,
                              circleColor: _successColor,
                              checkColor: Colors.white,
                            ),
                          ),
                        );
                      },
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
              onTap: widget.onButtonTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _SuccessIconPainter extends CustomPainter {
  final double circleProgress;
  final double checkProgress;
  final Color circleColor;
  final Color checkColor;

  _SuccessIconPainter({
    required this.circleProgress,
    required this.checkProgress,
    required this.circleColor,
    required this.checkColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) * circleProgress;

    // Draw circle
    if (circleProgress > 0) {
      final circlePaint = Paint()
        ..color = circleColor
        ..style = PaintingStyle.fill;
      canvas.drawCircle(center, radius, circlePaint);
    }

    // Draw checkmark
    if (checkProgress > 0 && circleProgress >= 1.0) {
      final checkPaint = Paint()
        ..color = checkColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.0
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round;

      // Checkmark path points (relative to 80x80)
      final startPoint = Offset(size.width * 0.28, size.height * 0.50);
      final midPoint = Offset(size.width * 0.42, size.height * 0.64);
      final endPoint = Offset(size.width * 0.72, size.height * 0.36);

      final path = Path();

      // First segment (start to mid)
      if (checkProgress <= 0.5) {
        final t = checkProgress * 2;
        final currentX = startPoint.dx + (midPoint.dx - startPoint.dx) * t;
        final currentY = startPoint.dy + (midPoint.dy - startPoint.dy) * t;
        path.moveTo(startPoint.dx, startPoint.dy);
        path.lineTo(currentX, currentY);
      } else {
        // Second segment (mid to end)
        final t = (checkProgress - 0.5) * 2;
        final currentX = midPoint.dx + (endPoint.dx - midPoint.dx) * t;
        final currentY = midPoint.dy + (endPoint.dy - midPoint.dy) * t;
        path.moveTo(startPoint.dx, startPoint.dy);
        path.lineTo(midPoint.dx, midPoint.dy);
        path.lineTo(currentX, currentY);
      }

      canvas.drawPath(path, checkPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _SuccessIconPainter oldDelegate) {
    return oldDelegate.circleProgress != circleProgress ||
        oldDelegate.checkProgress != checkProgress;
  }
}
