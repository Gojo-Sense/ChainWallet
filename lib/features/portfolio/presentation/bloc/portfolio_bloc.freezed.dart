// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PortfolioEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioEvent()';
}


}

/// @nodoc
class $PortfolioEventCopyWith<$Res>  {
$PortfolioEventCopyWith(PortfolioEvent _, $Res Function(PortfolioEvent) __);
}


/// Adds pattern-matching-related methods to [PortfolioEvent].
extension PortfolioEventPatterns on PortfolioEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadPortfolioEvent value)?  load,TResult Function( ChangeTimeRangeEvent value)?  changeTimeRange,TResult Function( RefreshPortfolioEvent value)?  refresh,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadPortfolioEvent() when load != null:
return load(_that);case ChangeTimeRangeEvent() when changeTimeRange != null:
return changeTimeRange(_that);case RefreshPortfolioEvent() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadPortfolioEvent value)  load,required TResult Function( ChangeTimeRangeEvent value)  changeTimeRange,required TResult Function( RefreshPortfolioEvent value)  refresh,}){
final _that = this;
switch (_that) {
case LoadPortfolioEvent():
return load(_that);case ChangeTimeRangeEvent():
return changeTimeRange(_that);case RefreshPortfolioEvent():
return refresh(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadPortfolioEvent value)?  load,TResult? Function( ChangeTimeRangeEvent value)?  changeTimeRange,TResult? Function( RefreshPortfolioEvent value)?  refresh,}){
final _that = this;
switch (_that) {
case LoadPortfolioEvent() when load != null:
return load(_that);case ChangeTimeRangeEvent() when changeTimeRange != null:
return changeTimeRange(_that);case RefreshPortfolioEvent() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( PortfolioTimeRange range)?  changeTimeRange,TResult Function()?  refresh,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadPortfolioEvent() when load != null:
return load();case ChangeTimeRangeEvent() when changeTimeRange != null:
return changeTimeRange(_that.range);case RefreshPortfolioEvent() when refresh != null:
return refresh();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( PortfolioTimeRange range)  changeTimeRange,required TResult Function()  refresh,}) {final _that = this;
switch (_that) {
case LoadPortfolioEvent():
return load();case ChangeTimeRangeEvent():
return changeTimeRange(_that.range);case RefreshPortfolioEvent():
return refresh();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( PortfolioTimeRange range)?  changeTimeRange,TResult? Function()?  refresh,}) {final _that = this;
switch (_that) {
case LoadPortfolioEvent() when load != null:
return load();case ChangeTimeRangeEvent() when changeTimeRange != null:
return changeTimeRange(_that.range);case RefreshPortfolioEvent() when refresh != null:
return refresh();case _:
  return null;

}
}

}

/// @nodoc


class LoadPortfolioEvent extends PortfolioEvent {
  const LoadPortfolioEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadPortfolioEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioEvent.load()';
}


}




/// @nodoc


class ChangeTimeRangeEvent extends PortfolioEvent {
  const ChangeTimeRangeEvent(this.range): super._();
  

 final  PortfolioTimeRange range;

/// Create a copy of PortfolioEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeTimeRangeEventCopyWith<ChangeTimeRangeEvent> get copyWith => _$ChangeTimeRangeEventCopyWithImpl<ChangeTimeRangeEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeTimeRangeEvent&&(identical(other.range, range) || other.range == range));
}


@override
int get hashCode => Object.hash(runtimeType,range);

@override
String toString() {
  return 'PortfolioEvent.changeTimeRange(range: $range)';
}


}

/// @nodoc
abstract mixin class $ChangeTimeRangeEventCopyWith<$Res> implements $PortfolioEventCopyWith<$Res> {
  factory $ChangeTimeRangeEventCopyWith(ChangeTimeRangeEvent value, $Res Function(ChangeTimeRangeEvent) _then) = _$ChangeTimeRangeEventCopyWithImpl;
@useResult
$Res call({
 PortfolioTimeRange range
});




}
/// @nodoc
class _$ChangeTimeRangeEventCopyWithImpl<$Res>
    implements $ChangeTimeRangeEventCopyWith<$Res> {
  _$ChangeTimeRangeEventCopyWithImpl(this._self, this._then);

  final ChangeTimeRangeEvent _self;
  final $Res Function(ChangeTimeRangeEvent) _then;

/// Create a copy of PortfolioEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? range = null,}) {
  return _then(ChangeTimeRangeEvent(
null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as PortfolioTimeRange,
  ));
}


}

/// @nodoc


class RefreshPortfolioEvent extends PortfolioEvent {
  const RefreshPortfolioEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshPortfolioEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioEvent.refresh()';
}


}




/// @nodoc
mixin _$PortfolioState {

 Portfolio? get portfolio; bool get isLoading; PortfolioTimeRange get selectedRange; String? get error;
/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioStateCopyWith<PortfolioState> get copyWith => _$PortfolioStateCopyWithImpl<PortfolioState>(this as PortfolioState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioState&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedRange, selectedRange) || other.selectedRange == selectedRange)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,portfolio,isLoading,selectedRange,error);

@override
String toString() {
  return 'PortfolioState(portfolio: $portfolio, isLoading: $isLoading, selectedRange: $selectedRange, error: $error)';
}


}

/// @nodoc
abstract mixin class $PortfolioStateCopyWith<$Res>  {
  factory $PortfolioStateCopyWith(PortfolioState value, $Res Function(PortfolioState) _then) = _$PortfolioStateCopyWithImpl;
@useResult
$Res call({
 Portfolio? portfolio, bool isLoading, PortfolioTimeRange selectedRange, String? error
});


$PortfolioCopyWith<$Res>? get portfolio;

}
/// @nodoc
class _$PortfolioStateCopyWithImpl<$Res>
    implements $PortfolioStateCopyWith<$Res> {
  _$PortfolioStateCopyWithImpl(this._self, this._then);

  final PortfolioState _self;
  final $Res Function(PortfolioState) _then;

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? portfolio = freezed,Object? isLoading = null,Object? selectedRange = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
portfolio: freezed == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as Portfolio?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedRange: null == selectedRange ? _self.selectedRange : selectedRange // ignore: cast_nullable_to_non_nullable
as PortfolioTimeRange,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PortfolioCopyWith<$Res>? get portfolio {
    if (_self.portfolio == null) {
    return null;
  }

  return $PortfolioCopyWith<$Res>(_self.portfolio!, (value) {
    return _then(_self.copyWith(portfolio: value));
  });
}
}


/// Adds pattern-matching-related methods to [PortfolioState].
extension PortfolioStatePatterns on PortfolioState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioState value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioState value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Portfolio? portfolio,  bool isLoading,  PortfolioTimeRange selectedRange,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioState() when $default != null:
return $default(_that.portfolio,_that.isLoading,_that.selectedRange,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Portfolio? portfolio,  bool isLoading,  PortfolioTimeRange selectedRange,  String? error)  $default,) {final _that = this;
switch (_that) {
case _PortfolioState():
return $default(_that.portfolio,_that.isLoading,_that.selectedRange,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Portfolio? portfolio,  bool isLoading,  PortfolioTimeRange selectedRange,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioState() when $default != null:
return $default(_that.portfolio,_that.isLoading,_that.selectedRange,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PortfolioState extends PortfolioState {
  const _PortfolioState({this.portfolio, this.isLoading = false, this.selectedRange = PortfolioTimeRange.month, this.error}): super._();
  

@override final  Portfolio? portfolio;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  PortfolioTimeRange selectedRange;
@override final  String? error;

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioStateCopyWith<_PortfolioState> get copyWith => __$PortfolioStateCopyWithImpl<_PortfolioState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioState&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedRange, selectedRange) || other.selectedRange == selectedRange)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,portfolio,isLoading,selectedRange,error);

@override
String toString() {
  return 'PortfolioState(portfolio: $portfolio, isLoading: $isLoading, selectedRange: $selectedRange, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PortfolioStateCopyWith<$Res> implements $PortfolioStateCopyWith<$Res> {
  factory _$PortfolioStateCopyWith(_PortfolioState value, $Res Function(_PortfolioState) _then) = __$PortfolioStateCopyWithImpl;
@override @useResult
$Res call({
 Portfolio? portfolio, bool isLoading, PortfolioTimeRange selectedRange, String? error
});


@override $PortfolioCopyWith<$Res>? get portfolio;

}
/// @nodoc
class __$PortfolioStateCopyWithImpl<$Res>
    implements _$PortfolioStateCopyWith<$Res> {
  __$PortfolioStateCopyWithImpl(this._self, this._then);

  final _PortfolioState _self;
  final $Res Function(_PortfolioState) _then;

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? portfolio = freezed,Object? isLoading = null,Object? selectedRange = null,Object? error = freezed,}) {
  return _then(_PortfolioState(
portfolio: freezed == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as Portfolio?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedRange: null == selectedRange ? _self.selectedRange : selectedRange // ignore: cast_nullable_to_non_nullable
as PortfolioTimeRange,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PortfolioCopyWith<$Res>? get portfolio {
    if (_self.portfolio == null) {
    return null;
  }

  return $PortfolioCopyWith<$Res>(_self.portfolio!, (value) {
    return _then(_self.copyWith(portfolio: value));
  });
}
}

// dart format on
