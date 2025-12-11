// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'swap_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SwapToken {

 String get id; String get symbol; String get name; String? get image; double get balance; double get priceUsd;
/// Create a copy of SwapToken
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<SwapToken> get copyWith => _$SwapTokenCopyWithImpl<SwapToken>(this as SwapToken, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwapToken&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.priceUsd, priceUsd) || other.priceUsd == priceUsd));
}


@override
int get hashCode => Object.hash(runtimeType,id,symbol,name,image,balance,priceUsd);

@override
String toString() {
  return 'SwapToken(id: $id, symbol: $symbol, name: $name, image: $image, balance: $balance, priceUsd: $priceUsd)';
}


}

/// @nodoc
abstract mixin class $SwapTokenCopyWith<$Res>  {
  factory $SwapTokenCopyWith(SwapToken value, $Res Function(SwapToken) _then) = _$SwapTokenCopyWithImpl;
@useResult
$Res call({
 String id, String symbol, String name, String? image, double balance, double priceUsd
});




}
/// @nodoc
class _$SwapTokenCopyWithImpl<$Res>
    implements $SwapTokenCopyWith<$Res> {
  _$SwapTokenCopyWithImpl(this._self, this._then);

  final SwapToken _self;
  final $Res Function(SwapToken) _then;

/// Create a copy of SwapToken
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? image = freezed,Object? balance = null,Object? priceUsd = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,priceUsd: null == priceUsd ? _self.priceUsd : priceUsd // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SwapToken].
extension SwapTokenPatterns on SwapToken {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SwapToken value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SwapToken() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SwapToken value)  $default,){
final _that = this;
switch (_that) {
case _SwapToken():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SwapToken value)?  $default,){
final _that = this;
switch (_that) {
case _SwapToken() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String symbol,  String name,  String? image,  double balance,  double priceUsd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SwapToken() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.balance,_that.priceUsd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String symbol,  String name,  String? image,  double balance,  double priceUsd)  $default,) {final _that = this;
switch (_that) {
case _SwapToken():
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.balance,_that.priceUsd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String symbol,  String name,  String? image,  double balance,  double priceUsd)?  $default,) {final _that = this;
switch (_that) {
case _SwapToken() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.balance,_that.priceUsd);case _:
  return null;

}
}

}

/// @nodoc


class _SwapToken extends SwapToken {
  const _SwapToken({required this.id, required this.symbol, required this.name, this.image, required this.balance, required this.priceUsd}): super._();
  

@override final  String id;
@override final  String symbol;
@override final  String name;
@override final  String? image;
@override final  double balance;
@override final  double priceUsd;

/// Create a copy of SwapToken
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SwapTokenCopyWith<_SwapToken> get copyWith => __$SwapTokenCopyWithImpl<_SwapToken>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SwapToken&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.priceUsd, priceUsd) || other.priceUsd == priceUsd));
}


@override
int get hashCode => Object.hash(runtimeType,id,symbol,name,image,balance,priceUsd);

@override
String toString() {
  return 'SwapToken(id: $id, symbol: $symbol, name: $name, image: $image, balance: $balance, priceUsd: $priceUsd)';
}


}

/// @nodoc
abstract mixin class _$SwapTokenCopyWith<$Res> implements $SwapTokenCopyWith<$Res> {
  factory _$SwapTokenCopyWith(_SwapToken value, $Res Function(_SwapToken) _then) = __$SwapTokenCopyWithImpl;
@override @useResult
$Res call({
 String id, String symbol, String name, String? image, double balance, double priceUsd
});




}
/// @nodoc
class __$SwapTokenCopyWithImpl<$Res>
    implements _$SwapTokenCopyWith<$Res> {
  __$SwapTokenCopyWithImpl(this._self, this._then);

  final _SwapToken _self;
  final $Res Function(_SwapToken) _then;

/// Create a copy of SwapToken
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? image = freezed,Object? balance = null,Object? priceUsd = null,}) {
  return _then(_SwapToken(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,priceUsd: null == priceUsd ? _self.priceUsd : priceUsd // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$SwapEntity {

 String get id; SwapToken get fromToken; SwapToken get toToken; double get fromAmount; double get toAmount; double get exchangeRate; double get fee; SwapStatus get status; DateTime get createdAt; DateTime? get completedAt; String? get txHash;
/// Create a copy of SwapEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwapEntityCopyWith<SwapEntity> get copyWith => _$SwapEntityCopyWithImpl<SwapEntity>(this as SwapEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwapEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.fromToken, fromToken) || other.fromToken == fromToken)&&(identical(other.toToken, toToken) || other.toToken == toToken)&&(identical(other.fromAmount, fromAmount) || other.fromAmount == fromAmount)&&(identical(other.toAmount, toAmount) || other.toAmount == toAmount)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.txHash, txHash) || other.txHash == txHash));
}


@override
int get hashCode => Object.hash(runtimeType,id,fromToken,toToken,fromAmount,toAmount,exchangeRate,fee,status,createdAt,completedAt,txHash);

@override
String toString() {
  return 'SwapEntity(id: $id, fromToken: $fromToken, toToken: $toToken, fromAmount: $fromAmount, toAmount: $toAmount, exchangeRate: $exchangeRate, fee: $fee, status: $status, createdAt: $createdAt, completedAt: $completedAt, txHash: $txHash)';
}


}

/// @nodoc
abstract mixin class $SwapEntityCopyWith<$Res>  {
  factory $SwapEntityCopyWith(SwapEntity value, $Res Function(SwapEntity) _then) = _$SwapEntityCopyWithImpl;
@useResult
$Res call({
 String id, SwapToken fromToken, SwapToken toToken, double fromAmount, double toAmount, double exchangeRate, double fee, SwapStatus status, DateTime createdAt, DateTime? completedAt, String? txHash
});


$SwapTokenCopyWith<$Res> get fromToken;$SwapTokenCopyWith<$Res> get toToken;

}
/// @nodoc
class _$SwapEntityCopyWithImpl<$Res>
    implements $SwapEntityCopyWith<$Res> {
  _$SwapEntityCopyWithImpl(this._self, this._then);

  final SwapEntity _self;
  final $Res Function(SwapEntity) _then;

/// Create a copy of SwapEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fromToken = null,Object? toToken = null,Object? fromAmount = null,Object? toAmount = null,Object? exchangeRate = null,Object? fee = null,Object? status = null,Object? createdAt = null,Object? completedAt = freezed,Object? txHash = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fromToken: null == fromToken ? _self.fromToken : fromToken // ignore: cast_nullable_to_non_nullable
as SwapToken,toToken: null == toToken ? _self.toToken : toToken // ignore: cast_nullable_to_non_nullable
as SwapToken,fromAmount: null == fromAmount ? _self.fromAmount : fromAmount // ignore: cast_nullable_to_non_nullable
as double,toAmount: null == toAmount ? _self.toAmount : toAmount // ignore: cast_nullable_to_non_nullable
as double,exchangeRate: null == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as double,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SwapStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,txHash: freezed == txHash ? _self.txHash : txHash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SwapEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<$Res> get fromToken {
  
  return $SwapTokenCopyWith<$Res>(_self.fromToken, (value) {
    return _then(_self.copyWith(fromToken: value));
  });
}/// Create a copy of SwapEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<$Res> get toToken {
  
  return $SwapTokenCopyWith<$Res>(_self.toToken, (value) {
    return _then(_self.copyWith(toToken: value));
  });
}
}


/// Adds pattern-matching-related methods to [SwapEntity].
extension SwapEntityPatterns on SwapEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SwapEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SwapEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SwapEntity value)  $default,){
final _that = this;
switch (_that) {
case _SwapEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SwapEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SwapEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  SwapToken fromToken,  SwapToken toToken,  double fromAmount,  double toAmount,  double exchangeRate,  double fee,  SwapStatus status,  DateTime createdAt,  DateTime? completedAt,  String? txHash)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SwapEntity() when $default != null:
return $default(_that.id,_that.fromToken,_that.toToken,_that.fromAmount,_that.toAmount,_that.exchangeRate,_that.fee,_that.status,_that.createdAt,_that.completedAt,_that.txHash);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  SwapToken fromToken,  SwapToken toToken,  double fromAmount,  double toAmount,  double exchangeRate,  double fee,  SwapStatus status,  DateTime createdAt,  DateTime? completedAt,  String? txHash)  $default,) {final _that = this;
switch (_that) {
case _SwapEntity():
return $default(_that.id,_that.fromToken,_that.toToken,_that.fromAmount,_that.toAmount,_that.exchangeRate,_that.fee,_that.status,_that.createdAt,_that.completedAt,_that.txHash);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  SwapToken fromToken,  SwapToken toToken,  double fromAmount,  double toAmount,  double exchangeRate,  double fee,  SwapStatus status,  DateTime createdAt,  DateTime? completedAt,  String? txHash)?  $default,) {final _that = this;
switch (_that) {
case _SwapEntity() when $default != null:
return $default(_that.id,_that.fromToken,_that.toToken,_that.fromAmount,_that.toAmount,_that.exchangeRate,_that.fee,_that.status,_that.createdAt,_that.completedAt,_that.txHash);case _:
  return null;

}
}

}

/// @nodoc


class _SwapEntity extends SwapEntity {
  const _SwapEntity({required this.id, required this.fromToken, required this.toToken, required this.fromAmount, required this.toAmount, required this.exchangeRate, required this.fee, required this.status, required this.createdAt, this.completedAt, this.txHash}): super._();
  

@override final  String id;
@override final  SwapToken fromToken;
@override final  SwapToken toToken;
@override final  double fromAmount;
@override final  double toAmount;
@override final  double exchangeRate;
@override final  double fee;
@override final  SwapStatus status;
@override final  DateTime createdAt;
@override final  DateTime? completedAt;
@override final  String? txHash;

/// Create a copy of SwapEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SwapEntityCopyWith<_SwapEntity> get copyWith => __$SwapEntityCopyWithImpl<_SwapEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SwapEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.fromToken, fromToken) || other.fromToken == fromToken)&&(identical(other.toToken, toToken) || other.toToken == toToken)&&(identical(other.fromAmount, fromAmount) || other.fromAmount == fromAmount)&&(identical(other.toAmount, toAmount) || other.toAmount == toAmount)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.txHash, txHash) || other.txHash == txHash));
}


@override
int get hashCode => Object.hash(runtimeType,id,fromToken,toToken,fromAmount,toAmount,exchangeRate,fee,status,createdAt,completedAt,txHash);

@override
String toString() {
  return 'SwapEntity(id: $id, fromToken: $fromToken, toToken: $toToken, fromAmount: $fromAmount, toAmount: $toAmount, exchangeRate: $exchangeRate, fee: $fee, status: $status, createdAt: $createdAt, completedAt: $completedAt, txHash: $txHash)';
}


}

/// @nodoc
abstract mixin class _$SwapEntityCopyWith<$Res> implements $SwapEntityCopyWith<$Res> {
  factory _$SwapEntityCopyWith(_SwapEntity value, $Res Function(_SwapEntity) _then) = __$SwapEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, SwapToken fromToken, SwapToken toToken, double fromAmount, double toAmount, double exchangeRate, double fee, SwapStatus status, DateTime createdAt, DateTime? completedAt, String? txHash
});


@override $SwapTokenCopyWith<$Res> get fromToken;@override $SwapTokenCopyWith<$Res> get toToken;

}
/// @nodoc
class __$SwapEntityCopyWithImpl<$Res>
    implements _$SwapEntityCopyWith<$Res> {
  __$SwapEntityCopyWithImpl(this._self, this._then);

  final _SwapEntity _self;
  final $Res Function(_SwapEntity) _then;

/// Create a copy of SwapEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fromToken = null,Object? toToken = null,Object? fromAmount = null,Object? toAmount = null,Object? exchangeRate = null,Object? fee = null,Object? status = null,Object? createdAt = null,Object? completedAt = freezed,Object? txHash = freezed,}) {
  return _then(_SwapEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fromToken: null == fromToken ? _self.fromToken : fromToken // ignore: cast_nullable_to_non_nullable
as SwapToken,toToken: null == toToken ? _self.toToken : toToken // ignore: cast_nullable_to_non_nullable
as SwapToken,fromAmount: null == fromAmount ? _self.fromAmount : fromAmount // ignore: cast_nullable_to_non_nullable
as double,toAmount: null == toAmount ? _self.toAmount : toAmount // ignore: cast_nullable_to_non_nullable
as double,exchangeRate: null == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as double,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SwapStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,txHash: freezed == txHash ? _self.txHash : txHash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SwapEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<$Res> get fromToken {
  
  return $SwapTokenCopyWith<$Res>(_self.fromToken, (value) {
    return _then(_self.copyWith(fromToken: value));
  });
}/// Create a copy of SwapEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<$Res> get toToken {
  
  return $SwapTokenCopyWith<$Res>(_self.toToken, (value) {
    return _then(_self.copyWith(toToken: value));
  });
}
}

/// @nodoc
mixin _$SwapQuote {

 SwapToken get fromToken; SwapToken get toToken; double get fromAmount; double get toAmount; double get exchangeRate; double get fee; double get priceImpact; double get minimumReceived; DateTime get expiresAt;
/// Create a copy of SwapQuote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwapQuoteCopyWith<SwapQuote> get copyWith => _$SwapQuoteCopyWithImpl<SwapQuote>(this as SwapQuote, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwapQuote&&(identical(other.fromToken, fromToken) || other.fromToken == fromToken)&&(identical(other.toToken, toToken) || other.toToken == toToken)&&(identical(other.fromAmount, fromAmount) || other.fromAmount == fromAmount)&&(identical(other.toAmount, toAmount) || other.toAmount == toAmount)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.priceImpact, priceImpact) || other.priceImpact == priceImpact)&&(identical(other.minimumReceived, minimumReceived) || other.minimumReceived == minimumReceived)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,fromToken,toToken,fromAmount,toAmount,exchangeRate,fee,priceImpact,minimumReceived,expiresAt);

@override
String toString() {
  return 'SwapQuote(fromToken: $fromToken, toToken: $toToken, fromAmount: $fromAmount, toAmount: $toAmount, exchangeRate: $exchangeRate, fee: $fee, priceImpact: $priceImpact, minimumReceived: $minimumReceived, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $SwapQuoteCopyWith<$Res>  {
  factory $SwapQuoteCopyWith(SwapQuote value, $Res Function(SwapQuote) _then) = _$SwapQuoteCopyWithImpl;
@useResult
$Res call({
 SwapToken fromToken, SwapToken toToken, double fromAmount, double toAmount, double exchangeRate, double fee, double priceImpact, double minimumReceived, DateTime expiresAt
});


$SwapTokenCopyWith<$Res> get fromToken;$SwapTokenCopyWith<$Res> get toToken;

}
/// @nodoc
class _$SwapQuoteCopyWithImpl<$Res>
    implements $SwapQuoteCopyWith<$Res> {
  _$SwapQuoteCopyWithImpl(this._self, this._then);

  final SwapQuote _self;
  final $Res Function(SwapQuote) _then;

/// Create a copy of SwapQuote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromToken = null,Object? toToken = null,Object? fromAmount = null,Object? toAmount = null,Object? exchangeRate = null,Object? fee = null,Object? priceImpact = null,Object? minimumReceived = null,Object? expiresAt = null,}) {
  return _then(_self.copyWith(
fromToken: null == fromToken ? _self.fromToken : fromToken // ignore: cast_nullable_to_non_nullable
as SwapToken,toToken: null == toToken ? _self.toToken : toToken // ignore: cast_nullable_to_non_nullable
as SwapToken,fromAmount: null == fromAmount ? _self.fromAmount : fromAmount // ignore: cast_nullable_to_non_nullable
as double,toAmount: null == toAmount ? _self.toAmount : toAmount // ignore: cast_nullable_to_non_nullable
as double,exchangeRate: null == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as double,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as double,priceImpact: null == priceImpact ? _self.priceImpact : priceImpact // ignore: cast_nullable_to_non_nullable
as double,minimumReceived: null == minimumReceived ? _self.minimumReceived : minimumReceived // ignore: cast_nullable_to_non_nullable
as double,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of SwapQuote
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<$Res> get fromToken {
  
  return $SwapTokenCopyWith<$Res>(_self.fromToken, (value) {
    return _then(_self.copyWith(fromToken: value));
  });
}/// Create a copy of SwapQuote
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<$Res> get toToken {
  
  return $SwapTokenCopyWith<$Res>(_self.toToken, (value) {
    return _then(_self.copyWith(toToken: value));
  });
}
}


/// Adds pattern-matching-related methods to [SwapQuote].
extension SwapQuotePatterns on SwapQuote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SwapQuote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SwapQuote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SwapQuote value)  $default,){
final _that = this;
switch (_that) {
case _SwapQuote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SwapQuote value)?  $default,){
final _that = this;
switch (_that) {
case _SwapQuote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SwapToken fromToken,  SwapToken toToken,  double fromAmount,  double toAmount,  double exchangeRate,  double fee,  double priceImpact,  double minimumReceived,  DateTime expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SwapQuote() when $default != null:
return $default(_that.fromToken,_that.toToken,_that.fromAmount,_that.toAmount,_that.exchangeRate,_that.fee,_that.priceImpact,_that.minimumReceived,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SwapToken fromToken,  SwapToken toToken,  double fromAmount,  double toAmount,  double exchangeRate,  double fee,  double priceImpact,  double minimumReceived,  DateTime expiresAt)  $default,) {final _that = this;
switch (_that) {
case _SwapQuote():
return $default(_that.fromToken,_that.toToken,_that.fromAmount,_that.toAmount,_that.exchangeRate,_that.fee,_that.priceImpact,_that.minimumReceived,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SwapToken fromToken,  SwapToken toToken,  double fromAmount,  double toAmount,  double exchangeRate,  double fee,  double priceImpact,  double minimumReceived,  DateTime expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _SwapQuote() when $default != null:
return $default(_that.fromToken,_that.toToken,_that.fromAmount,_that.toAmount,_that.exchangeRate,_that.fee,_that.priceImpact,_that.minimumReceived,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc


class _SwapQuote extends SwapQuote {
  const _SwapQuote({required this.fromToken, required this.toToken, required this.fromAmount, required this.toAmount, required this.exchangeRate, required this.fee, required this.priceImpact, required this.minimumReceived, required this.expiresAt}): super._();
  

@override final  SwapToken fromToken;
@override final  SwapToken toToken;
@override final  double fromAmount;
@override final  double toAmount;
@override final  double exchangeRate;
@override final  double fee;
@override final  double priceImpact;
@override final  double minimumReceived;
@override final  DateTime expiresAt;

/// Create a copy of SwapQuote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SwapQuoteCopyWith<_SwapQuote> get copyWith => __$SwapQuoteCopyWithImpl<_SwapQuote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SwapQuote&&(identical(other.fromToken, fromToken) || other.fromToken == fromToken)&&(identical(other.toToken, toToken) || other.toToken == toToken)&&(identical(other.fromAmount, fromAmount) || other.fromAmount == fromAmount)&&(identical(other.toAmount, toAmount) || other.toAmount == toAmount)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.priceImpact, priceImpact) || other.priceImpact == priceImpact)&&(identical(other.minimumReceived, minimumReceived) || other.minimumReceived == minimumReceived)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,fromToken,toToken,fromAmount,toAmount,exchangeRate,fee,priceImpact,minimumReceived,expiresAt);

@override
String toString() {
  return 'SwapQuote(fromToken: $fromToken, toToken: $toToken, fromAmount: $fromAmount, toAmount: $toAmount, exchangeRate: $exchangeRate, fee: $fee, priceImpact: $priceImpact, minimumReceived: $minimumReceived, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$SwapQuoteCopyWith<$Res> implements $SwapQuoteCopyWith<$Res> {
  factory _$SwapQuoteCopyWith(_SwapQuote value, $Res Function(_SwapQuote) _then) = __$SwapQuoteCopyWithImpl;
@override @useResult
$Res call({
 SwapToken fromToken, SwapToken toToken, double fromAmount, double toAmount, double exchangeRate, double fee, double priceImpact, double minimumReceived, DateTime expiresAt
});


@override $SwapTokenCopyWith<$Res> get fromToken;@override $SwapTokenCopyWith<$Res> get toToken;

}
/// @nodoc
class __$SwapQuoteCopyWithImpl<$Res>
    implements _$SwapQuoteCopyWith<$Res> {
  __$SwapQuoteCopyWithImpl(this._self, this._then);

  final _SwapQuote _self;
  final $Res Function(_SwapQuote) _then;

/// Create a copy of SwapQuote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromToken = null,Object? toToken = null,Object? fromAmount = null,Object? toAmount = null,Object? exchangeRate = null,Object? fee = null,Object? priceImpact = null,Object? minimumReceived = null,Object? expiresAt = null,}) {
  return _then(_SwapQuote(
fromToken: null == fromToken ? _self.fromToken : fromToken // ignore: cast_nullable_to_non_nullable
as SwapToken,toToken: null == toToken ? _self.toToken : toToken // ignore: cast_nullable_to_non_nullable
as SwapToken,fromAmount: null == fromAmount ? _self.fromAmount : fromAmount // ignore: cast_nullable_to_non_nullable
as double,toAmount: null == toAmount ? _self.toAmount : toAmount // ignore: cast_nullable_to_non_nullable
as double,exchangeRate: null == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as double,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as double,priceImpact: null == priceImpact ? _self.priceImpact : priceImpact // ignore: cast_nullable_to_non_nullable
as double,minimumReceived: null == minimumReceived ? _self.minimumReceived : minimumReceived // ignore: cast_nullable_to_non_nullable
as double,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of SwapQuote
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<$Res> get fromToken {
  
  return $SwapTokenCopyWith<$Res>(_self.fromToken, (value) {
    return _then(_self.copyWith(fromToken: value));
  });
}/// Create a copy of SwapQuote
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<$Res> get toToken {
  
  return $SwapTokenCopyWith<$Res>(_self.toToken, (value) {
    return _then(_self.copyWith(toToken: value));
  });
}
}

// dart format on
