// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlertEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AlertEvent()';
}


}

/// @nodoc
class $AlertEventCopyWith<$Res>  {
$AlertEventCopyWith(AlertEvent _, $Res Function(AlertEvent) __);
}


/// Adds pattern-matching-related methods to [AlertEvent].
extension AlertEventPatterns on AlertEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadAlertsEvent value)?  loadAlerts,TResult Function( CreateAlertEvent value)?  createAlert,TResult Function( DeleteAlertEvent value)?  deleteAlert,TResult Function( ToggleAlertEvent value)?  toggleAlert,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadAlertsEvent() when loadAlerts != null:
return loadAlerts(_that);case CreateAlertEvent() when createAlert != null:
return createAlert(_that);case DeleteAlertEvent() when deleteAlert != null:
return deleteAlert(_that);case ToggleAlertEvent() when toggleAlert != null:
return toggleAlert(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadAlertsEvent value)  loadAlerts,required TResult Function( CreateAlertEvent value)  createAlert,required TResult Function( DeleteAlertEvent value)  deleteAlert,required TResult Function( ToggleAlertEvent value)  toggleAlert,}){
final _that = this;
switch (_that) {
case LoadAlertsEvent():
return loadAlerts(_that);case CreateAlertEvent():
return createAlert(_that);case DeleteAlertEvent():
return deleteAlert(_that);case ToggleAlertEvent():
return toggleAlert(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadAlertsEvent value)?  loadAlerts,TResult? Function( CreateAlertEvent value)?  createAlert,TResult? Function( DeleteAlertEvent value)?  deleteAlert,TResult? Function( ToggleAlertEvent value)?  toggleAlert,}){
final _that = this;
switch (_that) {
case LoadAlertsEvent() when loadAlerts != null:
return loadAlerts(_that);case CreateAlertEvent() when createAlert != null:
return createAlert(_that);case DeleteAlertEvent() when deleteAlert != null:
return deleteAlert(_that);case ToggleAlertEvent() when toggleAlert != null:
return toggleAlert(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadAlerts,TResult Function( String tokenId,  String tokenName,  String tokenSymbol,  double targetPrice,  double currentPrice,  AlertCondition condition)?  createAlert,TResult Function( String alertId)?  deleteAlert,TResult Function( String alertId)?  toggleAlert,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadAlertsEvent() when loadAlerts != null:
return loadAlerts();case CreateAlertEvent() when createAlert != null:
return createAlert(_that.tokenId,_that.tokenName,_that.tokenSymbol,_that.targetPrice,_that.currentPrice,_that.condition);case DeleteAlertEvent() when deleteAlert != null:
return deleteAlert(_that.alertId);case ToggleAlertEvent() when toggleAlert != null:
return toggleAlert(_that.alertId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadAlerts,required TResult Function( String tokenId,  String tokenName,  String tokenSymbol,  double targetPrice,  double currentPrice,  AlertCondition condition)  createAlert,required TResult Function( String alertId)  deleteAlert,required TResult Function( String alertId)  toggleAlert,}) {final _that = this;
switch (_that) {
case LoadAlertsEvent():
return loadAlerts();case CreateAlertEvent():
return createAlert(_that.tokenId,_that.tokenName,_that.tokenSymbol,_that.targetPrice,_that.currentPrice,_that.condition);case DeleteAlertEvent():
return deleteAlert(_that.alertId);case ToggleAlertEvent():
return toggleAlert(_that.alertId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadAlerts,TResult? Function( String tokenId,  String tokenName,  String tokenSymbol,  double targetPrice,  double currentPrice,  AlertCondition condition)?  createAlert,TResult? Function( String alertId)?  deleteAlert,TResult? Function( String alertId)?  toggleAlert,}) {final _that = this;
switch (_that) {
case LoadAlertsEvent() when loadAlerts != null:
return loadAlerts();case CreateAlertEvent() when createAlert != null:
return createAlert(_that.tokenId,_that.tokenName,_that.tokenSymbol,_that.targetPrice,_that.currentPrice,_that.condition);case DeleteAlertEvent() when deleteAlert != null:
return deleteAlert(_that.alertId);case ToggleAlertEvent() when toggleAlert != null:
return toggleAlert(_that.alertId);case _:
  return null;

}
}

}

/// @nodoc


class LoadAlertsEvent implements AlertEvent {
  const LoadAlertsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadAlertsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AlertEvent.loadAlerts()';
}


}




/// @nodoc


class CreateAlertEvent implements AlertEvent {
  const CreateAlertEvent({required this.tokenId, required this.tokenName, required this.tokenSymbol, required this.targetPrice, required this.currentPrice, required this.condition});
  

 final  String tokenId;
 final  String tokenName;
 final  String tokenSymbol;
 final  double targetPrice;
 final  double currentPrice;
 final  AlertCondition condition;

/// Create a copy of AlertEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAlertEventCopyWith<CreateAlertEvent> get copyWith => _$CreateAlertEventCopyWithImpl<CreateAlertEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAlertEvent&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenName, tokenName) || other.tokenName == tokenName)&&(identical(other.tokenSymbol, tokenSymbol) || other.tokenSymbol == tokenSymbol)&&(identical(other.targetPrice, targetPrice) || other.targetPrice == targetPrice)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.condition, condition) || other.condition == condition));
}


@override
int get hashCode => Object.hash(runtimeType,tokenId,tokenName,tokenSymbol,targetPrice,currentPrice,condition);

@override
String toString() {
  return 'AlertEvent.createAlert(tokenId: $tokenId, tokenName: $tokenName, tokenSymbol: $tokenSymbol, targetPrice: $targetPrice, currentPrice: $currentPrice, condition: $condition)';
}


}

/// @nodoc
abstract mixin class $CreateAlertEventCopyWith<$Res> implements $AlertEventCopyWith<$Res> {
  factory $CreateAlertEventCopyWith(CreateAlertEvent value, $Res Function(CreateAlertEvent) _then) = _$CreateAlertEventCopyWithImpl;
@useResult
$Res call({
 String tokenId, String tokenName, String tokenSymbol, double targetPrice, double currentPrice, AlertCondition condition
});




}
/// @nodoc
class _$CreateAlertEventCopyWithImpl<$Res>
    implements $CreateAlertEventCopyWith<$Res> {
  _$CreateAlertEventCopyWithImpl(this._self, this._then);

  final CreateAlertEvent _self;
  final $Res Function(CreateAlertEvent) _then;

/// Create a copy of AlertEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tokenId = null,Object? tokenName = null,Object? tokenSymbol = null,Object? targetPrice = null,Object? currentPrice = null,Object? condition = null,}) {
  return _then(CreateAlertEvent(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenName: null == tokenName ? _self.tokenName : tokenName // ignore: cast_nullable_to_non_nullable
as String,tokenSymbol: null == tokenSymbol ? _self.tokenSymbol : tokenSymbol // ignore: cast_nullable_to_non_nullable
as String,targetPrice: null == targetPrice ? _self.targetPrice : targetPrice // ignore: cast_nullable_to_non_nullable
as double,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as AlertCondition,
  ));
}


}

/// @nodoc


class DeleteAlertEvent implements AlertEvent {
  const DeleteAlertEvent({required this.alertId});
  

 final  String alertId;

/// Create a copy of AlertEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteAlertEventCopyWith<DeleteAlertEvent> get copyWith => _$DeleteAlertEventCopyWithImpl<DeleteAlertEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAlertEvent&&(identical(other.alertId, alertId) || other.alertId == alertId));
}


@override
int get hashCode => Object.hash(runtimeType,alertId);

@override
String toString() {
  return 'AlertEvent.deleteAlert(alertId: $alertId)';
}


}

/// @nodoc
abstract mixin class $DeleteAlertEventCopyWith<$Res> implements $AlertEventCopyWith<$Res> {
  factory $DeleteAlertEventCopyWith(DeleteAlertEvent value, $Res Function(DeleteAlertEvent) _then) = _$DeleteAlertEventCopyWithImpl;
@useResult
$Res call({
 String alertId
});




}
/// @nodoc
class _$DeleteAlertEventCopyWithImpl<$Res>
    implements $DeleteAlertEventCopyWith<$Res> {
  _$DeleteAlertEventCopyWithImpl(this._self, this._then);

  final DeleteAlertEvent _self;
  final $Res Function(DeleteAlertEvent) _then;

/// Create a copy of AlertEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alertId = null,}) {
  return _then(DeleteAlertEvent(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ToggleAlertEvent implements AlertEvent {
  const ToggleAlertEvent({required this.alertId});
  

 final  String alertId;

/// Create a copy of AlertEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleAlertEventCopyWith<ToggleAlertEvent> get copyWith => _$ToggleAlertEventCopyWithImpl<ToggleAlertEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleAlertEvent&&(identical(other.alertId, alertId) || other.alertId == alertId));
}


@override
int get hashCode => Object.hash(runtimeType,alertId);

@override
String toString() {
  return 'AlertEvent.toggleAlert(alertId: $alertId)';
}


}

/// @nodoc
abstract mixin class $ToggleAlertEventCopyWith<$Res> implements $AlertEventCopyWith<$Res> {
  factory $ToggleAlertEventCopyWith(ToggleAlertEvent value, $Res Function(ToggleAlertEvent) _then) = _$ToggleAlertEventCopyWithImpl;
@useResult
$Res call({
 String alertId
});




}
/// @nodoc
class _$ToggleAlertEventCopyWithImpl<$Res>
    implements $ToggleAlertEventCopyWith<$Res> {
  _$ToggleAlertEventCopyWithImpl(this._self, this._then);

  final ToggleAlertEvent _self;
  final $Res Function(ToggleAlertEvent) _then;

/// Create a copy of AlertEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alertId = null,}) {
  return _then(ToggleAlertEvent(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
