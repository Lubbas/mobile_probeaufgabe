import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/core/routing/app_paths.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/breed.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/util/extensions/string_extension.dart';

class BreedListCard extends StatelessWidget {
  const BreedListCard({super.key, required this.breed});
  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.go("${AppPaths.breeds}/${breed.id}"),
      leading: CircleAvatar(
        backgroundImage: breed.image?.url != null
            ? NetworkImage(breed.image!.url!)
            : null,
        radius: 24,
      ),
      title: Text(
        breed.name.orPlaceholder(),
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        breed.description.orPlaceholder(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      // isThreeLine: true,
    );
  }
}
