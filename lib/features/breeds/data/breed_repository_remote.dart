import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/data/breed_repository.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/breed.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/cat_image.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/vote.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/shared/services/api_client_service.dart';

class BreedRepositoryRemote implements BreedRepository {
  BreedRepositoryRemote(this.apiClient);
  final ApiClientService apiClient;

  List<Breed> _breeds = [];

  @override
  Future<List<Breed>> getBreeds() async {
    _breeds = await apiClient.getBreeds();
    return Future.value(_breeds);
  }

  @override
  Future<Breed> getBreed(String id) async {
    // fetches breed from api
    final breedData = await apiClient.getBreed(id);

    // if breed has no image, fetches image from api with reference id
    if (breedData.image == null) {
      if (breedData.referenceImageId != null) {
        final imageData = await apiClient.getCatImage(
          breedData.referenceImageId!,
        );
        return breedData.copyWith(image: imageData);
      }
    }
    return breedData;
  }

  @override
  Future<bool> voteImage(Vote vote) async {
    if (vote.value == null) {
      throw ArgumentError('Vote must not be null');
    }
    if (vote.value! > 1 || vote.value! < -1) {
      throw ArgumentError('Vote must be either 1 (upvote) or -1 (downvote)');
    }

    return await apiClient.postCatImageVote(vote);
  }

  @override
  Future<Vote?> getCatImageVote({
    required String imageId,
    String? subId,
  }) async {
    final votes = await apiClient.getCatImageVotes(
      imageId: imageId,
      subId: subId,
    );
    return votes.where((element) => element.imageId == imageId).lastOrNull;
  }

  @override
  Future<List<CatImage>> searchImages(String breedId) async {
    final images = await apiClient.getImages(breedId: breedId);
    return images;
  }
}

final breedRepositoryRemoteProvider = Provider<BreedRepository>(
  (ref) => BreedRepositoryRemote(ref.watch(apiClientServiceProvider)),
);
