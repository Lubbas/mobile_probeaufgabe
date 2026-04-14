import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/core/routing/app_paths.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/breed.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/controller/breed_details_controller.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/widgets/details/breed_attribute_indicator.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/widgets/details/image_placeholder.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/widgets/details/info_container.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/widgets/details/voting_container.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/util/extensions/context_extension.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/util/extensions/string_extension.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BreedDetailScreen extends HookConsumerWidget {
  const BreedDetailScreen({super.key, required this.breedId});
  final String breedId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(breedDetailsControllerProvider(breedId));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            backgroundColor: context.colorScheme.surface,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [.zoomBackground],
              collapseMode: .pin,
              background: state.value?.image?.url?.isUseable ?? false
                  ? Image.network(
                      state.value!.image!.url!,
                      fit: .cover,
                      errorBuilder: (context, error, stackTrace) =>
                          ImagePlaceholder(),
                    )
                  : ImagePlaceholder(),
            ),
            actionsPadding: .only(right: 12),
            actions: [
              IconButton.filledTonal(
                onPressed: () =>
                    context.go("${context.location}${AppPaths.imageSearch}"),
                tooltip: "Bilder-Suche",
                icon: Icon(Icons.image_search_outlined),
              ),
            ],
          ),
          state.when(
            data: (data) => SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const .all(16.0),
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              spacing: 4,
                              crossAxisAlignment: .start,
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  data.name.orPlaceholder(),
                                  style: context.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  data.temperament.orPlaceholder(),
                                  style: context.textTheme.labelLarge?.copyWith(
                                    color: context.colorScheme.outline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Row(
                        spacing: 16,
                        children: [
                          InfoContainer(
                            icon: Icons.scale_outlined,
                            text: data.formattedWeight,
                          ),
                          InfoContainer(
                            icon: Icons.cake_outlined,
                            text: data.formattedLifeSpan,
                          ),
                          InfoContainer(
                            icon: Icons.public_outlined,
                            text: data.origin.orPlaceholder(),
                          ),
                        ],
                      ),
                      Text(data.description.orPlaceholder()),
                      if (data.image?.id != null)
                        VotingContainer(
                          key: const ValueKey("voting_container"),
                          imageId: data.image!.id!,
                        ),
                      SizedBox(
                        width: .infinity,
                        child: OutlinedButton.icon(
                          key: const ValueKey("wikipedia_button"),
                          onPressed: data.wikipediaUrl != null
                              ? () async {
                                  final canLaunch = await canLaunchUrlString(
                                    data.wikipediaUrl!,
                                  );
                                  if (!canLaunch) {
                                    return;
                                  }
                                  launchUrlString(data.wikipediaUrl!);
                                }
                              : null,
                          label: Text("Wikipedia"),
                          icon: const Icon(Icons.open_in_new_outlined),
                          iconAlignment: .end,
                        ),
                      ),
                      Text(
                        "Eigenschaften",
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Column(
                        spacing: 24,
                        children: [
                          BreedAttributeIndicator(
                            label: "Anpassungsfähigkeit",
                            value: data.adaptability ?? 0,
                            icon: Icons.tune_outlined,
                          ),
                          BreedAttributeIndicator(
                            label: "Zuneigung",
                            value: data.affectionLevel ?? 0,
                            icon: Icons.favorite_border_outlined,
                          ),
                          BreedAttributeIndicator(
                            label: "Kinderfreundlich",
                            value: data.childFriendly ?? 0,
                            icon: Icons.child_care_outlined,
                          ),
                          BreedAttributeIndicator(
                            label: "Hundefreundlich",
                            value: data.dogFriendly ?? 0,
                            icon: Icons.pets_outlined,
                          ),
                          BreedAttributeIndicator(
                            label: "Energielevel",
                            value: data.energyLevel ?? 0,
                            icon: Icons.bolt_outlined,
                          ),
                          BreedAttributeIndicator(
                            label: "Pflegeaufwand",
                            value: data.grooming ?? 0,
                            icon: Icons.content_cut_outlined,
                          ),

                          BreedAttributeIndicator(
                            label: "Gesundheitsrisiken",
                            value: data.healthIssues ?? 0,
                            icon: Icons.health_and_safety_outlined,
                          ),
                          BreedAttributeIndicator(
                            label: "Intelligenz",
                            value: data.intelligence ?? 0,
                            icon: Icons.psychology_outlined,
                          ),
                          BreedAttributeIndicator(
                            label: "Haarausfall",
                            value: data.sheddingLevel ?? 0,
                            icon: Icons.air_outlined,
                          ),
                          BreedAttributeIndicator(
                            label: "Sozialbedürfnis",
                            value: data.socialNeeds ?? 0,
                            icon: Icons.groups_2_outlined,
                          ),
                          BreedAttributeIndicator(
                            label: "Fremdenfreundlich",
                            value: data.strangerFriendly ?? 0,
                            icon: Icons.handshake_outlined,
                          ),
                          BreedAttributeIndicator(
                            label: "Lautstärke",
                            value: data.vocalisation ?? 0,
                            icon: Icons.volume_up_outlined,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            loading: () => SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stackTrace) => SliverFillRemaining(
              child: Center(child: Text(error.toString())),
            ),
          ),
        ],
      ),
    );
  }
}
