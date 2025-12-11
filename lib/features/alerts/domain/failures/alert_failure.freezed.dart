// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlertFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AlertFailure()';
}


}

/// @nodoc
class $AlertFailureCopyWith<$Res>  {
$AlertFailureCopyWith(AlertFailure _, $Res Function(AlertFailure) __);
}


/// Adds pattern-matching-related methods to [AlertFailure].
extension AlertFailurePatterns on AlertFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AlertStorageError value)?  storageError,TResult Function( AlertNotFound value)?  notFound,TResult Function( AlertLimitReached value)?  limitReached,TResult Function( AlertNotificationError value)?  notificationError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AlertStorageError() when storageError != null:
return storageError(_that);case AlertNotFound() when notFound != null:
return notFound(_that);case AlertLimitReached() when limitReached != null:
return limitReached(_that);case AlertNotificationError() when notificationError != null:
return notificationError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AlertStorageError value)  storageError,required TResult Function( AlertNotFound value)  notFound,required TResult Function( AlertLimitReached value)  limitReached,required TResult Function( AlertNotificationError value)  notificationError,}){
final _that = this;
switch (_that) {
case AlertStorageError():
return storageError(_that);case AlertNotFound():
return notFound(_that);case AlertLimitReached():
return limitReached(_that);case AlertNotificationError():
return notificationError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AlertStorageError value)?  storageError,TResult? Function( AlertNotFound value)?  notFound,TResult? Function( AlertLimitReached value)?  limitReached,TResult? Function( AlertNotificationError value)?  notificationError,}){
final _that = this;
switch (_that) {
case AlertStorageError() when storageError != null:
return storageError(_that);case AlertNotFound() when notFound != null:
return notFound(_that);case AlertLimitReached() when limitReached != null:
return limitReached(_that);case AlertNotificationError() when notificationError != null:
return notificationError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  storageError,TResult Function( String alertId)?  notFound,TResult Function( int maxAlerts)?  limitReached,TResult Function( String message)?  notificationError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AlertStorageError() when storageError != null:
return storageError(_that.message);case AlertNotFound() when notFound != null:
return notFound(_that.alertId);case AlertLimitReached() when limitReached != null:
return limitReached(_that.maxAlerts);case AlertNotificationError() when notificationError != null:
return notificationError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  storageError,required TResult Function( String alertId)  notFound,required TResult Function( int maxAlerts)  limitReached,required TResult Function( String message)  notificationError,}) {final _that = this;
switch (_that) {
case AlertStorageError():
return storageError(_that.message);case AlertNotFound():
return notFound(_that.alertId);case AlertLimitReached():
return limitReached(_that.maxAlerts);case AlertNotificationError():
return notificationError(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  storageError,TResult? Function( String alertId)?  notFound,TResult? Function( int maxAlerts)?  limitReached,TResult? Function( String message)?  notificationError,}) {final _that = this;
switch (_that) {
case AlertStorageError() when storageError != null:
return storageError(_that.message);case AlertNotFound() when notFound != null:
return notFound(_that.alertId);case AlertLimitReached() when limitReached != null:
return limitReached(_that.maxAlerts);case AlertNotificationError() when notificationError != null:
return notificationError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AlertStorageError implements AlertFailure {
  const AlertStorageError({required this.message});
  

 final  String message;

/// Create a copy of AlertFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertStorageErrorCopyWith<AlertStorageError> get copyWith => _$AlertStorageErrorCopyWithImpl<AlertStorageError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertStorageError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AlertFailure.storageError(message: $message)';
}


}

/// @nodoc
abstract mixin class $AlertStorageErrorCopyWith<$Res> implements $AlertFailureCopyWith<$Res> {
  factory $AlertStorageErrorCopyWith(AlertStorageError value, $Res Function(AlertStorageError) _then) = _$AlertStorageErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AlertStorageErrorCopyWithImpl<$Res>
    implements $AlertStorageErrorCopyWith<$Res> {
  _$AlertStorageErrorCopyWithImpl(this._self, this._then);

  final AlertStorageError _self;
  final $Res Function(AlertStorageError) _then;

/// Create a copy of AlertFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AlertStorageError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AlertNotFound implements AlertFailure {
  const AlertNotFound({required this.alertId});
  

 final  String alertId;

/// Create a copy of AlertFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertNotFoundCopyWith<AlertNotFound> get copyWith => _$AlertNotFoundCopyWithImpl<AlertNotFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertNotFound&&(identical(other.alertId, alertId) || other.alertId == alertId));
}


@override
int get hashCode => Object.hash(runtimeType,alertId);

@override
String toString() {
  return 'AlertFailure.notFound(alertId: $alertId)';
}


}

/// @nodoc
abstract mixin class $AlertNotFoundCopyWith<$Res> implements $AlertFailureCopyWith<$Res> {
  factory $AlertNotFoundCopyWith(AlertNotFound value, $Res Function(AlertNotFound) _then) = _$AlertNotFoundCopyWithImpl;
@useResult
$Res call({
 String alertId
});




}
/// @nodoc
class _$AlertNotFoundCopyWithImpl<$Res>
    implements $AlertNotFoundCopyWith<$Res> {
  _$AlertNotFoundCopyWithImpl(this._self, this._then);

  final AlertNotFound _self;
  final $Res Function(AlertNotFound) _then;

/// Create a copy of AlertFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alertId = null,}) {
  return _then(AlertNotFound(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AlertLimitReached implements AlertFailure {
  const AlertLimitReached({required this.maxAlerts});
  

 final  int maxAlerts;

/// Create a copy of AlertFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertLimitReachedCopyWith<AlertLimitReached> get copyWith => _$AlertLimitReachedCopyWithImpl<AlertLimitReached>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertLimitReached&&(identical(other.maxAlerts, maxAlerts) || other.maxAlerts == maxAlerts));
}


@override
int get hashCode => Object.hash(runtimeType,maxAlerts);

@override
String toString() {
  return 'AlertFailure.limitReached(maxAlerts: $maxAlerts)';
}


}

/// @nodoc
abstract mixin class $AlertLimitReachedCopyWith<$Res> implements $AlertFailureCopyWith<$Res> {
  factory $AlertLimitReachedCopyWith(AlertLimitReached value, $Res Function(AlertLimitReached) _then) = _$AlertLimitReachedCopyWithImpl;
@useResult
$Res call({
 int maxAlerts
});




}
/// @nodoc
class _$AlertLimitReachedCopyWithImpl<$Res>
    implements $AlertLimitReachedCopyWith<$Res> {
  _$AlertLimitReachedCopyWithImpl(this._self, this._then);

  final AlertLimitReached _self;
  final $Res Function(AlertLimitReached) _then;

/// Create a copy of AlertFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? maxAlerts = null,}) {
  return _then(AlertLimitReached(
maxAlerts: null == maxAlerts ? _self.maxAlerts : maxAlerts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AlertNotificationError implements AlertFailure {
  const AlertNotificationError({required this.message});
  

 final  String message;

/// Create a copy of AlertFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertNotificationErrorCopyWith<AlertNotificationError> get copyWith => _$AlertNotificationErrorCopyWithImpl<AlertNotificationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertNotificationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AlertFailure.notificationError(message: $message)';
}


}

/// @nodoc
abstract mixin class $AlertNotificationErrorCopyWith<$Res> implements $AlertFailureCopyWith<$Res> {
  factory $AlertNotificationErrorCopyWith(AlertNotificationError value, $Res Function(AlertNotificationError) _then) = _$AlertNotificationErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AlertNotificationErrorCopyWithImpl<$Res>
    implements $AlertNotificationErrorCopyWith<$Res> {
  _$AlertNotificationErrorCopyWithImpl(this._self, this._then);

  final AlertNotificationError _self;
  final $Res Function(AlertNotificationError) _then;

/// Create a copy of AlertFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AlertNotificationError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
