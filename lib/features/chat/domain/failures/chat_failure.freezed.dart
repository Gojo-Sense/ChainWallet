// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatFailure()';
}


}

/// @nodoc
class $ChatFailureCopyWith<$Res>  {
$ChatFailureCopyWith(ChatFailure _, $Res Function(ChatFailure) __);
}


/// Adds pattern-matching-related methods to [ChatFailure].
extension ChatFailurePatterns on ChatFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatParseError value)?  parseError,TResult Function( ChatApiError value)?  apiError,TResult Function( ChatUnknownCommand value)?  unknownCommand,TResult Function( ChatInvalidAddress value)?  invalidAddress,TResult Function( ChatInsufficientBalance value)?  insufficientBalance,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatParseError() when parseError != null:
return parseError(_that);case ChatApiError() when apiError != null:
return apiError(_that);case ChatUnknownCommand() when unknownCommand != null:
return unknownCommand(_that);case ChatInvalidAddress() when invalidAddress != null:
return invalidAddress(_that);case ChatInsufficientBalance() when insufficientBalance != null:
return insufficientBalance(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatParseError value)  parseError,required TResult Function( ChatApiError value)  apiError,required TResult Function( ChatUnknownCommand value)  unknownCommand,required TResult Function( ChatInvalidAddress value)  invalidAddress,required TResult Function( ChatInsufficientBalance value)  insufficientBalance,}){
final _that = this;
switch (_that) {
case ChatParseError():
return parseError(_that);case ChatApiError():
return apiError(_that);case ChatUnknownCommand():
return unknownCommand(_that);case ChatInvalidAddress():
return invalidAddress(_that);case ChatInsufficientBalance():
return insufficientBalance(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatParseError value)?  parseError,TResult? Function( ChatApiError value)?  apiError,TResult? Function( ChatUnknownCommand value)?  unknownCommand,TResult? Function( ChatInvalidAddress value)?  invalidAddress,TResult? Function( ChatInsufficientBalance value)?  insufficientBalance,}){
final _that = this;
switch (_that) {
case ChatParseError() when parseError != null:
return parseError(_that);case ChatApiError() when apiError != null:
return apiError(_that);case ChatUnknownCommand() when unknownCommand != null:
return unknownCommand(_that);case ChatInvalidAddress() when invalidAddress != null:
return invalidAddress(_that);case ChatInsufficientBalance() when insufficientBalance != null:
return insufficientBalance(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  parseError,TResult Function( String message)?  apiError,TResult Function( String input)?  unknownCommand,TResult Function( String address)?  invalidAddress,TResult Function( String token,  double required,  double available)?  insufficientBalance,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatParseError() when parseError != null:
return parseError(_that.message);case ChatApiError() when apiError != null:
return apiError(_that.message);case ChatUnknownCommand() when unknownCommand != null:
return unknownCommand(_that.input);case ChatInvalidAddress() when invalidAddress != null:
return invalidAddress(_that.address);case ChatInsufficientBalance() when insufficientBalance != null:
return insufficientBalance(_that.token,_that.required,_that.available);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  parseError,required TResult Function( String message)  apiError,required TResult Function( String input)  unknownCommand,required TResult Function( String address)  invalidAddress,required TResult Function( String token,  double required,  double available)  insufficientBalance,}) {final _that = this;
switch (_that) {
case ChatParseError():
return parseError(_that.message);case ChatApiError():
return apiError(_that.message);case ChatUnknownCommand():
return unknownCommand(_that.input);case ChatInvalidAddress():
return invalidAddress(_that.address);case ChatInsufficientBalance():
return insufficientBalance(_that.token,_that.required,_that.available);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  parseError,TResult? Function( String message)?  apiError,TResult? Function( String input)?  unknownCommand,TResult? Function( String address)?  invalidAddress,TResult? Function( String token,  double required,  double available)?  insufficientBalance,}) {final _that = this;
switch (_that) {
case ChatParseError() when parseError != null:
return parseError(_that.message);case ChatApiError() when apiError != null:
return apiError(_that.message);case ChatUnknownCommand() when unknownCommand != null:
return unknownCommand(_that.input);case ChatInvalidAddress() when invalidAddress != null:
return invalidAddress(_that.address);case ChatInsufficientBalance() when insufficientBalance != null:
return insufficientBalance(_that.token,_that.required,_that.available);case _:
  return null;

}
}

}

/// @nodoc


class ChatParseError implements ChatFailure {
  const ChatParseError({required this.message});
  

 final  String message;

/// Create a copy of ChatFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatParseErrorCopyWith<ChatParseError> get copyWith => _$ChatParseErrorCopyWithImpl<ChatParseError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatParseError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatFailure.parseError(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatParseErrorCopyWith<$Res> implements $ChatFailureCopyWith<$Res> {
  factory $ChatParseErrorCopyWith(ChatParseError value, $Res Function(ChatParseError) _then) = _$ChatParseErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ChatParseErrorCopyWithImpl<$Res>
    implements $ChatParseErrorCopyWith<$Res> {
  _$ChatParseErrorCopyWithImpl(this._self, this._then);

  final ChatParseError _self;
  final $Res Function(ChatParseError) _then;

/// Create a copy of ChatFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ChatParseError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatApiError implements ChatFailure {
  const ChatApiError({required this.message});
  

 final  String message;

/// Create a copy of ChatFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatApiErrorCopyWith<ChatApiError> get copyWith => _$ChatApiErrorCopyWithImpl<ChatApiError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatApiError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatFailure.apiError(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatApiErrorCopyWith<$Res> implements $ChatFailureCopyWith<$Res> {
  factory $ChatApiErrorCopyWith(ChatApiError value, $Res Function(ChatApiError) _then) = _$ChatApiErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ChatApiErrorCopyWithImpl<$Res>
    implements $ChatApiErrorCopyWith<$Res> {
  _$ChatApiErrorCopyWithImpl(this._self, this._then);

  final ChatApiError _self;
  final $Res Function(ChatApiError) _then;

/// Create a copy of ChatFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ChatApiError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatUnknownCommand implements ChatFailure {
  const ChatUnknownCommand({required this.input});
  

 final  String input;

/// Create a copy of ChatFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatUnknownCommandCopyWith<ChatUnknownCommand> get copyWith => _$ChatUnknownCommandCopyWithImpl<ChatUnknownCommand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatUnknownCommand&&(identical(other.input, input) || other.input == input));
}


@override
int get hashCode => Object.hash(runtimeType,input);

@override
String toString() {
  return 'ChatFailure.unknownCommand(input: $input)';
}


}

/// @nodoc
abstract mixin class $ChatUnknownCommandCopyWith<$Res> implements $ChatFailureCopyWith<$Res> {
  factory $ChatUnknownCommandCopyWith(ChatUnknownCommand value, $Res Function(ChatUnknownCommand) _then) = _$ChatUnknownCommandCopyWithImpl;
@useResult
$Res call({
 String input
});




}
/// @nodoc
class _$ChatUnknownCommandCopyWithImpl<$Res>
    implements $ChatUnknownCommandCopyWith<$Res> {
  _$ChatUnknownCommandCopyWithImpl(this._self, this._then);

  final ChatUnknownCommand _self;
  final $Res Function(ChatUnknownCommand) _then;

/// Create a copy of ChatFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? input = null,}) {
  return _then(ChatUnknownCommand(
input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatInvalidAddress implements ChatFailure {
  const ChatInvalidAddress({required this.address});
  

 final  String address;

/// Create a copy of ChatFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatInvalidAddressCopyWith<ChatInvalidAddress> get copyWith => _$ChatInvalidAddressCopyWithImpl<ChatInvalidAddress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatInvalidAddress&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,address);

@override
String toString() {
  return 'ChatFailure.invalidAddress(address: $address)';
}


}

/// @nodoc
abstract mixin class $ChatInvalidAddressCopyWith<$Res> implements $ChatFailureCopyWith<$Res> {
  factory $ChatInvalidAddressCopyWith(ChatInvalidAddress value, $Res Function(ChatInvalidAddress) _then) = _$ChatInvalidAddressCopyWithImpl;
@useResult
$Res call({
 String address
});




}
/// @nodoc
class _$ChatInvalidAddressCopyWithImpl<$Res>
    implements $ChatInvalidAddressCopyWith<$Res> {
  _$ChatInvalidAddressCopyWithImpl(this._self, this._then);

  final ChatInvalidAddress _self;
  final $Res Function(ChatInvalidAddress) _then;

/// Create a copy of ChatFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,}) {
  return _then(ChatInvalidAddress(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatInsufficientBalance implements ChatFailure {
  const ChatInsufficientBalance({required this.token, required this.required, required this.available});
  

 final  String token;
 final  double required;
 final  double available;

/// Create a copy of ChatFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatInsufficientBalanceCopyWith<ChatInsufficientBalance> get copyWith => _$ChatInsufficientBalanceCopyWithImpl<ChatInsufficientBalance>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatInsufficientBalance&&(identical(other.token, token) || other.token == token)&&(identical(other.required, required) || other.required == required)&&(identical(other.available, available) || other.available == available));
}


@override
int get hashCode => Object.hash(runtimeType,token,required,available);

@override
String toString() {
  return 'ChatFailure.insufficientBalance(token: $token, required: $required, available: $available)';
}


}

/// @nodoc
abstract mixin class $ChatInsufficientBalanceCopyWith<$Res> implements $ChatFailureCopyWith<$Res> {
  factory $ChatInsufficientBalanceCopyWith(ChatInsufficientBalance value, $Res Function(ChatInsufficientBalance) _then) = _$ChatInsufficientBalanceCopyWithImpl;
@useResult
$Res call({
 String token, double required, double available
});




}
/// @nodoc
class _$ChatInsufficientBalanceCopyWithImpl<$Res>
    implements $ChatInsufficientBalanceCopyWith<$Res> {
  _$ChatInsufficientBalanceCopyWithImpl(this._self, this._then);

  final ChatInsufficientBalance _self;
  final $Res Function(ChatInsufficientBalance) _then;

/// Create a copy of ChatFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,Object? required = null,Object? available = null,}) {
  return _then(ChatInsufficientBalance(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,required: null == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as double,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
