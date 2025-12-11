// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'swap_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SwapFailure {

 String get message;
/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwapFailureCopyWith<SwapFailure> get copyWith => _$SwapFailureCopyWithImpl<SwapFailure>(this as SwapFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwapFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SwapFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $SwapFailureCopyWith<$Res>  {
  factory $SwapFailureCopyWith(SwapFailure value, $Res Function(SwapFailure) _then) = _$SwapFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SwapFailureCopyWithImpl<$Res>
    implements $SwapFailureCopyWith<$Res> {
  _$SwapFailureCopyWithImpl(this._self, this._then);

  final SwapFailure _self;
  final $Res Function(SwapFailure) _then;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SwapFailure].
extension SwapFailurePatterns on SwapFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InsufficientBalance value)?  insufficientBalance,TResult Function( InvalidAmount value)?  invalidAmount,TResult Function( QuoteFailed value)?  quoteFailed,TResult Function( SwapFailed value)?  swapFailed,TResult Function( QuoteExpired value)?  quoteExpired,TResult Function( SwapNetworkError value)?  networkError,TResult Function( SlippageExceeded value)?  slippageExceeded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InsufficientBalance() when insufficientBalance != null:
return insufficientBalance(_that);case InvalidAmount() when invalidAmount != null:
return invalidAmount(_that);case QuoteFailed() when quoteFailed != null:
return quoteFailed(_that);case SwapFailed() when swapFailed != null:
return swapFailed(_that);case QuoteExpired() when quoteExpired != null:
return quoteExpired(_that);case SwapNetworkError() when networkError != null:
return networkError(_that);case SlippageExceeded() when slippageExceeded != null:
return slippageExceeded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InsufficientBalance value)  insufficientBalance,required TResult Function( InvalidAmount value)  invalidAmount,required TResult Function( QuoteFailed value)  quoteFailed,required TResult Function( SwapFailed value)  swapFailed,required TResult Function( QuoteExpired value)  quoteExpired,required TResult Function( SwapNetworkError value)  networkError,required TResult Function( SlippageExceeded value)  slippageExceeded,}){
final _that = this;
switch (_that) {
case InsufficientBalance():
return insufficientBalance(_that);case InvalidAmount():
return invalidAmount(_that);case QuoteFailed():
return quoteFailed(_that);case SwapFailed():
return swapFailed(_that);case QuoteExpired():
return quoteExpired(_that);case SwapNetworkError():
return networkError(_that);case SlippageExceeded():
return slippageExceeded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InsufficientBalance value)?  insufficientBalance,TResult? Function( InvalidAmount value)?  invalidAmount,TResult? Function( QuoteFailed value)?  quoteFailed,TResult? Function( SwapFailed value)?  swapFailed,TResult? Function( QuoteExpired value)?  quoteExpired,TResult? Function( SwapNetworkError value)?  networkError,TResult? Function( SlippageExceeded value)?  slippageExceeded,}){
final _that = this;
switch (_that) {
case InsufficientBalance() when insufficientBalance != null:
return insufficientBalance(_that);case InvalidAmount() when invalidAmount != null:
return invalidAmount(_that);case QuoteFailed() when quoteFailed != null:
return quoteFailed(_that);case SwapFailed() when swapFailed != null:
return swapFailed(_that);case QuoteExpired() when quoteExpired != null:
return quoteExpired(_that);case SwapNetworkError() when networkError != null:
return networkError(_that);case SlippageExceeded() when slippageExceeded != null:
return slippageExceeded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  insufficientBalance,TResult Function( String message)?  invalidAmount,TResult Function( String message)?  quoteFailed,TResult Function( String message)?  swapFailed,TResult Function( String message)?  quoteExpired,TResult Function( String message)?  networkError,TResult Function( String message)?  slippageExceeded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InsufficientBalance() when insufficientBalance != null:
return insufficientBalance(_that.message);case InvalidAmount() when invalidAmount != null:
return invalidAmount(_that.message);case QuoteFailed() when quoteFailed != null:
return quoteFailed(_that.message);case SwapFailed() when swapFailed != null:
return swapFailed(_that.message);case QuoteExpired() when quoteExpired != null:
return quoteExpired(_that.message);case SwapNetworkError() when networkError != null:
return networkError(_that.message);case SlippageExceeded() when slippageExceeded != null:
return slippageExceeded(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  insufficientBalance,required TResult Function( String message)  invalidAmount,required TResult Function( String message)  quoteFailed,required TResult Function( String message)  swapFailed,required TResult Function( String message)  quoteExpired,required TResult Function( String message)  networkError,required TResult Function( String message)  slippageExceeded,}) {final _that = this;
switch (_that) {
case InsufficientBalance():
return insufficientBalance(_that.message);case InvalidAmount():
return invalidAmount(_that.message);case QuoteFailed():
return quoteFailed(_that.message);case SwapFailed():
return swapFailed(_that.message);case QuoteExpired():
return quoteExpired(_that.message);case SwapNetworkError():
return networkError(_that.message);case SlippageExceeded():
return slippageExceeded(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  insufficientBalance,TResult? Function( String message)?  invalidAmount,TResult? Function( String message)?  quoteFailed,TResult? Function( String message)?  swapFailed,TResult? Function( String message)?  quoteExpired,TResult? Function( String message)?  networkError,TResult? Function( String message)?  slippageExceeded,}) {final _that = this;
switch (_that) {
case InsufficientBalance() when insufficientBalance != null:
return insufficientBalance(_that.message);case InvalidAmount() when invalidAmount != null:
return invalidAmount(_that.message);case QuoteFailed() when quoteFailed != null:
return quoteFailed(_that.message);case SwapFailed() when swapFailed != null:
return swapFailed(_that.message);case QuoteExpired() when quoteExpired != null:
return quoteExpired(_that.message);case SwapNetworkError() when networkError != null:
return networkError(_that.message);case SlippageExceeded() when slippageExceeded != null:
return slippageExceeded(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class InsufficientBalance implements SwapFailure {
  const InsufficientBalance({this.message = 'Insufficient balance for this swap'});
  

@override@JsonKey() final  String message;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InsufficientBalanceCopyWith<InsufficientBalance> get copyWith => _$InsufficientBalanceCopyWithImpl<InsufficientBalance>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsufficientBalance&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SwapFailure.insufficientBalance(message: $message)';
}


}

/// @nodoc
abstract mixin class $InsufficientBalanceCopyWith<$Res> implements $SwapFailureCopyWith<$Res> {
  factory $InsufficientBalanceCopyWith(InsufficientBalance value, $Res Function(InsufficientBalance) _then) = _$InsufficientBalanceCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$InsufficientBalanceCopyWithImpl<$Res>
    implements $InsufficientBalanceCopyWith<$Res> {
  _$InsufficientBalanceCopyWithImpl(this._self, this._then);

  final InsufficientBalance _self;
  final $Res Function(InsufficientBalance) _then;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InsufficientBalance(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InvalidAmount implements SwapFailure {
  const InvalidAmount({this.message = 'Invalid swap amount'});
  

@override@JsonKey() final  String message;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidAmountCopyWith<InvalidAmount> get copyWith => _$InvalidAmountCopyWithImpl<InvalidAmount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidAmount&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SwapFailure.invalidAmount(message: $message)';
}


}

/// @nodoc
abstract mixin class $InvalidAmountCopyWith<$Res> implements $SwapFailureCopyWith<$Res> {
  factory $InvalidAmountCopyWith(InvalidAmount value, $Res Function(InvalidAmount) _then) = _$InvalidAmountCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$InvalidAmountCopyWithImpl<$Res>
    implements $InvalidAmountCopyWith<$Res> {
  _$InvalidAmountCopyWithImpl(this._self, this._then);

  final InvalidAmount _self;
  final $Res Function(InvalidAmount) _then;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InvalidAmount(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class QuoteFailed implements SwapFailure {
  const QuoteFailed({this.message = 'Failed to get swap quote'});
  

@override@JsonKey() final  String message;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteFailedCopyWith<QuoteFailed> get copyWith => _$QuoteFailedCopyWithImpl<QuoteFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SwapFailure.quoteFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class $QuoteFailedCopyWith<$Res> implements $SwapFailureCopyWith<$Res> {
  factory $QuoteFailedCopyWith(QuoteFailed value, $Res Function(QuoteFailed) _then) = _$QuoteFailedCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$QuoteFailedCopyWithImpl<$Res>
    implements $QuoteFailedCopyWith<$Res> {
  _$QuoteFailedCopyWithImpl(this._self, this._then);

  final QuoteFailed _self;
  final $Res Function(QuoteFailed) _then;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(QuoteFailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SwapFailed implements SwapFailure {
  const SwapFailed({this.message = 'Swap transaction failed'});
  

@override@JsonKey() final  String message;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwapFailedCopyWith<SwapFailed> get copyWith => _$SwapFailedCopyWithImpl<SwapFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwapFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SwapFailure.swapFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class $SwapFailedCopyWith<$Res> implements $SwapFailureCopyWith<$Res> {
  factory $SwapFailedCopyWith(SwapFailed value, $Res Function(SwapFailed) _then) = _$SwapFailedCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SwapFailedCopyWithImpl<$Res>
    implements $SwapFailedCopyWith<$Res> {
  _$SwapFailedCopyWithImpl(this._self, this._then);

  final SwapFailed _self;
  final $Res Function(SwapFailed) _then;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SwapFailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class QuoteExpired implements SwapFailure {
  const QuoteExpired({this.message = 'Swap quote has expired'});
  

@override@JsonKey() final  String message;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteExpiredCopyWith<QuoteExpired> get copyWith => _$QuoteExpiredCopyWithImpl<QuoteExpired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteExpired&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SwapFailure.quoteExpired(message: $message)';
}


}

/// @nodoc
abstract mixin class $QuoteExpiredCopyWith<$Res> implements $SwapFailureCopyWith<$Res> {
  factory $QuoteExpiredCopyWith(QuoteExpired value, $Res Function(QuoteExpired) _then) = _$QuoteExpiredCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$QuoteExpiredCopyWithImpl<$Res>
    implements $QuoteExpiredCopyWith<$Res> {
  _$QuoteExpiredCopyWithImpl(this._self, this._then);

  final QuoteExpired _self;
  final $Res Function(QuoteExpired) _then;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(QuoteExpired(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SwapNetworkError implements SwapFailure {
  const SwapNetworkError({this.message = 'Network error occurred'});
  

@override@JsonKey() final  String message;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwapNetworkErrorCopyWith<SwapNetworkError> get copyWith => _$SwapNetworkErrorCopyWithImpl<SwapNetworkError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwapNetworkError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SwapFailure.networkError(message: $message)';
}


}

/// @nodoc
abstract mixin class $SwapNetworkErrorCopyWith<$Res> implements $SwapFailureCopyWith<$Res> {
  factory $SwapNetworkErrorCopyWith(SwapNetworkError value, $Res Function(SwapNetworkError) _then) = _$SwapNetworkErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SwapNetworkErrorCopyWithImpl<$Res>
    implements $SwapNetworkErrorCopyWith<$Res> {
  _$SwapNetworkErrorCopyWithImpl(this._self, this._then);

  final SwapNetworkError _self;
  final $Res Function(SwapNetworkError) _then;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SwapNetworkError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SlippageExceeded implements SwapFailure {
  const SlippageExceeded({this.message = 'Price slippage exceeded tolerance'});
  

@override@JsonKey() final  String message;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlippageExceededCopyWith<SlippageExceeded> get copyWith => _$SlippageExceededCopyWithImpl<SlippageExceeded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlippageExceeded&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SwapFailure.slippageExceeded(message: $message)';
}


}

/// @nodoc
abstract mixin class $SlippageExceededCopyWith<$Res> implements $SwapFailureCopyWith<$Res> {
  factory $SlippageExceededCopyWith(SlippageExceeded value, $Res Function(SlippageExceeded) _then) = _$SlippageExceededCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SlippageExceededCopyWithImpl<$Res>
    implements $SlippageExceededCopyWith<$Res> {
  _$SlippageExceededCopyWithImpl(this._self, this._then);

  final SlippageExceeded _self;
  final $Res Function(SlippageExceeded) _then;

/// Create a copy of SwapFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SlippageExceeded(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
