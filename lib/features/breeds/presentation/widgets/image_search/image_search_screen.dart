import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/controller/image_search_controller.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/widgets/details/image_placeholder.dart';

class ImageSearchScreen extends HookConsumerWidget {
  const ImageSearchScreen({super.key, required this.breedId});
  final String breedId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(imageSearchControllerProvider(breedId));

    return Scaffold(
      appBar: AppBar(title: Text("Bilder-Suche")),
      body: state.when(
        data: (data) => data.isEmpty
            ? const Center(child: Text("Keine Bilder gefunden"))
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) => Image.network(
                  data[index].url!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      ImagePlaceholder(),
                ),
              ),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
