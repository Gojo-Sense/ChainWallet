// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AchievementEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchievementEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AchievementEvent()';
}


}

/// @nodoc
class $AchievementEventCopyWith<$Res>  {
$AchievementEventCopyWith(AchievementEvent _, $Res Function(AchievementEvent) __);
}


/// Adds pattern-matching-related methods to [AchievementEvent].
extension AchievementEventPatterns on AchievementEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadAchievementsEvent value)?  load,TResult Function( FilterByCategoryEvent value)?  filterByCategory,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadAchievementsEvent() when load != null:
return load(_that);case FilterByCategoryEvent() when filterByCategory != null:
return filterByCategory(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadAchievementsEvent value)  load,required TResult Function( FilterByCategoryEvent value)  filterByCategory,}){
final _that = this;
switch (_that) {
case LoadAchievementsEvent():
return load(_that);case FilterByCategoryEvent():
return filterByCategory(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadAchievementsEvent value)?  load,TResult? Function( FilterByCategoryEvent value)?  filterByCategory,}){
final _that = this;
switch (_that) {
case LoadAchievementsEvent() when load != null:
return load(_that);case FilterByCategoryEvent() when filterByCategory != null:
return filterByCategory(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( AchievementCategory? category)?  filterByCategory,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadAchievementsEvent() when load != null:
return load();case FilterByCategoryEvent() when filterByCategory != null:
return filterByCategory(_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( AchievementCategory? category)  filterByCategory,}) {final _that = this;
switch (_that) {
case LoadAchievementsEvent():
return load();case FilterByCategoryEvent():
return filterByCategory(_that.category);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( AchievementCategory? category)?  filterByCategory,}) {final _that = this;
switch (_that) {
case LoadAchievementsEvent() when load != null:
return load();case FilterByCategoryEvent() when filterByCategory != null:
return filterByCategory(_that.category);case _:
  return null;

}
}

}

/// @nodoc


class LoadAchievementsEvent extends AchievementEvent {
  const LoadAchievementsEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadAchievementsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AchievementEvent.load()';
}


}




/// @nodoc


class FilterByCategoryEvent extends AchievementEvent {
  const FilterByCategoryEvent(this.category): super._();
  

 final  AchievementCategory? category;

/// Create a copy of AchievementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterByCategoryEventCopyWith<FilterByCategoryEvent> get copyWith => _$FilterByCategoryEventCopyWithImpl<FilterByCategoryEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterByCategoryEvent&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'AchievementEvent.filterByCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class $FilterByCategoryEventCopyWith<$Res> implements $AchievementEventCopyWith<$Res> {
  factory $FilterByCategoryEventCopyWith(FilterByCategoryEvent value, $Res Function(FilterByCategoryEvent) _then) = _$FilterByCategoryEventCopyWithImpl;
@useResult
$Res call({
 AchievementCategory? category
});




}
/// @nodoc
class _$FilterByCategoryEventCopyWithImpl<$Res>
    implements $FilterByCategoryEventCopyWith<$Res> {
  _$FilterByCategoryEventCopyWithImpl(this._self, this._then);

  final FilterByCategoryEvent _self;
  final $Res Function(FilterByCategoryEvent) _then;

/// Create a copy of AchievementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = freezed,}) {
  return _then(FilterByCategoryEvent(
freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as AchievementCategory?,
  ));
}


}

/// @nodoc
mixin _$AchievementState {

 List<Achievement> get achievements; bool get isLoading; AchievementStats? get stats; AchievementCategory? get selectedCategory; String? get error;
/// Create a copy of AchievementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementStateCopyWith<AchievementState> get copyWith => _$AchievementStateCopyWithImpl<AchievementState>(this as AchievementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchievementState&&const DeepCollectionEquality().equals(other.achievements, achievements)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(achievements),isLoading,stats,selectedCategory,error);

@override
String toString() {
  return 'AchievementState(achievements: $achievements, isLoading: $isLoading, stats: $stats, selectedCategory: $selectedCategory, error: $error)';
}


}

/// @nodoc
abstract mixin class $AchievementStateCopyWith<$Res>  {
  factory $AchievementStateCopyWith(AchievementState value, $Res Function(AchievementState) _then) = _$AchievementStateCopyWithImpl;
@useResult
$Res call({
 List<Achievement> achievements, bool isLoading, AchievementStats? stats, AchievementCategory? selectedCategory, String? error
});


$AchievementStatsCopyWith<$Res>? get stats;

}
/// @nodoc
class _$AchievementStateCopyWithImpl<$Res>
    implements $AchievementStateCopyWith<$Res> {
  _$AchievementStateCopyWithImpl(this._self, this._then);

  final AchievementState _self;
  final $Res Function(AchievementState) _then;

/// Create a copy of AchievementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? achievements = null,Object? isLoading = null,Object? stats = freezed,Object? selectedCategory = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<Achievement>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as AchievementStats?,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as AchievementCategory?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AchievementState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AchievementStatsCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $AchievementStatsCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [AchievementState].
extension AchievementStatePatterns on AchievementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AchievementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AchievementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AchievementState value)  $default,){
final _that = this;
switch (_that) {
case _AchievementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AchievementState value)?  $default,){
final _that = this;
switch (_that) {
case _AchievementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Achievement> achievements,  bool isLoading,  AchievementStats? stats,  AchievementCategory? selectedCategory,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AchievementState() when $default != null:
return $default(_that.achievements,_that.isLoading,_that.stats,_that.selectedCategory,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Achievement> achievements,  bool isLoading,  AchievementStats? stats,  AchievementCategory? selectedCategory,  String? error)  $default,) {final _that = this;
switch (_that) {
case _AchievementState():
return $default(_that.achievements,_that.isLoading,_that.stats,_that.selectedCategory,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Achievement> achievements,  bool isLoading,  AchievementStats? stats,  AchievementCategory? selectedCategory,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _AchievementState() when $default != null:
return $default(_that.achievements,_that.isLoading,_that.stats,_that.selectedCategory,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AchievementState extends AchievementState {
  const _AchievementState({final  List<Achievement> achievements = const [], this.isLoading = false, this.stats, this.selectedCategory, this.error}): _achievements = achievements,super._();
  

 final  List<Achievement> _achievements;
@override@JsonKey() List<Achievement> get achievements {
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievements);
}

@override@JsonKey() final  bool isLoading;
@override final  AchievementStats? stats;
@override final  AchievementCategory? selectedCategory;
@override final  String? error;

/// Create a copy of AchievementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementStateCopyWith<_AchievementState> get copyWith => __$AchievementStateCopyWithImpl<_AchievementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AchievementState&&const DeepCollectionEquality().equals(other._achievements, _achievements)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_achievements),isLoading,stats,selectedCategory,error);

@override
String toString() {
  return 'AchievementState(achievements: $achievements, isLoading: $isLoading, stats: $stats, selectedCategory: $selectedCategory, error: $error)';
}


}

/// @nodoc
abstract mixin class _$AchievementStateCopyWith<$Res> implements $AchievementStateCopyWith<$Res> {
  factory _$AchievementStateCopyWith(_AchievementState value, $Res Function(_AchievementState) _then) = __$AchievementStateCopyWithImpl;
@override @useResult
$Res call({
 List<Achievement> achievements, bool isLoading, AchievementStats? stats, AchievementCategory? selectedCategory, String? error
});


@override $AchievementStatsCopyWith<$Res>? get stats;

}
/// @nodoc
class __$AchievementStateCopyWithImpl<$Res>
    implements _$AchievementStateCopyWith<$Res> {
  __$AchievementStateCopyWithImpl(this._self, this._then);

  final _AchievementState _self;
  final $Res Function(_AchievementState) _then;

/// Create a copy of AchievementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? achievements = null,Object? isLoading = null,Object? stats = freezed,Object? selectedCategory = freezed,Object? error = freezed,}) {
  return _then(_AchievementState(
achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<Achievement>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as AchievementStats?,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as AchievementCategory?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AchievementState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AchievementStatsCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $AchievementStatsCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}

// dart format on
