import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/data/breed_repository_fake.dart';

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
  });

  test("breed has no image", () async {
    final repo = BreedRepositoryFake(hasImage: false, hasReferenceImage: false);
    final breed = await repo.getBreed("abys");
    expect(breed.image, isNull);
  });
}
