// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Portfolio {

 double get totalValue; double get totalPnL; double get pnLPercentage; List<PortfolioAsset> get assets; List<PortfolioSnapshot> get history;
/// Create a copy of Portfolio
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioCopyWith<Portfolio> get copyWith => _$PortfolioCopyWithImpl<Portfolio>(this as Portfolio, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Portfolio&&(identical(other.totalValue, totalValue) || other.totalValue == totalValue)&&(identical(other.totalPnL, totalPnL) || other.totalPnL == totalPnL)&&(identical(other.pnLPercentage, pnLPercentage) || other.pnLPercentage == pnLPercentage)&&const DeepCollectionEquality().equals(other.assets, assets)&&const DeepCollectionEquality().equals(other.history, history));
}


@override
int get hashCode => Object.hash(runtimeType,totalValue,totalPnL,pnLPercentage,const DeepCollectionEquality().hash(assets),const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'Portfolio(totalValue: $totalValue, totalPnL: $totalPnL, pnLPercentage: $pnLPercentage, assets: $assets, history: $history)';
}


}

/// @nodoc
abstract mixin class $PortfolioCopyWith<$Res>  {
  factory $PortfolioCopyWith(Portfolio value, $Res Function(Portfolio) _then) = _$PortfolioCopyWithImpl;
@useResult
$Res call({
 double totalValue, double totalPnL, double pnLPercentage, List<PortfolioAsset> assets, List<PortfolioSnapshot> history
});




}
/// @nodoc
class _$PortfolioCopyWithImpl<$Res>
    implements $PortfolioCopyWith<$Res> {
  _$PortfolioCopyWithImpl(this._self, this._then);

  final Portfolio _self;
  final $Res Function(Portfolio) _then;

/// Create a copy of Portfolio
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalValue = null,Object? totalPnL = null,Object? pnLPercentage = null,Object? assets = null,Object? history = null,}) {
  return _then(_self.copyWith(
totalValue: null == totalValue ? _self.totalValue : totalValue // ignore: cast_nullable_to_non_nullable
as double,totalPnL: null == totalPnL ? _self.totalPnL : totalPnL // ignore: cast_nullable_to_non_nullable
as double,pnLPercentage: null == pnLPercentage ? _self.pnLPercentage : pnLPercentage // ignore: cast_nullable_to_non_nullable
as double,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as List<PortfolioAsset>,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<PortfolioSnapshot>,
  ));
}

}


/// Adds pattern-matching-related methods to [Portfolio].
extension PortfolioPatterns on Portfolio {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Portfolio value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Portfolio() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Portfolio value)  $default,){
final _that = this;
switch (_that) {
case _Portfolio():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Portfolio value)?  $default,){
final _that = this;
switch (_that) {
case _Portfolio() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalValue,  double totalPnL,  double pnLPercentage,  List<PortfolioAsset> assets,  List<PortfolioSnapshot> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Portfolio() when $default != null:
return $default(_that.totalValue,_that.totalPnL,_that.pnLPercentage,_that.assets,_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalValue,  double totalPnL,  double pnLPercentage,  List<PortfolioAsset> assets,  List<PortfolioSnapshot> history)  $default,) {final _that = this;
switch (_that) {
case _Portfolio():
return $default(_that.totalValue,_that.totalPnL,_that.pnLPercentage,_that.assets,_that.history);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalValue,  double totalPnL,  double pnLPercentage,  List<PortfolioAsset> assets,  List<PortfolioSnapshot> history)?  $default,) {final _that = this;
switch (_that) {
case _Portfolio() when $default != null:
return $default(_that.totalValue,_that.totalPnL,_that.pnLPercentage,_that.assets,_that.history);case _:
  return null;

}
}

}

/// @nodoc


class _Portfolio extends Portfolio {
  const _Portfolio({required this.totalValue, required this.totalPnL, required this.pnLPercentage, required final  List<PortfolioAsset> assets, required final  List<PortfolioSnapshot> history}): _assets = assets,_history = history,super._();
  

@override final  double totalValue;
@override final  double totalPnL;
@override final  double pnLPercentage;
 final  List<PortfolioAsset> _assets;
@override List<PortfolioAsset> get assets {
  if (_assets is EqualUnmodifiableListView) return _assets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assets);
}

 final  List<PortfolioSnapshot> _history;
@override List<PortfolioSnapshot> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of Portfolio
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioCopyWith<_Portfolio> get copyWith => __$PortfolioCopyWithImpl<_Portfolio>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Portfolio&&(identical(other.totalValue, totalValue) || other.totalValue == totalValue)&&(identical(other.totalPnL, totalPnL) || other.totalPnL == totalPnL)&&(identical(other.pnLPercentage, pnLPercentage) || other.pnLPercentage == pnLPercentage)&&const DeepCollectionEquality().equals(other._assets, _assets)&&const DeepCollectionEquality().equals(other._history, _history));
}


@override
int get hashCode => Object.hash(runtimeType,totalValue,totalPnL,pnLPercentage,const DeepCollectionEquality().hash(_assets),const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'Portfolio(totalValue: $totalValue, totalPnL: $totalPnL, pnLPercentage: $pnLPercentage, assets: $assets, history: $history)';
}


}

/// @nodoc
abstract mixin class _$PortfolioCopyWith<$Res> implements $PortfolioCopyWith<$Res> {
  factory _$PortfolioCopyWith(_Portfolio value, $Res Function(_Portfolio) _then) = __$PortfolioCopyWithImpl;
@override @useResult
$Res call({
 double totalValue, double totalPnL, double pnLPercentage, List<PortfolioAsset> assets, List<PortfolioSnapshot> history
});




}
/// @nodoc
class __$PortfolioCopyWithImpl<$Res>
    implements _$PortfolioCopyWith<$Res> {
  __$PortfolioCopyWithImpl(this._self, this._then);

  final _Portfolio _self;
  final $Res Function(_Portfolio) _then;

/// Create a copy of Portfolio
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalValue = null,Object? totalPnL = null,Object? pnLPercentage = null,Object? assets = null,Object? history = null,}) {
  return _then(_Portfolio(
totalValue: null == totalValue ? _self.totalValue : totalValue // ignore: cast_nullable_to_non_nullable
as double,totalPnL: null == totalPnL ? _self.totalPnL : totalPnL // ignore: cast_nullable_to_non_nullable
as double,pnLPercentage: null == pnLPercentage ? _self.pnLPercentage : pnLPercentage // ignore: cast_nullable_to_non_nullable
as double,assets: null == assets ? _self._assets : assets // ignore: cast_nullable_to_non_nullable
as List<PortfolioAsset>,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<PortfolioSnapshot>,
  ));
}


}

/// @nodoc
mixin _$PortfolioAsset {

 String get id; String get symbol; String get name; double get amount; double get value; double get price; double get pnL; double get pnLPercentage; double get allocation; String? get imageUrl;
/// Create a copy of PortfolioAsset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioAssetCopyWith<PortfolioAsset> get copyWith => _$PortfolioAssetCopyWithImpl<PortfolioAsset>(this as PortfolioAsset, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioAsset&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.value, value) || other.value == value)&&(identical(other.price, price) || other.price == price)&&(identical(other.pnL, pnL) || other.pnL == pnL)&&(identical(other.pnLPercentage, pnLPercentage) || other.pnLPercentage == pnLPercentage)&&(identical(other.allocation, allocation) || other.allocation == allocation)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,symbol,name,amount,value,price,pnL,pnLPercentage,allocation,imageUrl);

@override
String toString() {
  return 'PortfolioAsset(id: $id, symbol: $symbol, name: $name, amount: $amount, value: $value, price: $price, pnL: $pnL, pnLPercentage: $pnLPercentage, allocation: $allocation, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $PortfolioAssetCopyWith<$Res>  {
  factory $PortfolioAssetCopyWith(PortfolioAsset value, $Res Function(PortfolioAsset) _then) = _$PortfolioAssetCopyWithImpl;
@useResult
$Res call({
 String id, String symbol, String name, double amount, double value, double price, double pnL, double pnLPercentage, double allocation, String? imageUrl
});




}
/// @nodoc
class _$PortfolioAssetCopyWithImpl<$Res>
    implements $PortfolioAssetCopyWith<$Res> {
  _$PortfolioAssetCopyWithImpl(this._self, this._then);

  final PortfolioAsset _self;
  final $Res Function(PortfolioAsset) _then;

/// Create a copy of PortfolioAsset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? amount = null,Object? value = null,Object? price = null,Object? pnL = null,Object? pnLPercentage = null,Object? allocation = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,pnL: null == pnL ? _self.pnL : pnL // ignore: cast_nullable_to_non_nullable
as double,pnLPercentage: null == pnLPercentage ? _self.pnLPercentage : pnLPercentage // ignore: cast_nullable_to_non_nullable
as double,allocation: null == allocation ? _self.allocation : allocation // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioAsset].
extension PortfolioAssetPatterns on PortfolioAsset {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioAsset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioAsset() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioAsset value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioAsset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioAsset value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioAsset() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String symbol,  String name,  double amount,  double value,  double price,  double pnL,  double pnLPercentage,  double allocation,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioAsset() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.amount,_that.value,_that.price,_that.pnL,_that.pnLPercentage,_that.allocation,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String symbol,  String name,  double amount,  double value,  double price,  double pnL,  double pnLPercentage,  double allocation,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _PortfolioAsset():
return $default(_that.id,_that.symbol,_that.name,_that.amount,_that.value,_that.price,_that.pnL,_that.pnLPercentage,_that.allocation,_that.imageUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String symbol,  String name,  double amount,  double value,  double price,  double pnL,  double pnLPercentage,  double allocation,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioAsset() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.amount,_that.value,_that.price,_that.pnL,_that.pnLPercentage,_that.allocation,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _PortfolioAsset extends PortfolioAsset {
  const _PortfolioAsset({required this.id, required this.symbol, required this.name, required this.amount, required this.value, required this.price, required this.pnL, required this.pnLPercentage, required this.allocation, this.imageUrl}): super._();
  

@override final  String id;
@override final  String symbol;
@override final  String name;
@override final  double amount;
@override final  double value;
@override final  double price;
@override final  double pnL;
@override final  double pnLPercentage;
@override final  double allocation;
@override final  String? imageUrl;

/// Create a copy of PortfolioAsset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioAssetCopyWith<_PortfolioAsset> get copyWith => __$PortfolioAssetCopyWithImpl<_PortfolioAsset>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioAsset&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.value, value) || other.value == value)&&(identical(other.price, price) || other.price == price)&&(identical(other.pnL, pnL) || other.pnL == pnL)&&(identical(other.pnLPercentage, pnLPercentage) || other.pnLPercentage == pnLPercentage)&&(identical(other.allocation, allocation) || other.allocation == allocation)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,symbol,name,amount,value,price,pnL,pnLPercentage,allocation,imageUrl);

@override
String toString() {
  return 'PortfolioAsset(id: $id, symbol: $symbol, name: $name, amount: $amount, value: $value, price: $price, pnL: $pnL, pnLPercentage: $pnLPercentage, allocation: $allocation, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$PortfolioAssetCopyWith<$Res> implements $PortfolioAssetCopyWith<$Res> {
  factory _$PortfolioAssetCopyWith(_PortfolioAsset value, $Res Function(_PortfolioAsset) _then) = __$PortfolioAssetCopyWithImpl;
@override @useResult
$Res call({
 String id, String symbol, String name, double amount, double value, double price, double pnL, double pnLPercentage, double allocation, String? imageUrl
});




}
/// @nodoc
class __$PortfolioAssetCopyWithImpl<$Res>
    implements _$PortfolioAssetCopyWith<$Res> {
  __$PortfolioAssetCopyWithImpl(this._self, this._then);

  final _PortfolioAsset _self;
  final $Res Function(_PortfolioAsset) _then;

/// Create a copy of PortfolioAsset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? amount = null,Object? value = null,Object? price = null,Object? pnL = null,Object? pnLPercentage = null,Object? allocation = null,Object? imageUrl = freezed,}) {
  return _then(_PortfolioAsset(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,pnL: null == pnL ? _self.pnL : pnL // ignore: cast_nullable_to_non_nullable
as double,pnLPercentage: null == pnLPercentage ? _self.pnLPercentage : pnLPercentage // ignore: cast_nullable_to_non_nullable
as double,allocation: null == allocation ? _self.allocation : allocation // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$PortfolioSnapshot {

 DateTime get timestamp; double get value;
/// Create a copy of PortfolioSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioSnapshotCopyWith<PortfolioSnapshot> get copyWith => _$PortfolioSnapshotCopyWithImpl<PortfolioSnapshot>(this as PortfolioSnapshot, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioSnapshot&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,timestamp,value);

@override
String toString() {
  return 'PortfolioSnapshot(timestamp: $timestamp, value: $value)';
}


}

/// @nodoc
abstract mixin class $PortfolioSnapshotCopyWith<$Res>  {
  factory $PortfolioSnapshotCopyWith(PortfolioSnapshot value, $Res Function(PortfolioSnapshot) _then) = _$PortfolioSnapshotCopyWithImpl;
@useResult
$Res call({
 DateTime timestamp, double value
});




}
/// @nodoc
class _$PortfolioSnapshotCopyWithImpl<$Res>
    implements $PortfolioSnapshotCopyWith<$Res> {
  _$PortfolioSnapshotCopyWithImpl(this._self, this._then);

  final PortfolioSnapshot _self;
  final $Res Function(PortfolioSnapshot) _then;

/// Create a copy of PortfolioSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? value = null,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioSnapshot].
extension PortfolioSnapshotPatterns on PortfolioSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime timestamp,  double value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioSnapshot() when $default != null:
return $default(_that.timestamp,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime timestamp,  double value)  $default,) {final _that = this;
switch (_that) {
case _PortfolioSnapshot():
return $default(_that.timestamp,_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime timestamp,  double value)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioSnapshot() when $default != null:
return $default(_that.timestamp,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _PortfolioSnapshot extends PortfolioSnapshot {
  const _PortfolioSnapshot({required this.timestamp, required this.value}): super._();
  

@override final  DateTime timestamp;
@override final  double value;

/// Create a copy of PortfolioSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioSnapshotCopyWith<_PortfolioSnapshot> get copyWith => __$PortfolioSnapshotCopyWithImpl<_PortfolioSnapshot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioSnapshot&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,timestamp,value);

@override
String toString() {
  return 'PortfolioSnapshot(timestamp: $timestamp, value: $value)';
}


}

/// @nodoc
abstract mixin class _$PortfolioSnapshotCopyWith<$Res> implements $PortfolioSnapshotCopyWith<$Res> {
  factory _$PortfolioSnapshotCopyWith(_PortfolioSnapshot value, $Res Function(_PortfolioSnapshot) _then) = __$PortfolioSnapshotCopyWithImpl;
@override @useResult
$Res call({
 DateTime timestamp, double value
});




}
/// @nodoc
class __$PortfolioSnapshotCopyWithImpl<$Res>
    implements _$PortfolioSnapshotCopyWith<$Res> {
  __$PortfolioSnapshotCopyWithImpl(this._self, this._then);

  final _PortfolioSnapshot _self;
  final $Res Function(_PortfolioSnapshot) _then;

/// Create a copy of PortfolioSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? value = null,}) {
  return _then(_PortfolioSnapshot(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
