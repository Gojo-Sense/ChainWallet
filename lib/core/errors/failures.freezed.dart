// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoreFailure {

 String get message;
/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoreFailureCopyWith<CoreFailure> get copyWith => _$CoreFailureCopyWithImpl<CoreFailure>(this as CoreFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoreFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CoreFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $CoreFailureCopyWith<$Res>  {
  factory $CoreFailureCopyWith(CoreFailure value, $Res Function(CoreFailure) _then) = _$CoreFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CoreFailureCopyWithImpl<$Res>
    implements $CoreFailureCopyWith<$Res> {
  _$CoreFailureCopyWithImpl(this._self, this._then);

  final CoreFailure _self;
  final $Res Function(CoreFailure) _then;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CoreFailure].
extension CoreFailurePatterns on CoreFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UnexpectedFailure value)?  unexpected,TResult Function( StorageFailure value)?  storage,TResult Function( NetworkFailure value)?  network,TResult Function( ServerFailure value)?  server,TResult Function( InvalidDataFailure value)?  invalidData,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case StorageFailure() when storage != null:
return storage(_that);case NetworkFailure() when network != null:
return network(_that);case ServerFailure() when server != null:
return server(_that);case InvalidDataFailure() when invalidData != null:
return invalidData(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UnexpectedFailure value)  unexpected,required TResult Function( StorageFailure value)  storage,required TResult Function( NetworkFailure value)  network,required TResult Function( ServerFailure value)  server,required TResult Function( InvalidDataFailure value)  invalidData,}){
final _that = this;
switch (_that) {
case UnexpectedFailure():
return unexpected(_that);case StorageFailure():
return storage(_that);case NetworkFailure():
return network(_that);case ServerFailure():
return server(_that);case InvalidDataFailure():
return invalidData(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UnexpectedFailure value)?  unexpected,TResult? Function( StorageFailure value)?  storage,TResult? Function( NetworkFailure value)?  network,TResult? Function( ServerFailure value)?  server,TResult? Function( InvalidDataFailure value)?  invalidData,}){
final _that = this;
switch (_that) {
case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case StorageFailure() when storage != null:
return storage(_that);case NetworkFailure() when network != null:
return network(_that);case ServerFailure() when server != null:
return server(_that);case InvalidDataFailure() when invalidData != null:
return invalidData(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  unexpected,TResult Function( String message)?  storage,TResult Function( String message)?  network,TResult Function( String message,  int? statusCode)?  server,TResult Function( String message)?  invalidData,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UnexpectedFailure() when unexpected != null:
return unexpected(_that.message);case StorageFailure() when storage != null:
return storage(_that.message);case NetworkFailure() when network != null:
return network(_that.message);case ServerFailure() when server != null:
return server(_that.message,_that.statusCode);case InvalidDataFailure() when invalidData != null:
return invalidData(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  unexpected,required TResult Function( String message)  storage,required TResult Function( String message)  network,required TResult Function( String message,  int? statusCode)  server,required TResult Function( String message)  invalidData,}) {final _that = this;
switch (_that) {
case UnexpectedFailure():
return unexpected(_that.message);case StorageFailure():
return storage(_that.message);case NetworkFailure():
return network(_that.message);case ServerFailure():
return server(_that.message,_that.statusCode);case InvalidDataFailure():
return invalidData(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  unexpected,TResult? Function( String message)?  storage,TResult? Function( String message)?  network,TResult? Function( String message,  int? statusCode)?  server,TResult? Function( String message)?  invalidData,}) {final _that = this;
switch (_that) {
case UnexpectedFailure() when unexpected != null:
return unexpected(_that.message);case StorageFailure() when storage != null:
return storage(_that.message);case NetworkFailure() when network != null:
return network(_that.message);case ServerFailure() when server != null:
return server(_that.message,_that.statusCode);case InvalidDataFailure() when invalidData != null:
return invalidData(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class UnexpectedFailure extends CoreFailure {
  const UnexpectedFailure({this.message = 'An unexpected error occurred'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedFailureCopyWith<UnexpectedFailure> get copyWith => _$UnexpectedFailureCopyWithImpl<UnexpectedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CoreFailure.unexpected(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnexpectedFailureCopyWith<$Res> implements $CoreFailureCopyWith<$Res> {
  factory $UnexpectedFailureCopyWith(UnexpectedFailure value, $Res Function(UnexpectedFailure) _then) = _$UnexpectedFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnexpectedFailureCopyWithImpl<$Res>
    implements $UnexpectedFailureCopyWith<$Res> {
  _$UnexpectedFailureCopyWithImpl(this._self, this._then);

  final UnexpectedFailure _self;
  final $Res Function(UnexpectedFailure) _then;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnexpectedFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StorageFailure extends CoreFailure {
  const StorageFailure({this.message = 'Failed to access secure storage'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorageFailureCopyWith<StorageFailure> get copyWith => _$StorageFailureCopyWithImpl<StorageFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorageFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CoreFailure.storage(message: $message)';
}


}

/// @nodoc
abstract mixin class $StorageFailureCopyWith<$Res> implements $CoreFailureCopyWith<$Res> {
  factory $StorageFailureCopyWith(StorageFailure value, $Res Function(StorageFailure) _then) = _$StorageFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$StorageFailureCopyWithImpl<$Res>
    implements $StorageFailureCopyWith<$Res> {
  _$StorageFailureCopyWithImpl(this._self, this._then);

  final StorageFailure _self;
  final $Res Function(StorageFailure) _then;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(StorageFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NetworkFailure extends CoreFailure {
  const NetworkFailure({this.message = 'No internet connection'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkFailureCopyWith<NetworkFailure> get copyWith => _$NetworkFailureCopyWithImpl<NetworkFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CoreFailure.network(message: $message)';
}


}

/// @nodoc
abstract mixin class $NetworkFailureCopyWith<$Res> implements $CoreFailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(NetworkFailure value, $Res Function(NetworkFailure) _then) = _$NetworkFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._self, this._then);

  final NetworkFailure _self;
  final $Res Function(NetworkFailure) _then;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NetworkFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ServerFailure extends CoreFailure {
  const ServerFailure({this.message = 'Server error occurred', this.statusCode}): super._();
  

@override@JsonKey() final  String message;
 final  int? statusCode;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerFailureCopyWith<ServerFailure> get copyWith => _$ServerFailureCopyWithImpl<ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode => Object.hash(runtimeType,message,statusCode);

@override
String toString() {
  return 'CoreFailure.server(message: $message, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class $ServerFailureCopyWith<$Res> implements $CoreFailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(ServerFailure value, $Res Function(ServerFailure) _then) = _$ServerFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, int? statusCode
});




}
/// @nodoc
class _$ServerFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._self, this._then);

  final ServerFailure _self;
  final $Res Function(ServerFailure) _then;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,}) {
  return _then(ServerFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class InvalidDataFailure extends CoreFailure {
  const InvalidDataFailure({this.message = 'Invalid data received'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidDataFailureCopyWith<InvalidDataFailure> get copyWith => _$InvalidDataFailureCopyWithImpl<InvalidDataFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidDataFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CoreFailure.invalidData(message: $message)';
}


}

/// @nodoc
abstract mixin class $InvalidDataFailureCopyWith<$Res> implements $CoreFailureCopyWith<$Res> {
  factory $InvalidDataFailureCopyWith(InvalidDataFailure value, $Res Function(InvalidDataFailure) _then) = _$InvalidDataFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$InvalidDataFailureCopyWithImpl<$Res>
    implements $InvalidDataFailureCopyWith<$Res> {
  _$InvalidDataFailureCopyWithImpl(this._self, this._then);

  final InvalidDataFailure _self;
  final $Res Function(InvalidDataFailure) _then;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InvalidDataFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
