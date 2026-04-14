import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/data/breed_repository_fake.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/vote.dart';

void main() {
  group("BreedRepository", () {
    test("breed has image", () async {
      final repo = BreedRepositoryFake(hasImage: true);
      final breed = await repo.getBreed("abys");
      expect(breed.image, isNotNull);
    });

    test("breed fetches image via referenceImageId", () async {
      final repo = BreedRepositoryFake(
        hasImage: false,
        hasReferenceImage: true,
      );
      final breed = await repo.getBreed("abys");
      expect(breed.image, isNotNull);
    });
    test("breed has no image", () async {
      final repo = BreedRepositoryFake(
        hasImage: false,
        hasReferenceImage: false,
      );
      final breed = await repo.getBreed("abys");
      expect(breed.image, isNull);
    });

    test("throws argument error when voting more than 1", () async {
      final repo = BreedRepositoryFake();
      expect(
        () => repo.voteImage(Vote(imageId: "0XYvRd7oD", value: 2)),
        throwsA(isA<ArgumentError>()),
      );
    });

    test("throws argument error when voting less than -1", () async {
      final repo = BreedRepositoryFake();
      expect(
        () => repo.voteImage(Vote(imageId: "0XYvRd7oD", value: -2)),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
