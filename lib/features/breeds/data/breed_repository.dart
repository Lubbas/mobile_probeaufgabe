import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/breed.dart';

abstract class BreedRepository {
  /// Get List of all [Breed]s
  Future<List<Breed>> getBreeds();

  /// Get a single [Breed] by its ID
  Future<Breed> getBreed(String id);
}
