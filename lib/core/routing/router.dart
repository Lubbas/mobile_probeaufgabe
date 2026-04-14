import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/core/routing/app_paths.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/widgets/details/breed_detail_screen.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/widgets/image_search/image_search_screen.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/presentation/widgets/list/breed_list_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppPaths.breeds,
    routes: [
      GoRoute(
        path: AppPaths.breeds,
        builder: (context, state) => const BreedListScreen(),
        routes: [
          GoRoute(
            path: AppPaths.breedDetail,
            redirect: (context, state) {
              if (state.pathParameters[AppPaths.breedIdKey] == null) {
                return AppPaths.breeds;
              }
              return null;
            },
            builder: (context, state) => BreedDetailScreen(
              breedId: state.pathParameters[AppPaths.breedIdKey]!,
            ),
            routes: [
              GoRoute(
                path: AppPaths.imageSearch,
                redirect: (context, state) {
                  if (state.pathParameters[AppPaths.breedIdKey] == null) {
                    return AppPaths.breeds;
                  }
                  return null;
                },
                builder: (context, state) => ImageSearchScreen(
                  breedId: state.pathParameters[AppPaths.breedIdKey]!,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
