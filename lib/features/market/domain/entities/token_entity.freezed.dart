// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TokenEntity {

 String get id; String get symbol; String get name; double get currentPrice; double get priceChangePercentage24h; String? get image; double? get marketCap; double? get volume24h; double? get high24h; double? get low24h;
/// Create a copy of TokenEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenEntityCopyWith<TokenEntity> get copyWith => _$TokenEntityCopyWithImpl<TokenEntity>(this as TokenEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.priceChangePercentage24h, priceChangePercentage24h) || other.priceChangePercentage24h == priceChangePercentage24h)&&(identical(other.image, image) || other.image == image)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.volume24h, volume24h) || other.volume24h == volume24h)&&(identical(other.high24h, high24h) || other.high24h == high24h)&&(identical(other.low24h, low24h) || other.low24h == low24h));
}


@override
int get hashCode => Object.hash(runtimeType,id,symbol,name,currentPrice,priceChangePercentage24h,image,marketCap,volume24h,high24h,low24h);

@override
String toString() {
  return 'TokenEntity(id: $id, symbol: $symbol, name: $name, currentPrice: $currentPrice, priceChangePercentage24h: $priceChangePercentage24h, image: $image, marketCap: $marketCap, volume24h: $volume24h, high24h: $high24h, low24h: $low24h)';
}


}

/// @nodoc
abstract mixin class $TokenEntityCopyWith<$Res>  {
  factory $TokenEntityCopyWith(TokenEntity value, $Res Function(TokenEntity) _then) = _$TokenEntityCopyWithImpl;
@useResult
$Res call({
 String id, String symbol, String name, double currentPrice, double priceChangePercentage24h, String? image, double? marketCap, double? volume24h, double? high24h, double? low24h
});




}
/// @nodoc
class _$TokenEntityCopyWithImpl<$Res>
    implements $TokenEntityCopyWith<$Res> {
  _$TokenEntityCopyWithImpl(this._self, this._then);

  final TokenEntity _self;
  final $Res Function(TokenEntity) _then;

/// Create a copy of TokenEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? currentPrice = null,Object? priceChangePercentage24h = null,Object? image = freezed,Object? marketCap = freezed,Object? volume24h = freezed,Object? high24h = freezed,Object? low24h = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,priceChangePercentage24h: null == priceChangePercentage24h ? _self.priceChangePercentage24h : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
as double,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,marketCap: freezed == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double?,volume24h: freezed == volume24h ? _self.volume24h : volume24h // ignore: cast_nullable_to_non_nullable
as double?,high24h: freezed == high24h ? _self.high24h : high24h // ignore: cast_nullable_to_non_nullable
as double?,low24h: freezed == low24h ? _self.low24h : low24h // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenEntity].
extension TokenEntityPatterns on TokenEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenEntity value)  $default,){
final _that = this;
switch (_that) {
case _TokenEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TokenEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String symbol,  String name,  double currentPrice,  double priceChangePercentage24h,  String? image,  double? marketCap,  double? volume24h,  double? high24h,  double? low24h)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenEntity() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.currentPrice,_that.priceChangePercentage24h,_that.image,_that.marketCap,_that.volume24h,_that.high24h,_that.low24h);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String symbol,  String name,  double currentPrice,  double priceChangePercentage24h,  String? image,  double? marketCap,  double? volume24h,  double? high24h,  double? low24h)  $default,) {final _that = this;
switch (_that) {
case _TokenEntity():
return $default(_that.id,_that.symbol,_that.name,_that.currentPrice,_that.priceChangePercentage24h,_that.image,_that.marketCap,_that.volume24h,_that.high24h,_that.low24h);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String symbol,  String name,  double currentPrice,  double priceChangePercentage24h,  String? image,  double? marketCap,  double? volume24h,  double? high24h,  double? low24h)?  $default,) {final _that = this;
switch (_that) {
case _TokenEntity() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.currentPrice,_that.priceChangePercentage24h,_that.image,_that.marketCap,_that.volume24h,_that.high24h,_that.low24h);case _:
  return null;

}
}

}

/// @nodoc


class _TokenEntity extends TokenEntity {
  const _TokenEntity({required this.id, required this.symbol, required this.name, required this.currentPrice, required this.priceChangePercentage24h, this.image, this.marketCap, this.volume24h, this.high24h, this.low24h}): super._();
  

@override final  String id;
@override final  String symbol;
@override final  String name;
@override final  double currentPrice;
@override final  double priceChangePercentage24h;
@override final  String? image;
@override final  double? marketCap;
@override final  double? volume24h;
@override final  double? high24h;
@override final  double? low24h;

/// Create a copy of TokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenEntityCopyWith<_TokenEntity> get copyWith => __$TokenEntityCopyWithImpl<_TokenEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.priceChangePercentage24h, priceChangePercentage24h) || other.priceChangePercentage24h == priceChangePercentage24h)&&(identical(other.image, image) || other.image == image)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.volume24h, volume24h) || other.volume24h == volume24h)&&(identical(other.high24h, high24h) || other.high24h == high24h)&&(identical(other.low24h, low24h) || other.low24h == low24h));
}


@override
int get hashCode => Object.hash(runtimeType,id,symbol,name,currentPrice,priceChangePercentage24h,image,marketCap,volume24h,high24h,low24h);

@override
String toString() {
  return 'TokenEntity(id: $id, symbol: $symbol, name: $name, currentPrice: $currentPrice, priceChangePercentage24h: $priceChangePercentage24h, image: $image, marketCap: $marketCap, volume24h: $volume24h, high24h: $high24h, low24h: $low24h)';
}


}

/// @nodoc
abstract mixin class _$TokenEntityCopyWith<$Res> implements $TokenEntityCopyWith<$Res> {
  factory _$TokenEntityCopyWith(_TokenEntity value, $Res Function(_TokenEntity) _then) = __$TokenEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String symbol, String name, double currentPrice, double priceChangePercentage24h, String? image, double? marketCap, double? volume24h, double? high24h, double? low24h
});




}
/// @nodoc
class __$TokenEntityCopyWithImpl<$Res>
    implements _$TokenEntityCopyWith<$Res> {
  __$TokenEntityCopyWithImpl(this._self, this._then);

  final _TokenEntity _self;
  final $Res Function(_TokenEntity) _then;

/// Create a copy of TokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? currentPrice = null,Object? priceChangePercentage24h = null,Object? image = freezed,Object? marketCap = freezed,Object? volume24h = freezed,Object? high24h = freezed,Object? low24h = freezed,}) {
  return _then(_TokenEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,priceChangePercentage24h: null == priceChangePercentage24h ? _self.priceChangePercentage24h : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
as double,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,marketCap: freezed == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double?,volume24h: freezed == volume24h ? _self.volume24h : volume24h // ignore: cast_nullable_to_non_nullable
as double?,high24h: freezed == high24h ? _self.high24h : high24h // ignore: cast_nullable_to_non_nullable
as double?,low24h: freezed == low24h ? _self.low24h : low24h // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$PricePoint {

 DateTime get timestamp; double get price;
/// Create a copy of PricePoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PricePointCopyWith<PricePoint> get copyWith => _$PricePointCopyWithImpl<PricePoint>(this as PricePoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PricePoint&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,timestamp,price);

@override
String toString() {
  return 'PricePoint(timestamp: $timestamp, price: $price)';
}


}

/// @nodoc
abstract mixin class $PricePointCopyWith<$Res>  {
  factory $PricePointCopyWith(PricePoint value, $Res Function(PricePoint) _then) = _$PricePointCopyWithImpl;
@useResult
$Res call({
 DateTime timestamp, double price
});




}
/// @nodoc
class _$PricePointCopyWithImpl<$Res>
    implements $PricePointCopyWith<$Res> {
  _$PricePointCopyWithImpl(this._self, this._then);

  final PricePoint _self;
  final $Res Function(PricePoint) _then;

/// Create a copy of PricePoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? price = null,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PricePoint].
extension PricePointPatterns on PricePoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PricePoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PricePoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PricePoint value)  $default,){
final _that = this;
switch (_that) {
case _PricePoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PricePoint value)?  $default,){
final _that = this;
switch (_that) {
case _PricePoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime timestamp,  double price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PricePoint() when $default != null:
return $default(_that.timestamp,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime timestamp,  double price)  $default,) {final _that = this;
switch (_that) {
case _PricePoint():
return $default(_that.timestamp,_that.price);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime timestamp,  double price)?  $default,) {final _that = this;
switch (_that) {
case _PricePoint() when $default != null:
return $default(_that.timestamp,_that.price);case _:
  return null;

}
}

}

/// @nodoc


class _PricePoint implements PricePoint {
  const _PricePoint({required this.timestamp, required this.price});
  

@override final  DateTime timestamp;
@override final  double price;

/// Create a copy of PricePoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PricePointCopyWith<_PricePoint> get copyWith => __$PricePointCopyWithImpl<_PricePoint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PricePoint&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,timestamp,price);

@override
String toString() {
  return 'PricePoint(timestamp: $timestamp, price: $price)';
}


}

/// @nodoc
abstract mixin class _$PricePointCopyWith<$Res> implements $PricePointCopyWith<$Res> {
  factory _$PricePointCopyWith(_PricePoint value, $Res Function(_PricePoint) _then) = __$PricePointCopyWithImpl;
@override @useResult
$Res call({
 DateTime timestamp, double price
});




}
/// @nodoc
class __$PricePointCopyWithImpl<$Res>
    implements _$PricePointCopyWith<$Res> {
  __$PricePointCopyWithImpl(this._self, this._then);

  final _PricePoint _self;
  final $Res Function(_PricePoint) _then;

/// Create a copy of PricePoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? price = null,}) {
  return _then(_PricePoint(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$MarketChartEntity {

 String get tokenId; List<PricePoint> get prices; DateTime get startTime; DateTime get endTime;
/// Create a copy of MarketChartEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketChartEntityCopyWith<MarketChartEntity> get copyWith => _$MarketChartEntityCopyWithImpl<MarketChartEntity>(this as MarketChartEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketChartEntity&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&const DeepCollectionEquality().equals(other.prices, prices)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}


@override
int get hashCode => Object.hash(runtimeType,tokenId,const DeepCollectionEquality().hash(prices),startTime,endTime);

@override
String toString() {
  return 'MarketChartEntity(tokenId: $tokenId, prices: $prices, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class $MarketChartEntityCopyWith<$Res>  {
  factory $MarketChartEntityCopyWith(MarketChartEntity value, $Res Function(MarketChartEntity) _then) = _$MarketChartEntityCopyWithImpl;
@useResult
$Res call({
 String tokenId, List<PricePoint> prices, DateTime startTime, DateTime endTime
});




}
/// @nodoc
class _$MarketChartEntityCopyWithImpl<$Res>
    implements $MarketChartEntityCopyWith<$Res> {
  _$MarketChartEntityCopyWithImpl(this._self, this._then);

  final MarketChartEntity _self;
  final $Res Function(MarketChartEntity) _then;

/// Create a copy of MarketChartEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokenId = null,Object? prices = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_self.copyWith(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,prices: null == prices ? _self.prices : prices // ignore: cast_nullable_to_non_nullable
as List<PricePoint>,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketChartEntity].
extension MarketChartEntityPatterns on MarketChartEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketChartEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketChartEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketChartEntity value)  $default,){
final _that = this;
switch (_that) {
case _MarketChartEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketChartEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MarketChartEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tokenId,  List<PricePoint> prices,  DateTime startTime,  DateTime endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketChartEntity() when $default != null:
return $default(_that.tokenId,_that.prices,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tokenId,  List<PricePoint> prices,  DateTime startTime,  DateTime endTime)  $default,) {final _that = this;
switch (_that) {
case _MarketChartEntity():
return $default(_that.tokenId,_that.prices,_that.startTime,_that.endTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tokenId,  List<PricePoint> prices,  DateTime startTime,  DateTime endTime)?  $default,) {final _that = this;
switch (_that) {
case _MarketChartEntity() when $default != null:
return $default(_that.tokenId,_that.prices,_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc


class _MarketChartEntity extends MarketChartEntity {
  const _MarketChartEntity({required this.tokenId, required final  List<PricePoint> prices, required this.startTime, required this.endTime}): _prices = prices,super._();
  

@override final  String tokenId;
 final  List<PricePoint> _prices;
@override List<PricePoint> get prices {
  if (_prices is EqualUnmodifiableListView) return _prices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prices);
}

@override final  DateTime startTime;
@override final  DateTime endTime;

/// Create a copy of MarketChartEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketChartEntityCopyWith<_MarketChartEntity> get copyWith => __$MarketChartEntityCopyWithImpl<_MarketChartEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketChartEntity&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&const DeepCollectionEquality().equals(other._prices, _prices)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}


@override
int get hashCode => Object.hash(runtimeType,tokenId,const DeepCollectionEquality().hash(_prices),startTime,endTime);

@override
String toString() {
  return 'MarketChartEntity(tokenId: $tokenId, prices: $prices, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$MarketChartEntityCopyWith<$Res> implements $MarketChartEntityCopyWith<$Res> {
  factory _$MarketChartEntityCopyWith(_MarketChartEntity value, $Res Function(_MarketChartEntity) _then) = __$MarketChartEntityCopyWithImpl;
@override @useResult
$Res call({
 String tokenId, List<PricePoint> prices, DateTime startTime, DateTime endTime
});




}
/// @nodoc
class __$MarketChartEntityCopyWithImpl<$Res>
    implements _$MarketChartEntityCopyWith<$Res> {
  __$MarketChartEntityCopyWithImpl(this._self, this._then);

  final _MarketChartEntity _self;
  final $Res Function(_MarketChartEntity) _then;

/// Create a copy of MarketChartEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokenId = null,Object? prices = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_MarketChartEntity(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,prices: null == prices ? _self._prices : prices // ignore: cast_nullable_to_non_nullable
as List<PricePoint>,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$CandlestickEntity {

 DateTime get timestamp; double get open; double get high; double get low; double get close; double get volume; bool get isClosed;
/// Create a copy of CandlestickEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CandlestickEntityCopyWith<CandlestickEntity> get copyWith => _$CandlestickEntityCopyWithImpl<CandlestickEntity>(this as CandlestickEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CandlestickEntity&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.open, open) || other.open == open)&&(identical(other.high, high) || other.high == high)&&(identical(other.low, low) || other.low == low)&&(identical(other.close, close) || other.close == close)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed));
}


@override
int get hashCode => Object.hash(runtimeType,timestamp,open,high,low,close,volume,isClosed);

@override
String toString() {
  return 'CandlestickEntity(timestamp: $timestamp, open: $open, high: $high, low: $low, close: $close, volume: $volume, isClosed: $isClosed)';
}


}

/// @nodoc
abstract mixin class $CandlestickEntityCopyWith<$Res>  {
  factory $CandlestickEntityCopyWith(CandlestickEntity value, $Res Function(CandlestickEntity) _then) = _$CandlestickEntityCopyWithImpl;
@useResult
$Res call({
 DateTime timestamp, double open, double high, double low, double close, double volume, bool isClosed
});




}
/// @nodoc
class _$CandlestickEntityCopyWithImpl<$Res>
    implements $CandlestickEntityCopyWith<$Res> {
  _$CandlestickEntityCopyWithImpl(this._self, this._then);

  final CandlestickEntity _self;
  final $Res Function(CandlestickEntity) _then;

/// Create a copy of CandlestickEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? open = null,Object? high = null,Object? low = null,Object? close = null,Object? volume = null,Object? isClosed = null,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as double,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as double,low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as double,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,isClosed: null == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CandlestickEntity].
extension CandlestickEntityPatterns on CandlestickEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CandlestickEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CandlestickEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CandlestickEntity value)  $default,){
final _that = this;
switch (_that) {
case _CandlestickEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CandlestickEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CandlestickEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime timestamp,  double open,  double high,  double low,  double close,  double volume,  bool isClosed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CandlestickEntity() when $default != null:
return $default(_that.timestamp,_that.open,_that.high,_that.low,_that.close,_that.volume,_that.isClosed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime timestamp,  double open,  double high,  double low,  double close,  double volume,  bool isClosed)  $default,) {final _that = this;
switch (_that) {
case _CandlestickEntity():
return $default(_that.timestamp,_that.open,_that.high,_that.low,_that.close,_that.volume,_that.isClosed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime timestamp,  double open,  double high,  double low,  double close,  double volume,  bool isClosed)?  $default,) {final _that = this;
switch (_that) {
case _CandlestickEntity() when $default != null:
return $default(_that.timestamp,_that.open,_that.high,_that.low,_that.close,_that.volume,_that.isClosed);case _:
  return null;

}
}

}

/// @nodoc


class _CandlestickEntity extends CandlestickEntity {
  const _CandlestickEntity({required this.timestamp, required this.open, required this.high, required this.low, required this.close, required this.volume, required this.isClosed}): super._();
  

@override final  DateTime timestamp;
@override final  double open;
@override final  double high;
@override final  double low;
@override final  double close;
@override final  double volume;
@override final  bool isClosed;

/// Create a copy of CandlestickEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandlestickEntityCopyWith<_CandlestickEntity> get copyWith => __$CandlestickEntityCopyWithImpl<_CandlestickEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CandlestickEntity&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.open, open) || other.open == open)&&(identical(other.high, high) || other.high == high)&&(identical(other.low, low) || other.low == low)&&(identical(other.close, close) || other.close == close)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed));
}


@override
int get hashCode => Object.hash(runtimeType,timestamp,open,high,low,close,volume,isClosed);

@override
String toString() {
  return 'CandlestickEntity(timestamp: $timestamp, open: $open, high: $high, low: $low, close: $close, volume: $volume, isClosed: $isClosed)';
}


}

/// @nodoc
abstract mixin class _$CandlestickEntityCopyWith<$Res> implements $CandlestickEntityCopyWith<$Res> {
  factory _$CandlestickEntityCopyWith(_CandlestickEntity value, $Res Function(_CandlestickEntity) _then) = __$CandlestickEntityCopyWithImpl;
@override @useResult
$Res call({
 DateTime timestamp, double open, double high, double low, double close, double volume, bool isClosed
});




}
/// @nodoc
class __$CandlestickEntityCopyWithImpl<$Res>
    implements _$CandlestickEntityCopyWith<$Res> {
  __$CandlestickEntityCopyWithImpl(this._self, this._then);

  final _CandlestickEntity _self;
  final $Res Function(_CandlestickEntity) _then;

/// Create a copy of CandlestickEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? open = null,Object? high = null,Object? low = null,Object? close = null,Object? volume = null,Object? isClosed = null,}) {
  return _then(_CandlestickEntity(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as double,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as double,low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as double,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,isClosed: null == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
