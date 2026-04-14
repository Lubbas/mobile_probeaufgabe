import 'package:flutter/material.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/util/extensions/context_extension.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: .circular(4),
          color: context.colorScheme.surfaceContainerLow,
        ),
        padding: .all(12),
        child: Column(
          spacing: 8,
          children: [
            Icon(icon, size: 32, color: context.colorScheme.primary),
            Text(
              text,
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.primary,
              ),
              textAlign: .center,
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
