// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BreedImage _$BreedImageFromJson(Map<String, dynamic> json) => _BreedImage(
  id: json['id'] as String?,
  width: (json['width'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  url: json['url'] as String?,
);

Map<String, dynamic> _$BreedImageToJson(_BreedImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
