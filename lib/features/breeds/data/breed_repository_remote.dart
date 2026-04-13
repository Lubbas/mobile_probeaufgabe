import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/data/breed_repository.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/breed.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/breed_image.dart';
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
    final breedData = await apiClient.getBreed(id);
    if (breedData.image == null) {
      if (breedData.referenceImageId != null) {
        final imageData = await apiClient.getBreedImage(
          breedData.referenceImageId!,
        );
        return breedData.copyWith(image: imageData);
      }
    }
    return breedData;
  }

  @override
  Future<BreedImage> getBreedImage(String id) => apiClient.getBreedImage(id);
}

final breedRepositoryRemoteProvider = Provider<BreedRepository>(
  (ref) => BreedRepositoryRemote(ref.watch(apiClientServiceProvider)),
);
