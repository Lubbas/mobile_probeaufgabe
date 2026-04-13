import 'package:flutter/material.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/util/extensions/context_extension.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surfaceContainerLow,
      child: Icon(Icons.pets, size: 64, color: context.colorScheme.outline),
    );
  }
}
