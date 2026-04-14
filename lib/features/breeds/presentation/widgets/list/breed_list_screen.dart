import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/controller/breed_list_controller.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/widgets/list/breed_list_card.dart';

class BreedListScreen extends HookConsumerWidget {
  const BreedListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(breedListControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Rassen")),
      body: state.when(
        skipLoadingOnRefresh: false,
        data: (data) => RefreshIndicator(
          onRefresh: () => ref.refresh(breedListControllerProvider.future),
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemCount: data.length,
            itemBuilder: (context, index) => BreedListCard(breed: data[index]),
          ),
        ),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
