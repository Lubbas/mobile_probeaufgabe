import 'package:flutter/material.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/util/extensions/context_extension.dart';

class BreedAttributeIndicator extends StatelessWidget {
  const BreedAttributeIndicator({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });
  final IconData icon;
  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              spacing: 8,
              children: [
                Icon(icon, size: 16),
                Text(label, style: context.textTheme.labelLarge),
              ],
            ),
            Text("$value/10"),
          ],
        ),
        LinearProgressIndicator(
          value: value / 10,
          minHeight: 6,
          borderRadius: .circular(24),
        ),
      ],
    );
  }
}
