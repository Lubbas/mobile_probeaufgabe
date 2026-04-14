import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/data/breed_repository_remote.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/vote.dart';

class ImageVotingController extends AsyncNotifier<Vote> {
  final String imageId;
  ImageVotingController(this.imageId);

  final String _subID = "c0b526a3-6e1a-44d2-bf74-e7a225dd587e";

  @override
  FutureOr<Vote> build() async {
    final repo = ref.read(breedRepositoryRemoteProvider);
    final vote = await repo.getCatImageVote(imageId: imageId);
    return vote ?? Vote(imageId: imageId);
  }

  Future<void> upvote() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(breedRepositoryRemoteProvider);
      final voteResult = await repo.voteImage(
        Vote(imageId: imageId, value: 1, subId: _subID),
      );
      if (voteResult) {
        return state.value!.copyWith(value: 1);
      }
      return state.value!;
    });
  }

  Future<void> downVote() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(breedRepositoryRemoteProvider);
      final voteResult = await repo.voteImage(
        Vote(imageId: imageId, value: -1, subId: _subID),
      );
      if (voteResult) {
        return state.value!.copyWith(value: -1);
      }
      return state.value!;
    });
  }
}

final votingControllerProvider = AsyncNotifierProvider.autoDispose
    .family<ImageVotingController, Vote, String>(
      name: "Voting-Controller",
      (imageId) => ImageVotingController(imageId),
    );
