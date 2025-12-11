// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WalletEntity {

 String get address; String get mnemonic; bool get isImported; DateTime? get createdAt;
/// Create a copy of WalletEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletEntityCopyWith<WalletEntity> get copyWith => _$WalletEntityCopyWithImpl<WalletEntity>(this as WalletEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletEntity&&(identical(other.address, address) || other.address == address)&&(identical(other.mnemonic, mnemonic) || other.mnemonic == mnemonic)&&(identical(other.isImported, isImported) || other.isImported == isImported)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,address,mnemonic,isImported,createdAt);

@override
String toString() {
  return 'WalletEntity(address: $address, mnemonic: $mnemonic, isImported: $isImported, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $WalletEntityCopyWith<$Res>  {
  factory $WalletEntityCopyWith(WalletEntity value, $Res Function(WalletEntity) _then) = _$WalletEntityCopyWithImpl;
@useResult
$Res call({
 String address, String mnemonic, bool isImported, DateTime? createdAt
});




}
/// @nodoc
class _$WalletEntityCopyWithImpl<$Res>
    implements $WalletEntityCopyWith<$Res> {
  _$WalletEntityCopyWithImpl(this._self, this._then);

  final WalletEntity _self;
  final $Res Function(WalletEntity) _then;

/// Create a copy of WalletEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? mnemonic = null,Object? isImported = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,mnemonic: null == mnemonic ? _self.mnemonic : mnemonic // ignore: cast_nullable_to_non_nullable
as String,isImported: null == isImported ? _self.isImported : isImported // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletEntity].
extension WalletEntityPatterns on WalletEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletEntity value)  $default,){
final _that = this;
switch (_that) {
case _WalletEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WalletEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  String mnemonic,  bool isImported,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletEntity() when $default != null:
return $default(_that.address,_that.mnemonic,_that.isImported,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  String mnemonic,  bool isImported,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _WalletEntity():
return $default(_that.address,_that.mnemonic,_that.isImported,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  String mnemonic,  bool isImported,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _WalletEntity() when $default != null:
return $default(_that.address,_that.mnemonic,_that.isImported,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _WalletEntity extends WalletEntity {
  const _WalletEntity({required this.address, required this.mnemonic, this.isImported = false, this.createdAt}): super._();
  

@override final  String address;
@override final  String mnemonic;
@override@JsonKey() final  bool isImported;
@override final  DateTime? createdAt;

/// Create a copy of WalletEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletEntityCopyWith<_WalletEntity> get copyWith => __$WalletEntityCopyWithImpl<_WalletEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletEntity&&(identical(other.address, address) || other.address == address)&&(identical(other.mnemonic, mnemonic) || other.mnemonic == mnemonic)&&(identical(other.isImported, isImported) || other.isImported == isImported)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,address,mnemonic,isImported,createdAt);

@override
String toString() {
  return 'WalletEntity(address: $address, mnemonic: $mnemonic, isImported: $isImported, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$WalletEntityCopyWith<$Res> implements $WalletEntityCopyWith<$Res> {
  factory _$WalletEntityCopyWith(_WalletEntity value, $Res Function(_WalletEntity) _then) = __$WalletEntityCopyWithImpl;
@override @useResult
$Res call({
 String address, String mnemonic, bool isImported, DateTime? createdAt
});




}
/// @nodoc
class __$WalletEntityCopyWithImpl<$Res>
    implements _$WalletEntityCopyWith<$Res> {
  __$WalletEntityCopyWithImpl(this._self, this._then);

  final _WalletEntity _self;
  final $Res Function(_WalletEntity) _then;

/// Create a copy of WalletEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? mnemonic = null,Object? isImported = null,Object? createdAt = freezed,}) {
  return _then(_WalletEntity(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,mnemonic: null == mnemonic ? _self.mnemonic : mnemonic // ignore: cast_nullable_to_non_nullable
as String,isImported: null == isImported ? _self.isImported : isImported // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
