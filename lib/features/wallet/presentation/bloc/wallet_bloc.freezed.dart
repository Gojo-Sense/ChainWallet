// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WalletEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletEvent()';
}


}

/// @nodoc
class $WalletEventCopyWith<$Res>  {
$WalletEventCopyWith(WalletEvent _, $Res Function(WalletEvent) __);
}


/// Adds pattern-matching-related methods to [WalletEvent].
extension WalletEventPatterns on WalletEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CheckWalletExists value)?  checkWalletExists,TResult Function( GenerateMnemonic value)?  generateMnemonic,TResult Function( CreateWallet value)?  createWallet,TResult Function( ImportWallet value)?  importWallet,TResult Function( LoadWallet value)?  loadWallet,TResult Function( DeleteWallet value)?  deleteWallet,TResult Function( CopyToClipboard value)?  copyToClipboard,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CheckWalletExists() when checkWalletExists != null:
return checkWalletExists(_that);case GenerateMnemonic() when generateMnemonic != null:
return generateMnemonic(_that);case CreateWallet() when createWallet != null:
return createWallet(_that);case ImportWallet() when importWallet != null:
return importWallet(_that);case LoadWallet() when loadWallet != null:
return loadWallet(_that);case DeleteWallet() when deleteWallet != null:
return deleteWallet(_that);case CopyToClipboard() when copyToClipboard != null:
return copyToClipboard(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CheckWalletExists value)  checkWalletExists,required TResult Function( GenerateMnemonic value)  generateMnemonic,required TResult Function( CreateWallet value)  createWallet,required TResult Function( ImportWallet value)  importWallet,required TResult Function( LoadWallet value)  loadWallet,required TResult Function( DeleteWallet value)  deleteWallet,required TResult Function( CopyToClipboard value)  copyToClipboard,}){
final _that = this;
switch (_that) {
case CheckWalletExists():
return checkWalletExists(_that);case GenerateMnemonic():
return generateMnemonic(_that);case CreateWallet():
return createWallet(_that);case ImportWallet():
return importWallet(_that);case LoadWallet():
return loadWallet(_that);case DeleteWallet():
return deleteWallet(_that);case CopyToClipboard():
return copyToClipboard(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CheckWalletExists value)?  checkWalletExists,TResult? Function( GenerateMnemonic value)?  generateMnemonic,TResult? Function( CreateWallet value)?  createWallet,TResult? Function( ImportWallet value)?  importWallet,TResult? Function( LoadWallet value)?  loadWallet,TResult? Function( DeleteWallet value)?  deleteWallet,TResult? Function( CopyToClipboard value)?  copyToClipboard,}){
final _that = this;
switch (_that) {
case CheckWalletExists() when checkWalletExists != null:
return checkWalletExists(_that);case GenerateMnemonic() when generateMnemonic != null:
return generateMnemonic(_that);case CreateWallet() when createWallet != null:
return createWallet(_that);case ImportWallet() when importWallet != null:
return importWallet(_that);case LoadWallet() when loadWallet != null:
return loadWallet(_that);case DeleteWallet() when deleteWallet != null:
return deleteWallet(_that);case CopyToClipboard() when copyToClipboard != null:
return copyToClipboard(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkWalletExists,TResult Function()?  generateMnemonic,TResult Function( String mnemonic)?  createWallet,TResult Function( String privateKey)?  importWallet,TResult Function()?  loadWallet,TResult Function()?  deleteWallet,TResult Function( String text)?  copyToClipboard,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CheckWalletExists() when checkWalletExists != null:
return checkWalletExists();case GenerateMnemonic() when generateMnemonic != null:
return generateMnemonic();case CreateWallet() when createWallet != null:
return createWallet(_that.mnemonic);case ImportWallet() when importWallet != null:
return importWallet(_that.privateKey);case LoadWallet() when loadWallet != null:
return loadWallet();case DeleteWallet() when deleteWallet != null:
return deleteWallet();case CopyToClipboard() when copyToClipboard != null:
return copyToClipboard(_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkWalletExists,required TResult Function()  generateMnemonic,required TResult Function( String mnemonic)  createWallet,required TResult Function( String privateKey)  importWallet,required TResult Function()  loadWallet,required TResult Function()  deleteWallet,required TResult Function( String text)  copyToClipboard,}) {final _that = this;
switch (_that) {
case CheckWalletExists():
return checkWalletExists();case GenerateMnemonic():
return generateMnemonic();case CreateWallet():
return createWallet(_that.mnemonic);case ImportWallet():
return importWallet(_that.privateKey);case LoadWallet():
return loadWallet();case DeleteWallet():
return deleteWallet();case CopyToClipboard():
return copyToClipboard(_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkWalletExists,TResult? Function()?  generateMnemonic,TResult? Function( String mnemonic)?  createWallet,TResult? Function( String privateKey)?  importWallet,TResult? Function()?  loadWallet,TResult? Function()?  deleteWallet,TResult? Function( String text)?  copyToClipboard,}) {final _that = this;
switch (_that) {
case CheckWalletExists() when checkWalletExists != null:
return checkWalletExists();case GenerateMnemonic() when generateMnemonic != null:
return generateMnemonic();case CreateWallet() when createWallet != null:
return createWallet(_that.mnemonic);case ImportWallet() when importWallet != null:
return importWallet(_that.privateKey);case LoadWallet() when loadWallet != null:
return loadWallet();case DeleteWallet() when deleteWallet != null:
return deleteWallet();case CopyToClipboard() when copyToClipboard != null:
return copyToClipboard(_that.text);case _:
  return null;

}
}

}

/// @nodoc


class CheckWalletExists implements WalletEvent {
  const CheckWalletExists();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckWalletExists);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletEvent.checkWalletExists()';
}


}




/// @nodoc


class GenerateMnemonic implements WalletEvent {
  const GenerateMnemonic();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateMnemonic);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletEvent.generateMnemonic()';
}


}




/// @nodoc


class CreateWallet implements WalletEvent {
  const CreateWallet(this.mnemonic);
  

 final  String mnemonic;

/// Create a copy of WalletEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateWalletCopyWith<CreateWallet> get copyWith => _$CreateWalletCopyWithImpl<CreateWallet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWallet&&(identical(other.mnemonic, mnemonic) || other.mnemonic == mnemonic));
}


@override
int get hashCode => Object.hash(runtimeType,mnemonic);

@override
String toString() {
  return 'WalletEvent.createWallet(mnemonic: $mnemonic)';
}


}

/// @nodoc
abstract mixin class $CreateWalletCopyWith<$Res> implements $WalletEventCopyWith<$Res> {
  factory $CreateWalletCopyWith(CreateWallet value, $Res Function(CreateWallet) _then) = _$CreateWalletCopyWithImpl;
@useResult
$Res call({
 String mnemonic
});




}
/// @nodoc
class _$CreateWalletCopyWithImpl<$Res>
    implements $CreateWalletCopyWith<$Res> {
  _$CreateWalletCopyWithImpl(this._self, this._then);

  final CreateWallet _self;
  final $Res Function(CreateWallet) _then;

/// Create a copy of WalletEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mnemonic = null,}) {
  return _then(CreateWallet(
null == mnemonic ? _self.mnemonic : mnemonic // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ImportWallet implements WalletEvent {
  const ImportWallet(this.privateKey);
  

 final  String privateKey;

/// Create a copy of WalletEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportWalletCopyWith<ImportWallet> get copyWith => _$ImportWalletCopyWithImpl<ImportWallet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportWallet&&(identical(other.privateKey, privateKey) || other.privateKey == privateKey));
}


@override
int get hashCode => Object.hash(runtimeType,privateKey);

@override
String toString() {
  return 'WalletEvent.importWallet(privateKey: $privateKey)';
}


}

/// @nodoc
abstract mixin class $ImportWalletCopyWith<$Res> implements $WalletEventCopyWith<$Res> {
  factory $ImportWalletCopyWith(ImportWallet value, $Res Function(ImportWallet) _then) = _$ImportWalletCopyWithImpl;
@useResult
$Res call({
 String privateKey
});




}
/// @nodoc
class _$ImportWalletCopyWithImpl<$Res>
    implements $ImportWalletCopyWith<$Res> {
  _$ImportWalletCopyWithImpl(this._self, this._then);

  final ImportWallet _self;
  final $Res Function(ImportWallet) _then;

/// Create a copy of WalletEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? privateKey = null,}) {
  return _then(ImportWallet(
null == privateKey ? _self.privateKey : privateKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadWallet implements WalletEvent {
  const LoadWallet();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadWallet);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletEvent.loadWallet()';
}


}




/// @nodoc


class DeleteWallet implements WalletEvent {
  const DeleteWallet();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteWallet);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletEvent.deleteWallet()';
}


}




/// @nodoc


class CopyToClipboard implements WalletEvent {
  const CopyToClipboard(this.text);
  

 final  String text;

/// Create a copy of WalletEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CopyToClipboardCopyWith<CopyToClipboard> get copyWith => _$CopyToClipboardCopyWithImpl<CopyToClipboard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CopyToClipboard&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'WalletEvent.copyToClipboard(text: $text)';
}


}

/// @nodoc
abstract mixin class $CopyToClipboardCopyWith<$Res> implements $WalletEventCopyWith<$Res> {
  factory $CopyToClipboardCopyWith(CopyToClipboard value, $Res Function(CopyToClipboard) _then) = _$CopyToClipboardCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$CopyToClipboardCopyWithImpl<$Res>
    implements $CopyToClipboardCopyWith<$Res> {
  _$CopyToClipboardCopyWithImpl(this._self, this._then);

  final CopyToClipboard _self;
  final $Res Function(CopyToClipboard) _then;

/// Create a copy of WalletEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(CopyToClipboard(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$WalletState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletState()';
}


}

/// @nodoc
class $WalletStateCopyWith<$Res>  {
$WalletStateCopyWith(WalletState _, $Res Function(WalletState) __);
}


/// Adds pattern-matching-related methods to [WalletState].
extension WalletStatePatterns on WalletState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WalletInitial value)?  initial,TResult Function( WalletLoading value)?  loading,TResult Function( WalletNotExists value)?  noWallet,TResult Function( MnemonicGenerated value)?  mnemonicGenerated,TResult Function( WalletLoaded value)?  walletLoaded,TResult Function( WalletCreated value)?  walletCreated,TResult Function( WalletDeleted value)?  walletDeleted,TResult Function( CopiedToClipboard value)?  copiedToClipboard,TResult Function( WalletStateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WalletInitial() when initial != null:
return initial(_that);case WalletLoading() when loading != null:
return loading(_that);case WalletNotExists() when noWallet != null:
return noWallet(_that);case MnemonicGenerated() when mnemonicGenerated != null:
return mnemonicGenerated(_that);case WalletLoaded() when walletLoaded != null:
return walletLoaded(_that);case WalletCreated() when walletCreated != null:
return walletCreated(_that);case WalletDeleted() when walletDeleted != null:
return walletDeleted(_that);case CopiedToClipboard() when copiedToClipboard != null:
return copiedToClipboard(_that);case WalletStateFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WalletInitial value)  initial,required TResult Function( WalletLoading value)  loading,required TResult Function( WalletNotExists value)  noWallet,required TResult Function( MnemonicGenerated value)  mnemonicGenerated,required TResult Function( WalletLoaded value)  walletLoaded,required TResult Function( WalletCreated value)  walletCreated,required TResult Function( WalletDeleted value)  walletDeleted,required TResult Function( CopiedToClipboard value)  copiedToClipboard,required TResult Function( WalletStateFailure value)  failure,}){
final _that = this;
switch (_that) {
case WalletInitial():
return initial(_that);case WalletLoading():
return loading(_that);case WalletNotExists():
return noWallet(_that);case MnemonicGenerated():
return mnemonicGenerated(_that);case WalletLoaded():
return walletLoaded(_that);case WalletCreated():
return walletCreated(_that);case WalletDeleted():
return walletDeleted(_that);case CopiedToClipboard():
return copiedToClipboard(_that);case WalletStateFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WalletInitial value)?  initial,TResult? Function( WalletLoading value)?  loading,TResult? Function( WalletNotExists value)?  noWallet,TResult? Function( MnemonicGenerated value)?  mnemonicGenerated,TResult? Function( WalletLoaded value)?  walletLoaded,TResult? Function( WalletCreated value)?  walletCreated,TResult? Function( WalletDeleted value)?  walletDeleted,TResult? Function( CopiedToClipboard value)?  copiedToClipboard,TResult? Function( WalletStateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case WalletInitial() when initial != null:
return initial(_that);case WalletLoading() when loading != null:
return loading(_that);case WalletNotExists() when noWallet != null:
return noWallet(_that);case MnemonicGenerated() when mnemonicGenerated != null:
return mnemonicGenerated(_that);case WalletLoaded() when walletLoaded != null:
return walletLoaded(_that);case WalletCreated() when walletCreated != null:
return walletCreated(_that);case WalletDeleted() when walletDeleted != null:
return walletDeleted(_that);case CopiedToClipboard() when copiedToClipboard != null:
return copiedToClipboard(_that);case WalletStateFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  noWallet,TResult Function( String mnemonic)?  mnemonicGenerated,TResult Function( WalletEntity wallet)?  walletLoaded,TResult Function( WalletEntity wallet)?  walletCreated,TResult Function()?  walletDeleted,TResult Function()?  copiedToClipboard,TResult Function( WalletFailure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WalletInitial() when initial != null:
return initial();case WalletLoading() when loading != null:
return loading();case WalletNotExists() when noWallet != null:
return noWallet();case MnemonicGenerated() when mnemonicGenerated != null:
return mnemonicGenerated(_that.mnemonic);case WalletLoaded() when walletLoaded != null:
return walletLoaded(_that.wallet);case WalletCreated() when walletCreated != null:
return walletCreated(_that.wallet);case WalletDeleted() when walletDeleted != null:
return walletDeleted();case CopiedToClipboard() when copiedToClipboard != null:
return copiedToClipboard();case WalletStateFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  noWallet,required TResult Function( String mnemonic)  mnemonicGenerated,required TResult Function( WalletEntity wallet)  walletLoaded,required TResult Function( WalletEntity wallet)  walletCreated,required TResult Function()  walletDeleted,required TResult Function()  copiedToClipboard,required TResult Function( WalletFailure failure)  failure,}) {final _that = this;
switch (_that) {
case WalletInitial():
return initial();case WalletLoading():
return loading();case WalletNotExists():
return noWallet();case MnemonicGenerated():
return mnemonicGenerated(_that.mnemonic);case WalletLoaded():
return walletLoaded(_that.wallet);case WalletCreated():
return walletCreated(_that.wallet);case WalletDeleted():
return walletDeleted();case CopiedToClipboard():
return copiedToClipboard();case WalletStateFailure():
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  noWallet,TResult? Function( String mnemonic)?  mnemonicGenerated,TResult? Function( WalletEntity wallet)?  walletLoaded,TResult? Function( WalletEntity wallet)?  walletCreated,TResult? Function()?  walletDeleted,TResult? Function()?  copiedToClipboard,TResult? Function( WalletFailure failure)?  failure,}) {final _that = this;
switch (_that) {
case WalletInitial() when initial != null:
return initial();case WalletLoading() when loading != null:
return loading();case WalletNotExists() when noWallet != null:
return noWallet();case MnemonicGenerated() when mnemonicGenerated != null:
return mnemonicGenerated(_that.mnemonic);case WalletLoaded() when walletLoaded != null:
return walletLoaded(_that.wallet);case WalletCreated() when walletCreated != null:
return walletCreated(_that.wallet);case WalletDeleted() when walletDeleted != null:
return walletDeleted();case CopiedToClipboard() when copiedToClipboard != null:
return copiedToClipboard();case WalletStateFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class WalletInitial extends WalletState {
  const WalletInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletState.initial()';
}


}




/// @nodoc


class WalletLoading extends WalletState {
  const WalletLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletState.loading()';
}


}




/// @nodoc


class WalletNotExists extends WalletState {
  const WalletNotExists(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletNotExists);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletState.noWallet()';
}


}




/// @nodoc


class MnemonicGenerated extends WalletState {
  const MnemonicGenerated(this.mnemonic): super._();
  

 final  String mnemonic;

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MnemonicGeneratedCopyWith<MnemonicGenerated> get copyWith => _$MnemonicGeneratedCopyWithImpl<MnemonicGenerated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MnemonicGenerated&&(identical(other.mnemonic, mnemonic) || other.mnemonic == mnemonic));
}


@override
int get hashCode => Object.hash(runtimeType,mnemonic);

@override
String toString() {
  return 'WalletState.mnemonicGenerated(mnemonic: $mnemonic)';
}


}

/// @nodoc
abstract mixin class $MnemonicGeneratedCopyWith<$Res> implements $WalletStateCopyWith<$Res> {
  factory $MnemonicGeneratedCopyWith(MnemonicGenerated value, $Res Function(MnemonicGenerated) _then) = _$MnemonicGeneratedCopyWithImpl;
@useResult
$Res call({
 String mnemonic
});




}
/// @nodoc
class _$MnemonicGeneratedCopyWithImpl<$Res>
    implements $MnemonicGeneratedCopyWith<$Res> {
  _$MnemonicGeneratedCopyWithImpl(this._self, this._then);

  final MnemonicGenerated _self;
  final $Res Function(MnemonicGenerated) _then;

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mnemonic = null,}) {
  return _then(MnemonicGenerated(
null == mnemonic ? _self.mnemonic : mnemonic // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WalletLoaded extends WalletState {
  const WalletLoaded(this.wallet): super._();
  

 final  WalletEntity wallet;

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletLoadedCopyWith<WalletLoaded> get copyWith => _$WalletLoadedCopyWithImpl<WalletLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletLoaded&&(identical(other.wallet, wallet) || other.wallet == wallet));
}


@override
int get hashCode => Object.hash(runtimeType,wallet);

@override
String toString() {
  return 'WalletState.walletLoaded(wallet: $wallet)';
}


}

/// @nodoc
abstract mixin class $WalletLoadedCopyWith<$Res> implements $WalletStateCopyWith<$Res> {
  factory $WalletLoadedCopyWith(WalletLoaded value, $Res Function(WalletLoaded) _then) = _$WalletLoadedCopyWithImpl;
@useResult
$Res call({
 WalletEntity wallet
});


$WalletEntityCopyWith<$Res> get wallet;

}
/// @nodoc
class _$WalletLoadedCopyWithImpl<$Res>
    implements $WalletLoadedCopyWith<$Res> {
  _$WalletLoadedCopyWithImpl(this._self, this._then);

  final WalletLoaded _self;
  final $Res Function(WalletLoaded) _then;

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? wallet = null,}) {
  return _then(WalletLoaded(
null == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as WalletEntity,
  ));
}

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletEntityCopyWith<$Res> get wallet {
  
  return $WalletEntityCopyWith<$Res>(_self.wallet, (value) {
    return _then(_self.copyWith(wallet: value));
  });
}
}

/// @nodoc


class WalletCreated extends WalletState {
  const WalletCreated(this.wallet): super._();
  

 final  WalletEntity wallet;

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletCreatedCopyWith<WalletCreated> get copyWith => _$WalletCreatedCopyWithImpl<WalletCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletCreated&&(identical(other.wallet, wallet) || other.wallet == wallet));
}


@override
int get hashCode => Object.hash(runtimeType,wallet);

@override
String toString() {
  return 'WalletState.walletCreated(wallet: $wallet)';
}


}

/// @nodoc
abstract mixin class $WalletCreatedCopyWith<$Res> implements $WalletStateCopyWith<$Res> {
  factory $WalletCreatedCopyWith(WalletCreated value, $Res Function(WalletCreated) _then) = _$WalletCreatedCopyWithImpl;
@useResult
$Res call({
 WalletEntity wallet
});


$WalletEntityCopyWith<$Res> get wallet;

}
/// @nodoc
class _$WalletCreatedCopyWithImpl<$Res>
    implements $WalletCreatedCopyWith<$Res> {
  _$WalletCreatedCopyWithImpl(this._self, this._then);

  final WalletCreated _self;
  final $Res Function(WalletCreated) _then;

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? wallet = null,}) {
  return _then(WalletCreated(
null == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as WalletEntity,
  ));
}

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletEntityCopyWith<$Res> get wallet {
  
  return $WalletEntityCopyWith<$Res>(_self.wallet, (value) {
    return _then(_self.copyWith(wallet: value));
  });
}
}

/// @nodoc


class WalletDeleted extends WalletState {
  const WalletDeleted(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletState.walletDeleted()';
}


}




/// @nodoc


class CopiedToClipboard extends WalletState {
  const CopiedToClipboard(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CopiedToClipboard);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletState.copiedToClipboard()';
}


}




/// @nodoc


class WalletStateFailure extends WalletState {
  const WalletStateFailure(this.failure): super._();
  

 final  WalletFailure failure;

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletStateFailureCopyWith<WalletStateFailure> get copyWith => _$WalletStateFailureCopyWithImpl<WalletStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletStateFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'WalletState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $WalletStateFailureCopyWith<$Res> implements $WalletStateCopyWith<$Res> {
  factory $WalletStateFailureCopyWith(WalletStateFailure value, $Res Function(WalletStateFailure) _then) = _$WalletStateFailureCopyWithImpl;
@useResult
$Res call({
 WalletFailure failure
});


$WalletFailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$WalletStateFailureCopyWithImpl<$Res>
    implements $WalletStateFailureCopyWith<$Res> {
  _$WalletStateFailureCopyWithImpl(this._self, this._then);

  final WalletStateFailure _self;
  final $Res Function(WalletStateFailure) _then;

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(WalletStateFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as WalletFailure,
  ));
}

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletFailureCopyWith<$Res> get failure {
  
  return $WalletFailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
