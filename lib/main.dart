import 'package:flutter/material.dart';
import 'plan_card.dart';
import 'ds_button.dart';

void main() {
  runApp(const DesignSystemDemo());
}

class DesignSystemDemo extends StatelessWidget {
  const DesignSystemDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design System Pilot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6200EE)),
        useMaterial3: true,
      ),
      home: const ComponentsDemo(),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Design System Pilot'),
        backgroundColor: const Color(0xFF6200EE),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PlanCard Section
            _buildSectionHeader('PlanCard'),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  _buildStateBadge(_getCardStateName(_currentCardState)),
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
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 48),
            
            // Button Section
            _buildSectionHeader('Button'),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  _buildStateBadge(_getButtonVariantName(_currentButtonVariant)),
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
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 48),
            
            // All Button Variants
            _buildSectionHeader('All Button Variants'),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1C1B1F),
      ),
    );
  }

  Widget _buildStateBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF6200EE).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF6200EE),
        ),
      ),
    );
  }

  Widget _buildChipSelector<T>({
    required List<T> items,
    required T selected,
    required String Function(T) labelBuilder,
    required void Function(T) onSelect,
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
              color: isActive ? const Color(0xFF6200EE) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF6200EE),
                width: 1,
              ),
            ),
            child: Text(
              labelBuilder(item),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive ? Colors.white : const Color(0xFF6200EE),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
