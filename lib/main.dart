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
  PlanCardState _currentState = PlanCardState.populated;

  final List<PlanCardState> _states = [
    PlanCardState.populated,
    PlanCardState.empty,
    PlanCardState.loading,
    PlanCardState.selected,
    PlanCardState.error,
  ];

  void _cycleState() {
    setState(() {
      final currentIndex = _states.indexOf(_currentState);
      _currentState = _states[(currentIndex + 1) % _states.length];
    });
  }

  String _getStateName(PlanCardState state) {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('PlanCard Component'),
        backgroundColor: const Color(0xFF6200EE),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF6200EE).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'State: ${_getStateName(_currentState)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6200EE),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              PlanCard(
                state: _currentState,
                title: 'Hybrid Fund',
                amount: '₹12,450.00',
                subtitle: '+12.4% returns this year',
                onTap: _cycleState,
              ),
              const SizedBox(height: 32),
              const Text(
                'Tap the card to cycle through states',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B6B6B),
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: _states.map((state) {
                  final isActive = state == _currentState;
                  return GestureDetector(
                    onTap: () => setState(() => _currentState = state),
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
                        _getStateName(state),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isActive ? Colors.white : const Color(0xFF6200EE),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
