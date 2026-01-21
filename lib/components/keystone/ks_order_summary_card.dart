import 'package:flutter/material.dart';
import '../../themes/keystone_theme.dart';

/// Order Summary Row Item
class KsOrderSummaryItem {
  final String label;
  final String value;

  const KsOrderSummaryItem({
    required this.label,
    required this.value,
  });
}

/// Keystone Order Summary Card Component
/// 
/// Displays order summary with line items and optional info note.
class KsOrderSummaryCard extends StatelessWidget {
  final List<KsOrderSummaryItem> items;
  final String? infoNote;

  const KsOrderSummaryCard({
    super.key,
    required this.items,
    this.infoNote,
  });

  @override
  Widget build(BuildContext context) {
    final theme = KeystoneTheme();

    return Container(
      decoration: BoxDecoration(
        color: KeystoneTheme.white,
        borderRadius: BorderRadius.circular(KeystoneTheme.radiusLGVal),
      ),
      child: Column(
        children: [
          // Summary rows
          Padding(
            padding: EdgeInsets.fromLTRB(
              KeystoneTheme.spacingLGVal,
              KeystoneTheme.spacingLGVal,
              KeystoneTheme.spacingLGVal,
              KeystoneTheme.spacingMDVal,
            ),
            child: Column(
              children: items.asMap().entries.map((entry) {
                final isLast = entry.key == items.length - 1;
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: isLast ? 0 : KeystoneTheme.spacingSMVal,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          entry.value.label,
                          style: theme.subtitleRegular.copyWith(color: KeystoneTheme.grey),
                        ),
                      ),
                      Text(
                        entry.value.value,
                        style: theme.subtitleRegular.copyWith(color: KeystoneTheme.grey),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          
          // Info note section
          if (infoNote != null) ...[
            // Dashed divider
            Padding(
              padding: EdgeInsets.symmetric(horizontal: KeystoneTheme.spacingLGVal),
              child: CustomPaint(
                size: const Size(double.infinity, 1),
                painter: _DashedLinePainter(color: KeystoneTheme.lightGrey),
              ),
            ),
            // Info note
            Padding(
              padding: EdgeInsets.fromLTRB(
                KeystoneTheme.spacingLGVal,
                KeystoneTheme.spacingMDVal,
                KeystoneTheme.spacingLGVal,
                KeystoneTheme.spacingLGVal,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Icon(
                      Icons.info_outline,
                      size: 20,
                      color: KeystoneTheme.grey,
                    ),
                  ),
                  SizedBox(width: KeystoneTheme.spacingSMVal),
                  Expanded(
                    child: Text(
                      infoNote!,
                      style: theme.bodyRegular.copyWith(color: KeystoneTheme.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;

  _DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + 2, 0), paint);
      startX += 4;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
