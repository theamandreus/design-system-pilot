import 'package:flutter/material.dart';
import 'plan_card.dart';
import 'ds_button.dart';
import 'screens/verify_otp_screen.dart';
import 'screens/success_screen.dart';
import 'themes/themes.dart';

void main() {
  runApp(const DesignSystemDemo());
}

class DesignSystemDemo extends StatelessWidget {
  const DesignSystemDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      initialTheme: ThemeType.pilot,
      child: Builder(
        builder: (context) {
          final theme = context.appTheme;
          return MaterialApp(
            title: 'Design System Pilot',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: theme.primary),
              useMaterial3: true,
            ),
            home: const MainNavigation(),
          );
        },
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  bool _showSuccess = false;

  void _onVerifyTap() {
    setState(() {
      _showSuccess = true;
    });
  }

  void _onGoToDashboard() {
    setState(() {
      _showSuccess = false;
      _currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const ComponentsDemo(),
          _showSuccess
              ? SuccessScreen(onButtonTap: _onGoToDashboard)
              : VerifyOtpScreen(onPrimaryButtonTap: _onVerifyTap),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
          if (index == 1) {
            _showSuccess = false;
          }
        }),
        selectedItemColor: theme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            activeIcon: Icon(Icons.widgets),
            label: 'Components',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android_outlined),
            activeIcon: Icon(Icons.phone_android),
            label: 'Screens',
          ),
        ],
      ),
    );
  }
}

class ComponentsDemo extends StatefulWidget {
  const ComponentsDemo({super.key});

  @override
  State<ComponentsDemo> createState() => _ComponentsDemoState();
}

class _ComponentsDemoState extends State<ComponentsDemo> {
  // PlanCard state
  PlanCardState _currentCardState = PlanCardState.populated;
  final List<PlanCardState> _cardStates = PlanCardState.values;

  // Button state
  DSButtonVariant _currentButtonVariant = DSButtonVariant.filled;

  void _cycleCardState() {
    setState(() {
      final currentIndex = _cardStates.indexOf(_currentCardState);
      _currentCardState = _cardStates[(currentIndex + 1) % _cardStates.length];
    });
  }

  void _cycleButtonVariant() {
    setState(() {
      final variants = DSButtonVariant.values;
      final currentIndex = variants.indexOf(_currentButtonVariant);
      _currentButtonVariant = variants[(currentIndex + 1) % variants.length];
    });
  }

  String _getCardStateName(PlanCardState state) {
    switch (state) {
      case PlanCardState.populated:
        return 'Populated';
      case PlanCardState.empty:
        return 'Empty';
      case PlanCardState.loading:
        return 'Loading';
      case PlanCardState.selected:
        return 'Selected';
      case PlanCardState.error:
        return 'Error';
      case PlanCardState.success:
        return 'Success';
      case PlanCardState.disabled:
        return 'Disabled';
    }
  }

  String _getButtonVariantName(DSButtonVariant variant) {
    switch (variant) {
      case DSButtonVariant.filled:
        return 'Filled';
      case DSButtonVariant.outlined:
        return 'Outlined';
      case DSButtonVariant.destructive:
        return 'Destructive';
      case DSButtonVariant.inactive:
        return 'Inactive';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final currentThemeType = context.themeType;
    
    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        title: Text('${theme.name} Design System'),
        backgroundColor: theme.primary,
        foregroundColor: theme.onPrimary,
        actions: [
          // Theme Switcher - Simple toggle buttons
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                _buildThemeToggle('Pilot', ThemeType.pilot, currentThemeType, theme, context),
                const SizedBox(width: 4),
                _buildThemeToggle('Keystone', ThemeType.keystone, currentThemeType, theme, context),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theme Info Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: theme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.border),
                boxShadow: [theme.cardShadow],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Theme: ${theme.name}',
                    style: theme.headlineBold.copyWith(color: theme.textPrimary),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildColorDot(theme.primary, 'Primary'),
                      const SizedBox(width: 16),
                      _buildColorDot(theme.success, 'Success'),
                      const SizedBox(width: 16),
                      _buildColorDot(theme.error, 'Error'),
                    ],
                  ),
                ],
              ),
            ),
            
            // PlanCard Section
            _buildSectionHeader('PlanCard', theme),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  _buildStateBadge(_getCardStateName(_currentCardState), theme),
                  const SizedBox(height: 16),
                  PlanCard(
                    state: _currentCardState,
                    title: 'Hybrid Fund',
                    amount: '₹12,450.00',
                    subtitle: '+12.4% returns this year',
                    onTap: _cycleCardState,
                  ),
                  const SizedBox(height: 16),
                  _buildChipSelector<PlanCardState>(
                    items: _cardStates,
                    selected: _currentCardState,
                    labelBuilder: _getCardStateName,
                    onSelect: (state) => setState(() => _currentCardState = state),
                    theme: theme,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 48),
            
            // Button Section
            _buildSectionHeader('Button', theme),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  _buildStateBadge(_getButtonVariantName(_currentButtonVariant), theme),
                  const SizedBox(height: 16),
                  DSButton(
                    label: 'Button Label',
                    variant: _currentButtonVariant,
                    onTap: _cycleButtonVariant,
                  ),
                  const SizedBox(height: 16),
                  _buildChipSelector<DSButtonVariant>(
                    items: DSButtonVariant.values,
                    selected: _currentButtonVariant,
                    labelBuilder: _getButtonVariantName,
                    onSelect: (variant) => setState(() => _currentButtonVariant = variant),
                    theme: theme,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 48),
            
            // All Button Variants
            _buildSectionHeader('All Button Variants', theme),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  DSButton(
                    label: 'Filled Button',
                    variant: DSButtonVariant.filled,
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  DSButton(
                    label: 'Outlined Button',
                    variant: DSButtonVariant.outlined,
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  DSButton(
                    label: 'Destructive Button',
                    variant: DSButtonVariant.destructive,
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  DSButton(
                    label: 'Inactive Button',
                    variant: DSButtonVariant.inactive,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeToggle(String label, ThemeType type, ThemeType current, AppTheme theme, BuildContext context) {
    final isSelected = type == current;
    return GestureDetector(
      onTap: () => context.setTheme(type),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? theme.onPrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: theme.onPrimary.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: isSelected ? theme.primary : theme.onPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildColorDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildSectionHeader(String title, AppTheme theme) {
    return Text(
      title,
      style: theme.h2.copyWith(color: theme.textPrimary),
    );
  }

  Widget _buildStateBadge(String label, AppTheme theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.primaryLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: theme.subtitleBold.copyWith(color: theme.primary),
      ),
    );
  }

  Widget _buildChipSelector<T>({
    required List<T> items,
    required T selected,
    required String Function(T) labelBuilder,
    required void Function(T) onSelect,
    required AppTheme theme,
  }) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: items.map((item) {
        final isActive = item == selected;
        return GestureDetector(
          onTap: () => onSelect(item),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isActive ? theme.primary : theme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: theme.primary,
                width: 1,
              ),
            ),
            child: Text(
              labelBuilder(item),
              style: theme.bodyMedium.copyWith(
                color: isActive ? theme.onPrimary : theme.primary,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
