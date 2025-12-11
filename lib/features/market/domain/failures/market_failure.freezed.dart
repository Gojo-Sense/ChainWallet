// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MarketFailure {

 String get message;
/// Create a copy of MarketFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketFailureCopyWith<MarketFailure> get copyWith => _$MarketFailureCopyWithImpl<MarketFailure>(this as MarketFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MarketFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $MarketFailureCopyWith<$Res>  {
  factory $MarketFailureCopyWith(MarketFailure value, $Res Function(MarketFailure) _then) = _$MarketFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MarketFailureCopyWithImpl<$Res>
    implements $MarketFailureCopyWith<$Res> {
  _$MarketFailureCopyWithImpl(this._self, this._then);

  final MarketFailure _self;
  final $Res Function(MarketFailure) _then;

/// Create a copy of MarketFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketFailure].
extension MarketFailurePatterns on MarketFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MarketNetworkFailure value)?  networkError,TResult Function( RateLimitExceeded value)?  rateLimitExceeded,TResult Function( TokenNotFoundFailure value)?  tokenNotFound,TResult Function( InvalidResponseFailure value)?  invalidResponse,TResult Function( PaymentFailure value)?  paymentFailed,TResult Function( PaymentCancelled value)?  paymentCancelled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MarketNetworkFailure() when networkError != null:
return networkError(_that);case RateLimitExceeded() when rateLimitExceeded != null:
return rateLimitExceeded(_that);case TokenNotFoundFailure() when tokenNotFound != null:
return tokenNotFound(_that);case InvalidResponseFailure() when invalidResponse != null:
return invalidResponse(_that);case PaymentFailure() when paymentFailed != null:
return paymentFailed(_that);case PaymentCancelled() when paymentCancelled != null:
return paymentCancelled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MarketNetworkFailure value)  networkError,required TResult Function( RateLimitExceeded value)  rateLimitExceeded,required TResult Function( TokenNotFoundFailure value)  tokenNotFound,required TResult Function( InvalidResponseFailure value)  invalidResponse,required TResult Function( PaymentFailure value)  paymentFailed,required TResult Function( PaymentCancelled value)  paymentCancelled,}){
final _that = this;
switch (_that) {
case MarketNetworkFailure():
return networkError(_that);case RateLimitExceeded():
return rateLimitExceeded(_that);case TokenNotFoundFailure():
return tokenNotFound(_that);case InvalidResponseFailure():
return invalidResponse(_that);case PaymentFailure():
return paymentFailed(_that);case PaymentCancelled():
return paymentCancelled(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MarketNetworkFailure value)?  networkError,TResult? Function( RateLimitExceeded value)?  rateLimitExceeded,TResult? Function( TokenNotFoundFailure value)?  tokenNotFound,TResult? Function( InvalidResponseFailure value)?  invalidResponse,TResult? Function( PaymentFailure value)?  paymentFailed,TResult? Function( PaymentCancelled value)?  paymentCancelled,}){
final _that = this;
switch (_that) {
case MarketNetworkFailure() when networkError != null:
return networkError(_that);case RateLimitExceeded() when rateLimitExceeded != null:
return rateLimitExceeded(_that);case TokenNotFoundFailure() when tokenNotFound != null:
return tokenNotFound(_that);case InvalidResponseFailure() when invalidResponse != null:
return invalidResponse(_that);case PaymentFailure() when paymentFailed != null:
return paymentFailed(_that);case PaymentCancelled() when paymentCancelled != null:
return paymentCancelled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  networkError,TResult Function( String message)?  rateLimitExceeded,TResult Function( String message)?  tokenNotFound,TResult Function( String message)?  invalidResponse,TResult Function( String message)?  paymentFailed,TResult Function( String message)?  paymentCancelled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MarketNetworkFailure() when networkError != null:
return networkError(_that.message);case RateLimitExceeded() when rateLimitExceeded != null:
return rateLimitExceeded(_that.message);case TokenNotFoundFailure() when tokenNotFound != null:
return tokenNotFound(_that.message);case InvalidResponseFailure() when invalidResponse != null:
return invalidResponse(_that.message);case PaymentFailure() when paymentFailed != null:
return paymentFailed(_that.message);case PaymentCancelled() when paymentCancelled != null:
return paymentCancelled(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  networkError,required TResult Function( String message)  rateLimitExceeded,required TResult Function( String message)  tokenNotFound,required TResult Function( String message)  invalidResponse,required TResult Function( String message)  paymentFailed,required TResult Function( String message)  paymentCancelled,}) {final _that = this;
switch (_that) {
case MarketNetworkFailure():
return networkError(_that.message);case RateLimitExceeded():
return rateLimitExceeded(_that.message);case TokenNotFoundFailure():
return tokenNotFound(_that.message);case InvalidResponseFailure():
return invalidResponse(_that.message);case PaymentFailure():
return paymentFailed(_that.message);case PaymentCancelled():
return paymentCancelled(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  networkError,TResult? Function( String message)?  rateLimitExceeded,TResult? Function( String message)?  tokenNotFound,TResult? Function( String message)?  invalidResponse,TResult? Function( String message)?  paymentFailed,TResult? Function( String message)?  paymentCancelled,}) {final _that = this;
switch (_that) {
case MarketNetworkFailure() when networkError != null:
return networkError(_that.message);case RateLimitExceeded() when rateLimitExceeded != null:
return rateLimitExceeded(_that.message);case TokenNotFoundFailure() when tokenNotFound != null:
return tokenNotFound(_that.message);case InvalidResponseFailure() when invalidResponse != null:
return invalidResponse(_that.message);case PaymentFailure() when paymentFailed != null:
return paymentFailed(_that.message);case PaymentCancelled() when paymentCancelled != null:
return paymentCancelled(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class MarketNetworkFailure extends MarketFailure {
  const MarketNetworkFailure({this.message = 'Failed to fetch market data'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of MarketFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketNetworkFailureCopyWith<MarketNetworkFailure> get copyWith => _$MarketNetworkFailureCopyWithImpl<MarketNetworkFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketNetworkFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MarketFailure.networkError(message: $message)';
}


}

/// @nodoc
abstract mixin class $MarketNetworkFailureCopyWith<$Res> implements $MarketFailureCopyWith<$Res> {
  factory $MarketNetworkFailureCopyWith(MarketNetworkFailure value, $Res Function(MarketNetworkFailure) _then) = _$MarketNetworkFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MarketNetworkFailureCopyWithImpl<$Res>
    implements $MarketNetworkFailureCopyWith<$Res> {
  _$MarketNetworkFailureCopyWithImpl(this._self, this._then);

  final MarketNetworkFailure _self;
  final $Res Function(MarketNetworkFailure) _then;

/// Create a copy of MarketFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MarketNetworkFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RateLimitExceeded extends MarketFailure {
  const RateLimitExceeded({this.message = 'API rate limit exceeded. Please try again later.'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of MarketFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateLimitExceededCopyWith<RateLimitExceeded> get copyWith => _$RateLimitExceededCopyWithImpl<RateLimitExceeded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateLimitExceeded&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MarketFailure.rateLimitExceeded(message: $message)';
}


}

/// @nodoc
abstract mixin class $RateLimitExceededCopyWith<$Res> implements $MarketFailureCopyWith<$Res> {
  factory $RateLimitExceededCopyWith(RateLimitExceeded value, $Res Function(RateLimitExceeded) _then) = _$RateLimitExceededCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$RateLimitExceededCopyWithImpl<$Res>
    implements $RateLimitExceededCopyWith<$Res> {
  _$RateLimitExceededCopyWithImpl(this._self, this._then);

  final RateLimitExceeded _self;
  final $Res Function(RateLimitExceeded) _then;

/// Create a copy of MarketFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(RateLimitExceeded(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TokenNotFoundFailure extends MarketFailure {
  const TokenNotFoundFailure({this.message = 'Token not found'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of MarketFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenNotFoundFailureCopyWith<TokenNotFoundFailure> get copyWith => _$TokenNotFoundFailureCopyWithImpl<TokenNotFoundFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenNotFoundFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MarketFailure.tokenNotFound(message: $message)';
}


}

/// @nodoc
abstract mixin class $TokenNotFoundFailureCopyWith<$Res> implements $MarketFailureCopyWith<$Res> {
  factory $TokenNotFoundFailureCopyWith(TokenNotFoundFailure value, $Res Function(TokenNotFoundFailure) _then) = _$TokenNotFoundFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TokenNotFoundFailureCopyWithImpl<$Res>
    implements $TokenNotFoundFailureCopyWith<$Res> {
  _$TokenNotFoundFailureCopyWithImpl(this._self, this._then);

  final TokenNotFoundFailure _self;
  final $Res Function(TokenNotFoundFailure) _then;

/// Create a copy of MarketFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TokenNotFoundFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InvalidResponseFailure extends MarketFailure {
  const InvalidResponseFailure({this.message = 'Invalid response from server'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of MarketFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidResponseFailureCopyWith<InvalidResponseFailure> get copyWith => _$InvalidResponseFailureCopyWithImpl<InvalidResponseFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidResponseFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MarketFailure.invalidResponse(message: $message)';
}


}

/// @nodoc
abstract mixin class $InvalidResponseFailureCopyWith<$Res> implements $MarketFailureCopyWith<$Res> {
  factory $InvalidResponseFailureCopyWith(InvalidResponseFailure value, $Res Function(InvalidResponseFailure) _then) = _$InvalidResponseFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$InvalidResponseFailureCopyWithImpl<$Res>
    implements $InvalidResponseFailureCopyWith<$Res> {
  _$InvalidResponseFailureCopyWithImpl(this._self, this._then);

  final InvalidResponseFailure _self;
  final $Res Function(InvalidResponseFailure) _then;

/// Create a copy of MarketFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InvalidResponseFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PaymentFailure extends MarketFailure {
  const PaymentFailure({this.message = 'Payment failed'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of MarketFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentFailureCopyWith<PaymentFailure> get copyWith => _$PaymentFailureCopyWithImpl<PaymentFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MarketFailure.paymentFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class $PaymentFailureCopyWith<$Res> implements $MarketFailureCopyWith<$Res> {
  factory $PaymentFailureCopyWith(PaymentFailure value, $Res Function(PaymentFailure) _then) = _$PaymentFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PaymentFailureCopyWithImpl<$Res>
    implements $PaymentFailureCopyWith<$Res> {
  _$PaymentFailureCopyWithImpl(this._self, this._then);

  final PaymentFailure _self;
  final $Res Function(PaymentFailure) _then;

/// Create a copy of MarketFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PaymentFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PaymentCancelled extends MarketFailure {
  const PaymentCancelled({this.message = 'Payment was cancelled'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of MarketFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCancelledCopyWith<PaymentCancelled> get copyWith => _$PaymentCancelledCopyWithImpl<PaymentCancelled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentCancelled&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MarketFailure.paymentCancelled(message: $message)';
}


}

/// @nodoc
abstract mixin class $PaymentCancelledCopyWith<$Res> implements $MarketFailureCopyWith<$Res> {
  factory $PaymentCancelledCopyWith(PaymentCancelled value, $Res Function(PaymentCancelled) _then) = _$PaymentCancelledCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PaymentCancelledCopyWithImpl<$Res>
    implements $PaymentCancelledCopyWith<$Res> {
  _$PaymentCancelledCopyWithImpl(this._self, this._then);

  final PaymentCancelled _self;
  final $Res Function(PaymentCancelled) _then;

/// Create a copy of MarketFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PaymentCancelled(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
