import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/data/breed_repository_remote.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/breed.dart';

class BreedListController extends AsyncNotifier<List<Breed>> {
  @override
  Future<List<Breed>> build() {
    final repo = ref.watch(breedRepositoryRemoteProvider);
    return repo.getBreeds();
  }
}

final breedListControllerProvider =
    AsyncNotifierProvider.autoDispose<BreedListController, List<Breed>>(
      () => BreedListController(),
    );
