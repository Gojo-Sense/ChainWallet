// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NFT {

 String get id; String get name; String get collection; String get imageUrl; String get contractAddress; String get tokenId; String? get description; double? get floorPrice; double? get lastSalePrice; String? get rarityRank; List<NFTAttribute> get attributes;
/// Create a copy of NFT
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NFTCopyWith<NFT> get copyWith => _$NFTCopyWithImpl<NFT>(this as NFT, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFT&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.collection, collection) || other.collection == collection)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.contractAddress, contractAddress) || other.contractAddress == contractAddress)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.description, description) || other.description == description)&&(identical(other.floorPrice, floorPrice) || other.floorPrice == floorPrice)&&(identical(other.lastSalePrice, lastSalePrice) || other.lastSalePrice == lastSalePrice)&&(identical(other.rarityRank, rarityRank) || other.rarityRank == rarityRank)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,collection,imageUrl,contractAddress,tokenId,description,floorPrice,lastSalePrice,rarityRank,const DeepCollectionEquality().hash(attributes));

@override
String toString() {
  return 'NFT(id: $id, name: $name, collection: $collection, imageUrl: $imageUrl, contractAddress: $contractAddress, tokenId: $tokenId, description: $description, floorPrice: $floorPrice, lastSalePrice: $lastSalePrice, rarityRank: $rarityRank, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $NFTCopyWith<$Res>  {
  factory $NFTCopyWith(NFT value, $Res Function(NFT) _then) = _$NFTCopyWithImpl;
@useResult
$Res call({
 String id, String name, String collection, String imageUrl, String contractAddress, String tokenId, String? description, double? floorPrice, double? lastSalePrice, String? rarityRank, List<NFTAttribute> attributes
});




}
/// @nodoc
class _$NFTCopyWithImpl<$Res>
    implements $NFTCopyWith<$Res> {
  _$NFTCopyWithImpl(this._self, this._then);

  final NFT _self;
  final $Res Function(NFT) _then;

/// Create a copy of NFT
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? collection = null,Object? imageUrl = null,Object? contractAddress = null,Object? tokenId = null,Object? description = freezed,Object? floorPrice = freezed,Object? lastSalePrice = freezed,Object? rarityRank = freezed,Object? attributes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,collection: null == collection ? _self.collection : collection // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,contractAddress: null == contractAddress ? _self.contractAddress : contractAddress // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,floorPrice: freezed == floorPrice ? _self.floorPrice : floorPrice // ignore: cast_nullable_to_non_nullable
as double?,lastSalePrice: freezed == lastSalePrice ? _self.lastSalePrice : lastSalePrice // ignore: cast_nullable_to_non_nullable
as double?,rarityRank: freezed == rarityRank ? _self.rarityRank : rarityRank // ignore: cast_nullable_to_non_nullable
as String?,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<NFTAttribute>,
  ));
}

}


/// Adds pattern-matching-related methods to [NFT].
extension NFTPatterns on NFT {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NFT value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NFT() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NFT value)  $default,){
final _that = this;
switch (_that) {
case _NFT():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NFT value)?  $default,){
final _that = this;
switch (_that) {
case _NFT() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String collection,  String imageUrl,  String contractAddress,  String tokenId,  String? description,  double? floorPrice,  double? lastSalePrice,  String? rarityRank,  List<NFTAttribute> attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NFT() when $default != null:
return $default(_that.id,_that.name,_that.collection,_that.imageUrl,_that.contractAddress,_that.tokenId,_that.description,_that.floorPrice,_that.lastSalePrice,_that.rarityRank,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String collection,  String imageUrl,  String contractAddress,  String tokenId,  String? description,  double? floorPrice,  double? lastSalePrice,  String? rarityRank,  List<NFTAttribute> attributes)  $default,) {final _that = this;
switch (_that) {
case _NFT():
return $default(_that.id,_that.name,_that.collection,_that.imageUrl,_that.contractAddress,_that.tokenId,_that.description,_that.floorPrice,_that.lastSalePrice,_that.rarityRank,_that.attributes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String collection,  String imageUrl,  String contractAddress,  String tokenId,  String? description,  double? floorPrice,  double? lastSalePrice,  String? rarityRank,  List<NFTAttribute> attributes)?  $default,) {final _that = this;
switch (_that) {
case _NFT() when $default != null:
return $default(_that.id,_that.name,_that.collection,_that.imageUrl,_that.contractAddress,_that.tokenId,_that.description,_that.floorPrice,_that.lastSalePrice,_that.rarityRank,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc


class _NFT extends NFT {
  const _NFT({required this.id, required this.name, required this.collection, required this.imageUrl, required this.contractAddress, required this.tokenId, this.description, this.floorPrice, this.lastSalePrice, this.rarityRank, final  List<NFTAttribute> attributes = const []}): _attributes = attributes,super._();
  

@override final  String id;
@override final  String name;
@override final  String collection;
@override final  String imageUrl;
@override final  String contractAddress;
@override final  String tokenId;
@override final  String? description;
@override final  double? floorPrice;
@override final  double? lastSalePrice;
@override final  String? rarityRank;
 final  List<NFTAttribute> _attributes;
@override@JsonKey() List<NFTAttribute> get attributes {
  if (_attributes is EqualUnmodifiableListView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attributes);
}


/// Create a copy of NFT
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NFTCopyWith<_NFT> get copyWith => __$NFTCopyWithImpl<_NFT>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NFT&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.collection, collection) || other.collection == collection)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.contractAddress, contractAddress) || other.contractAddress == contractAddress)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.description, description) || other.description == description)&&(identical(other.floorPrice, floorPrice) || other.floorPrice == floorPrice)&&(identical(other.lastSalePrice, lastSalePrice) || other.lastSalePrice == lastSalePrice)&&(identical(other.rarityRank, rarityRank) || other.rarityRank == rarityRank)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,collection,imageUrl,contractAddress,tokenId,description,floorPrice,lastSalePrice,rarityRank,const DeepCollectionEquality().hash(_attributes));

@override
String toString() {
  return 'NFT(id: $id, name: $name, collection: $collection, imageUrl: $imageUrl, contractAddress: $contractAddress, tokenId: $tokenId, description: $description, floorPrice: $floorPrice, lastSalePrice: $lastSalePrice, rarityRank: $rarityRank, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$NFTCopyWith<$Res> implements $NFTCopyWith<$Res> {
  factory _$NFTCopyWith(_NFT value, $Res Function(_NFT) _then) = __$NFTCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String collection, String imageUrl, String contractAddress, String tokenId, String? description, double? floorPrice, double? lastSalePrice, String? rarityRank, List<NFTAttribute> attributes
});




}
/// @nodoc
class __$NFTCopyWithImpl<$Res>
    implements _$NFTCopyWith<$Res> {
  __$NFTCopyWithImpl(this._self, this._then);

  final _NFT _self;
  final $Res Function(_NFT) _then;

/// Create a copy of NFT
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? collection = null,Object? imageUrl = null,Object? contractAddress = null,Object? tokenId = null,Object? description = freezed,Object? floorPrice = freezed,Object? lastSalePrice = freezed,Object? rarityRank = freezed,Object? attributes = null,}) {
  return _then(_NFT(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,collection: null == collection ? _self.collection : collection // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,contractAddress: null == contractAddress ? _self.contractAddress : contractAddress // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,floorPrice: freezed == floorPrice ? _self.floorPrice : floorPrice // ignore: cast_nullable_to_non_nullable
as double?,lastSalePrice: freezed == lastSalePrice ? _self.lastSalePrice : lastSalePrice // ignore: cast_nullable_to_non_nullable
as double?,rarityRank: freezed == rarityRank ? _self.rarityRank : rarityRank // ignore: cast_nullable_to_non_nullable
as String?,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<NFTAttribute>,
  ));
}


}

/// @nodoc
mixin _$NFTAttribute {

 String get traitType; String get value; double? get rarity;
/// Create a copy of NFTAttribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NFTAttributeCopyWith<NFTAttribute> get copyWith => _$NFTAttributeCopyWithImpl<NFTAttribute>(this as NFTAttribute, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFTAttribute&&(identical(other.traitType, traitType) || other.traitType == traitType)&&(identical(other.value, value) || other.value == value)&&(identical(other.rarity, rarity) || other.rarity == rarity));
}


@override
int get hashCode => Object.hash(runtimeType,traitType,value,rarity);

@override
String toString() {
  return 'NFTAttribute(traitType: $traitType, value: $value, rarity: $rarity)';
}


}

/// @nodoc
abstract mixin class $NFTAttributeCopyWith<$Res>  {
  factory $NFTAttributeCopyWith(NFTAttribute value, $Res Function(NFTAttribute) _then) = _$NFTAttributeCopyWithImpl;
@useResult
$Res call({
 String traitType, String value, double? rarity
});




}
/// @nodoc
class _$NFTAttributeCopyWithImpl<$Res>
    implements $NFTAttributeCopyWith<$Res> {
  _$NFTAttributeCopyWithImpl(this._self, this._then);

  final NFTAttribute _self;
  final $Res Function(NFTAttribute) _then;

/// Create a copy of NFTAttribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? traitType = null,Object? value = null,Object? rarity = freezed,}) {
  return _then(_self.copyWith(
traitType: null == traitType ? _self.traitType : traitType // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,rarity: freezed == rarity ? _self.rarity : rarity // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [NFTAttribute].
extension NFTAttributePatterns on NFTAttribute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NFTAttribute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NFTAttribute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NFTAttribute value)  $default,){
final _that = this;
switch (_that) {
case _NFTAttribute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NFTAttribute value)?  $default,){
final _that = this;
switch (_that) {
case _NFTAttribute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String traitType,  String value,  double? rarity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NFTAttribute() when $default != null:
return $default(_that.traitType,_that.value,_that.rarity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String traitType,  String value,  double? rarity)  $default,) {final _that = this;
switch (_that) {
case _NFTAttribute():
return $default(_that.traitType,_that.value,_that.rarity);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String traitType,  String value,  double? rarity)?  $default,) {final _that = this;
switch (_that) {
case _NFTAttribute() when $default != null:
return $default(_that.traitType,_that.value,_that.rarity);case _:
  return null;

}
}

}

/// @nodoc


class _NFTAttribute extends NFTAttribute {
  const _NFTAttribute({required this.traitType, required this.value, this.rarity}): super._();
  

@override final  String traitType;
@override final  String value;
@override final  double? rarity;

/// Create a copy of NFTAttribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NFTAttributeCopyWith<_NFTAttribute> get copyWith => __$NFTAttributeCopyWithImpl<_NFTAttribute>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NFTAttribute&&(identical(other.traitType, traitType) || other.traitType == traitType)&&(identical(other.value, value) || other.value == value)&&(identical(other.rarity, rarity) || other.rarity == rarity));
}


@override
int get hashCode => Object.hash(runtimeType,traitType,value,rarity);

@override
String toString() {
  return 'NFTAttribute(traitType: $traitType, value: $value, rarity: $rarity)';
}


}

/// @nodoc
abstract mixin class _$NFTAttributeCopyWith<$Res> implements $NFTAttributeCopyWith<$Res> {
  factory _$NFTAttributeCopyWith(_NFTAttribute value, $Res Function(_NFTAttribute) _then) = __$NFTAttributeCopyWithImpl;
@override @useResult
$Res call({
 String traitType, String value, double? rarity
});




}
/// @nodoc
class __$NFTAttributeCopyWithImpl<$Res>
    implements _$NFTAttributeCopyWith<$Res> {
  __$NFTAttributeCopyWithImpl(this._self, this._then);

  final _NFTAttribute _self;
  final $Res Function(_NFTAttribute) _then;

/// Create a copy of NFTAttribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? traitType = null,Object? value = null,Object? rarity = freezed,}) {
  return _then(_NFTAttribute(
traitType: null == traitType ? _self.traitType : traitType // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,rarity: freezed == rarity ? _self.rarity : rarity // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$NFTCollection {

 String get name; String get slug; String? get imageUrl; double? get floorPrice; int? get totalSupply; int? get ownedCount;
/// Create a copy of NFTCollection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NFTCollectionCopyWith<NFTCollection> get copyWith => _$NFTCollectionCopyWithImpl<NFTCollection>(this as NFTCollection, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFTCollection&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.floorPrice, floorPrice) || other.floorPrice == floorPrice)&&(identical(other.totalSupply, totalSupply) || other.totalSupply == totalSupply)&&(identical(other.ownedCount, ownedCount) || other.ownedCount == ownedCount));
}


@override
int get hashCode => Object.hash(runtimeType,name,slug,imageUrl,floorPrice,totalSupply,ownedCount);

@override
String toString() {
  return 'NFTCollection(name: $name, slug: $slug, imageUrl: $imageUrl, floorPrice: $floorPrice, totalSupply: $totalSupply, ownedCount: $ownedCount)';
}


}

/// @nodoc
abstract mixin class $NFTCollectionCopyWith<$Res>  {
  factory $NFTCollectionCopyWith(NFTCollection value, $Res Function(NFTCollection) _then) = _$NFTCollectionCopyWithImpl;
@useResult
$Res call({
 String name, String slug, String? imageUrl, double? floorPrice, int? totalSupply, int? ownedCount
});




}
/// @nodoc
class _$NFTCollectionCopyWithImpl<$Res>
    implements $NFTCollectionCopyWith<$Res> {
  _$NFTCollectionCopyWithImpl(this._self, this._then);

  final NFTCollection _self;
  final $Res Function(NFTCollection) _then;

/// Create a copy of NFTCollection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? slug = null,Object? imageUrl = freezed,Object? floorPrice = freezed,Object? totalSupply = freezed,Object? ownedCount = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,floorPrice: freezed == floorPrice ? _self.floorPrice : floorPrice // ignore: cast_nullable_to_non_nullable
as double?,totalSupply: freezed == totalSupply ? _self.totalSupply : totalSupply // ignore: cast_nullable_to_non_nullable
as int?,ownedCount: freezed == ownedCount ? _self.ownedCount : ownedCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [NFTCollection].
extension NFTCollectionPatterns on NFTCollection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NFTCollection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NFTCollection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NFTCollection value)  $default,){
final _that = this;
switch (_that) {
case _NFTCollection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NFTCollection value)?  $default,){
final _that = this;
switch (_that) {
case _NFTCollection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String slug,  String? imageUrl,  double? floorPrice,  int? totalSupply,  int? ownedCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NFTCollection() when $default != null:
return $default(_that.name,_that.slug,_that.imageUrl,_that.floorPrice,_that.totalSupply,_that.ownedCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String slug,  String? imageUrl,  double? floorPrice,  int? totalSupply,  int? ownedCount)  $default,) {final _that = this;
switch (_that) {
case _NFTCollection():
return $default(_that.name,_that.slug,_that.imageUrl,_that.floorPrice,_that.totalSupply,_that.ownedCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String slug,  String? imageUrl,  double? floorPrice,  int? totalSupply,  int? ownedCount)?  $default,) {final _that = this;
switch (_that) {
case _NFTCollection() when $default != null:
return $default(_that.name,_that.slug,_that.imageUrl,_that.floorPrice,_that.totalSupply,_that.ownedCount);case _:
  return null;

}
}

}

/// @nodoc


class _NFTCollection extends NFTCollection {
  const _NFTCollection({required this.name, required this.slug, this.imageUrl, this.floorPrice, this.totalSupply, this.ownedCount}): super._();
  

@override final  String name;
@override final  String slug;
@override final  String? imageUrl;
@override final  double? floorPrice;
@override final  int? totalSupply;
@override final  int? ownedCount;

/// Create a copy of NFTCollection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NFTCollectionCopyWith<_NFTCollection> get copyWith => __$NFTCollectionCopyWithImpl<_NFTCollection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NFTCollection&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.floorPrice, floorPrice) || other.floorPrice == floorPrice)&&(identical(other.totalSupply, totalSupply) || other.totalSupply == totalSupply)&&(identical(other.ownedCount, ownedCount) || other.ownedCount == ownedCount));
}


@override
int get hashCode => Object.hash(runtimeType,name,slug,imageUrl,floorPrice,totalSupply,ownedCount);

@override
String toString() {
  return 'NFTCollection(name: $name, slug: $slug, imageUrl: $imageUrl, floorPrice: $floorPrice, totalSupply: $totalSupply, ownedCount: $ownedCount)';
}


}

/// @nodoc
abstract mixin class _$NFTCollectionCopyWith<$Res> implements $NFTCollectionCopyWith<$Res> {
  factory _$NFTCollectionCopyWith(_NFTCollection value, $Res Function(_NFTCollection) _then) = __$NFTCollectionCopyWithImpl;
@override @useResult
$Res call({
 String name, String slug, String? imageUrl, double? floorPrice, int? totalSupply, int? ownedCount
});




}
/// @nodoc
class __$NFTCollectionCopyWithImpl<$Res>
    implements _$NFTCollectionCopyWith<$Res> {
  __$NFTCollectionCopyWithImpl(this._self, this._then);

  final _NFTCollection _self;
  final $Res Function(_NFTCollection) _then;

/// Create a copy of NFTCollection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? slug = null,Object? imageUrl = freezed,Object? floorPrice = freezed,Object? totalSupply = freezed,Object? ownedCount = freezed,}) {
  return _then(_NFTCollection(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,floorPrice: freezed == floorPrice ? _self.floorPrice : floorPrice // ignore: cast_nullable_to_non_nullable
as double?,totalSupply: freezed == totalSupply ? _self.totalSupply : totalSupply // ignore: cast_nullable_to_non_nullable
as int?,ownedCount: freezed == ownedCount ? _self.ownedCount : ownedCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
