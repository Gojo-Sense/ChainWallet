// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionFailure {

 String get message;
/// Create a copy of TransactionFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionFailureCopyWith<TransactionFailure> get copyWith => _$TransactionFailureCopyWithImpl<TransactionFailure>(this as TransactionFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TransactionFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $TransactionFailureCopyWith<$Res>  {
  factory $TransactionFailureCopyWith(TransactionFailure value, $Res Function(TransactionFailure) _then) = _$TransactionFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TransactionFailureCopyWithImpl<$Res>
    implements $TransactionFailureCopyWith<$Res> {
  _$TransactionFailureCopyWithImpl(this._self, this._then);

  final TransactionFailure _self;
  final $Res Function(TransactionFailure) _then;

/// Create a copy of TransactionFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionFailure].
extension TransactionFailurePatterns on TransactionFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TransactionFetchError value)?  fetchError,TResult Function( TransactionStorageError value)?  storageError,TResult Function( TransactionNotFound value)?  notFound,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TransactionFetchError() when fetchError != null:
return fetchError(_that);case TransactionStorageError() when storageError != null:
return storageError(_that);case TransactionNotFound() when notFound != null:
return notFound(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TransactionFetchError value)  fetchError,required TResult Function( TransactionStorageError value)  storageError,required TResult Function( TransactionNotFound value)  notFound,}){
final _that = this;
switch (_that) {
case TransactionFetchError():
return fetchError(_that);case TransactionStorageError():
return storageError(_that);case TransactionNotFound():
return notFound(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TransactionFetchError value)?  fetchError,TResult? Function( TransactionStorageError value)?  storageError,TResult? Function( TransactionNotFound value)?  notFound,}){
final _that = this;
switch (_that) {
case TransactionFetchError() when fetchError != null:
return fetchError(_that);case TransactionStorageError() when storageError != null:
return storageError(_that);case TransactionNotFound() when notFound != null:
return notFound(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  fetchError,TResult Function( String message)?  storageError,TResult Function( String message)?  notFound,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TransactionFetchError() when fetchError != null:
return fetchError(_that.message);case TransactionStorageError() when storageError != null:
return storageError(_that.message);case TransactionNotFound() when notFound != null:
return notFound(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  fetchError,required TResult Function( String message)  storageError,required TResult Function( String message)  notFound,}) {final _that = this;
switch (_that) {
case TransactionFetchError():
return fetchError(_that.message);case TransactionStorageError():
return storageError(_that.message);case TransactionNotFound():
return notFound(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  fetchError,TResult? Function( String message)?  storageError,TResult? Function( String message)?  notFound,}) {final _that = this;
switch (_that) {
case TransactionFetchError() when fetchError != null:
return fetchError(_that.message);case TransactionStorageError() when storageError != null:
return storageError(_that.message);case TransactionNotFound() when notFound != null:
return notFound(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TransactionFetchError implements TransactionFailure {
  const TransactionFetchError({this.message = 'Failed to fetch transactions'});
  

@override@JsonKey() final  String message;

/// Create a copy of TransactionFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionFetchErrorCopyWith<TransactionFetchError> get copyWith => _$TransactionFetchErrorCopyWithImpl<TransactionFetchError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionFetchError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TransactionFailure.fetchError(message: $message)';
}


}

/// @nodoc
abstract mixin class $TransactionFetchErrorCopyWith<$Res> implements $TransactionFailureCopyWith<$Res> {
  factory $TransactionFetchErrorCopyWith(TransactionFetchError value, $Res Function(TransactionFetchError) _then) = _$TransactionFetchErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TransactionFetchErrorCopyWithImpl<$Res>
    implements $TransactionFetchErrorCopyWith<$Res> {
  _$TransactionFetchErrorCopyWithImpl(this._self, this._then);

  final TransactionFetchError _self;
  final $Res Function(TransactionFetchError) _then;

/// Create a copy of TransactionFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TransactionFetchError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TransactionStorageError implements TransactionFailure {
  const TransactionStorageError({this.message = 'Failed to save transaction'});
  

@override@JsonKey() final  String message;

/// Create a copy of TransactionFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionStorageErrorCopyWith<TransactionStorageError> get copyWith => _$TransactionStorageErrorCopyWithImpl<TransactionStorageError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionStorageError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TransactionFailure.storageError(message: $message)';
}


}

/// @nodoc
abstract mixin class $TransactionStorageErrorCopyWith<$Res> implements $TransactionFailureCopyWith<$Res> {
  factory $TransactionStorageErrorCopyWith(TransactionStorageError value, $Res Function(TransactionStorageError) _then) = _$TransactionStorageErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TransactionStorageErrorCopyWithImpl<$Res>
    implements $TransactionStorageErrorCopyWith<$Res> {
  _$TransactionStorageErrorCopyWithImpl(this._self, this._then);

  final TransactionStorageError _self;
  final $Res Function(TransactionStorageError) _then;

/// Create a copy of TransactionFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TransactionStorageError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TransactionNotFound implements TransactionFailure {
  const TransactionNotFound({this.message = 'Transaction not found'});
  

@override@JsonKey() final  String message;

/// Create a copy of TransactionFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionNotFoundCopyWith<TransactionNotFound> get copyWith => _$TransactionNotFoundCopyWithImpl<TransactionNotFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionNotFound&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TransactionFailure.notFound(message: $message)';
}


}

/// @nodoc
abstract mixin class $TransactionNotFoundCopyWith<$Res> implements $TransactionFailureCopyWith<$Res> {
  factory $TransactionNotFoundCopyWith(TransactionNotFound value, $Res Function(TransactionNotFound) _then) = _$TransactionNotFoundCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TransactionNotFoundCopyWithImpl<$Res>
    implements $TransactionNotFoundCopyWith<$Res> {
  _$TransactionNotFoundCopyWithImpl(this._self, this._then);

  final TransactionNotFound _self;
  final $Res Function(TransactionNotFound) _then;

/// Create a copy of TransactionFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TransactionNotFound(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
