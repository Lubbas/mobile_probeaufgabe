import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/data/breed_repository_remote.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/breed.dart';

class BreedDetailsController extends AsyncNotifier<Breed> {
  final String breedId;
  BreedDetailsController(this.breedId);

  @override
  Future<Breed> build() {
    final repo = ref.watch(breedRepositoryRemoteProvider);
    return repo.getBreed(breedId);
  }
}

final breedDetailsControllerProvider = AsyncNotifierProvider.autoDispose
    .family<BreedDetailsController, Breed, String>(
      name: "Breed-Details-Controller",
      (breedId) => BreedDetailsController(breedId),
    );
