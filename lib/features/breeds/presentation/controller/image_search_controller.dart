import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/data/breed_repository_remote.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/cat_image.dart';

class ImageSearchController extends AsyncNotifier<List<CatImage>> {
  final String breedId;
  ImageSearchController(this.breedId);

  @override
  FutureOr<List<CatImage>> build() {
    final repo = ref.read(breedRepositoryRemoteProvider);
    return repo.searchImages(breedId);
  }
}

final imageSearchControllerProvider = AsyncNotifierProvider.autoDispose
    .family<ImageSearchController, List<CatImage>, String>(
      name: "Image-Search-Controller",
      (breedId) => ImageSearchController(breedId),
    );
