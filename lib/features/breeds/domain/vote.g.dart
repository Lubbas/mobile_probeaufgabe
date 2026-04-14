// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Vote _$VoteFromJson(Map<String, dynamic> json) => _Vote(
  imageId: json['image_id'] as String,
  value: (json['value'] as num?)?.toInt(),
  subId: json['sub_id'] as String?,
);

Map<String, dynamic> _$VoteToJson(_Vote instance) => <String, dynamic>{
  'image_id': instance.imageId,
  'value': instance.value,
  'sub_id': instance.subId,
};
