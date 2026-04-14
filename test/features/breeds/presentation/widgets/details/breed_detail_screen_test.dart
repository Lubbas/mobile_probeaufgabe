import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/data/breed_repository_fake.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/data/breed_repository_remote.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/widgets/details/breed_detail_screen.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/shared/exceptions/not_found_exception.dart';

void main() {
  group("Breed-Detail-Tests", () {
    Future<void> setupScreen(
      WidgetTester tester, {
      bool shouldThrowError = false,
    }) async {
      await tester.pumpWidget(
        ProviderScope(
          retry: (retryCount, error) => null,
          overrides: [
            breedRepositoryRemoteProvider.overrideWithValue(
              BreedRepositoryFake(
                hasImage: false,
                hasReferenceImage: false,
                shouldThrowError: shouldThrowError,
                delay: Duration(milliseconds: 500),
              ),
            ),
          ],
          child: MaterialApp(home: BreedDetailScreen(breedId: "abys")),
        ),
      );
    }

    testWidgets("Show loading indicator while loading breed", (tester) async {
      await setupScreen(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets("Show breed details after loading", (widgetTester) async {
      await setupScreen(widgetTester);
      await widgetTester.pumpAndSettle();
      expect(find.text("Abyssinian"), findsOneWidget);
      expect(
        find.text("Active, Energetic, Independent, Intelligent, Gentle"),
        findsOneWidget,
      );
    });

    testWidgets("Disable button to open Wikipedia when no URL is available", (
      widgetTester,
    ) async {
      await setupScreen(widgetTester);
      await widgetTester.pumpAndSettle();
      expect(
        widgetTester
            .widget<OutlinedButton>(
              find.byKey(const ValueKey("wikipedia_button")),
            )
            .enabled,
        isFalse,
      );
    });

    testWidgets("Shows error message when breed details fails to load", (
      widgetTester,
    ) async {
      await setupScreen(widgetTester, shouldThrowError: true);
      await widgetTester.pumpAndSettle();
      expect(
        find.text(BreedNotFoundException("abys").toString()),
        findsOneWidget,
      );
    });
  });
}
