import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/breed.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/cat_image.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/vote.dart';

abstract class BreedRepository {
  /// Get List of all [Breed]s
  Future<List<Breed>> getBreeds();

  /// Get a single [Breed] by its ID
  Future<Breed> getBreed(String id);

  /// Vote for an [CatImage] by its ID with a given [vote] value (1 or -1)
  Future<bool> voteImage(Vote vote);

  /// Get the [Vote] for a given [CatImage] by its ID
  Future<Vote?> getCatImageVote({required String imageId, String? subId});

  /// Get the [CatImage]s for a given [Breed] by its ID
  Future<List<CatImage>> searchImages(String breedId);
}
