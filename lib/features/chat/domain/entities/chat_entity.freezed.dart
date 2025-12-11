// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatMessage {

 String get id; String get content; bool get isUser; DateTime get timestamp; ChatAction? get action; bool get isLoading;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.isUser, isUser) || other.isUser == isUser)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.action, action) || other.action == action)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,id,content,isUser,timestamp,action,isLoading);

@override
String toString() {
  return 'ChatMessage(id: $id, content: $content, isUser: $isUser, timestamp: $timestamp, action: $action, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String id, String content, bool isUser, DateTime timestamp, ChatAction? action, bool isLoading
});


$ChatActionCopyWith<$Res>? get action;

}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? isUser = null,Object? timestamp = null,Object? action = freezed,Object? isLoading = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isUser: null == isUser ? _self.isUser : isUser // ignore: cast_nullable_to_non_nullable
as bool,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ChatAction?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatActionCopyWith<$Res>? get action {
    if (_self.action == null) {
    return null;
  }

  return $ChatActionCopyWith<$Res>(_self.action!, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String content,  bool isUser,  DateTime timestamp,  ChatAction? action,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.content,_that.isUser,_that.timestamp,_that.action,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String content,  bool isUser,  DateTime timestamp,  ChatAction? action,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that.id,_that.content,_that.isUser,_that.timestamp,_that.action,_that.isLoading);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String content,  bool isUser,  DateTime timestamp,  ChatAction? action,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.content,_that.isUser,_that.timestamp,_that.action,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _ChatMessage extends ChatMessage {
  const _ChatMessage({required this.id, required this.content, required this.isUser, required this.timestamp, this.action = null, this.isLoading = false}): super._();
  

@override final  String id;
@override final  String content;
@override final  bool isUser;
@override final  DateTime timestamp;
@override@JsonKey() final  ChatAction? action;
@override@JsonKey() final  bool isLoading;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageCopyWith<_ChatMessage> get copyWith => __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.isUser, isUser) || other.isUser == isUser)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.action, action) || other.action == action)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,id,content,isUser,timestamp,action,isLoading);

@override
String toString() {
  return 'ChatMessage(id: $id, content: $content, isUser: $isUser, timestamp: $timestamp, action: $action, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(_ChatMessage value, $Res Function(_ChatMessage) _then) = __$ChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, String content, bool isUser, DateTime timestamp, ChatAction? action, bool isLoading
});


@override $ChatActionCopyWith<$Res>? get action;

}
/// @nodoc
class __$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? isUser = null,Object? timestamp = null,Object? action = freezed,Object? isLoading = null,}) {
  return _then(_ChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isUser: null == isUser ? _self.isUser : isUser // ignore: cast_nullable_to_non_nullable
as bool,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ChatAction?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatActionCopyWith<$Res>? get action {
    if (_self.action == null) {
    return null;
  }

  return $ChatActionCopyWith<$Res>(_self.action!, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}

/// @nodoc
mixin _$ChatAction {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatAction()';
}


}

/// @nodoc
class $ChatActionCopyWith<$Res>  {
$ChatActionCopyWith(ChatAction _, $Res Function(ChatAction) __);
}


/// Adds pattern-matching-related methods to [ChatAction].
extension ChatActionPatterns on ChatAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SendCryptoAction value)?  sendCrypto,TResult Function( SwapAction value)?  swap,TResult Function( ShowChartAction value)?  showChart,TResult Function( PriceAlertAction value)?  priceAlert,TResult Function( NavigateAction value)?  navigate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SendCryptoAction() when sendCrypto != null:
return sendCrypto(_that);case SwapAction() when swap != null:
return swap(_that);case ShowChartAction() when showChart != null:
return showChart(_that);case PriceAlertAction() when priceAlert != null:
return priceAlert(_that);case NavigateAction() when navigate != null:
return navigate(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SendCryptoAction value)  sendCrypto,required TResult Function( SwapAction value)  swap,required TResult Function( ShowChartAction value)  showChart,required TResult Function( PriceAlertAction value)  priceAlert,required TResult Function( NavigateAction value)  navigate,}){
final _that = this;
switch (_that) {
case SendCryptoAction():
return sendCrypto(_that);case SwapAction():
return swap(_that);case ShowChartAction():
return showChart(_that);case PriceAlertAction():
return priceAlert(_that);case NavigateAction():
return navigate(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SendCryptoAction value)?  sendCrypto,TResult? Function( SwapAction value)?  swap,TResult? Function( ShowChartAction value)?  showChart,TResult? Function( PriceAlertAction value)?  priceAlert,TResult? Function( NavigateAction value)?  navigate,}){
final _that = this;
switch (_that) {
case SendCryptoAction() when sendCrypto != null:
return sendCrypto(_that);case SwapAction() when swap != null:
return swap(_that);case ShowChartAction() when showChart != null:
return showChart(_that);case PriceAlertAction() when priceAlert != null:
return priceAlert(_that);case NavigateAction() when navigate != null:
return navigate(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String address,  double amount,  String token)?  sendCrypto,TResult Function( String fromToken,  String toToken,  double amount)?  swap,TResult Function( String tokenId,  String tokenName)?  showChart,TResult Function( String token,  double targetPrice,  bool isAbove)?  priceAlert,TResult Function( String route,  String? label)?  navigate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SendCryptoAction() when sendCrypto != null:
return sendCrypto(_that.address,_that.amount,_that.token);case SwapAction() when swap != null:
return swap(_that.fromToken,_that.toToken,_that.amount);case ShowChartAction() when showChart != null:
return showChart(_that.tokenId,_that.tokenName);case PriceAlertAction() when priceAlert != null:
return priceAlert(_that.token,_that.targetPrice,_that.isAbove);case NavigateAction() when navigate != null:
return navigate(_that.route,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String address,  double amount,  String token)  sendCrypto,required TResult Function( String fromToken,  String toToken,  double amount)  swap,required TResult Function( String tokenId,  String tokenName)  showChart,required TResult Function( String token,  double targetPrice,  bool isAbove)  priceAlert,required TResult Function( String route,  String? label)  navigate,}) {final _that = this;
switch (_that) {
case SendCryptoAction():
return sendCrypto(_that.address,_that.amount,_that.token);case SwapAction():
return swap(_that.fromToken,_that.toToken,_that.amount);case ShowChartAction():
return showChart(_that.tokenId,_that.tokenName);case PriceAlertAction():
return priceAlert(_that.token,_that.targetPrice,_that.isAbove);case NavigateAction():
return navigate(_that.route,_that.label);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String address,  double amount,  String token)?  sendCrypto,TResult? Function( String fromToken,  String toToken,  double amount)?  swap,TResult? Function( String tokenId,  String tokenName)?  showChart,TResult? Function( String token,  double targetPrice,  bool isAbove)?  priceAlert,TResult? Function( String route,  String? label)?  navigate,}) {final _that = this;
switch (_that) {
case SendCryptoAction() when sendCrypto != null:
return sendCrypto(_that.address,_that.amount,_that.token);case SwapAction() when swap != null:
return swap(_that.fromToken,_that.toToken,_that.amount);case ShowChartAction() when showChart != null:
return showChart(_that.tokenId,_that.tokenName);case PriceAlertAction() when priceAlert != null:
return priceAlert(_that.token,_that.targetPrice,_that.isAbove);case NavigateAction() when navigate != null:
return navigate(_that.route,_that.label);case _:
  return null;

}
}

}

/// @nodoc


class SendCryptoAction extends ChatAction {
  const SendCryptoAction({required this.address, required this.amount, required this.token}): super._();
  

 final  String address;
 final  double amount;
 final  String token;

/// Create a copy of ChatAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendCryptoActionCopyWith<SendCryptoAction> get copyWith => _$SendCryptoActionCopyWithImpl<SendCryptoAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendCryptoAction&&(identical(other.address, address) || other.address == address)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,address,amount,token);

@override
String toString() {
  return 'ChatAction.sendCrypto(address: $address, amount: $amount, token: $token)';
}


}

/// @nodoc
abstract mixin class $SendCryptoActionCopyWith<$Res> implements $ChatActionCopyWith<$Res> {
  factory $SendCryptoActionCopyWith(SendCryptoAction value, $Res Function(SendCryptoAction) _then) = _$SendCryptoActionCopyWithImpl;
@useResult
$Res call({
 String address, double amount, String token
});




}
/// @nodoc
class _$SendCryptoActionCopyWithImpl<$Res>
    implements $SendCryptoActionCopyWith<$Res> {
  _$SendCryptoActionCopyWithImpl(this._self, this._then);

  final SendCryptoAction _self;
  final $Res Function(SendCryptoAction) _then;

/// Create a copy of ChatAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,Object? amount = null,Object? token = null,}) {
  return _then(SendCryptoAction(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SwapAction extends ChatAction {
  const SwapAction({required this.fromToken, required this.toToken, this.amount = 0.0}): super._();
  

 final  String fromToken;
 final  String toToken;
@JsonKey() final  double amount;

/// Create a copy of ChatAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwapActionCopyWith<SwapAction> get copyWith => _$SwapActionCopyWithImpl<SwapAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwapAction&&(identical(other.fromToken, fromToken) || other.fromToken == fromToken)&&(identical(other.toToken, toToken) || other.toToken == toToken)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,fromToken,toToken,amount);

@override
String toString() {
  return 'ChatAction.swap(fromToken: $fromToken, toToken: $toToken, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $SwapActionCopyWith<$Res> implements $ChatActionCopyWith<$Res> {
  factory $SwapActionCopyWith(SwapAction value, $Res Function(SwapAction) _then) = _$SwapActionCopyWithImpl;
@useResult
$Res call({
 String fromToken, String toToken, double amount
});




}
/// @nodoc
class _$SwapActionCopyWithImpl<$Res>
    implements $SwapActionCopyWith<$Res> {
  _$SwapActionCopyWithImpl(this._self, this._then);

  final SwapAction _self;
  final $Res Function(SwapAction) _then;

/// Create a copy of ChatAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fromToken = null,Object? toToken = null,Object? amount = null,}) {
  return _then(SwapAction(
fromToken: null == fromToken ? _self.fromToken : fromToken // ignore: cast_nullable_to_non_nullable
as String,toToken: null == toToken ? _self.toToken : toToken // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class ShowChartAction extends ChatAction {
  const ShowChartAction({required this.tokenId, required this.tokenName}): super._();
  

 final  String tokenId;
 final  String tokenName;

/// Create a copy of ChatAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowChartActionCopyWith<ShowChartAction> get copyWith => _$ShowChartActionCopyWithImpl<ShowChartAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowChartAction&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenName, tokenName) || other.tokenName == tokenName));
}


@override
int get hashCode => Object.hash(runtimeType,tokenId,tokenName);

@override
String toString() {
  return 'ChatAction.showChart(tokenId: $tokenId, tokenName: $tokenName)';
}


}

/// @nodoc
abstract mixin class $ShowChartActionCopyWith<$Res> implements $ChatActionCopyWith<$Res> {
  factory $ShowChartActionCopyWith(ShowChartAction value, $Res Function(ShowChartAction) _then) = _$ShowChartActionCopyWithImpl;
@useResult
$Res call({
 String tokenId, String tokenName
});




}
/// @nodoc
class _$ShowChartActionCopyWithImpl<$Res>
    implements $ShowChartActionCopyWith<$Res> {
  _$ShowChartActionCopyWithImpl(this._self, this._then);

  final ShowChartAction _self;
  final $Res Function(ShowChartAction) _then;

/// Create a copy of ChatAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tokenId = null,Object? tokenName = null,}) {
  return _then(ShowChartAction(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenName: null == tokenName ? _self.tokenName : tokenName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PriceAlertAction extends ChatAction {
  const PriceAlertAction({required this.token, required this.targetPrice, required this.isAbove}): super._();
  

 final  String token;
 final  double targetPrice;
 final  bool isAbove;

/// Create a copy of ChatAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PriceAlertActionCopyWith<PriceAlertAction> get copyWith => _$PriceAlertActionCopyWithImpl<PriceAlertAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PriceAlertAction&&(identical(other.token, token) || other.token == token)&&(identical(other.targetPrice, targetPrice) || other.targetPrice == targetPrice)&&(identical(other.isAbove, isAbove) || other.isAbove == isAbove));
}


@override
int get hashCode => Object.hash(runtimeType,token,targetPrice,isAbove);

@override
String toString() {
  return 'ChatAction.priceAlert(token: $token, targetPrice: $targetPrice, isAbove: $isAbove)';
}


}

/// @nodoc
abstract mixin class $PriceAlertActionCopyWith<$Res> implements $ChatActionCopyWith<$Res> {
  factory $PriceAlertActionCopyWith(PriceAlertAction value, $Res Function(PriceAlertAction) _then) = _$PriceAlertActionCopyWithImpl;
@useResult
$Res call({
 String token, double targetPrice, bool isAbove
});




}
/// @nodoc
class _$PriceAlertActionCopyWithImpl<$Res>
    implements $PriceAlertActionCopyWith<$Res> {
  _$PriceAlertActionCopyWithImpl(this._self, this._then);

  final PriceAlertAction _self;
  final $Res Function(PriceAlertAction) _then;

/// Create a copy of ChatAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,Object? targetPrice = null,Object? isAbove = null,}) {
  return _then(PriceAlertAction(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,targetPrice: null == targetPrice ? _self.targetPrice : targetPrice // ignore: cast_nullable_to_non_nullable
as double,isAbove: null == isAbove ? _self.isAbove : isAbove // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class NavigateAction extends ChatAction {
  const NavigateAction({required this.route, this.label}): super._();
  

 final  String route;
 final  String? label;

/// Create a copy of ChatAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateActionCopyWith<NavigateAction> get copyWith => _$NavigateActionCopyWithImpl<NavigateAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigateAction&&(identical(other.route, route) || other.route == route)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,route,label);

@override
String toString() {
  return 'ChatAction.navigate(route: $route, label: $label)';
}


}

/// @nodoc
abstract mixin class $NavigateActionCopyWith<$Res> implements $ChatActionCopyWith<$Res> {
  factory $NavigateActionCopyWith(NavigateAction value, $Res Function(NavigateAction) _then) = _$NavigateActionCopyWithImpl;
@useResult
$Res call({
 String route, String? label
});




}
/// @nodoc
class _$NavigateActionCopyWithImpl<$Res>
    implements $NavigateActionCopyWith<$Res> {
  _$NavigateActionCopyWithImpl(this._self, this._then);

  final NavigateAction _self;
  final $Res Function(NavigateAction) _then;

/// Create a copy of ChatAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? route = null,Object? label = freezed,}) {
  return _then(NavigateAction(
route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ChatSuggestion {

 String get label; String get emoji; String get query;
/// Create a copy of ChatSuggestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatSuggestionCopyWith<ChatSuggestion> get copyWith => _$ChatSuggestionCopyWithImpl<ChatSuggestion>(this as ChatSuggestion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatSuggestion&&(identical(other.label, label) || other.label == label)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,label,emoji,query);

@override
String toString() {
  return 'ChatSuggestion(label: $label, emoji: $emoji, query: $query)';
}


}

/// @nodoc
abstract mixin class $ChatSuggestionCopyWith<$Res>  {
  factory $ChatSuggestionCopyWith(ChatSuggestion value, $Res Function(ChatSuggestion) _then) = _$ChatSuggestionCopyWithImpl;
@useResult
$Res call({
 String label, String emoji, String query
});




}
/// @nodoc
class _$ChatSuggestionCopyWithImpl<$Res>
    implements $ChatSuggestionCopyWith<$Res> {
  _$ChatSuggestionCopyWithImpl(this._self, this._then);

  final ChatSuggestion _self;
  final $Res Function(ChatSuggestion) _then;

/// Create a copy of ChatSuggestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? emoji = null,Object? query = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatSuggestion].
extension ChatSuggestionPatterns on ChatSuggestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatSuggestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatSuggestion() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatSuggestion value)  $default,){
final _that = this;
switch (_that) {
case _ChatSuggestion():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatSuggestion value)?  $default,){
final _that = this;
switch (_that) {
case _ChatSuggestion() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String emoji,  String query)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatSuggestion() when $default != null:
return $default(_that.label,_that.emoji,_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String emoji,  String query)  $default,) {final _that = this;
switch (_that) {
case _ChatSuggestion():
return $default(_that.label,_that.emoji,_that.query);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String emoji,  String query)?  $default,) {final _that = this;
switch (_that) {
case _ChatSuggestion() when $default != null:
return $default(_that.label,_that.emoji,_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _ChatSuggestion extends ChatSuggestion {
  const _ChatSuggestion({required this.label, required this.emoji, required this.query}): super._();
  

@override final  String label;
@override final  String emoji;
@override final  String query;

/// Create a copy of ChatSuggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatSuggestionCopyWith<_ChatSuggestion> get copyWith => __$ChatSuggestionCopyWithImpl<_ChatSuggestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatSuggestion&&(identical(other.label, label) || other.label == label)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,label,emoji,query);

@override
String toString() {
  return 'ChatSuggestion(label: $label, emoji: $emoji, query: $query)';
}


}

/// @nodoc
abstract mixin class _$ChatSuggestionCopyWith<$Res> implements $ChatSuggestionCopyWith<$Res> {
  factory _$ChatSuggestionCopyWith(_ChatSuggestion value, $Res Function(_ChatSuggestion) _then) = __$ChatSuggestionCopyWithImpl;
@override @useResult
$Res call({
 String label, String emoji, String query
});




}
/// @nodoc
class __$ChatSuggestionCopyWithImpl<$Res>
    implements _$ChatSuggestionCopyWith<$Res> {
  __$ChatSuggestionCopyWithImpl(this._self, this._then);

  final _ChatSuggestion _self;
  final $Res Function(_ChatSuggestion) _then;

/// Create a copy of ChatSuggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? emoji = null,Object? query = null,}) {
  return _then(_ChatSuggestion(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$GasPrice {

 double get slow; double get standard; double get fast; String get unit;
/// Create a copy of GasPrice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GasPriceCopyWith<GasPrice> get copyWith => _$GasPriceCopyWithImpl<GasPrice>(this as GasPrice, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GasPrice&&(identical(other.slow, slow) || other.slow == slow)&&(identical(other.standard, standard) || other.standard == standard)&&(identical(other.fast, fast) || other.fast == fast)&&(identical(other.unit, unit) || other.unit == unit));
}


@override
int get hashCode => Object.hash(runtimeType,slow,standard,fast,unit);

@override
String toString() {
  return 'GasPrice(slow: $slow, standard: $standard, fast: $fast, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $GasPriceCopyWith<$Res>  {
  factory $GasPriceCopyWith(GasPrice value, $Res Function(GasPrice) _then) = _$GasPriceCopyWithImpl;
@useResult
$Res call({
 double slow, double standard, double fast, String unit
});




}
/// @nodoc
class _$GasPriceCopyWithImpl<$Res>
    implements $GasPriceCopyWith<$Res> {
  _$GasPriceCopyWithImpl(this._self, this._then);

  final GasPrice _self;
  final $Res Function(GasPrice) _then;

/// Create a copy of GasPrice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slow = null,Object? standard = null,Object? fast = null,Object? unit = null,}) {
  return _then(_self.copyWith(
slow: null == slow ? _self.slow : slow // ignore: cast_nullable_to_non_nullable
as double,standard: null == standard ? _self.standard : standard // ignore: cast_nullable_to_non_nullable
as double,fast: null == fast ? _self.fast : fast // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GasPrice].
extension GasPricePatterns on GasPrice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GasPrice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GasPrice() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GasPrice value)  $default,){
final _that = this;
switch (_that) {
case _GasPrice():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GasPrice value)?  $default,){
final _that = this;
switch (_that) {
case _GasPrice() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double slow,  double standard,  double fast,  String unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GasPrice() when $default != null:
return $default(_that.slow,_that.standard,_that.fast,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double slow,  double standard,  double fast,  String unit)  $default,) {final _that = this;
switch (_that) {
case _GasPrice():
return $default(_that.slow,_that.standard,_that.fast,_that.unit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double slow,  double standard,  double fast,  String unit)?  $default,) {final _that = this;
switch (_that) {
case _GasPrice() when $default != null:
return $default(_that.slow,_that.standard,_that.fast,_that.unit);case _:
  return null;

}
}

}

/// @nodoc


class _GasPrice extends GasPrice {
  const _GasPrice({required this.slow, required this.standard, required this.fast, required this.unit}): super._();
  

@override final  double slow;
@override final  double standard;
@override final  double fast;
@override final  String unit;

/// Create a copy of GasPrice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GasPriceCopyWith<_GasPrice> get copyWith => __$GasPriceCopyWithImpl<_GasPrice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GasPrice&&(identical(other.slow, slow) || other.slow == slow)&&(identical(other.standard, standard) || other.standard == standard)&&(identical(other.fast, fast) || other.fast == fast)&&(identical(other.unit, unit) || other.unit == unit));
}


@override
int get hashCode => Object.hash(runtimeType,slow,standard,fast,unit);

@override
String toString() {
  return 'GasPrice(slow: $slow, standard: $standard, fast: $fast, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$GasPriceCopyWith<$Res> implements $GasPriceCopyWith<$Res> {
  factory _$GasPriceCopyWith(_GasPrice value, $Res Function(_GasPrice) _then) = __$GasPriceCopyWithImpl;
@override @useResult
$Res call({
 double slow, double standard, double fast, String unit
});




}
/// @nodoc
class __$GasPriceCopyWithImpl<$Res>
    implements _$GasPriceCopyWith<$Res> {
  __$GasPriceCopyWithImpl(this._self, this._then);

  final _GasPrice _self;
  final $Res Function(_GasPrice) _then;

/// Create a copy of GasPrice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slow = null,Object? standard = null,Object? fast = null,Object? unit = null,}) {
  return _then(_GasPrice(
slow: null == slow ? _self.slow : slow // ignore: cast_nullable_to_non_nullable
as double,standard: null == standard ? _self.standard : standard // ignore: cast_nullable_to_non_nullable
as double,fast: null == fast ? _self.fast : fast // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ParsedSendCommand {

 double get amount; String get token; String get address;
/// Create a copy of ParsedSendCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsedSendCommandCopyWith<ParsedSendCommand> get copyWith => _$ParsedSendCommandCopyWithImpl<ParsedSendCommand>(this as ParsedSendCommand, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsedSendCommand&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.token, token) || other.token == token)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,amount,token,address);

@override
String toString() {
  return 'ParsedSendCommand(amount: $amount, token: $token, address: $address)';
}


}

/// @nodoc
abstract mixin class $ParsedSendCommandCopyWith<$Res>  {
  factory $ParsedSendCommandCopyWith(ParsedSendCommand value, $Res Function(ParsedSendCommand) _then) = _$ParsedSendCommandCopyWithImpl;
@useResult
$Res call({
 double amount, String token, String address
});




}
/// @nodoc
class _$ParsedSendCommandCopyWithImpl<$Res>
    implements $ParsedSendCommandCopyWith<$Res> {
  _$ParsedSendCommandCopyWithImpl(this._self, this._then);

  final ParsedSendCommand _self;
  final $Res Function(ParsedSendCommand) _then;

/// Create a copy of ParsedSendCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? token = null,Object? address = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ParsedSendCommand].
extension ParsedSendCommandPatterns on ParsedSendCommand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParsedSendCommand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParsedSendCommand() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParsedSendCommand value)  $default,){
final _that = this;
switch (_that) {
case _ParsedSendCommand():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParsedSendCommand value)?  $default,){
final _that = this;
switch (_that) {
case _ParsedSendCommand() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount,  String token,  String address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParsedSendCommand() when $default != null:
return $default(_that.amount,_that.token,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount,  String token,  String address)  $default,) {final _that = this;
switch (_that) {
case _ParsedSendCommand():
return $default(_that.amount,_that.token,_that.address);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount,  String token,  String address)?  $default,) {final _that = this;
switch (_that) {
case _ParsedSendCommand() when $default != null:
return $default(_that.amount,_that.token,_that.address);case _:
  return null;

}
}

}

/// @nodoc


class _ParsedSendCommand extends ParsedSendCommand {
  const _ParsedSendCommand({required this.amount, required this.token, required this.address}): super._();
  

@override final  double amount;
@override final  String token;
@override final  String address;

/// Create a copy of ParsedSendCommand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParsedSendCommandCopyWith<_ParsedSendCommand> get copyWith => __$ParsedSendCommandCopyWithImpl<_ParsedSendCommand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParsedSendCommand&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.token, token) || other.token == token)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,amount,token,address);

@override
String toString() {
  return 'ParsedSendCommand(amount: $amount, token: $token, address: $address)';
}


}

/// @nodoc
abstract mixin class _$ParsedSendCommandCopyWith<$Res> implements $ParsedSendCommandCopyWith<$Res> {
  factory _$ParsedSendCommandCopyWith(_ParsedSendCommand value, $Res Function(_ParsedSendCommand) _then) = __$ParsedSendCommandCopyWithImpl;
@override @useResult
$Res call({
 double amount, String token, String address
});




}
/// @nodoc
class __$ParsedSendCommandCopyWithImpl<$Res>
    implements _$ParsedSendCommandCopyWith<$Res> {
  __$ParsedSendCommandCopyWithImpl(this._self, this._then);

  final _ParsedSendCommand _self;
  final $Res Function(_ParsedSendCommand) _then;

/// Create a copy of ParsedSendCommand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? token = null,Object? address = null,}) {
  return _then(_ParsedSendCommand(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ParsedSwapCommand {

 double get amount; String get fromToken; String get toToken;
/// Create a copy of ParsedSwapCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsedSwapCommandCopyWith<ParsedSwapCommand> get copyWith => _$ParsedSwapCommandCopyWithImpl<ParsedSwapCommand>(this as ParsedSwapCommand, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsedSwapCommand&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.fromToken, fromToken) || other.fromToken == fromToken)&&(identical(other.toToken, toToken) || other.toToken == toToken));
}


@override
int get hashCode => Object.hash(runtimeType,amount,fromToken,toToken);

@override
String toString() {
  return 'ParsedSwapCommand(amount: $amount, fromToken: $fromToken, toToken: $toToken)';
}


}

/// @nodoc
abstract mixin class $ParsedSwapCommandCopyWith<$Res>  {
  factory $ParsedSwapCommandCopyWith(ParsedSwapCommand value, $Res Function(ParsedSwapCommand) _then) = _$ParsedSwapCommandCopyWithImpl;
@useResult
$Res call({
 double amount, String fromToken, String toToken
});




}
/// @nodoc
class _$ParsedSwapCommandCopyWithImpl<$Res>
    implements $ParsedSwapCommandCopyWith<$Res> {
  _$ParsedSwapCommandCopyWithImpl(this._self, this._then);

  final ParsedSwapCommand _self;
  final $Res Function(ParsedSwapCommand) _then;

/// Create a copy of ParsedSwapCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? fromToken = null,Object? toToken = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,fromToken: null == fromToken ? _self.fromToken : fromToken // ignore: cast_nullable_to_non_nullable
as String,toToken: null == toToken ? _self.toToken : toToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ParsedSwapCommand].
extension ParsedSwapCommandPatterns on ParsedSwapCommand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParsedSwapCommand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParsedSwapCommand() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParsedSwapCommand value)  $default,){
final _that = this;
switch (_that) {
case _ParsedSwapCommand():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParsedSwapCommand value)?  $default,){
final _that = this;
switch (_that) {
case _ParsedSwapCommand() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount,  String fromToken,  String toToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParsedSwapCommand() when $default != null:
return $default(_that.amount,_that.fromToken,_that.toToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount,  String fromToken,  String toToken)  $default,) {final _that = this;
switch (_that) {
case _ParsedSwapCommand():
return $default(_that.amount,_that.fromToken,_that.toToken);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount,  String fromToken,  String toToken)?  $default,) {final _that = this;
switch (_that) {
case _ParsedSwapCommand() when $default != null:
return $default(_that.amount,_that.fromToken,_that.toToken);case _:
  return null;

}
}

}

/// @nodoc


class _ParsedSwapCommand extends ParsedSwapCommand {
  const _ParsedSwapCommand({required this.amount, required this.fromToken, required this.toToken}): super._();
  

@override final  double amount;
@override final  String fromToken;
@override final  String toToken;

/// Create a copy of ParsedSwapCommand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParsedSwapCommandCopyWith<_ParsedSwapCommand> get copyWith => __$ParsedSwapCommandCopyWithImpl<_ParsedSwapCommand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParsedSwapCommand&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.fromToken, fromToken) || other.fromToken == fromToken)&&(identical(other.toToken, toToken) || other.toToken == toToken));
}


@override
int get hashCode => Object.hash(runtimeType,amount,fromToken,toToken);

@override
String toString() {
  return 'ParsedSwapCommand(amount: $amount, fromToken: $fromToken, toToken: $toToken)';
}


}

/// @nodoc
abstract mixin class _$ParsedSwapCommandCopyWith<$Res> implements $ParsedSwapCommandCopyWith<$Res> {
  factory _$ParsedSwapCommandCopyWith(_ParsedSwapCommand value, $Res Function(_ParsedSwapCommand) _then) = __$ParsedSwapCommandCopyWithImpl;
@override @useResult
$Res call({
 double amount, String fromToken, String toToken
});




}
/// @nodoc
class __$ParsedSwapCommandCopyWithImpl<$Res>
    implements _$ParsedSwapCommandCopyWith<$Res> {
  __$ParsedSwapCommandCopyWithImpl(this._self, this._then);

  final _ParsedSwapCommand _self;
  final $Res Function(_ParsedSwapCommand) _then;

/// Create a copy of ParsedSwapCommand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? fromToken = null,Object? toToken = null,}) {
  return _then(_ParsedSwapCommand(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,fromToken: null == fromToken ? _self.fromToken : fromToken // ignore: cast_nullable_to_non_nullable
as String,toToken: null == toToken ? _self.toToken : toToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
