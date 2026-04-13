// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breed_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BreedImage {

 String? get id; int? get width; int? get height; String? get url;
/// Create a copy of BreedImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreedImageCopyWith<BreedImage> get copyWith => _$BreedImageCopyWithImpl<BreedImage>(this as BreedImage, _$identity);

  /// Serializes this BreedImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreedImage&&(identical(other.id, id) || other.id == id)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,width,height,url);

@override
String toString() {
  return 'BreedImage(id: $id, width: $width, height: $height, url: $url)';
}


}

/// @nodoc
abstract mixin class $BreedImageCopyWith<$Res>  {
  factory $BreedImageCopyWith(BreedImage value, $Res Function(BreedImage) _then) = _$BreedImageCopyWithImpl;
@useResult
$Res call({
 String? id, int? width, int? height, String? url
});




}
/// @nodoc
class _$BreedImageCopyWithImpl<$Res>
    implements $BreedImageCopyWith<$Res> {
  _$BreedImageCopyWithImpl(this._self, this._then);

  final BreedImage _self;
  final $Res Function(BreedImage) _then;

/// Create a copy of BreedImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? width = freezed,Object? height = freezed,Object? url = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BreedImage].
extension BreedImagePatterns on BreedImage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BreedImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BreedImage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BreedImage value)  $default,){
final _that = this;
switch (_that) {
case _BreedImage():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BreedImage value)?  $default,){
final _that = this;
switch (_that) {
case _BreedImage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  int? width,  int? height,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BreedImage() when $default != null:
return $default(_that.id,_that.width,_that.height,_that.url);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  int? width,  int? height,  String? url)  $default,) {final _that = this;
switch (_that) {
case _BreedImage():
return $default(_that.id,_that.width,_that.height,_that.url);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  int? width,  int? height,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _BreedImage() when $default != null:
return $default(_that.id,_that.width,_that.height,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BreedImage implements BreedImage {
  const _BreedImage({this.id, this.width, this.height, this.url});
  factory _BreedImage.fromJson(Map<String, dynamic> json) => _$BreedImageFromJson(json);

@override final  String? id;
@override final  int? width;
@override final  int? height;
@override final  String? url;

/// Create a copy of BreedImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BreedImageCopyWith<_BreedImage> get copyWith => __$BreedImageCopyWithImpl<_BreedImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BreedImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BreedImage&&(identical(other.id, id) || other.id == id)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,width,height,url);

@override
String toString() {
  return 'BreedImage(id: $id, width: $width, height: $height, url: $url)';
}


}

/// @nodoc
abstract mixin class _$BreedImageCopyWith<$Res> implements $BreedImageCopyWith<$Res> {
  factory _$BreedImageCopyWith(_BreedImage value, $Res Function(_BreedImage) _then) = __$BreedImageCopyWithImpl;
@override @useResult
$Res call({
 String? id, int? width, int? height, String? url
});




}
/// @nodoc
class __$BreedImageCopyWithImpl<$Res>
    implements _$BreedImageCopyWith<$Res> {
  __$BreedImageCopyWithImpl(this._self, this._then);

  final _BreedImage _self;
  final $Res Function(_BreedImage) _then;

/// Create a copy of BreedImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? width = freezed,Object? height = freezed,Object? url = freezed,}) {
  return _then(_BreedImage(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
