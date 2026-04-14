import 'package:freezed_annotation/freezed_annotation.dart';

part 'vote.freezed.dart';
part 'vote.g.dart';

@freezed
sealed class Vote with _$Vote {
  const factory Vote({
    @JsonKey(name: "image_id") required final String imageId,
    final int? value,
    @JsonKey(name: "sub_id") final String? subId,
  }) = _Vote;

  factory Vote.fromJson(Map<String, dynamic> json) => _$VoteFromJson(json);
}
