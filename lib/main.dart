import 'package:flutter/material.dart';
import 'plan_card.dart';

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
      home: const PlanCardDemo(),
    );
  }
}

class PlanCardDemo extends StatefulWidget {
  const PlanCardDemo({super.key});

  @override
  State<PlanCardDemo> createState() => _PlanCardDemoState();
}

class _PlanCardDemoState extends State<PlanCardDemo> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('PlanCard Component'),
        backgroundColor: const Color(0xFF6200EE),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Populated State',
              PlanCard(
                state: _selectedIndex == 0
                    ? PlanCardState.selected
                    : PlanCardState.populated,
                title: 'Equity Growth Fund',
                amount: '₹25,000.00',
                subtitle: '+18.2% returns this year',
                onTap: () => setState(() => _selectedIndex = 0),
              ),
            ),
            _buildSection(
              'Empty State',
              const PlanCard(
                state: PlanCardState.empty,
              ),
            ),
            _buildSection(
              'Loading State',
              const PlanCard(
                state: PlanCardState.loading,
              ),
            ),
            _buildSection(
              'Selected State',
              const PlanCard(
                state: PlanCardState.selected,
                title: 'Debt Fund',
                amount: '₹50,000.00',
                subtitle: '+8.5% returns this year',
              ),
            ),
            _buildSection(
              'Error State',
              const PlanCard(
                state: PlanCardState.error,
                title: 'Index Fund',
                amount: '₹15,000.00',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
