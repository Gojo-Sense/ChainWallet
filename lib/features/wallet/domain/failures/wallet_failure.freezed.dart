// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WalletFailure {

 String get message;
/// Create a copy of WalletFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletFailureCopyWith<WalletFailure> get copyWith => _$WalletFailureCopyWithImpl<WalletFailure>(this as WalletFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WalletFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $WalletFailureCopyWith<$Res>  {
  factory $WalletFailureCopyWith(WalletFailure value, $Res Function(WalletFailure) _then) = _$WalletFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$WalletFailureCopyWithImpl<$Res>
    implements $WalletFailureCopyWith<$Res> {
  _$WalletFailureCopyWithImpl(this._self, this._then);

  final WalletFailure _self;
  final $Res Function(WalletFailure) _then;

/// Create a copy of WalletFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletFailure].
extension WalletFailurePatterns on WalletFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MnemonicGenerationFailure value)?  mnemonicGeneration,TResult Function( InvalidMnemonicFailure value)?  invalidMnemonic,TResult Function( InvalidPrivateKeyFailure value)?  invalidPrivateKey,TResult Function( WalletStorageFailure value)?  storageError,TResult Function( WalletNotFoundFailure value)?  walletNotFound,TResult Function( WalletExistsFailure value)?  walletExists,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MnemonicGenerationFailure() when mnemonicGeneration != null:
return mnemonicGeneration(_that);case InvalidMnemonicFailure() when invalidMnemonic != null:
return invalidMnemonic(_that);case InvalidPrivateKeyFailure() when invalidPrivateKey != null:
return invalidPrivateKey(_that);case WalletStorageFailure() when storageError != null:
return storageError(_that);case WalletNotFoundFailure() when walletNotFound != null:
return walletNotFound(_that);case WalletExistsFailure() when walletExists != null:
return walletExists(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MnemonicGenerationFailure value)  mnemonicGeneration,required TResult Function( InvalidMnemonicFailure value)  invalidMnemonic,required TResult Function( InvalidPrivateKeyFailure value)  invalidPrivateKey,required TResult Function( WalletStorageFailure value)  storageError,required TResult Function( WalletNotFoundFailure value)  walletNotFound,required TResult Function( WalletExistsFailure value)  walletExists,}){
final _that = this;
switch (_that) {
case MnemonicGenerationFailure():
return mnemonicGeneration(_that);case InvalidMnemonicFailure():
return invalidMnemonic(_that);case InvalidPrivateKeyFailure():
return invalidPrivateKey(_that);case WalletStorageFailure():
return storageError(_that);case WalletNotFoundFailure():
return walletNotFound(_that);case WalletExistsFailure():
return walletExists(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MnemonicGenerationFailure value)?  mnemonicGeneration,TResult? Function( InvalidMnemonicFailure value)?  invalidMnemonic,TResult? Function( InvalidPrivateKeyFailure value)?  invalidPrivateKey,TResult? Function( WalletStorageFailure value)?  storageError,TResult? Function( WalletNotFoundFailure value)?  walletNotFound,TResult? Function( WalletExistsFailure value)?  walletExists,}){
final _that = this;
switch (_that) {
case MnemonicGenerationFailure() when mnemonicGeneration != null:
return mnemonicGeneration(_that);case InvalidMnemonicFailure() when invalidMnemonic != null:
return invalidMnemonic(_that);case InvalidPrivateKeyFailure() when invalidPrivateKey != null:
return invalidPrivateKey(_that);case WalletStorageFailure() when storageError != null:
return storageError(_that);case WalletNotFoundFailure() when walletNotFound != null:
return walletNotFound(_that);case WalletExistsFailure() when walletExists != null:
return walletExists(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  mnemonicGeneration,TResult Function( String message)?  invalidMnemonic,TResult Function( String message)?  invalidPrivateKey,TResult Function( String message)?  storageError,TResult Function( String message)?  walletNotFound,TResult Function( String message)?  walletExists,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MnemonicGenerationFailure() when mnemonicGeneration != null:
return mnemonicGeneration(_that.message);case InvalidMnemonicFailure() when invalidMnemonic != null:
return invalidMnemonic(_that.message);case InvalidPrivateKeyFailure() when invalidPrivateKey != null:
return invalidPrivateKey(_that.message);case WalletStorageFailure() when storageError != null:
return storageError(_that.message);case WalletNotFoundFailure() when walletNotFound != null:
return walletNotFound(_that.message);case WalletExistsFailure() when walletExists != null:
return walletExists(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  mnemonicGeneration,required TResult Function( String message)  invalidMnemonic,required TResult Function( String message)  invalidPrivateKey,required TResult Function( String message)  storageError,required TResult Function( String message)  walletNotFound,required TResult Function( String message)  walletExists,}) {final _that = this;
switch (_that) {
case MnemonicGenerationFailure():
return mnemonicGeneration(_that.message);case InvalidMnemonicFailure():
return invalidMnemonic(_that.message);case InvalidPrivateKeyFailure():
return invalidPrivateKey(_that.message);case WalletStorageFailure():
return storageError(_that.message);case WalletNotFoundFailure():
return walletNotFound(_that.message);case WalletExistsFailure():
return walletExists(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  mnemonicGeneration,TResult? Function( String message)?  invalidMnemonic,TResult? Function( String message)?  invalidPrivateKey,TResult? Function( String message)?  storageError,TResult? Function( String message)?  walletNotFound,TResult? Function( String message)?  walletExists,}) {final _that = this;
switch (_that) {
case MnemonicGenerationFailure() when mnemonicGeneration != null:
return mnemonicGeneration(_that.message);case InvalidMnemonicFailure() when invalidMnemonic != null:
return invalidMnemonic(_that.message);case InvalidPrivateKeyFailure() when invalidPrivateKey != null:
return invalidPrivateKey(_that.message);case WalletStorageFailure() when storageError != null:
return storageError(_that.message);case WalletNotFoundFailure() when walletNotFound != null:
return walletNotFound(_that.message);case WalletExistsFailure() when walletExists != null:
return walletExists(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class MnemonicGenerationFailure extends WalletFailure {
  const MnemonicGenerationFailure({this.message = 'Failed to generate seed phrase'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of WalletFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MnemonicGenerationFailureCopyWith<MnemonicGenerationFailure> get copyWith => _$MnemonicGenerationFailureCopyWithImpl<MnemonicGenerationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MnemonicGenerationFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WalletFailure.mnemonicGeneration(message: $message)';
}


}

/// @nodoc
abstract mixin class $MnemonicGenerationFailureCopyWith<$Res> implements $WalletFailureCopyWith<$Res> {
  factory $MnemonicGenerationFailureCopyWith(MnemonicGenerationFailure value, $Res Function(MnemonicGenerationFailure) _then) = _$MnemonicGenerationFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MnemonicGenerationFailureCopyWithImpl<$Res>
    implements $MnemonicGenerationFailureCopyWith<$Res> {
  _$MnemonicGenerationFailureCopyWithImpl(this._self, this._then);

  final MnemonicGenerationFailure _self;
  final $Res Function(MnemonicGenerationFailure) _then;

/// Create a copy of WalletFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MnemonicGenerationFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InvalidMnemonicFailure extends WalletFailure {
  const InvalidMnemonicFailure({this.message = 'Invalid seed phrase'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of WalletFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidMnemonicFailureCopyWith<InvalidMnemonicFailure> get copyWith => _$InvalidMnemonicFailureCopyWithImpl<InvalidMnemonicFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidMnemonicFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WalletFailure.invalidMnemonic(message: $message)';
}


}

/// @nodoc
abstract mixin class $InvalidMnemonicFailureCopyWith<$Res> implements $WalletFailureCopyWith<$Res> {
  factory $InvalidMnemonicFailureCopyWith(InvalidMnemonicFailure value, $Res Function(InvalidMnemonicFailure) _then) = _$InvalidMnemonicFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$InvalidMnemonicFailureCopyWithImpl<$Res>
    implements $InvalidMnemonicFailureCopyWith<$Res> {
  _$InvalidMnemonicFailureCopyWithImpl(this._self, this._then);

  final InvalidMnemonicFailure _self;
  final $Res Function(InvalidMnemonicFailure) _then;

/// Create a copy of WalletFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InvalidMnemonicFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InvalidPrivateKeyFailure extends WalletFailure {
  const InvalidPrivateKeyFailure({this.message = 'Invalid private key format'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of WalletFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidPrivateKeyFailureCopyWith<InvalidPrivateKeyFailure> get copyWith => _$InvalidPrivateKeyFailureCopyWithImpl<InvalidPrivateKeyFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidPrivateKeyFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WalletFailure.invalidPrivateKey(message: $message)';
}


}

/// @nodoc
abstract mixin class $InvalidPrivateKeyFailureCopyWith<$Res> implements $WalletFailureCopyWith<$Res> {
  factory $InvalidPrivateKeyFailureCopyWith(InvalidPrivateKeyFailure value, $Res Function(InvalidPrivateKeyFailure) _then) = _$InvalidPrivateKeyFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$InvalidPrivateKeyFailureCopyWithImpl<$Res>
    implements $InvalidPrivateKeyFailureCopyWith<$Res> {
  _$InvalidPrivateKeyFailureCopyWithImpl(this._self, this._then);

  final InvalidPrivateKeyFailure _self;
  final $Res Function(InvalidPrivateKeyFailure) _then;

/// Create a copy of WalletFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InvalidPrivateKeyFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WalletStorageFailure extends WalletFailure {
  const WalletStorageFailure({this.message = 'Failed to store wallet securely'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of WalletFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletStorageFailureCopyWith<WalletStorageFailure> get copyWith => _$WalletStorageFailureCopyWithImpl<WalletStorageFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletStorageFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WalletFailure.storageError(message: $message)';
}


}

/// @nodoc
abstract mixin class $WalletStorageFailureCopyWith<$Res> implements $WalletFailureCopyWith<$Res> {
  factory $WalletStorageFailureCopyWith(WalletStorageFailure value, $Res Function(WalletStorageFailure) _then) = _$WalletStorageFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$WalletStorageFailureCopyWithImpl<$Res>
    implements $WalletStorageFailureCopyWith<$Res> {
  _$WalletStorageFailureCopyWithImpl(this._self, this._then);

  final WalletStorageFailure _self;
  final $Res Function(WalletStorageFailure) _then;

/// Create a copy of WalletFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(WalletStorageFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WalletNotFoundFailure extends WalletFailure {
  const WalletNotFoundFailure({this.message = 'No wallet found'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of WalletFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletNotFoundFailureCopyWith<WalletNotFoundFailure> get copyWith => _$WalletNotFoundFailureCopyWithImpl<WalletNotFoundFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletNotFoundFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WalletFailure.walletNotFound(message: $message)';
}


}

/// @nodoc
abstract mixin class $WalletNotFoundFailureCopyWith<$Res> implements $WalletFailureCopyWith<$Res> {
  factory $WalletNotFoundFailureCopyWith(WalletNotFoundFailure value, $Res Function(WalletNotFoundFailure) _then) = _$WalletNotFoundFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$WalletNotFoundFailureCopyWithImpl<$Res>
    implements $WalletNotFoundFailureCopyWith<$Res> {
  _$WalletNotFoundFailureCopyWithImpl(this._self, this._then);

  final WalletNotFoundFailure _self;
  final $Res Function(WalletNotFoundFailure) _then;

/// Create a copy of WalletFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(WalletNotFoundFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WalletExistsFailure extends WalletFailure {
  const WalletExistsFailure({this.message = 'Wallet already exists'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of WalletFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletExistsFailureCopyWith<WalletExistsFailure> get copyWith => _$WalletExistsFailureCopyWithImpl<WalletExistsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletExistsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WalletFailure.walletExists(message: $message)';
}


}

/// @nodoc
abstract mixin class $WalletExistsFailureCopyWith<$Res> implements $WalletFailureCopyWith<$Res> {
  factory $WalletExistsFailureCopyWith(WalletExistsFailure value, $Res Function(WalletExistsFailure) _then) = _$WalletExistsFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$WalletExistsFailureCopyWithImpl<$Res>
    implements $WalletExistsFailureCopyWith<$Res> {
  _$WalletExistsFailureCopyWithImpl(this._self, this._then);

  final WalletExistsFailure _self;
  final $Res Function(WalletExistsFailure) _then;

/// Create a copy of WalletFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(WalletExistsFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
