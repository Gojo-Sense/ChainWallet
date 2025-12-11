// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent()';
}


}

/// @nodoc
class $ChatEventCopyWith<$Res>  {
$ChatEventCopyWith(ChatEvent _, $Res Function(ChatEvent) __);
}


/// Adds pattern-matching-related methods to [ChatEvent].
extension ChatEventPatterns on ChatEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SendMessageEvent value)?  sendMessage,TResult Function( ExecuteActionEvent value)?  executeAction,TResult Function( ClearHistoryEvent value)?  clearHistory,TResult Function( LoadInitialEvent value)?  loadInitial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SendMessageEvent() when sendMessage != null:
return sendMessage(_that);case ExecuteActionEvent() when executeAction != null:
return executeAction(_that);case ClearHistoryEvent() when clearHistory != null:
return clearHistory(_that);case LoadInitialEvent() when loadInitial != null:
return loadInitial(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SendMessageEvent value)  sendMessage,required TResult Function( ExecuteActionEvent value)  executeAction,required TResult Function( ClearHistoryEvent value)  clearHistory,required TResult Function( LoadInitialEvent value)  loadInitial,}){
final _that = this;
switch (_that) {
case SendMessageEvent():
return sendMessage(_that);case ExecuteActionEvent():
return executeAction(_that);case ClearHistoryEvent():
return clearHistory(_that);case LoadInitialEvent():
return loadInitial(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SendMessageEvent value)?  sendMessage,TResult? Function( ExecuteActionEvent value)?  executeAction,TResult? Function( ClearHistoryEvent value)?  clearHistory,TResult? Function( LoadInitialEvent value)?  loadInitial,}){
final _that = this;
switch (_that) {
case SendMessageEvent() when sendMessage != null:
return sendMessage(_that);case ExecuteActionEvent() when executeAction != null:
return executeAction(_that);case ClearHistoryEvent() when clearHistory != null:
return clearHistory(_that);case LoadInitialEvent() when loadInitial != null:
return loadInitial(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  sendMessage,TResult Function( ChatAction action)?  executeAction,TResult Function()?  clearHistory,TResult Function()?  loadInitial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SendMessageEvent() when sendMessage != null:
return sendMessage(_that.message);case ExecuteActionEvent() when executeAction != null:
return executeAction(_that.action);case ClearHistoryEvent() when clearHistory != null:
return clearHistory();case LoadInitialEvent() when loadInitial != null:
return loadInitial();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  sendMessage,required TResult Function( ChatAction action)  executeAction,required TResult Function()  clearHistory,required TResult Function()  loadInitial,}) {final _that = this;
switch (_that) {
case SendMessageEvent():
return sendMessage(_that.message);case ExecuteActionEvent():
return executeAction(_that.action);case ClearHistoryEvent():
return clearHistory();case LoadInitialEvent():
return loadInitial();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  sendMessage,TResult? Function( ChatAction action)?  executeAction,TResult? Function()?  clearHistory,TResult? Function()?  loadInitial,}) {final _that = this;
switch (_that) {
case SendMessageEvent() when sendMessage != null:
return sendMessage(_that.message);case ExecuteActionEvent() when executeAction != null:
return executeAction(_that.action);case ClearHistoryEvent() when clearHistory != null:
return clearHistory();case LoadInitialEvent() when loadInitial != null:
return loadInitial();case _:
  return null;

}
}

}

/// @nodoc


class SendMessageEvent implements ChatEvent {
  const SendMessageEvent({required this.message});
  

 final  String message;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageEventCopyWith<SendMessageEvent> get copyWith => _$SendMessageEventCopyWithImpl<SendMessageEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessageEvent&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatEvent.sendMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class $SendMessageEventCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $SendMessageEventCopyWith(SendMessageEvent value, $Res Function(SendMessageEvent) _then) = _$SendMessageEventCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SendMessageEventCopyWithImpl<$Res>
    implements $SendMessageEventCopyWith<$Res> {
  _$SendMessageEventCopyWithImpl(this._self, this._then);

  final SendMessageEvent _self;
  final $Res Function(SendMessageEvent) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SendMessageEvent(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ExecuteActionEvent implements ChatEvent {
  const ExecuteActionEvent({required this.action});
  

 final  ChatAction action;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecuteActionEventCopyWith<ExecuteActionEvent> get copyWith => _$ExecuteActionEventCopyWithImpl<ExecuteActionEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecuteActionEvent&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode => Object.hash(runtimeType,action);

@override
String toString() {
  return 'ChatEvent.executeAction(action: $action)';
}


}

/// @nodoc
abstract mixin class $ExecuteActionEventCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $ExecuteActionEventCopyWith(ExecuteActionEvent value, $Res Function(ExecuteActionEvent) _then) = _$ExecuteActionEventCopyWithImpl;
@useResult
$Res call({
 ChatAction action
});


$ChatActionCopyWith<$Res> get action;

}
/// @nodoc
class _$ExecuteActionEventCopyWithImpl<$Res>
    implements $ExecuteActionEventCopyWith<$Res> {
  _$ExecuteActionEventCopyWithImpl(this._self, this._then);

  final ExecuteActionEvent _self;
  final $Res Function(ExecuteActionEvent) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? action = null,}) {
  return _then(ExecuteActionEvent(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ChatAction,
  ));
}

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatActionCopyWith<$Res> get action {
  
  return $ChatActionCopyWith<$Res>(_self.action, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}

/// @nodoc


class ClearHistoryEvent implements ChatEvent {
  const ClearHistoryEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearHistoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.clearHistory()';
}


}




/// @nodoc


class LoadInitialEvent implements ChatEvent {
  const LoadInitialEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadInitialEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.loadInitial()';
}


}




// dart format on
