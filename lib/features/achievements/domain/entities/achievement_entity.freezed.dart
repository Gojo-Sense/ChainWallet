// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Achievement {

 String get id; String get title; String get description; String get emoji; AchievementCategory get category; AchievementRarity get rarity; bool get isUnlocked; DateTime? get unlockedAt; double? get progress; double? get target; int? get xpReward;
/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementCopyWith<Achievement> get copyWith => _$AchievementCopyWithImpl<Achievement>(this as Achievement, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Achievement&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.category, category) || other.category == category)&&(identical(other.rarity, rarity) || other.rarity == rarity)&&(identical(other.isUnlocked, isUnlocked) || other.isUnlocked == isUnlocked)&&(identical(other.unlockedAt, unlockedAt) || other.unlockedAt == unlockedAt)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.target, target) || other.target == target)&&(identical(other.xpReward, xpReward) || other.xpReward == xpReward));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,emoji,category,rarity,isUnlocked,unlockedAt,progress,target,xpReward);

@override
String toString() {
  return 'Achievement(id: $id, title: $title, description: $description, emoji: $emoji, category: $category, rarity: $rarity, isUnlocked: $isUnlocked, unlockedAt: $unlockedAt, progress: $progress, target: $target, xpReward: $xpReward)';
}


}

/// @nodoc
abstract mixin class $AchievementCopyWith<$Res>  {
  factory $AchievementCopyWith(Achievement value, $Res Function(Achievement) _then) = _$AchievementCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, String emoji, AchievementCategory category, AchievementRarity rarity, bool isUnlocked, DateTime? unlockedAt, double? progress, double? target, int? xpReward
});




}
/// @nodoc
class _$AchievementCopyWithImpl<$Res>
    implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._self, this._then);

  final Achievement _self;
  final $Res Function(Achievement) _then;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? emoji = null,Object? category = null,Object? rarity = null,Object? isUnlocked = null,Object? unlockedAt = freezed,Object? progress = freezed,Object? target = freezed,Object? xpReward = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as AchievementCategory,rarity: null == rarity ? _self.rarity : rarity // ignore: cast_nullable_to_non_nullable
as AchievementRarity,isUnlocked: null == isUnlocked ? _self.isUnlocked : isUnlocked // ignore: cast_nullable_to_non_nullable
as bool,unlockedAt: freezed == unlockedAt ? _self.unlockedAt : unlockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as double?,xpReward: freezed == xpReward ? _self.xpReward : xpReward // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Achievement].
extension AchievementPatterns on Achievement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Achievement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Achievement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Achievement value)  $default,){
final _that = this;
switch (_that) {
case _Achievement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Achievement value)?  $default,){
final _that = this;
switch (_that) {
case _Achievement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String emoji,  AchievementCategory category,  AchievementRarity rarity,  bool isUnlocked,  DateTime? unlockedAt,  double? progress,  double? target,  int? xpReward)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Achievement() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.emoji,_that.category,_that.rarity,_that.isUnlocked,_that.unlockedAt,_that.progress,_that.target,_that.xpReward);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String emoji,  AchievementCategory category,  AchievementRarity rarity,  bool isUnlocked,  DateTime? unlockedAt,  double? progress,  double? target,  int? xpReward)  $default,) {final _that = this;
switch (_that) {
case _Achievement():
return $default(_that.id,_that.title,_that.description,_that.emoji,_that.category,_that.rarity,_that.isUnlocked,_that.unlockedAt,_that.progress,_that.target,_that.xpReward);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  String emoji,  AchievementCategory category,  AchievementRarity rarity,  bool isUnlocked,  DateTime? unlockedAt,  double? progress,  double? target,  int? xpReward)?  $default,) {final _that = this;
switch (_that) {
case _Achievement() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.emoji,_that.category,_that.rarity,_that.isUnlocked,_that.unlockedAt,_that.progress,_that.target,_that.xpReward);case _:
  return null;

}
}

}

/// @nodoc


class _Achievement extends Achievement {
  const _Achievement({required this.id, required this.title, required this.description, required this.emoji, required this.category, required this.rarity, this.isUnlocked = false, this.unlockedAt, this.progress, this.target, this.xpReward}): super._();
  

@override final  String id;
@override final  String title;
@override final  String description;
@override final  String emoji;
@override final  AchievementCategory category;
@override final  AchievementRarity rarity;
@override@JsonKey() final  bool isUnlocked;
@override final  DateTime? unlockedAt;
@override final  double? progress;
@override final  double? target;
@override final  int? xpReward;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementCopyWith<_Achievement> get copyWith => __$AchievementCopyWithImpl<_Achievement>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Achievement&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.category, category) || other.category == category)&&(identical(other.rarity, rarity) || other.rarity == rarity)&&(identical(other.isUnlocked, isUnlocked) || other.isUnlocked == isUnlocked)&&(identical(other.unlockedAt, unlockedAt) || other.unlockedAt == unlockedAt)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.target, target) || other.target == target)&&(identical(other.xpReward, xpReward) || other.xpReward == xpReward));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,emoji,category,rarity,isUnlocked,unlockedAt,progress,target,xpReward);

@override
String toString() {
  return 'Achievement(id: $id, title: $title, description: $description, emoji: $emoji, category: $category, rarity: $rarity, isUnlocked: $isUnlocked, unlockedAt: $unlockedAt, progress: $progress, target: $target, xpReward: $xpReward)';
}


}

/// @nodoc
abstract mixin class _$AchievementCopyWith<$Res> implements $AchievementCopyWith<$Res> {
  factory _$AchievementCopyWith(_Achievement value, $Res Function(_Achievement) _then) = __$AchievementCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, String emoji, AchievementCategory category, AchievementRarity rarity, bool isUnlocked, DateTime? unlockedAt, double? progress, double? target, int? xpReward
});




}
/// @nodoc
class __$AchievementCopyWithImpl<$Res>
    implements _$AchievementCopyWith<$Res> {
  __$AchievementCopyWithImpl(this._self, this._then);

  final _Achievement _self;
  final $Res Function(_Achievement) _then;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? emoji = null,Object? category = null,Object? rarity = null,Object? isUnlocked = null,Object? unlockedAt = freezed,Object? progress = freezed,Object? target = freezed,Object? xpReward = freezed,}) {
  return _then(_Achievement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as AchievementCategory,rarity: null == rarity ? _self.rarity : rarity // ignore: cast_nullable_to_non_nullable
as AchievementRarity,isUnlocked: null == isUnlocked ? _self.isUnlocked : isUnlocked // ignore: cast_nullable_to_non_nullable
as bool,unlockedAt: freezed == unlockedAt ? _self.unlockedAt : unlockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as double?,xpReward: freezed == xpReward ? _self.xpReward : xpReward // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$AchievementStats {

 int get totalAchievements; int get unlockedAchievements; int get totalXP; int get currentLevel; int get xpToNextLevel;
/// Create a copy of AchievementStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementStatsCopyWith<AchievementStats> get copyWith => _$AchievementStatsCopyWithImpl<AchievementStats>(this as AchievementStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchievementStats&&(identical(other.totalAchievements, totalAchievements) || other.totalAchievements == totalAchievements)&&(identical(other.unlockedAchievements, unlockedAchievements) || other.unlockedAchievements == unlockedAchievements)&&(identical(other.totalXP, totalXP) || other.totalXP == totalXP)&&(identical(other.currentLevel, currentLevel) || other.currentLevel == currentLevel)&&(identical(other.xpToNextLevel, xpToNextLevel) || other.xpToNextLevel == xpToNextLevel));
}


@override
int get hashCode => Object.hash(runtimeType,totalAchievements,unlockedAchievements,totalXP,currentLevel,xpToNextLevel);

@override
String toString() {
  return 'AchievementStats(totalAchievements: $totalAchievements, unlockedAchievements: $unlockedAchievements, totalXP: $totalXP, currentLevel: $currentLevel, xpToNextLevel: $xpToNextLevel)';
}


}

/// @nodoc
abstract mixin class $AchievementStatsCopyWith<$Res>  {
  factory $AchievementStatsCopyWith(AchievementStats value, $Res Function(AchievementStats) _then) = _$AchievementStatsCopyWithImpl;
@useResult
$Res call({
 int totalAchievements, int unlockedAchievements, int totalXP, int currentLevel, int xpToNextLevel
});




}
/// @nodoc
class _$AchievementStatsCopyWithImpl<$Res>
    implements $AchievementStatsCopyWith<$Res> {
  _$AchievementStatsCopyWithImpl(this._self, this._then);

  final AchievementStats _self;
  final $Res Function(AchievementStats) _then;

/// Create a copy of AchievementStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalAchievements = null,Object? unlockedAchievements = null,Object? totalXP = null,Object? currentLevel = null,Object? xpToNextLevel = null,}) {
  return _then(_self.copyWith(
totalAchievements: null == totalAchievements ? _self.totalAchievements : totalAchievements // ignore: cast_nullable_to_non_nullable
as int,unlockedAchievements: null == unlockedAchievements ? _self.unlockedAchievements : unlockedAchievements // ignore: cast_nullable_to_non_nullable
as int,totalXP: null == totalXP ? _self.totalXP : totalXP // ignore: cast_nullable_to_non_nullable
as int,currentLevel: null == currentLevel ? _self.currentLevel : currentLevel // ignore: cast_nullable_to_non_nullable
as int,xpToNextLevel: null == xpToNextLevel ? _self.xpToNextLevel : xpToNextLevel // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AchievementStats].
extension AchievementStatsPatterns on AchievementStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AchievementStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AchievementStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AchievementStats value)  $default,){
final _that = this;
switch (_that) {
case _AchievementStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AchievementStats value)?  $default,){
final _that = this;
switch (_that) {
case _AchievementStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalAchievements,  int unlockedAchievements,  int totalXP,  int currentLevel,  int xpToNextLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AchievementStats() when $default != null:
return $default(_that.totalAchievements,_that.unlockedAchievements,_that.totalXP,_that.currentLevel,_that.xpToNextLevel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalAchievements,  int unlockedAchievements,  int totalXP,  int currentLevel,  int xpToNextLevel)  $default,) {final _that = this;
switch (_that) {
case _AchievementStats():
return $default(_that.totalAchievements,_that.unlockedAchievements,_that.totalXP,_that.currentLevel,_that.xpToNextLevel);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalAchievements,  int unlockedAchievements,  int totalXP,  int currentLevel,  int xpToNextLevel)?  $default,) {final _that = this;
switch (_that) {
case _AchievementStats() when $default != null:
return $default(_that.totalAchievements,_that.unlockedAchievements,_that.totalXP,_that.currentLevel,_that.xpToNextLevel);case _:
  return null;

}
}

}

/// @nodoc


class _AchievementStats extends AchievementStats {
  const _AchievementStats({required this.totalAchievements, required this.unlockedAchievements, required this.totalXP, required this.currentLevel, required this.xpToNextLevel}): super._();
  

@override final  int totalAchievements;
@override final  int unlockedAchievements;
@override final  int totalXP;
@override final  int currentLevel;
@override final  int xpToNextLevel;

/// Create a copy of AchievementStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementStatsCopyWith<_AchievementStats> get copyWith => __$AchievementStatsCopyWithImpl<_AchievementStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AchievementStats&&(identical(other.totalAchievements, totalAchievements) || other.totalAchievements == totalAchievements)&&(identical(other.unlockedAchievements, unlockedAchievements) || other.unlockedAchievements == unlockedAchievements)&&(identical(other.totalXP, totalXP) || other.totalXP == totalXP)&&(identical(other.currentLevel, currentLevel) || other.currentLevel == currentLevel)&&(identical(other.xpToNextLevel, xpToNextLevel) || other.xpToNextLevel == xpToNextLevel));
}


@override
int get hashCode => Object.hash(runtimeType,totalAchievements,unlockedAchievements,totalXP,currentLevel,xpToNextLevel);

@override
String toString() {
  return 'AchievementStats(totalAchievements: $totalAchievements, unlockedAchievements: $unlockedAchievements, totalXP: $totalXP, currentLevel: $currentLevel, xpToNextLevel: $xpToNextLevel)';
}


}

/// @nodoc
abstract mixin class _$AchievementStatsCopyWith<$Res> implements $AchievementStatsCopyWith<$Res> {
  factory _$AchievementStatsCopyWith(_AchievementStats value, $Res Function(_AchievementStats) _then) = __$AchievementStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalAchievements, int unlockedAchievements, int totalXP, int currentLevel, int xpToNextLevel
});




}
/// @nodoc
class __$AchievementStatsCopyWithImpl<$Res>
    implements _$AchievementStatsCopyWith<$Res> {
  __$AchievementStatsCopyWithImpl(this._self, this._then);

  final _AchievementStats _self;
  final $Res Function(_AchievementStats) _then;

/// Create a copy of AchievementStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalAchievements = null,Object? unlockedAchievements = null,Object? totalXP = null,Object? currentLevel = null,Object? xpToNextLevel = null,}) {
  return _then(_AchievementStats(
totalAchievements: null == totalAchievements ? _self.totalAchievements : totalAchievements // ignore: cast_nullable_to_non_nullable
as int,unlockedAchievements: null == unlockedAchievements ? _self.unlockedAchievements : unlockedAchievements // ignore: cast_nullable_to_non_nullable
as int,totalXP: null == totalXP ? _self.totalXP : totalXP // ignore: cast_nullable_to_non_nullable
as int,currentLevel: null == currentLevel ? _self.currentLevel : currentLevel // ignore: cast_nullable_to_non_nullable
as int,xpToNextLevel: null == xpToNextLevel ? _self.xpToNextLevel : xpToNextLevel // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
