import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/controller/voting_controller.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/util/extensions/context_extension.dart';

class VotingContainer extends HookConsumerWidget {
  const VotingContainer({super.key, required this.imageId});
  final String imageId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(votingControllerProvider(imageId));

    return SizedBox(
      width: .infinity,
      child: SegmentedButton(
        style: SegmentedButton.styleFrom(
          side: BorderSide(color: context.colorScheme.outlineVariant),
          selectedBackgroundColor: context.colorScheme.primaryContainer,
        ),
        emptySelectionAllowed: true,
        selected: state.maybeWhen(
          data: (data) => {if (data.value == 1) 0, if (data.value == -1) 1},
          orElse: () => {},
        ),

        onSelectionChanged: state.maybeWhen(
          data: (data) => (val) {
            if (val.isEmpty) return;
            final controller = ref.read(
              votingControllerProvider(imageId).notifier,
            );
            val.first == 0 ? controller.upvote() : controller.downVote();
          },
          orElse: () => null,
        ),
        showSelectedIcon: false,
        segments: [
          ButtonSegment(
            icon: Icon(Icons.thumb_up_outlined),
            label: Text("Gefällt mir"),
            value: 0,
          ),
          ButtonSegment(
            label: Text("Gefällt mir nicht"),
            icon: Icon(Icons.thumb_down_outlined),
            value: 1,
          ),
        ],
      ),
    );
  }
}
