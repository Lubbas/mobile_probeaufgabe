import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/core/routing/router.dart';

void main() async {
  /// Load environment variables from .env file
  await dotenv.load(fileName: ".env");

  runApp(
    ProviderScope(
      retry: (retryCount, error) => null,
      child: Consumer(
        builder: (context, ref, child) {
          final colorScheme = ColorScheme.fromSeed(
            dynamicSchemeVariant: .tonalSpot,
            seedColor: Color(0xffFE6841),
          );
          return MaterialApp.router(
            routerConfig: ref.read(routerProvider),
            theme: ThemeData(colorScheme: colorScheme),
          );
        },
      ),
    ),
  );
}
