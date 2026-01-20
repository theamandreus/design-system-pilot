import 'package:flutter/material.dart';
import 'ds_button.dart';

/// PlanCard state enumeration
enum PlanCardState {
  populated,
  empty,
  loading,
  selected,
  error,
  success,
}

/// PlanCard component from Design System
/// 
/// A card displaying investment plan information with multiple states.
/// 
/// Figma: https://www.figma.com/design/cmgj79bpLI0KBt9mpl5oJb/Design-System---Pilot?node-id=6-49
class PlanCard extends StatelessWidget {
  final PlanCardState state;
  final String? title;
  final String? amount;
  final String? subtitle;
  final String? buttonLabel;
  final VoidCallback? onTap;
  final VoidCallback? onButtonTap;

  const PlanCard({
    super.key,
    this.state = PlanCardState.populated,
    this.title,
    this.amount,
    this.subtitle,
    this.buttonLabel,
    this.onTap,
    this.onButtonTap,
  });

  // Design tokens from Figma
  static const _cardWidth = 320.0;
  static const _borderRadius = 12.0;
  static const _padding = 16.0;
  static const _gap = 8.0;

  // Colors
  static const _bgColor = Color(0xFFFFFFFF);
  static const _borderDefault = Color(0xFFE0E0E0);
  static const _borderSelected = Color(0xFF6200EE);
  static const _borderError = Color(0xFFB3261E);
  static const _textPrimary = Color(0xFF1C1B1F);
  static const _textSecondary = Color(0xFF6B6B6B);
  static const _textError = Color(0xFFB3261E);
  static const _textSuccess = Color(0xFF6200EE);
  static const _skeletonColor = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _cardWidth,
        padding: const EdgeInsets.all(_padding),
        decoration: BoxDecoration(
          color: _bgColor,
          borderRadius: BorderRadius.circular(_borderRadius),
          border: Border.all(
            color: _getBorderColor(),
            width: _getBorderWidth(),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: _buildContent(),
      ),
    );
  }

  Color _getBorderColor() {
    switch (state) {
      case PlanCardState.selected:
        return _borderSelected;
      case PlanCardState.error:
        return _borderError;
      default:
        return _borderDefault;
    }
  }

  double _getBorderWidth() {
    return state == PlanCardState.selected ? 2.0 : 1.0;
  }

  Widget _buildContent() {
    switch (state) {
      case PlanCardState.loading:
        return _buildLoadingState();
      case PlanCardState.empty:
        return _buildEmptyState();
      case PlanCardState.error:
        return _buildErrorState();
      case PlanCardState.success:
        return _buildSuccessState();
      case PlanCardState.populated:
      case PlanCardState.selected:
        return _buildPopulatedState();
    }
  }

  Widget _buildPopulatedState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title ?? 'Hybrid Fund',
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.125,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: _gap),
        Text(
          amount ?? '₹12,450.00',
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 1.208,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: _gap),
        Text(
          subtitle ?? '+12.4% returns this year',
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.428,
            color: _textSecondary,
          ),
        ),
        const SizedBox(height: _gap),
        DSButton(
          label: buttonLabel ?? 'Button Label',
          variant: DSButtonVariant.outlined,
          width: 288,
          onTap: onButtonTap,
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'No plan selected',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.125,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: _gap),
        const Text(
          '—',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 1.208,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: _gap),
        const Text(
          'Select a plan to invest',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.428,
            color: _textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80,
          height: 18,
          decoration: BoxDecoration(
            color: _skeletonColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: _gap),
        Container(
          width: 120,
          height: 29,
          decoration: BoxDecoration(
            color: _skeletonColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: _gap),
        Container(
          width: 140,
          height: 20,
          decoration: BoxDecoration(
            color: _skeletonColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title ?? 'Hybrid Fund',
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.125,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: _gap),
        Text(
          amount ?? '₹12,450.00',
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 1.208,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: _gap),
        const Text(
          'Failed to load data',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.428,
            color: _textError,
          ),
        ),
      ],
    );
  }

  Widget _buildSuccessState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title ?? 'Hybrid Fund',
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.125,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: _gap),
        Text(
          amount ?? '₹12,450.00',
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 1.208,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: _gap),
        Text(
          subtitle ?? 'Wow ! You made Profit',
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.428,
            color: _textSuccess,
          ),
        ),
      ],
    );
  }
}
