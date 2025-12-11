// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenModel {

 String get id; String get symbol; String get name;@JsonKey(name: 'current_price') double? get currentPrice;@JsonKey(name: 'price_change_percentage_24h') double? get priceChangePercentage24h; String? get image;@JsonKey(name: 'market_cap') double? get marketCap;@JsonKey(name: 'total_volume') double? get volume24h;@JsonKey(name: 'high_24h') double? get high24h;@JsonKey(name: 'low_24h') double? get low24h;
/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenModelCopyWith<TokenModel> get copyWith => _$TokenModelCopyWithImpl<TokenModel>(this as TokenModel, _$identity);

  /// Serializes this TokenModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenModel&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.priceChangePercentage24h, priceChangePercentage24h) || other.priceChangePercentage24h == priceChangePercentage24h)&&(identical(other.image, image) || other.image == image)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.volume24h, volume24h) || other.volume24h == volume24h)&&(identical(other.high24h, high24h) || other.high24h == high24h)&&(identical(other.low24h, low24h) || other.low24h == low24h));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,symbol,name,currentPrice,priceChangePercentage24h,image,marketCap,volume24h,high24h,low24h);

@override
String toString() {
  return 'TokenModel(id: $id, symbol: $symbol, name: $name, currentPrice: $currentPrice, priceChangePercentage24h: $priceChangePercentage24h, image: $image, marketCap: $marketCap, volume24h: $volume24h, high24h: $high24h, low24h: $low24h)';
}


}

/// @nodoc
abstract mixin class $TokenModelCopyWith<$Res>  {
  factory $TokenModelCopyWith(TokenModel value, $Res Function(TokenModel) _then) = _$TokenModelCopyWithImpl;
@useResult
$Res call({
 String id, String symbol, String name,@JsonKey(name: 'current_price') double? currentPrice,@JsonKey(name: 'price_change_percentage_24h') double? priceChangePercentage24h, String? image,@JsonKey(name: 'market_cap') double? marketCap,@JsonKey(name: 'total_volume') double? volume24h,@JsonKey(name: 'high_24h') double? high24h,@JsonKey(name: 'low_24h') double? low24h
});




}
/// @nodoc
class _$TokenModelCopyWithImpl<$Res>
    implements $TokenModelCopyWith<$Res> {
  _$TokenModelCopyWithImpl(this._self, this._then);

  final TokenModel _self;
  final $Res Function(TokenModel) _then;

/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? currentPrice = freezed,Object? priceChangePercentage24h = freezed,Object? image = freezed,Object? marketCap = freezed,Object? volume24h = freezed,Object? high24h = freezed,Object? low24h = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double?,priceChangePercentage24h: freezed == priceChangePercentage24h ? _self.priceChangePercentage24h : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
as double?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,marketCap: freezed == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double?,volume24h: freezed == volume24h ? _self.volume24h : volume24h // ignore: cast_nullable_to_non_nullable
as double?,high24h: freezed == high24h ? _self.high24h : high24h // ignore: cast_nullable_to_non_nullable
as double?,low24h: freezed == low24h ? _self.low24h : low24h // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenModel].
extension TokenModelPatterns on TokenModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenModel value)  $default,){
final _that = this;
switch (_that) {
case _TokenModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenModel value)?  $default,){
final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String symbol,  String name, @JsonKey(name: 'current_price')  double? currentPrice, @JsonKey(name: 'price_change_percentage_24h')  double? priceChangePercentage24h,  String? image, @JsonKey(name: 'market_cap')  double? marketCap, @JsonKey(name: 'total_volume')  double? volume24h, @JsonKey(name: 'high_24h')  double? high24h, @JsonKey(name: 'low_24h')  double? low24h)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String symbol,  String name, @JsonKey(name: 'current_price')  double? currentPrice, @JsonKey(name: 'price_change_percentage_24h')  double? priceChangePercentage24h,  String? image, @JsonKey(name: 'market_cap')  double? marketCap, @JsonKey(name: 'total_volume')  double? volume24h, @JsonKey(name: 'high_24h')  double? high24h, @JsonKey(name: 'low_24h')  double? low24h)  $default,) {final _that = this;
switch (_that) {
case _TokenModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String symbol,  String name, @JsonKey(name: 'current_price')  double? currentPrice, @JsonKey(name: 'price_change_percentage_24h')  double? priceChangePercentage24h,  String? image, @JsonKey(name: 'market_cap')  double? marketCap, @JsonKey(name: 'total_volume')  double? volume24h, @JsonKey(name: 'high_24h')  double? high24h, @JsonKey(name: 'low_24h')  double? low24h)?  $default,) {final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.currentPrice,_that.priceChangePercentage24h,_that.image,_that.marketCap,_that.volume24h,_that.high24h,_that.low24h);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenModel extends TokenModel {
  const _TokenModel({required this.id, required this.symbol, required this.name, @JsonKey(name: 'current_price') this.currentPrice, @JsonKey(name: 'price_change_percentage_24h') this.priceChangePercentage24h, this.image, @JsonKey(name: 'market_cap') this.marketCap, @JsonKey(name: 'total_volume') this.volume24h, @JsonKey(name: 'high_24h') this.high24h, @JsonKey(name: 'low_24h') this.low24h}): super._();
  factory _TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

@override final  String id;
@override final  String symbol;
@override final  String name;
@override@JsonKey(name: 'current_price') final  double? currentPrice;
@override@JsonKey(name: 'price_change_percentage_24h') final  double? priceChangePercentage24h;
@override final  String? image;
@override@JsonKey(name: 'market_cap') final  double? marketCap;
@override@JsonKey(name: 'total_volume') final  double? volume24h;
@override@JsonKey(name: 'high_24h') final  double? high24h;
@override@JsonKey(name: 'low_24h') final  double? low24h;

/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenModelCopyWith<_TokenModel> get copyWith => __$TokenModelCopyWithImpl<_TokenModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenModel&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.priceChangePercentage24h, priceChangePercentage24h) || other.priceChangePercentage24h == priceChangePercentage24h)&&(identical(other.image, image) || other.image == image)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.volume24h, volume24h) || other.volume24h == volume24h)&&(identical(other.high24h, high24h) || other.high24h == high24h)&&(identical(other.low24h, low24h) || other.low24h == low24h));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,symbol,name,currentPrice,priceChangePercentage24h,image,marketCap,volume24h,high24h,low24h);

@override
String toString() {
  return 'TokenModel(id: $id, symbol: $symbol, name: $name, currentPrice: $currentPrice, priceChangePercentage24h: $priceChangePercentage24h, image: $image, marketCap: $marketCap, volume24h: $volume24h, high24h: $high24h, low24h: $low24h)';
}


}

/// @nodoc
abstract mixin class _$TokenModelCopyWith<$Res> implements $TokenModelCopyWith<$Res> {
  factory _$TokenModelCopyWith(_TokenModel value, $Res Function(_TokenModel) _then) = __$TokenModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String symbol, String name,@JsonKey(name: 'current_price') double? currentPrice,@JsonKey(name: 'price_change_percentage_24h') double? priceChangePercentage24h, String? image,@JsonKey(name: 'market_cap') double? marketCap,@JsonKey(name: 'total_volume') double? volume24h,@JsonKey(name: 'high_24h') double? high24h,@JsonKey(name: 'low_24h') double? low24h
});




}
/// @nodoc
class __$TokenModelCopyWithImpl<$Res>
    implements _$TokenModelCopyWith<$Res> {
  __$TokenModelCopyWithImpl(this._self, this._then);

  final _TokenModel _self;
  final $Res Function(_TokenModel) _then;

/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? currentPrice = freezed,Object? priceChangePercentage24h = freezed,Object? image = freezed,Object? marketCap = freezed,Object? volume24h = freezed,Object? high24h = freezed,Object? low24h = freezed,}) {
  return _then(_TokenModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double?,priceChangePercentage24h: freezed == priceChangePercentage24h ? _self.priceChangePercentage24h : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
as double?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,marketCap: freezed == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double?,volume24h: freezed == volume24h ? _self.volume24h : volume24h // ignore: cast_nullable_to_non_nullable
as double?,high24h: freezed == high24h ? _self.high24h : high24h // ignore: cast_nullable_to_non_nullable
as double?,low24h: freezed == low24h ? _self.low24h : low24h // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$SimplePriceModel {

 String get id; double get usd;@JsonKey(name: 'usd_24h_change') double? get usd24hChange;@JsonKey(name: 'usd_market_cap') double? get usdMarketCap;@JsonKey(name: 'usd_24h_vol') double? get usd24hVol;
/// Create a copy of SimplePriceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimplePriceModelCopyWith<SimplePriceModel> get copyWith => _$SimplePriceModelCopyWithImpl<SimplePriceModel>(this as SimplePriceModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimplePriceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.usd, usd) || other.usd == usd)&&(identical(other.usd24hChange, usd24hChange) || other.usd24hChange == usd24hChange)&&(identical(other.usdMarketCap, usdMarketCap) || other.usdMarketCap == usdMarketCap)&&(identical(other.usd24hVol, usd24hVol) || other.usd24hVol == usd24hVol));
}


@override
int get hashCode => Object.hash(runtimeType,id,usd,usd24hChange,usdMarketCap,usd24hVol);

@override
String toString() {
  return 'SimplePriceModel(id: $id, usd: $usd, usd24hChange: $usd24hChange, usdMarketCap: $usdMarketCap, usd24hVol: $usd24hVol)';
}


}

/// @nodoc
abstract mixin class $SimplePriceModelCopyWith<$Res>  {
  factory $SimplePriceModelCopyWith(SimplePriceModel value, $Res Function(SimplePriceModel) _then) = _$SimplePriceModelCopyWithImpl;
@useResult
$Res call({
 String id, double usd,@JsonKey(name: 'usd_24h_change') double? usd24hChange,@JsonKey(name: 'usd_market_cap') double? usdMarketCap,@JsonKey(name: 'usd_24h_vol') double? usd24hVol
});




}
/// @nodoc
class _$SimplePriceModelCopyWithImpl<$Res>
    implements $SimplePriceModelCopyWith<$Res> {
  _$SimplePriceModelCopyWithImpl(this._self, this._then);

  final SimplePriceModel _self;
  final $Res Function(SimplePriceModel) _then;

/// Create a copy of SimplePriceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? usd = null,Object? usd24hChange = freezed,Object? usdMarketCap = freezed,Object? usd24hVol = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,usd: null == usd ? _self.usd : usd // ignore: cast_nullable_to_non_nullable
as double,usd24hChange: freezed == usd24hChange ? _self.usd24hChange : usd24hChange // ignore: cast_nullable_to_non_nullable
as double?,usdMarketCap: freezed == usdMarketCap ? _self.usdMarketCap : usdMarketCap // ignore: cast_nullable_to_non_nullable
as double?,usd24hVol: freezed == usd24hVol ? _self.usd24hVol : usd24hVol // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SimplePriceModel].
extension SimplePriceModelPatterns on SimplePriceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SimplePriceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SimplePriceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SimplePriceModel value)  $default,){
final _that = this;
switch (_that) {
case _SimplePriceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SimplePriceModel value)?  $default,){
final _that = this;
switch (_that) {
case _SimplePriceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double usd, @JsonKey(name: 'usd_24h_change')  double? usd24hChange, @JsonKey(name: 'usd_market_cap')  double? usdMarketCap, @JsonKey(name: 'usd_24h_vol')  double? usd24hVol)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SimplePriceModel() when $default != null:
return $default(_that.id,_that.usd,_that.usd24hChange,_that.usdMarketCap,_that.usd24hVol);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double usd, @JsonKey(name: 'usd_24h_change')  double? usd24hChange, @JsonKey(name: 'usd_market_cap')  double? usdMarketCap, @JsonKey(name: 'usd_24h_vol')  double? usd24hVol)  $default,) {final _that = this;
switch (_that) {
case _SimplePriceModel():
return $default(_that.id,_that.usd,_that.usd24hChange,_that.usdMarketCap,_that.usd24hVol);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double usd, @JsonKey(name: 'usd_24h_change')  double? usd24hChange, @JsonKey(name: 'usd_market_cap')  double? usdMarketCap, @JsonKey(name: 'usd_24h_vol')  double? usd24hVol)?  $default,) {final _that = this;
switch (_that) {
case _SimplePriceModel() when $default != null:
return $default(_that.id,_that.usd,_that.usd24hChange,_that.usdMarketCap,_that.usd24hVol);case _:
  return null;

}
}

}

/// @nodoc


class _SimplePriceModel extends SimplePriceModel {
  const _SimplePriceModel({required this.id, required this.usd, @JsonKey(name: 'usd_24h_change') this.usd24hChange, @JsonKey(name: 'usd_market_cap') this.usdMarketCap, @JsonKey(name: 'usd_24h_vol') this.usd24hVol}): super._();
  

@override final  String id;
@override final  double usd;
@override@JsonKey(name: 'usd_24h_change') final  double? usd24hChange;
@override@JsonKey(name: 'usd_market_cap') final  double? usdMarketCap;
@override@JsonKey(name: 'usd_24h_vol') final  double? usd24hVol;

/// Create a copy of SimplePriceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimplePriceModelCopyWith<_SimplePriceModel> get copyWith => __$SimplePriceModelCopyWithImpl<_SimplePriceModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimplePriceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.usd, usd) || other.usd == usd)&&(identical(other.usd24hChange, usd24hChange) || other.usd24hChange == usd24hChange)&&(identical(other.usdMarketCap, usdMarketCap) || other.usdMarketCap == usdMarketCap)&&(identical(other.usd24hVol, usd24hVol) || other.usd24hVol == usd24hVol));
}


@override
int get hashCode => Object.hash(runtimeType,id,usd,usd24hChange,usdMarketCap,usd24hVol);

@override
String toString() {
  return 'SimplePriceModel(id: $id, usd: $usd, usd24hChange: $usd24hChange, usdMarketCap: $usdMarketCap, usd24hVol: $usd24hVol)';
}


}

/// @nodoc
abstract mixin class _$SimplePriceModelCopyWith<$Res> implements $SimplePriceModelCopyWith<$Res> {
  factory _$SimplePriceModelCopyWith(_SimplePriceModel value, $Res Function(_SimplePriceModel) _then) = __$SimplePriceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, double usd,@JsonKey(name: 'usd_24h_change') double? usd24hChange,@JsonKey(name: 'usd_market_cap') double? usdMarketCap,@JsonKey(name: 'usd_24h_vol') double? usd24hVol
});




}
/// @nodoc
class __$SimplePriceModelCopyWithImpl<$Res>
    implements _$SimplePriceModelCopyWith<$Res> {
  __$SimplePriceModelCopyWithImpl(this._self, this._then);

  final _SimplePriceModel _self;
  final $Res Function(_SimplePriceModel) _then;

/// Create a copy of SimplePriceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? usd = null,Object? usd24hChange = freezed,Object? usdMarketCap = freezed,Object? usd24hVol = freezed,}) {
  return _then(_SimplePriceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,usd: null == usd ? _self.usd : usd // ignore: cast_nullable_to_non_nullable
as double,usd24hChange: freezed == usd24hChange ? _self.usd24hChange : usd24hChange // ignore: cast_nullable_to_non_nullable
as double?,usdMarketCap: freezed == usdMarketCap ? _self.usdMarketCap : usdMarketCap // ignore: cast_nullable_to_non_nullable
as double?,usd24hVol: freezed == usd24hVol ? _self.usd24hVol : usd24hVol // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
