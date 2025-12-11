// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFailure {

 String get message;
/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<AuthFailure> get copyWith => _$AuthFailureCopyWithImpl<AuthFailure>(this as AuthFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res>  {
  factory $AuthFailureCopyWith(AuthFailure value, $Res Function(AuthFailure) _then) = _$AuthFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthFailure].
extension AuthFailurePatterns on AuthFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthNetworkFailure value)?  networkError,TResult Function( InvalidCredentialsFailure value)?  invalidCredentials,TResult Function( UserExistsFailure value)?  userExists,TResult Function( AuthServerFailure value)?  serverError,TResult Function( BadRequestFailure value)?  badRequest,TResult Function( UnauthorizedFailure value)?  unauthorized,TResult Function( NotFoundFailure value)?  notFound,TResult Function( UnknownAuthFailure value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthNetworkFailure() when networkError != null:
return networkError(_that);case InvalidCredentialsFailure() when invalidCredentials != null:
return invalidCredentials(_that);case UserExistsFailure() when userExists != null:
return userExists(_that);case AuthServerFailure() when serverError != null:
return serverError(_that);case BadRequestFailure() when badRequest != null:
return badRequest(_that);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case NotFoundFailure() when notFound != null:
return notFound(_that);case UnknownAuthFailure() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthNetworkFailure value)  networkError,required TResult Function( InvalidCredentialsFailure value)  invalidCredentials,required TResult Function( UserExistsFailure value)  userExists,required TResult Function( AuthServerFailure value)  serverError,required TResult Function( BadRequestFailure value)  badRequest,required TResult Function( UnauthorizedFailure value)  unauthorized,required TResult Function( NotFoundFailure value)  notFound,required TResult Function( UnknownAuthFailure value)  unknown,}){
final _that = this;
switch (_that) {
case AuthNetworkFailure():
return networkError(_that);case InvalidCredentialsFailure():
return invalidCredentials(_that);case UserExistsFailure():
return userExists(_that);case AuthServerFailure():
return serverError(_that);case BadRequestFailure():
return badRequest(_that);case UnauthorizedFailure():
return unauthorized(_that);case NotFoundFailure():
return notFound(_that);case UnknownAuthFailure():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthNetworkFailure value)?  networkError,TResult? Function( InvalidCredentialsFailure value)?  invalidCredentials,TResult? Function( UserExistsFailure value)?  userExists,TResult? Function( AuthServerFailure value)?  serverError,TResult? Function( BadRequestFailure value)?  badRequest,TResult? Function( UnauthorizedFailure value)?  unauthorized,TResult? Function( NotFoundFailure value)?  notFound,TResult? Function( UnknownAuthFailure value)?  unknown,}){
final _that = this;
switch (_that) {
case AuthNetworkFailure() when networkError != null:
return networkError(_that);case InvalidCredentialsFailure() when invalidCredentials != null:
return invalidCredentials(_that);case UserExistsFailure() when userExists != null:
return userExists(_that);case AuthServerFailure() when serverError != null:
return serverError(_that);case BadRequestFailure() when badRequest != null:
return badRequest(_that);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case NotFoundFailure() when notFound != null:
return notFound(_that);case UnknownAuthFailure() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  networkError,TResult Function( String message)?  invalidCredentials,TResult Function( String message)?  userExists,TResult Function( String message)?  serverError,TResult Function( String message)?  badRequest,TResult Function( String message)?  unauthorized,TResult Function( String message)?  notFound,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthNetworkFailure() when networkError != null:
return networkError(_that.message);case InvalidCredentialsFailure() when invalidCredentials != null:
return invalidCredentials(_that.message);case UserExistsFailure() when userExists != null:
return userExists(_that.message);case AuthServerFailure() when serverError != null:
return serverError(_that.message);case BadRequestFailure() when badRequest != null:
return badRequest(_that.message);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.message);case NotFoundFailure() when notFound != null:
return notFound(_that.message);case UnknownAuthFailure() when unknown != null:
return unknown(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  networkError,required TResult Function( String message)  invalidCredentials,required TResult Function( String message)  userExists,required TResult Function( String message)  serverError,required TResult Function( String message)  badRequest,required TResult Function( String message)  unauthorized,required TResult Function( String message)  notFound,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case AuthNetworkFailure():
return networkError(_that.message);case InvalidCredentialsFailure():
return invalidCredentials(_that.message);case UserExistsFailure():
return userExists(_that.message);case AuthServerFailure():
return serverError(_that.message);case BadRequestFailure():
return badRequest(_that.message);case UnauthorizedFailure():
return unauthorized(_that.message);case NotFoundFailure():
return notFound(_that.message);case UnknownAuthFailure():
return unknown(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  networkError,TResult? Function( String message)?  invalidCredentials,TResult? Function( String message)?  userExists,TResult? Function( String message)?  serverError,TResult? Function( String message)?  badRequest,TResult? Function( String message)?  unauthorized,TResult? Function( String message)?  notFound,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case AuthNetworkFailure() when networkError != null:
return networkError(_that.message);case InvalidCredentialsFailure() when invalidCredentials != null:
return invalidCredentials(_that.message);case UserExistsFailure() when userExists != null:
return userExists(_that.message);case AuthServerFailure() when serverError != null:
return serverError(_that.message);case BadRequestFailure() when badRequest != null:
return badRequest(_that.message);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.message);case NotFoundFailure() when notFound != null:
return notFound(_that.message);case UnknownAuthFailure() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AuthNetworkFailure extends AuthFailure {
  const AuthNetworkFailure({this.message = 'Failed to connect to server'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthNetworkFailureCopyWith<AuthNetworkFailure> get copyWith => _$AuthNetworkFailureCopyWithImpl<AuthNetworkFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthNetworkFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.networkError(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthNetworkFailureCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $AuthNetworkFailureCopyWith(AuthNetworkFailure value, $Res Function(AuthNetworkFailure) _then) = _$AuthNetworkFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthNetworkFailureCopyWithImpl<$Res>
    implements $AuthNetworkFailureCopyWith<$Res> {
  _$AuthNetworkFailureCopyWithImpl(this._self, this._then);

  final AuthNetworkFailure _self;
  final $Res Function(AuthNetworkFailure) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthNetworkFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure({this.message = 'Invalid email or password'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidCredentialsFailureCopyWith<InvalidCredentialsFailure> get copyWith => _$InvalidCredentialsFailureCopyWithImpl<InvalidCredentialsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidCredentialsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.invalidCredentials(message: $message)';
}


}

/// @nodoc
abstract mixin class $InvalidCredentialsFailureCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $InvalidCredentialsFailureCopyWith(InvalidCredentialsFailure value, $Res Function(InvalidCredentialsFailure) _then) = _$InvalidCredentialsFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$InvalidCredentialsFailureCopyWithImpl<$Res>
    implements $InvalidCredentialsFailureCopyWith<$Res> {
  _$InvalidCredentialsFailureCopyWithImpl(this._self, this._then);

  final InvalidCredentialsFailure _self;
  final $Res Function(InvalidCredentialsFailure) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InvalidCredentialsFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserExistsFailure extends AuthFailure {
  const UserExistsFailure({this.message = 'User already exists'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserExistsFailureCopyWith<UserExistsFailure> get copyWith => _$UserExistsFailureCopyWithImpl<UserExistsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserExistsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.userExists(message: $message)';
}


}

/// @nodoc
abstract mixin class $UserExistsFailureCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $UserExistsFailureCopyWith(UserExistsFailure value, $Res Function(UserExistsFailure) _then) = _$UserExistsFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UserExistsFailureCopyWithImpl<$Res>
    implements $UserExistsFailureCopyWith<$Res> {
  _$UserExistsFailureCopyWithImpl(this._self, this._then);

  final UserExistsFailure _self;
  final $Res Function(UserExistsFailure) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UserExistsFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthServerFailure extends AuthFailure {
  const AuthServerFailure({this.message = 'Server error occurred'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthServerFailureCopyWith<AuthServerFailure> get copyWith => _$AuthServerFailureCopyWithImpl<AuthServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthServerFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthServerFailureCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $AuthServerFailureCopyWith(AuthServerFailure value, $Res Function(AuthServerFailure) _then) = _$AuthServerFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthServerFailureCopyWithImpl<$Res>
    implements $AuthServerFailureCopyWith<$Res> {
  _$AuthServerFailureCopyWithImpl(this._self, this._then);

  final AuthServerFailure _self;
  final $Res Function(AuthServerFailure) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthServerFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BadRequestFailure extends AuthFailure {
  const BadRequestFailure({this.message = 'Invalid request'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadRequestFailureCopyWith<BadRequestFailure> get copyWith => _$BadRequestFailureCopyWithImpl<BadRequestFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadRequestFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.badRequest(message: $message)';
}


}

/// @nodoc
abstract mixin class $BadRequestFailureCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $BadRequestFailureCopyWith(BadRequestFailure value, $Res Function(BadRequestFailure) _then) = _$BadRequestFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$BadRequestFailureCopyWithImpl<$Res>
    implements $BadRequestFailureCopyWith<$Res> {
  _$BadRequestFailureCopyWithImpl(this._self, this._then);

  final BadRequestFailure _self;
  final $Res Function(BadRequestFailure) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(BadRequestFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnauthorizedFailure extends AuthFailure {
  const UnauthorizedFailure({this.message = 'Unauthorized'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedFailureCopyWith<UnauthorizedFailure> get copyWith => _$UnauthorizedFailureCopyWithImpl<UnauthorizedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.unauthorized(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedFailureCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $UnauthorizedFailureCopyWith(UnauthorizedFailure value, $Res Function(UnauthorizedFailure) _then) = _$UnauthorizedFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnauthorizedFailureCopyWithImpl<$Res>
    implements $UnauthorizedFailureCopyWith<$Res> {
  _$UnauthorizedFailureCopyWithImpl(this._self, this._then);

  final UnauthorizedFailure _self;
  final $Res Function(UnauthorizedFailure) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnauthorizedFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NotFoundFailure extends AuthFailure {
  const NotFoundFailure({this.message = 'Resource not found'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundFailureCopyWith<NotFoundFailure> get copyWith => _$NotFoundFailureCopyWithImpl<NotFoundFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFoundFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.notFound(message: $message)';
}


}

/// @nodoc
abstract mixin class $NotFoundFailureCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $NotFoundFailureCopyWith(NotFoundFailure value, $Res Function(NotFoundFailure) _then) = _$NotFoundFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NotFoundFailureCopyWithImpl<$Res>
    implements $NotFoundFailureCopyWith<$Res> {
  _$NotFoundFailureCopyWithImpl(this._self, this._then);

  final NotFoundFailure _self;
  final $Res Function(NotFoundFailure) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NotFoundFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnknownAuthFailure extends AuthFailure {
  const UnknownAuthFailure({this.message = 'An unknown error occurred'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownAuthFailureCopyWith<UnknownAuthFailure> get copyWith => _$UnknownAuthFailureCopyWithImpl<UnknownAuthFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownAuthFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnknownAuthFailureCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $UnknownAuthFailureCopyWith(UnknownAuthFailure value, $Res Function(UnknownAuthFailure) _then) = _$UnknownAuthFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnknownAuthFailureCopyWithImpl<$Res>
    implements $UnknownAuthFailureCopyWith<$Res> {
  _$UnknownAuthFailureCopyWithImpl(this._self, this._then);

  final UnknownAuthFailure _self;
  final $Res Function(UnknownAuthFailure) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnknownAuthFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
