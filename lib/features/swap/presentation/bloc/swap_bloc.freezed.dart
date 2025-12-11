// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'swap_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SwapEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwapEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SwapEvent()';
}


}

/// @nodoc
class $SwapEventCopyWith<$Res>  {
$SwapEventCopyWith(SwapEvent _, $Res Function(SwapEvent) __);
}


/// Adds pattern-matching-related methods to [SwapEvent].
extension SwapEventPatterns on SwapEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadTokens value)?  loadTokens,TResult Function( SelectFromToken value)?  selectFromToken,TResult Function( SelectToToken value)?  selectToToken,TResult Function( UpdateAmount value)?  updateAmount,TResult Function( SwapTokens value)?  swapTokens,TResult Function( GetQuote value)?  getQuote,TResult Function( ExecuteSwap value)?  executeSwap,TResult Function( LoadHistory value)?  loadHistory,TResult Function( ClearQuote value)?  clearQuote,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadTokens() when loadTokens != null:
return loadTokens(_that);case SelectFromToken() when selectFromToken != null:
return selectFromToken(_that);case SelectToToken() when selectToToken != null:
return selectToToken(_that);case UpdateAmount() when updateAmount != null:
return updateAmount(_that);case SwapTokens() when swapTokens != null:
return swapTokens(_that);case GetQuote() when getQuote != null:
return getQuote(_that);case ExecuteSwap() when executeSwap != null:
return executeSwap(_that);case LoadHistory() when loadHistory != null:
return loadHistory(_that);case ClearQuote() when clearQuote != null:
return clearQuote(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadTokens value)  loadTokens,required TResult Function( SelectFromToken value)  selectFromToken,required TResult Function( SelectToToken value)  selectToToken,required TResult Function( UpdateAmount value)  updateAmount,required TResult Function( SwapTokens value)  swapTokens,required TResult Function( GetQuote value)  getQuote,required TResult Function( ExecuteSwap value)  executeSwap,required TResult Function( LoadHistory value)  loadHistory,required TResult Function( ClearQuote value)  clearQuote,}){
final _that = this;
switch (_that) {
case LoadTokens():
return loadTokens(_that);case SelectFromToken():
return selectFromToken(_that);case SelectToToken():
return selectToToken(_that);case UpdateAmount():
return updateAmount(_that);case SwapTokens():
return swapTokens(_that);case GetQuote():
return getQuote(_that);case ExecuteSwap():
return executeSwap(_that);case LoadHistory():
return loadHistory(_that);case ClearQuote():
return clearQuote(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadTokens value)?  loadTokens,TResult? Function( SelectFromToken value)?  selectFromToken,TResult? Function( SelectToToken value)?  selectToToken,TResult? Function( UpdateAmount value)?  updateAmount,TResult? Function( SwapTokens value)?  swapTokens,TResult? Function( GetQuote value)?  getQuote,TResult? Function( ExecuteSwap value)?  executeSwap,TResult? Function( LoadHistory value)?  loadHistory,TResult? Function( ClearQuote value)?  clearQuote,}){
final _that = this;
switch (_that) {
case LoadTokens() when loadTokens != null:
return loadTokens(_that);case SelectFromToken() when selectFromToken != null:
return selectFromToken(_that);case SelectToToken() when selectToToken != null:
return selectToToken(_that);case UpdateAmount() when updateAmount != null:
return updateAmount(_that);case SwapTokens() when swapTokens != null:
return swapTokens(_that);case GetQuote() when getQuote != null:
return getQuote(_that);case ExecuteSwap() when executeSwap != null:
return executeSwap(_that);case LoadHistory() when loadHistory != null:
return loadHistory(_that);case ClearQuote() when clearQuote != null:
return clearQuote(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadTokens,TResult Function( SwapToken token)?  selectFromToken,TResult Function( SwapToken token)?  selectToToken,TResult Function( double amount)?  updateAmount,TResult Function()?  swapTokens,TResult Function()?  getQuote,TResult Function()?  executeSwap,TResult Function()?  loadHistory,TResult Function()?  clearQuote,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadTokens() when loadTokens != null:
return loadTokens();case SelectFromToken() when selectFromToken != null:
return selectFromToken(_that.token);case SelectToToken() when selectToToken != null:
return selectToToken(_that.token);case UpdateAmount() when updateAmount != null:
return updateAmount(_that.amount);case SwapTokens() when swapTokens != null:
return swapTokens();case GetQuote() when getQuote != null:
return getQuote();case ExecuteSwap() when executeSwap != null:
return executeSwap();case LoadHistory() when loadHistory != null:
return loadHistory();case ClearQuote() when clearQuote != null:
return clearQuote();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadTokens,required TResult Function( SwapToken token)  selectFromToken,required TResult Function( SwapToken token)  selectToToken,required TResult Function( double amount)  updateAmount,required TResult Function()  swapTokens,required TResult Function()  getQuote,required TResult Function()  executeSwap,required TResult Function()  loadHistory,required TResult Function()  clearQuote,}) {final _that = this;
switch (_that) {
case LoadTokens():
return loadTokens();case SelectFromToken():
return selectFromToken(_that.token);case SelectToToken():
return selectToToken(_that.token);case UpdateAmount():
return updateAmount(_that.amount);case SwapTokens():
return swapTokens();case GetQuote():
return getQuote();case ExecuteSwap():
return executeSwap();case LoadHistory():
return loadHistory();case ClearQuote():
return clearQuote();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadTokens,TResult? Function( SwapToken token)?  selectFromToken,TResult? Function( SwapToken token)?  selectToToken,TResult? Function( double amount)?  updateAmount,TResult? Function()?  swapTokens,TResult? Function()?  getQuote,TResult? Function()?  executeSwap,TResult? Function()?  loadHistory,TResult? Function()?  clearQuote,}) {final _that = this;
switch (_that) {
case LoadTokens() when loadTokens != null:
return loadTokens();case SelectFromToken() when selectFromToken != null:
return selectFromToken(_that.token);case SelectToToken() when selectToToken != null:
return selectToToken(_that.token);case UpdateAmount() when updateAmount != null:
return updateAmount(_that.amount);case SwapTokens() when swapTokens != null:
return swapTokens();case GetQuote() when getQuote != null:
return getQuote();case ExecuteSwap() when executeSwap != null:
return executeSwap();case LoadHistory() when loadHistory != null:
return loadHistory();case ClearQuote() when clearQuote != null:
return clearQuote();case _:
  return null;

}
}

}

/// @nodoc


class LoadTokens implements SwapEvent {
  const LoadTokens();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTokens);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SwapEvent.loadTokens()';
}


}




/// @nodoc


class SelectFromToken implements SwapEvent {
  const SelectFromToken(this.token);
  

 final  SwapToken token;

/// Create a copy of SwapEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectFromTokenCopyWith<SelectFromToken> get copyWith => _$SelectFromTokenCopyWithImpl<SelectFromToken>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectFromToken&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'SwapEvent.selectFromToken(token: $token)';
}


}

/// @nodoc
abstract mixin class $SelectFromTokenCopyWith<$Res> implements $SwapEventCopyWith<$Res> {
  factory $SelectFromTokenCopyWith(SelectFromToken value, $Res Function(SelectFromToken) _then) = _$SelectFromTokenCopyWithImpl;
@useResult
$Res call({
 SwapToken token
});


$SwapTokenCopyWith<$Res> get token;

}
/// @nodoc
class _$SelectFromTokenCopyWithImpl<$Res>
    implements $SelectFromTokenCopyWith<$Res> {
  _$SelectFromTokenCopyWithImpl(this._self, this._then);

  final SelectFromToken _self;
  final $Res Function(SelectFromToken) _then;

/// Create a copy of SwapEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(SelectFromToken(
null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as SwapToken,
  ));
}

/// Create a copy of SwapEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<$Res> get token {
  
  return $SwapTokenCopyWith<$Res>(_self.token, (value) {
    return _then(_self.copyWith(token: value));
  });
}
}

/// @nodoc


class SelectToToken implements SwapEvent {
  const SelectToToken(this.token);
  

 final  SwapToken token;

/// Create a copy of SwapEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectToTokenCopyWith<SelectToToken> get copyWith => _$SelectToTokenCopyWithImpl<SelectToToken>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectToToken&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'SwapEvent.selectToToken(token: $token)';
}


}

/// @nodoc
abstract mixin class $SelectToTokenCopyWith<$Res> implements $SwapEventCopyWith<$Res> {
  factory $SelectToTokenCopyWith(SelectToToken value, $Res Function(SelectToToken) _then) = _$SelectToTokenCopyWithImpl;
@useResult
$Res call({
 SwapToken token
});


$SwapTokenCopyWith<$Res> get token;

}
/// @nodoc
class _$SelectToTokenCopyWithImpl<$Res>
    implements $SelectToTokenCopyWith<$Res> {
  _$SelectToTokenCopyWithImpl(this._self, this._then);

  final SelectToToken _self;
  final $Res Function(SelectToToken) _then;

/// Create a copy of SwapEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(SelectToToken(
null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as SwapToken,
  ));
}

/// Create a copy of SwapEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<$Res> get token {
  
  return $SwapTokenCopyWith<$Res>(_self.token, (value) {
    return _then(_self.copyWith(token: value));
  });
}
}

/// @nodoc


class UpdateAmount implements SwapEvent {
  const UpdateAmount(this.amount);
  

 final  double amount;

/// Create a copy of SwapEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAmountCopyWith<UpdateAmount> get copyWith => _$UpdateAmountCopyWithImpl<UpdateAmount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAmount&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'SwapEvent.updateAmount(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $UpdateAmountCopyWith<$Res> implements $SwapEventCopyWith<$Res> {
  factory $UpdateAmountCopyWith(UpdateAmount value, $Res Function(UpdateAmount) _then) = _$UpdateAmountCopyWithImpl;
@useResult
$Res call({
 double amount
});




}
/// @nodoc
class _$UpdateAmountCopyWithImpl<$Res>
    implements $UpdateAmountCopyWith<$Res> {
  _$UpdateAmountCopyWithImpl(this._self, this._then);

  final UpdateAmount _self;
  final $Res Function(UpdateAmount) _then;

/// Create a copy of SwapEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(UpdateAmount(
null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class SwapTokens implements SwapEvent {
  const SwapTokens();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwapTokens);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SwapEvent.swapTokens()';
}


}




/// @nodoc


class GetQuote implements SwapEvent {
  const GetQuote();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetQuote);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SwapEvent.getQuote()';
}


}




/// @nodoc


class ExecuteSwap implements SwapEvent {
  const ExecuteSwap();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecuteSwap);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SwapEvent.executeSwap()';
}


}




/// @nodoc


class LoadHistory implements SwapEvent {
  const LoadHistory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadHistory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SwapEvent.loadHistory()';
}


}




/// @nodoc


class ClearQuote implements SwapEvent {
  const ClearQuote();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearQuote);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SwapEvent.clearQuote()';
}


}




/// @nodoc
mixin _$SwapState {

 List<SwapToken> get availableTokens; SwapToken? get fromToken; SwapToken? get toToken; double get amount; SwapQuote? get quote; SwapEntity? get lastSwap; List<SwapEntity> get swapHistory; bool get isLoadingTokens; bool get isLoadingQuote; bool get isSwapping; bool get isLoadingHistory; SwapFailure? get failure;
/// Create a copy of SwapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwapStateCopyWith<SwapState> get copyWith => _$SwapStateCopyWithImpl<SwapState>(this as SwapState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwapState&&const DeepCollectionEquality().equals(other.availableTokens, availableTokens)&&(identical(other.fromToken, fromToken) || other.fromToken == fromToken)&&(identical(other.toToken, toToken) || other.toToken == toToken)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.lastSwap, lastSwap) || other.lastSwap == lastSwap)&&const DeepCollectionEquality().equals(other.swapHistory, swapHistory)&&(identical(other.isLoadingTokens, isLoadingTokens) || other.isLoadingTokens == isLoadingTokens)&&(identical(other.isLoadingQuote, isLoadingQuote) || other.isLoadingQuote == isLoadingQuote)&&(identical(other.isSwapping, isSwapping) || other.isSwapping == isSwapping)&&(identical(other.isLoadingHistory, isLoadingHistory) || other.isLoadingHistory == isLoadingHistory)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(availableTokens),fromToken,toToken,amount,quote,lastSwap,const DeepCollectionEquality().hash(swapHistory),isLoadingTokens,isLoadingQuote,isSwapping,isLoadingHistory,failure);

@override
String toString() {
  return 'SwapState(availableTokens: $availableTokens, fromToken: $fromToken, toToken: $toToken, amount: $amount, quote: $quote, lastSwap: $lastSwap, swapHistory: $swapHistory, isLoadingTokens: $isLoadingTokens, isLoadingQuote: $isLoadingQuote, isSwapping: $isSwapping, isLoadingHistory: $isLoadingHistory, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SwapStateCopyWith<$Res>  {
  factory $SwapStateCopyWith(SwapState value, $Res Function(SwapState) _then) = _$SwapStateCopyWithImpl;
@useResult
$Res call({
 List<SwapToken> availableTokens, SwapToken? fromToken, SwapToken? toToken, double amount, SwapQuote? quote, SwapEntity? lastSwap, List<SwapEntity> swapHistory, bool isLoadingTokens, bool isLoadingQuote, bool isSwapping, bool isLoadingHistory, SwapFailure? failure
});


$SwapTokenCopyWith<$Res>? get fromToken;$SwapTokenCopyWith<$Res>? get toToken;$SwapQuoteCopyWith<$Res>? get quote;$SwapEntityCopyWith<$Res>? get lastSwap;$SwapFailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$SwapStateCopyWithImpl<$Res>
    implements $SwapStateCopyWith<$Res> {
  _$SwapStateCopyWithImpl(this._self, this._then);

  final SwapState _self;
  final $Res Function(SwapState) _then;

/// Create a copy of SwapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableTokens = null,Object? fromToken = freezed,Object? toToken = freezed,Object? amount = null,Object? quote = freezed,Object? lastSwap = freezed,Object? swapHistory = null,Object? isLoadingTokens = null,Object? isLoadingQuote = null,Object? isSwapping = null,Object? isLoadingHistory = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
availableTokens: null == availableTokens ? _self.availableTokens : availableTokens // ignore: cast_nullable_to_non_nullable
as List<SwapToken>,fromToken: freezed == fromToken ? _self.fromToken : fromToken // ignore: cast_nullable_to_non_nullable
as SwapToken?,toToken: freezed == toToken ? _self.toToken : toToken // ignore: cast_nullable_to_non_nullable
as SwapToken?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as SwapQuote?,lastSwap: freezed == lastSwap ? _self.lastSwap : lastSwap // ignore: cast_nullable_to_non_nullable
as SwapEntity?,swapHistory: null == swapHistory ? _self.swapHistory : swapHistory // ignore: cast_nullable_to_non_nullable
as List<SwapEntity>,isLoadingTokens: null == isLoadingTokens ? _self.isLoadingTokens : isLoadingTokens // ignore: cast_nullable_to_non_nullable
as bool,isLoadingQuote: null == isLoadingQuote ? _self.isLoadingQuote : isLoadingQuote // ignore: cast_nullable_to_non_nullable
as bool,isSwapping: null == isSwapping ? _self.isSwapping : isSwapping // ignore: cast_nullable_to_non_nullable
as bool,isLoadingHistory: null == isLoadingHistory ? _self.isLoadingHistory : isLoadingHistory // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as SwapFailure?,
  ));
}
/// Create a copy of SwapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<$Res>? get fromToken {
    if (_self.fromToken == null) {
    return null;
  }

  return $SwapTokenCopyWith<$Res>(_self.fromToken!, (value) {
    return _then(_self.copyWith(fromToken: value));
  });
}/// Create a copy of SwapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<$Res>? get toToken {
    if (_self.toToken == null) {
    return null;
  }

  return $SwapTokenCopyWith<$Res>(_self.toToken!, (value) {
    return _then(_self.copyWith(toToken: value));
  });
}/// Create a copy of SwapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapQuoteCopyWith<$Res>? get quote {
    if (_self.quote == null) {
    return null;
  }

  return $SwapQuoteCopyWith<$Res>(_self.quote!, (value) {
    return _then(_self.copyWith(quote: value));
  });
}/// Create a copy of SwapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapEntityCopyWith<$Res>? get lastSwap {
    if (_self.lastSwap == null) {
    return null;
  }

  return $SwapEntityCopyWith<$Res>(_self.lastSwap!, (value) {
    return _then(_self.copyWith(lastSwap: value));
  });
}/// Create a copy of SwapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapFailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $SwapFailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}


/// Adds pattern-matching-related methods to [SwapState].
extension SwapStatePatterns on SwapState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SwapState value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SwapState() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SwapState value)  initial,}){
final _that = this;
switch (_that) {
case _SwapState():
return initial(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SwapState value)?  initial,}){
final _that = this;
switch (_that) {
case _SwapState() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<SwapToken> availableTokens,  SwapToken? fromToken,  SwapToken? toToken,  double amount,  SwapQuote? quote,  SwapEntity? lastSwap,  List<SwapEntity> swapHistory,  bool isLoadingTokens,  bool isLoadingQuote,  bool isSwapping,  bool isLoadingHistory,  SwapFailure? failure)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SwapState() when initial != null:
return initial(_that.availableTokens,_that.fromToken,_that.toToken,_that.amount,_that.quote,_that.lastSwap,_that.swapHistory,_that.isLoadingTokens,_that.isLoadingQuote,_that.isSwapping,_that.isLoadingHistory,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<SwapToken> availableTokens,  SwapToken? fromToken,  SwapToken? toToken,  double amount,  SwapQuote? quote,  SwapEntity? lastSwap,  List<SwapEntity> swapHistory,  bool isLoadingTokens,  bool isLoadingQuote,  bool isSwapping,  bool isLoadingHistory,  SwapFailure? failure)  initial,}) {final _that = this;
switch (_that) {
case _SwapState():
return initial(_that.availableTokens,_that.fromToken,_that.toToken,_that.amount,_that.quote,_that.lastSwap,_that.swapHistory,_that.isLoadingTokens,_that.isLoadingQuote,_that.isSwapping,_that.isLoadingHistory,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<SwapToken> availableTokens,  SwapToken? fromToken,  SwapToken? toToken,  double amount,  SwapQuote? quote,  SwapEntity? lastSwap,  List<SwapEntity> swapHistory,  bool isLoadingTokens,  bool isLoadingQuote,  bool isSwapping,  bool isLoadingHistory,  SwapFailure? failure)?  initial,}) {final _that = this;
switch (_that) {
case _SwapState() when initial != null:
return initial(_that.availableTokens,_that.fromToken,_that.toToken,_that.amount,_that.quote,_that.lastSwap,_that.swapHistory,_that.isLoadingTokens,_that.isLoadingQuote,_that.isSwapping,_that.isLoadingHistory,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _SwapState extends SwapState {
  const _SwapState({final  List<SwapToken> availableTokens = const [], this.fromToken, this.toToken, this.amount = 0, this.quote, this.lastSwap, final  List<SwapEntity> swapHistory = const [], this.isLoadingTokens = false, this.isLoadingQuote = false, this.isSwapping = false, this.isLoadingHistory = false, this.failure}): _availableTokens = availableTokens,_swapHistory = swapHistory,super._();
  

 final  List<SwapToken> _availableTokens;
@override@JsonKey() List<SwapToken> get availableTokens {
  if (_availableTokens is EqualUnmodifiableListView) return _availableTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableTokens);
}

@override final  SwapToken? fromToken;
@override final  SwapToken? toToken;
@override@JsonKey() final  double amount;
@override final  SwapQuote? quote;
@override final  SwapEntity? lastSwap;
 final  List<SwapEntity> _swapHistory;
@override@JsonKey() List<SwapEntity> get swapHistory {
  if (_swapHistory is EqualUnmodifiableListView) return _swapHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_swapHistory);
}

@override@JsonKey() final  bool isLoadingTokens;
@override@JsonKey() final  bool isLoadingQuote;
@override@JsonKey() final  bool isSwapping;
@override@JsonKey() final  bool isLoadingHistory;
@override final  SwapFailure? failure;

/// Create a copy of SwapState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SwapStateCopyWith<_SwapState> get copyWith => __$SwapStateCopyWithImpl<_SwapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SwapState&&const DeepCollectionEquality().equals(other._availableTokens, _availableTokens)&&(identical(other.fromToken, fromToken) || other.fromToken == fromToken)&&(identical(other.toToken, toToken) || other.toToken == toToken)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.lastSwap, lastSwap) || other.lastSwap == lastSwap)&&const DeepCollectionEquality().equals(other._swapHistory, _swapHistory)&&(identical(other.isLoadingTokens, isLoadingTokens) || other.isLoadingTokens == isLoadingTokens)&&(identical(other.isLoadingQuote, isLoadingQuote) || other.isLoadingQuote == isLoadingQuote)&&(identical(other.isSwapping, isSwapping) || other.isSwapping == isSwapping)&&(identical(other.isLoadingHistory, isLoadingHistory) || other.isLoadingHistory == isLoadingHistory)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_availableTokens),fromToken,toToken,amount,quote,lastSwap,const DeepCollectionEquality().hash(_swapHistory),isLoadingTokens,isLoadingQuote,isSwapping,isLoadingHistory,failure);

@override
String toString() {
  return 'SwapState.initial(availableTokens: $availableTokens, fromToken: $fromToken, toToken: $toToken, amount: $amount, quote: $quote, lastSwap: $lastSwap, swapHistory: $swapHistory, isLoadingTokens: $isLoadingTokens, isLoadingQuote: $isLoadingQuote, isSwapping: $isSwapping, isLoadingHistory: $isLoadingHistory, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$SwapStateCopyWith<$Res> implements $SwapStateCopyWith<$Res> {
  factory _$SwapStateCopyWith(_SwapState value, $Res Function(_SwapState) _then) = __$SwapStateCopyWithImpl;
@override @useResult
$Res call({
 List<SwapToken> availableTokens, SwapToken? fromToken, SwapToken? toToken, double amount, SwapQuote? quote, SwapEntity? lastSwap, List<SwapEntity> swapHistory, bool isLoadingTokens, bool isLoadingQuote, bool isSwapping, bool isLoadingHistory, SwapFailure? failure
});


@override $SwapTokenCopyWith<$Res>? get fromToken;@override $SwapTokenCopyWith<$Res>? get toToken;@override $SwapQuoteCopyWith<$Res>? get quote;@override $SwapEntityCopyWith<$Res>? get lastSwap;@override $SwapFailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$SwapStateCopyWithImpl<$Res>
    implements _$SwapStateCopyWith<$Res> {
  __$SwapStateCopyWithImpl(this._self, this._then);

  final _SwapState _self;
  final $Res Function(_SwapState) _then;

/// Create a copy of SwapState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availableTokens = null,Object? fromToken = freezed,Object? toToken = freezed,Object? amount = null,Object? quote = freezed,Object? lastSwap = freezed,Object? swapHistory = null,Object? isLoadingTokens = null,Object? isLoadingQuote = null,Object? isSwapping = null,Object? isLoadingHistory = null,Object? failure = freezed,}) {
  return _then(_SwapState(
availableTokens: null == availableTokens ? _self._availableTokens : availableTokens // ignore: cast_nullable_to_non_nullable
as List<SwapToken>,fromToken: freezed == fromToken ? _self.fromToken : fromToken // ignore: cast_nullable_to_non_nullable
as SwapToken?,toToken: freezed == toToken ? _self.toToken : toToken // ignore: cast_nullable_to_non_nullable
as SwapToken?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as SwapQuote?,lastSwap: freezed == lastSwap ? _self.lastSwap : lastSwap // ignore: cast_nullable_to_non_nullable
as SwapEntity?,swapHistory: null == swapHistory ? _self._swapHistory : swapHistory // ignore: cast_nullable_to_non_nullable
as List<SwapEntity>,isLoadingTokens: null == isLoadingTokens ? _self.isLoadingTokens : isLoadingTokens // ignore: cast_nullable_to_non_nullable
as bool,isLoadingQuote: null == isLoadingQuote ? _self.isLoadingQuote : isLoadingQuote // ignore: cast_nullable_to_non_nullable
as bool,isSwapping: null == isSwapping ? _self.isSwapping : isSwapping // ignore: cast_nullable_to_non_nullable
as bool,isLoadingHistory: null == isLoadingHistory ? _self.isLoadingHistory : isLoadingHistory // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as SwapFailure?,
  ));
}

/// Create a copy of SwapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<$Res>? get fromToken {
    if (_self.fromToken == null) {
    return null;
  }

  return $SwapTokenCopyWith<$Res>(_self.fromToken!, (value) {
    return _then(_self.copyWith(fromToken: value));
  });
}/// Create a copy of SwapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapTokenCopyWith<$Res>? get toToken {
    if (_self.toToken == null) {
    return null;
  }

  return $SwapTokenCopyWith<$Res>(_self.toToken!, (value) {
    return _then(_self.copyWith(toToken: value));
  });
}/// Create a copy of SwapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapQuoteCopyWith<$Res>? get quote {
    if (_self.quote == null) {
    return null;
  }

  return $SwapQuoteCopyWith<$Res>(_self.quote!, (value) {
    return _then(_self.copyWith(quote: value));
  });
}/// Create a copy of SwapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapEntityCopyWith<$Res>? get lastSwap {
    if (_self.lastSwap == null) {
    return null;
  }

  return $SwapEntityCopyWith<$Res>(_self.lastSwap!, (value) {
    return _then(_self.copyWith(lastSwap: value));
  });
}/// Create a copy of SwapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SwapFailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $SwapFailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
