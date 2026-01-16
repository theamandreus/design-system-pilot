import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'plan_card.dart';

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: [
        WidgetbookCategory(
          name: 'Components',
          children: [
            WidgetbookComponent(
              name: 'PlanCard',
              useCases: [
                WidgetbookUseCase(
                  name: 'Populated',
                  builder: (context) => Center(
                    child: PlanCard(
                      state: PlanCardState.populated,
                      title: context.knobs.string(
                        label: 'Plan Name',
                        initialValue: 'Hybrid Fund',
                      ),
                      amount: context.knobs.string(
                        label: 'Plan Value',
                        initialValue: '₹12,450.00',
                      ),
                      subtitle: context.knobs.string(
                        label: 'Description',
                        initialValue: '+12.4% returns this year',
                      ),
                      buttonLabel: 'View Details',
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Empty',
                  builder: (context) => const Center(
                    child: PlanCard(
                      state: PlanCardState.empty,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Loading',
                  builder: (context) => const Center(
                    child: PlanCard(
                      state: PlanCardState.loading,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Selected',
                  builder: (context) => Center(
                    child: PlanCard(
                      state: PlanCardState.selected,
                      title: context.knobs.string(
                        label: 'Plan Name',
                        initialValue: 'Equity Fund',
                      ),
                      amount: context.knobs.string(
                        label: 'Plan Value',
                        initialValue: '₹25,890.00',
                      ),
                      subtitle: context.knobs.string(
                        label: 'Description',
                        initialValue: '+18.2% returns this year',
                      ),
                      buttonLabel: 'View Details',
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Error',
                  builder: (context) => Center(
                    child: PlanCard(
                      state: PlanCardState.error,
                      title: context.knobs.string(
                        label: 'Plan Name',
                        initialValue: 'Debt Fund',
                      ),
                      amount: context.knobs.string(
                        label: 'Plan Value',
                        initialValue: '₹8,320.00',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
