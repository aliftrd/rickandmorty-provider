// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedResponseModel<T> {

 PaginationInfoModel get info; List<T> get results;
/// Create a copy of PaginatedResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedResponseModelCopyWith<T, PaginatedResponseModel<T>> get copyWith => _$PaginatedResponseModelCopyWithImpl<T, PaginatedResponseModel<T>>(this as PaginatedResponseModel<T>, _$identity);

  /// Serializes this PaginatedResponseModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedResponseModel<T>&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PaginatedResponseModel<$T>(info: $info, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedResponseModelCopyWith<T,$Res>  {
  factory $PaginatedResponseModelCopyWith(PaginatedResponseModel<T> value, $Res Function(PaginatedResponseModel<T>) _then) = _$PaginatedResponseModelCopyWithImpl;
@useResult
$Res call({
 PaginationInfoModel info, List<T> results
});


$PaginationInfoModelCopyWith<$Res> get info;

}
/// @nodoc
class _$PaginatedResponseModelCopyWithImpl<T,$Res>
    implements $PaginatedResponseModelCopyWith<T, $Res> {
  _$PaginatedResponseModelCopyWithImpl(this._self, this._then);

  final PaginatedResponseModel<T> _self;
  final $Res Function(PaginatedResponseModel<T>) _then;

/// Create a copy of PaginatedResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? info = null,Object? results = null,}) {
  return _then(_self.copyWith(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as PaginationInfoModel,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}
/// Create a copy of PaginatedResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationInfoModelCopyWith<$Res> get info {
  
  return $PaginationInfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaginatedResponseModel].
extension PaginatedResponseModelPatterns<T> on PaginatedResponseModel<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedResponseModel<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedResponseModel<T> value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedResponseModel<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaginationInfoModel info,  List<T> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedResponseModel() when $default != null:
return $default(_that.info,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaginationInfoModel info,  List<T> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedResponseModel():
return $default(_that.info,_that.results);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaginationInfoModel info,  List<T> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedResponseModel() when $default != null:
return $default(_that.info,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _PaginatedResponseModel<T> implements PaginatedResponseModel<T> {
  const _PaginatedResponseModel({required this.info, required final  List<T> results}): _results = results;
  factory _PaginatedResponseModel.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PaginatedResponseModelFromJson(json,fromJsonT);

@override final  PaginationInfoModel info;
 final  List<T> _results;
@override List<T> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedResponseModelCopyWith<T, _PaginatedResponseModel<T>> get copyWith => __$PaginatedResponseModelCopyWithImpl<T, _PaginatedResponseModel<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PaginatedResponseModelToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedResponseModel<T>&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PaginatedResponseModel<$T>(info: $info, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedResponseModelCopyWith<T,$Res> implements $PaginatedResponseModelCopyWith<T, $Res> {
  factory _$PaginatedResponseModelCopyWith(_PaginatedResponseModel<T> value, $Res Function(_PaginatedResponseModel<T>) _then) = __$PaginatedResponseModelCopyWithImpl;
@override @useResult
$Res call({
 PaginationInfoModel info, List<T> results
});


@override $PaginationInfoModelCopyWith<$Res> get info;

}
/// @nodoc
class __$PaginatedResponseModelCopyWithImpl<T,$Res>
    implements _$PaginatedResponseModelCopyWith<T, $Res> {
  __$PaginatedResponseModelCopyWithImpl(this._self, this._then);

  final _PaginatedResponseModel<T> _self;
  final $Res Function(_PaginatedResponseModel<T>) _then;

/// Create a copy of PaginatedResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? info = null,Object? results = null,}) {
  return _then(_PaginatedResponseModel<T>(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as PaginationInfoModel,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}

/// Create a copy of PaginatedResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationInfoModelCopyWith<$Res> get info {
  
  return $PaginationInfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

// dart format on
