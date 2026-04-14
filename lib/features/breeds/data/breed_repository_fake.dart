import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/data/breed_repository.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/breed.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/cat_image.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/vote.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/weight.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/shared/exceptions/not_found_exception.dart';

class BreedRepositoryFake implements BreedRepository {
  final bool hasImage;
  final bool hasReferenceImage;
  final Duration delay;
  final bool shouldThrowError;

  BreedRepositoryFake({
    this.hasImage = true,
    this.hasReferenceImage = true,
    this.delay = const Duration(seconds: 2),
    this.shouldThrowError = false,
  });

  @override
  Future<List<Breed>> getBreeds() async {
    await Future.delayed(delay);
    if (shouldThrowError) {
      throw Exception("Fehler beim Laden der Rassen");
    }
    return _breeds;
  }

  @override
  Future<Breed> getBreed(String id) async {
    await Future.delayed(delay);
    if (shouldThrowError) {
      throw BreedNotFoundException(id);
    }
    final breedData = _breeds.firstWhere(
      (breed) => breed.id == id,
      orElse: () => throw BreedNotFoundException(id),
    );

    if (!hasImage) {
      if (hasReferenceImage && breedData.referenceImageId != null) {
        final fakeImage = CatImage(
          id: breedData.referenceImageId!,
          width: 1200,
          height: 800,
          url: "https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg",
        );
        return breedData.copyWith(image: fakeImage);
      } else {
        return breedData.copyWith(image: null);
      }
    }
    return breedData;
  }

  @override
  Future<bool> voteImage(Vote vote) async {
    await Future.delayed(delay);
    if (shouldThrowError) {
      throw Exception("Fehler beim Voting aufgetreten");
    }
    if (vote.value == null) {
      throw ArgumentError('Vote must not be null');
    }
    if (vote.value! > 1 || vote.value! < -1) {
      throw ArgumentError('Vote must be either 1 (upvote) or -1 (downvote)');
    }

    return true;
  }

  @override
  Future<Vote?> getCatImageVote({
    required String imageId,
    String? subId,
  }) async {
    await Future.delayed(delay);
    return votes.where((element) => element.imageId == imageId).lastOrNull;
  }

  @override
  Future<List<CatImage>> searchImages(String breedId) async {
    await Future.delayed(delay);
    return _breeds
        .where((element) => element.id == breedId)
        .map((e) => e.image!)
        .toList();
  }

  /// [_breeds] for testing
  ///
  List<Breed> get _breeds =>
      [
            Breed(
              weight: Weight(imperial: "7  -  10", metric: "3 - 5"),
              id: "abys",
              name: "Abyssinian",
              cfaUrl: "http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx",
              vetstreetUrl: "http://www.vetstreet.com/cats/abyssinian",
              vcahospitalsUrl:
                  "https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian",
              temperament:
                  "Active, Energetic, Independent, Intelligent, Gentle",
              origin: "Egypt",
              countryCodes: "EG",
              countryCode: "EG",
              description:
                  "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
              lifeSpan: "14 - 15",
              indoor: 0,
              lap: 1,
              altNames: "",
              adaptability: 5,
              affectionLevel: 5,
              childFriendly: 3,
              dogFriendly: 4,
              energyLevel: 5,
              grooming: 1,
              healthIssues: 2,
              intelligence: 5,
              sheddingLevel: 2,
              socialNeeds: 5,
              strangerFriendly: 5,
              vocalisation: 1,
              experimental: 0,
              hairless: 0,
              natural: 1,
              rare: 0,
              rex: 0,
              suppressedTail: 0,
              shortLegs: 0,
              hypoallergenic: 0,
              referenceImageId: "0XYvRd7oD",
              image: CatImage(
                id: "0XYvRd7oD",
                width: 1204,
                height: 1445,
                url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
              ),
            ),
            Breed(
              weight: Weight(imperial: "7 - 10", metric: "3 - 5"),
              id: "aege",
              name: "Aegean",
              vetstreetUrl: "http://www.vetstreet.com/cats/aegean-cat",
              temperament: "Affectionate, Social, Intelligent, Playful, Active",
              origin: "Greece",
              countryCodes: "GR",
              countryCode: "GR",
              description:
                  "Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children.",
              lifeSpan: "9 - 12",
              indoor: 0,
              altNames: "",
              adaptability: 5,
              affectionLevel: 4,
              childFriendly: 4,
              dogFriendly: 4,
              energyLevel: 3,
              grooming: 3,
              healthIssues: 1,
              intelligence: 3,
              sheddingLevel: 3,
              socialNeeds: 4,
              strangerFriendly: 4,
              vocalisation: 3,
              experimental: 0,
              hairless: 0,
              natural: 0,
              rare: 0,
              rex: 0,
              suppressedTail: 0,
              shortLegs: 0,
              wikipediaUrl: "https://en.wikipedia.org/wiki/Aegean_cat",
              hypoallergenic: 0,
              referenceImageId: "ozEvzdVM-",
              image: CatImage(
                id: "ozEvzdVM-",
                width: 1200,
                height: 800,
                url: "https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg",
              ),
            ),
          ]
          .map(
            (e) => e.copyWith(
              image: hasImage ? e.image : null,
              referenceImageId: hasReferenceImage ? e.referenceImageId : null,
            ),
          )
          .toList();

  List<Vote> votes = [
    Vote(imageId: "0XYvRd7oD", value: 1),
    Vote(imageId: "ozEvzdVM", value: -1),
  ];
}
