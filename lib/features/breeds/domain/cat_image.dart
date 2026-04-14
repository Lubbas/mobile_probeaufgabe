import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_image.freezed.dart';
part 'cat_image.g.dart';

@freezed
sealed class CatImage with _$CatImage {
  const factory CatImage({
    final String? id,
    final int? width,
    final int? height,
    final String? url,
  }) = _CatImage;

  factory CatImage.fromJson(Map<String, dynamic> json) =>
      _$CatImageFromJson(json);
}
