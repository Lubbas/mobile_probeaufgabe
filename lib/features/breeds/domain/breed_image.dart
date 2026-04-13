import 'package:freezed_annotation/freezed_annotation.dart';

part 'breed_image.freezed.dart';
part 'breed_image.g.dart';

@freezed
sealed class BreedImage with _$BreedImage {
  const factory BreedImage({
    final String? id,
    final int? width,
    final int? height,
    final String? url,
  }) = _BreedImage;

  factory BreedImage.fromJson(Map<String, dynamic> json) =>
      _$BreedImageFromJson(json);
}
