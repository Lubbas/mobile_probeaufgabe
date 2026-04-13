import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/data/breed_repository_fake.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/data/breed_repository_remote.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/widgets/list/breed_list_card.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/widgets/list/breed_list_screen.dart';

void main() {
  group("Breed-List-Tests", () {
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
          child: MaterialApp(home: BreedListScreen()),
        ),
      );
    }

    testWidgets("Shows loading indicator while loading breeds", (tester) async {
      await setupScreen(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets("Shows breed list after loading", (widgetTester) async {
      await setupScreen(widgetTester);
      await widgetTester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(BreedListCard), findsWidgets);
    });

    testWidgets("Shows error message when breed list fails to load", (
      widgetTester,
    ) async {
      await setupScreen(widgetTester, shouldThrowError: true);
      await widgetTester.pumpAndSettle();
      expect(
        find.text("Exception: Fehler beim Laden der Rassen"),
        findsOneWidget,
      );
    });
  });
}
