// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NFTEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFTEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NFTEvent()';
}


}

/// @nodoc
class $NFTEventCopyWith<$Res>  {
$NFTEventCopyWith(NFTEvent _, $Res Function(NFTEvent) __);
}


/// Adds pattern-matching-related methods to [NFTEvent].
extension NFTEventPatterns on NFTEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadNFTsEvent value)?  load,TResult Function( SelectNFTEvent value)?  selectNFT,TResult Function( ClearSelectionEvent value)?  clearSelection,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadNFTsEvent() when load != null:
return load(_that);case SelectNFTEvent() when selectNFT != null:
return selectNFT(_that);case ClearSelectionEvent() when clearSelection != null:
return clearSelection(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadNFTsEvent value)  load,required TResult Function( SelectNFTEvent value)  selectNFT,required TResult Function( ClearSelectionEvent value)  clearSelection,}){
final _that = this;
switch (_that) {
case LoadNFTsEvent():
return load(_that);case SelectNFTEvent():
return selectNFT(_that);case ClearSelectionEvent():
return clearSelection(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadNFTsEvent value)?  load,TResult? Function( SelectNFTEvent value)?  selectNFT,TResult? Function( ClearSelectionEvent value)?  clearSelection,}){
final _that = this;
switch (_that) {
case LoadNFTsEvent() when load != null:
return load(_that);case SelectNFTEvent() when selectNFT != null:
return selectNFT(_that);case ClearSelectionEvent() when clearSelection != null:
return clearSelection(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( NFT nft)?  selectNFT,TResult Function()?  clearSelection,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadNFTsEvent() when load != null:
return load();case SelectNFTEvent() when selectNFT != null:
return selectNFT(_that.nft);case ClearSelectionEvent() when clearSelection != null:
return clearSelection();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( NFT nft)  selectNFT,required TResult Function()  clearSelection,}) {final _that = this;
switch (_that) {
case LoadNFTsEvent():
return load();case SelectNFTEvent():
return selectNFT(_that.nft);case ClearSelectionEvent():
return clearSelection();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( NFT nft)?  selectNFT,TResult? Function()?  clearSelection,}) {final _that = this;
switch (_that) {
case LoadNFTsEvent() when load != null:
return load();case SelectNFTEvent() when selectNFT != null:
return selectNFT(_that.nft);case ClearSelectionEvent() when clearSelection != null:
return clearSelection();case _:
  return null;

}
}

}

/// @nodoc


class LoadNFTsEvent extends NFTEvent {
  const LoadNFTsEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadNFTsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NFTEvent.load()';
}


}




/// @nodoc


class SelectNFTEvent extends NFTEvent {
  const SelectNFTEvent(this.nft): super._();
  

 final  NFT nft;

/// Create a copy of NFTEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectNFTEventCopyWith<SelectNFTEvent> get copyWith => _$SelectNFTEventCopyWithImpl<SelectNFTEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectNFTEvent&&(identical(other.nft, nft) || other.nft == nft));
}


@override
int get hashCode => Object.hash(runtimeType,nft);

@override
String toString() {
  return 'NFTEvent.selectNFT(nft: $nft)';
}


}

/// @nodoc
abstract mixin class $SelectNFTEventCopyWith<$Res> implements $NFTEventCopyWith<$Res> {
  factory $SelectNFTEventCopyWith(SelectNFTEvent value, $Res Function(SelectNFTEvent) _then) = _$SelectNFTEventCopyWithImpl;
@useResult
$Res call({
 NFT nft
});


$NFTCopyWith<$Res> get nft;

}
/// @nodoc
class _$SelectNFTEventCopyWithImpl<$Res>
    implements $SelectNFTEventCopyWith<$Res> {
  _$SelectNFTEventCopyWithImpl(this._self, this._then);

  final SelectNFTEvent _self;
  final $Res Function(SelectNFTEvent) _then;

/// Create a copy of NFTEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nft = null,}) {
  return _then(SelectNFTEvent(
null == nft ? _self.nft : nft // ignore: cast_nullable_to_non_nullable
as NFT,
  ));
}

/// Create a copy of NFTEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NFTCopyWith<$Res> get nft {
  
  return $NFTCopyWith<$Res>(_self.nft, (value) {
    return _then(_self.copyWith(nft: value));
  });
}
}

/// @nodoc


class ClearSelectionEvent extends NFTEvent {
  const ClearSelectionEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSelectionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NFTEvent.clearSelection()';
}


}




/// @nodoc
mixin _$NFTState {

 List<NFT> get nfts; List<NFTCollection> get collections; bool get isLoading; NFT? get selectedNFT; String? get error;
/// Create a copy of NFTState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NFTStateCopyWith<NFTState> get copyWith => _$NFTStateCopyWithImpl<NFTState>(this as NFTState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFTState&&const DeepCollectionEquality().equals(other.nfts, nfts)&&const DeepCollectionEquality().equals(other.collections, collections)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedNFT, selectedNFT) || other.selectedNFT == selectedNFT)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(nfts),const DeepCollectionEquality().hash(collections),isLoading,selectedNFT,error);

@override
String toString() {
  return 'NFTState(nfts: $nfts, collections: $collections, isLoading: $isLoading, selectedNFT: $selectedNFT, error: $error)';
}


}

/// @nodoc
abstract mixin class $NFTStateCopyWith<$Res>  {
  factory $NFTStateCopyWith(NFTState value, $Res Function(NFTState) _then) = _$NFTStateCopyWithImpl;
@useResult
$Res call({
 List<NFT> nfts, List<NFTCollection> collections, bool isLoading, NFT? selectedNFT, String? error
});


$NFTCopyWith<$Res>? get selectedNFT;

}
/// @nodoc
class _$NFTStateCopyWithImpl<$Res>
    implements $NFTStateCopyWith<$Res> {
  _$NFTStateCopyWithImpl(this._self, this._then);

  final NFTState _self;
  final $Res Function(NFTState) _then;

/// Create a copy of NFTState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nfts = null,Object? collections = null,Object? isLoading = null,Object? selectedNFT = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
nfts: null == nfts ? _self.nfts : nfts // ignore: cast_nullable_to_non_nullable
as List<NFT>,collections: null == collections ? _self.collections : collections // ignore: cast_nullable_to_non_nullable
as List<NFTCollection>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedNFT: freezed == selectedNFT ? _self.selectedNFT : selectedNFT // ignore: cast_nullable_to_non_nullable
as NFT?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of NFTState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NFTCopyWith<$Res>? get selectedNFT {
    if (_self.selectedNFT == null) {
    return null;
  }

  return $NFTCopyWith<$Res>(_self.selectedNFT!, (value) {
    return _then(_self.copyWith(selectedNFT: value));
  });
}
}


/// Adds pattern-matching-related methods to [NFTState].
extension NFTStatePatterns on NFTState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NFTState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NFTState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NFTState value)  $default,){
final _that = this;
switch (_that) {
case _NFTState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NFTState value)?  $default,){
final _that = this;
switch (_that) {
case _NFTState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NFT> nfts,  List<NFTCollection> collections,  bool isLoading,  NFT? selectedNFT,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NFTState() when $default != null:
return $default(_that.nfts,_that.collections,_that.isLoading,_that.selectedNFT,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NFT> nfts,  List<NFTCollection> collections,  bool isLoading,  NFT? selectedNFT,  String? error)  $default,) {final _that = this;
switch (_that) {
case _NFTState():
return $default(_that.nfts,_that.collections,_that.isLoading,_that.selectedNFT,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NFT> nfts,  List<NFTCollection> collections,  bool isLoading,  NFT? selectedNFT,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _NFTState() when $default != null:
return $default(_that.nfts,_that.collections,_that.isLoading,_that.selectedNFT,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _NFTState extends NFTState {
  const _NFTState({final  List<NFT> nfts = const [], final  List<NFTCollection> collections = const [], this.isLoading = false, this.selectedNFT, this.error}): _nfts = nfts,_collections = collections,super._();
  

 final  List<NFT> _nfts;
@override@JsonKey() List<NFT> get nfts {
  if (_nfts is EqualUnmodifiableListView) return _nfts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nfts);
}

 final  List<NFTCollection> _collections;
@override@JsonKey() List<NFTCollection> get collections {
  if (_collections is EqualUnmodifiableListView) return _collections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_collections);
}

@override@JsonKey() final  bool isLoading;
@override final  NFT? selectedNFT;
@override final  String? error;

/// Create a copy of NFTState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NFTStateCopyWith<_NFTState> get copyWith => __$NFTStateCopyWithImpl<_NFTState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NFTState&&const DeepCollectionEquality().equals(other._nfts, _nfts)&&const DeepCollectionEquality().equals(other._collections, _collections)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedNFT, selectedNFT) || other.selectedNFT == selectedNFT)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_nfts),const DeepCollectionEquality().hash(_collections),isLoading,selectedNFT,error);

@override
String toString() {
  return 'NFTState(nfts: $nfts, collections: $collections, isLoading: $isLoading, selectedNFT: $selectedNFT, error: $error)';
}


}

/// @nodoc
abstract mixin class _$NFTStateCopyWith<$Res> implements $NFTStateCopyWith<$Res> {
  factory _$NFTStateCopyWith(_NFTState value, $Res Function(_NFTState) _then) = __$NFTStateCopyWithImpl;
@override @useResult
$Res call({
 List<NFT> nfts, List<NFTCollection> collections, bool isLoading, NFT? selectedNFT, String? error
});


@override $NFTCopyWith<$Res>? get selectedNFT;

}
/// @nodoc
class __$NFTStateCopyWithImpl<$Res>
    implements _$NFTStateCopyWith<$Res> {
  __$NFTStateCopyWithImpl(this._self, this._then);

  final _NFTState _self;
  final $Res Function(_NFTState) _then;

/// Create a copy of NFTState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nfts = null,Object? collections = null,Object? isLoading = null,Object? selectedNFT = freezed,Object? error = freezed,}) {
  return _then(_NFTState(
nfts: null == nfts ? _self._nfts : nfts // ignore: cast_nullable_to_non_nullable
as List<NFT>,collections: null == collections ? _self._collections : collections // ignore: cast_nullable_to_non_nullable
as List<NFTCollection>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedNFT: freezed == selectedNFT ? _self.selectedNFT : selectedNFT // ignore: cast_nullable_to_non_nullable
as NFT?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of NFTState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NFTCopyWith<$Res>? get selectedNFT {
    if (_self.selectedNFT == null) {
    return null;
  }

  return $NFTCopyWith<$Res>(_self.selectedNFT!, (value) {
    return _then(_self.copyWith(selectedNFT: value));
  });
}
}

// dart format on
