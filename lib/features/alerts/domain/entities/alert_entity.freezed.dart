// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PriceAlert {

 String get id; String get tokenId; String get tokenName; String get tokenSymbol; double get targetPrice; double get currentPriceAtCreation; AlertCondition get condition; DateTime get createdAt; bool get isActive; DateTime? get triggeredAt;
/// Create a copy of PriceAlert
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PriceAlertCopyWith<PriceAlert> get copyWith => _$PriceAlertCopyWithImpl<PriceAlert>(this as PriceAlert, _$identity);

  /// Serializes this PriceAlert to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PriceAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenName, tokenName) || other.tokenName == tokenName)&&(identical(other.tokenSymbol, tokenSymbol) || other.tokenSymbol == tokenSymbol)&&(identical(other.targetPrice, targetPrice) || other.targetPrice == targetPrice)&&(identical(other.currentPriceAtCreation, currentPriceAtCreation) || other.currentPriceAtCreation == currentPriceAtCreation)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tokenId,tokenName,tokenSymbol,targetPrice,currentPriceAtCreation,condition,createdAt,isActive,triggeredAt);

@override
String toString() {
  return 'PriceAlert(id: $id, tokenId: $tokenId, tokenName: $tokenName, tokenSymbol: $tokenSymbol, targetPrice: $targetPrice, currentPriceAtCreation: $currentPriceAtCreation, condition: $condition, createdAt: $createdAt, isActive: $isActive, triggeredAt: $triggeredAt)';
}


}

/// @nodoc
abstract mixin class $PriceAlertCopyWith<$Res>  {
  factory $PriceAlertCopyWith(PriceAlert value, $Res Function(PriceAlert) _then) = _$PriceAlertCopyWithImpl;
@useResult
$Res call({
 String id, String tokenId, String tokenName, String tokenSymbol, double targetPrice, double currentPriceAtCreation, AlertCondition condition, DateTime createdAt, bool isActive, DateTime? triggeredAt
});




}
/// @nodoc
class _$PriceAlertCopyWithImpl<$Res>
    implements $PriceAlertCopyWith<$Res> {
  _$PriceAlertCopyWithImpl(this._self, this._then);

  final PriceAlert _self;
  final $Res Function(PriceAlert) _then;

/// Create a copy of PriceAlert
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tokenId = null,Object? tokenName = null,Object? tokenSymbol = null,Object? targetPrice = null,Object? currentPriceAtCreation = null,Object? condition = null,Object? createdAt = null,Object? isActive = null,Object? triggeredAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenName: null == tokenName ? _self.tokenName : tokenName // ignore: cast_nullable_to_non_nullable
as String,tokenSymbol: null == tokenSymbol ? _self.tokenSymbol : tokenSymbol // ignore: cast_nullable_to_non_nullable
as String,targetPrice: null == targetPrice ? _self.targetPrice : targetPrice // ignore: cast_nullable_to_non_nullable
as double,currentPriceAtCreation: null == currentPriceAtCreation ? _self.currentPriceAtCreation : currentPriceAtCreation // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as AlertCondition,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,triggeredAt: freezed == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PriceAlert].
extension PriceAlertPatterns on PriceAlert {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PriceAlert value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PriceAlert() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PriceAlert value)  $default,){
final _that = this;
switch (_that) {
case _PriceAlert():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PriceAlert value)?  $default,){
final _that = this;
switch (_that) {
case _PriceAlert() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tokenId,  String tokenName,  String tokenSymbol,  double targetPrice,  double currentPriceAtCreation,  AlertCondition condition,  DateTime createdAt,  bool isActive,  DateTime? triggeredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PriceAlert() when $default != null:
return $default(_that.id,_that.tokenId,_that.tokenName,_that.tokenSymbol,_that.targetPrice,_that.currentPriceAtCreation,_that.condition,_that.createdAt,_that.isActive,_that.triggeredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tokenId,  String tokenName,  String tokenSymbol,  double targetPrice,  double currentPriceAtCreation,  AlertCondition condition,  DateTime createdAt,  bool isActive,  DateTime? triggeredAt)  $default,) {final _that = this;
switch (_that) {
case _PriceAlert():
return $default(_that.id,_that.tokenId,_that.tokenName,_that.tokenSymbol,_that.targetPrice,_that.currentPriceAtCreation,_that.condition,_that.createdAt,_that.isActive,_that.triggeredAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tokenId,  String tokenName,  String tokenSymbol,  double targetPrice,  double currentPriceAtCreation,  AlertCondition condition,  DateTime createdAt,  bool isActive,  DateTime? triggeredAt)?  $default,) {final _that = this;
switch (_that) {
case _PriceAlert() when $default != null:
return $default(_that.id,_that.tokenId,_that.tokenName,_that.tokenSymbol,_that.targetPrice,_that.currentPriceAtCreation,_that.condition,_that.createdAt,_that.isActive,_that.triggeredAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PriceAlert extends PriceAlert {
  const _PriceAlert({required this.id, required this.tokenId, required this.tokenName, required this.tokenSymbol, required this.targetPrice, required this.currentPriceAtCreation, required this.condition, required this.createdAt, this.isActive = true, this.triggeredAt}): super._();
  factory _PriceAlert.fromJson(Map<String, dynamic> json) => _$PriceAlertFromJson(json);

@override final  String id;
@override final  String tokenId;
@override final  String tokenName;
@override final  String tokenSymbol;
@override final  double targetPrice;
@override final  double currentPriceAtCreation;
@override final  AlertCondition condition;
@override final  DateTime createdAt;
@override@JsonKey() final  bool isActive;
@override final  DateTime? triggeredAt;

/// Create a copy of PriceAlert
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PriceAlertCopyWith<_PriceAlert> get copyWith => __$PriceAlertCopyWithImpl<_PriceAlert>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PriceAlertToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PriceAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenName, tokenName) || other.tokenName == tokenName)&&(identical(other.tokenSymbol, tokenSymbol) || other.tokenSymbol == tokenSymbol)&&(identical(other.targetPrice, targetPrice) || other.targetPrice == targetPrice)&&(identical(other.currentPriceAtCreation, currentPriceAtCreation) || other.currentPriceAtCreation == currentPriceAtCreation)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tokenId,tokenName,tokenSymbol,targetPrice,currentPriceAtCreation,condition,createdAt,isActive,triggeredAt);

@override
String toString() {
  return 'PriceAlert(id: $id, tokenId: $tokenId, tokenName: $tokenName, tokenSymbol: $tokenSymbol, targetPrice: $targetPrice, currentPriceAtCreation: $currentPriceAtCreation, condition: $condition, createdAt: $createdAt, isActive: $isActive, triggeredAt: $triggeredAt)';
}


}

/// @nodoc
abstract mixin class _$PriceAlertCopyWith<$Res> implements $PriceAlertCopyWith<$Res> {
  factory _$PriceAlertCopyWith(_PriceAlert value, $Res Function(_PriceAlert) _then) = __$PriceAlertCopyWithImpl;
@override @useResult
$Res call({
 String id, String tokenId, String tokenName, String tokenSymbol, double targetPrice, double currentPriceAtCreation, AlertCondition condition, DateTime createdAt, bool isActive, DateTime? triggeredAt
});




}
/// @nodoc
class __$PriceAlertCopyWithImpl<$Res>
    implements _$PriceAlertCopyWith<$Res> {
  __$PriceAlertCopyWithImpl(this._self, this._then);

  final _PriceAlert _self;
  final $Res Function(_PriceAlert) _then;

/// Create a copy of PriceAlert
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tokenId = null,Object? tokenName = null,Object? tokenSymbol = null,Object? targetPrice = null,Object? currentPriceAtCreation = null,Object? condition = null,Object? createdAt = null,Object? isActive = null,Object? triggeredAt = freezed,}) {
  return _then(_PriceAlert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenName: null == tokenName ? _self.tokenName : tokenName // ignore: cast_nullable_to_non_nullable
as String,tokenSymbol: null == tokenSymbol ? _self.tokenSymbol : tokenSymbol // ignore: cast_nullable_to_non_nullable
as String,targetPrice: null == targetPrice ? _self.targetPrice : targetPrice // ignore: cast_nullable_to_non_nullable
as double,currentPriceAtCreation: null == currentPriceAtCreation ? _self.currentPriceAtCreation : currentPriceAtCreation // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as AlertCondition,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,triggeredAt: freezed == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
