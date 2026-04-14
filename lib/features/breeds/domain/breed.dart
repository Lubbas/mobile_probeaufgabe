import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/cat_image.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/weight.dart';

part 'breed.freezed.dart';
part 'breed.g.dart';

@freezed
sealed class Breed with _$Breed {
  const factory Breed({
    final Weight? weight,
    final String? id,
    final String? name,
    @JsonKey(name: "cfa_url") final String? cfaUrl,
    @JsonKey(name: "vetstreet_url") final String? vetstreetUrl,
    @JsonKey(name: "vcahospitals_url") final String? vcahospitalsUrl,
    final String? temperament,
    final String? origin,
    @JsonKey(name: "country_codes") final String? countryCodes,
    @JsonKey(name: "country_code") final String? countryCode,
    final String? description,
    @JsonKey(name: "life_span") final String? lifeSpan,
    final int? indoor,
    final int? lap,
    @JsonKey(name: "alt_names") final String? altNames,
    final int? adaptability,
    @JsonKey(name: "affection_level") final int? affectionLevel,
    @JsonKey(name: "child_friendly") final int? childFriendly,
    @JsonKey(name: "dog_friendly") final int? dogFriendly,
    @JsonKey(name: "energy_level") final int? energyLevel,
    final int? grooming,
    @JsonKey(name: "health_issues") final int? healthIssues,
    final int? intelligence,
    @JsonKey(name: "shedding_level") final int? sheddingLevel,
    @JsonKey(name: "social_needs") final int? socialNeeds,
    @JsonKey(name: "stranger_friendly") final int? strangerFriendly,
    final int? vocalisation,
    final int? experimental,
    final int? hairless,
    final int? natural,
    final int? rare,
    final int? rex,
    @JsonKey(name: "suppressed_tail") final int? suppressedTail,
    @JsonKey(name: "short_legs") final int? shortLegs,
    @JsonKey(name: "wikipedia_url") final String? wikipediaUrl,
    final int? hypoallergenic,
    @JsonKey(name: "reference_image_id") final String? referenceImageId,
    final CatImage? image,
  }) = _Breed;

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);
}

extension BreedExtension on Breed {
  String get formattedWeight {
    final metricData = weight?.metric;
    return "$metricData kg";
  }

  String get formattedLifeSpan {
    final years = lifeSpan?.split(" ")[0];
    return "$years Jahre";
  }
}
