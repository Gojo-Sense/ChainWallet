// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MarketEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MarketEvent()';
}


}

/// @nodoc
class $MarketEventCopyWith<$Res>  {
$MarketEventCopyWith(MarketEvent _, $Res Function(MarketEvent) __);
}


/// Adds pattern-matching-related methods to [MarketEvent].
extension MarketEventPatterns on MarketEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadTopTokens value)?  loadTopTokens,TResult Function( RefreshTokens value)?  refreshTokens,TResult Function( SelectToken value)?  selectToken,TResult Function( LoadChart value)?  loadChart,TResult Function( ChangeChartRange value)?  changeChartRange,TResult Function( SearchTokens value)?  searchTokens,TResult Function( ClearSelection value)?  clearSelection,TResult Function( StartLiveChart value)?  startLiveChart,TResult Function( StopLiveChart value)?  stopLiveChart,TResult Function( ChangeChartInterval value)?  changeChartInterval,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadTopTokens() when loadTopTokens != null:
return loadTopTokens(_that);case RefreshTokens() when refreshTokens != null:
return refreshTokens(_that);case SelectToken() when selectToken != null:
return selectToken(_that);case LoadChart() when loadChart != null:
return loadChart(_that);case ChangeChartRange() when changeChartRange != null:
return changeChartRange(_that);case SearchTokens() when searchTokens != null:
return searchTokens(_that);case ClearSelection() when clearSelection != null:
return clearSelection(_that);case StartLiveChart() when startLiveChart != null:
return startLiveChart(_that);case StopLiveChart() when stopLiveChart != null:
return stopLiveChart(_that);case ChangeChartInterval() when changeChartInterval != null:
return changeChartInterval(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadTopTokens value)  loadTopTokens,required TResult Function( RefreshTokens value)  refreshTokens,required TResult Function( SelectToken value)  selectToken,required TResult Function( LoadChart value)  loadChart,required TResult Function( ChangeChartRange value)  changeChartRange,required TResult Function( SearchTokens value)  searchTokens,required TResult Function( ClearSelection value)  clearSelection,required TResult Function( StartLiveChart value)  startLiveChart,required TResult Function( StopLiveChart value)  stopLiveChart,required TResult Function( ChangeChartInterval value)  changeChartInterval,}){
final _that = this;
switch (_that) {
case LoadTopTokens():
return loadTopTokens(_that);case RefreshTokens():
return refreshTokens(_that);case SelectToken():
return selectToken(_that);case LoadChart():
return loadChart(_that);case ChangeChartRange():
return changeChartRange(_that);case SearchTokens():
return searchTokens(_that);case ClearSelection():
return clearSelection(_that);case StartLiveChart():
return startLiveChart(_that);case StopLiveChart():
return stopLiveChart(_that);case ChangeChartInterval():
return changeChartInterval(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadTopTokens value)?  loadTopTokens,TResult? Function( RefreshTokens value)?  refreshTokens,TResult? Function( SelectToken value)?  selectToken,TResult? Function( LoadChart value)?  loadChart,TResult? Function( ChangeChartRange value)?  changeChartRange,TResult? Function( SearchTokens value)?  searchTokens,TResult? Function( ClearSelection value)?  clearSelection,TResult? Function( StartLiveChart value)?  startLiveChart,TResult? Function( StopLiveChart value)?  stopLiveChart,TResult? Function( ChangeChartInterval value)?  changeChartInterval,}){
final _that = this;
switch (_that) {
case LoadTopTokens() when loadTopTokens != null:
return loadTopTokens(_that);case RefreshTokens() when refreshTokens != null:
return refreshTokens(_that);case SelectToken() when selectToken != null:
return selectToken(_that);case LoadChart() when loadChart != null:
return loadChart(_that);case ChangeChartRange() when changeChartRange != null:
return changeChartRange(_that);case SearchTokens() when searchTokens != null:
return searchTokens(_that);case ClearSelection() when clearSelection != null:
return clearSelection(_that);case StartLiveChart() when startLiveChart != null:
return startLiveChart(_that);case StopLiveChart() when stopLiveChart != null:
return stopLiveChart(_that);case ChangeChartInterval() when changeChartInterval != null:
return changeChartInterval(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadTopTokens,TResult Function()?  refreshTokens,TResult Function( String tokenId)?  selectToken,TResult Function( String tokenId,  int days)?  loadChart,TResult Function( int days)?  changeChartRange,TResult Function( String query)?  searchTokens,TResult Function()?  clearSelection,TResult Function( String tokenId,  String interval)?  startLiveChart,TResult Function()?  stopLiveChart,TResult Function( String interval)?  changeChartInterval,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadTopTokens() when loadTopTokens != null:
return loadTopTokens();case RefreshTokens() when refreshTokens != null:
return refreshTokens();case SelectToken() when selectToken != null:
return selectToken(_that.tokenId);case LoadChart() when loadChart != null:
return loadChart(_that.tokenId,_that.days);case ChangeChartRange() when changeChartRange != null:
return changeChartRange(_that.days);case SearchTokens() when searchTokens != null:
return searchTokens(_that.query);case ClearSelection() when clearSelection != null:
return clearSelection();case StartLiveChart() when startLiveChart != null:
return startLiveChart(_that.tokenId,_that.interval);case StopLiveChart() when stopLiveChart != null:
return stopLiveChart();case ChangeChartInterval() when changeChartInterval != null:
return changeChartInterval(_that.interval);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadTopTokens,required TResult Function()  refreshTokens,required TResult Function( String tokenId)  selectToken,required TResult Function( String tokenId,  int days)  loadChart,required TResult Function( int days)  changeChartRange,required TResult Function( String query)  searchTokens,required TResult Function()  clearSelection,required TResult Function( String tokenId,  String interval)  startLiveChart,required TResult Function()  stopLiveChart,required TResult Function( String interval)  changeChartInterval,}) {final _that = this;
switch (_that) {
case LoadTopTokens():
return loadTopTokens();case RefreshTokens():
return refreshTokens();case SelectToken():
return selectToken(_that.tokenId);case LoadChart():
return loadChart(_that.tokenId,_that.days);case ChangeChartRange():
return changeChartRange(_that.days);case SearchTokens():
return searchTokens(_that.query);case ClearSelection():
return clearSelection();case StartLiveChart():
return startLiveChart(_that.tokenId,_that.interval);case StopLiveChart():
return stopLiveChart();case ChangeChartInterval():
return changeChartInterval(_that.interval);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadTopTokens,TResult? Function()?  refreshTokens,TResult? Function( String tokenId)?  selectToken,TResult? Function( String tokenId,  int days)?  loadChart,TResult? Function( int days)?  changeChartRange,TResult? Function( String query)?  searchTokens,TResult? Function()?  clearSelection,TResult? Function( String tokenId,  String interval)?  startLiveChart,TResult? Function()?  stopLiveChart,TResult? Function( String interval)?  changeChartInterval,}) {final _that = this;
switch (_that) {
case LoadTopTokens() when loadTopTokens != null:
return loadTopTokens();case RefreshTokens() when refreshTokens != null:
return refreshTokens();case SelectToken() when selectToken != null:
return selectToken(_that.tokenId);case LoadChart() when loadChart != null:
return loadChart(_that.tokenId,_that.days);case ChangeChartRange() when changeChartRange != null:
return changeChartRange(_that.days);case SearchTokens() when searchTokens != null:
return searchTokens(_that.query);case ClearSelection() when clearSelection != null:
return clearSelection();case StartLiveChart() when startLiveChart != null:
return startLiveChart(_that.tokenId,_that.interval);case StopLiveChart() when stopLiveChart != null:
return stopLiveChart();case ChangeChartInterval() when changeChartInterval != null:
return changeChartInterval(_that.interval);case _:
  return null;

}
}

}

/// @nodoc


class LoadTopTokens implements MarketEvent {
  const LoadTopTokens();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTopTokens);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MarketEvent.loadTopTokens()';
}


}




/// @nodoc


class RefreshTokens implements MarketEvent {
  const RefreshTokens();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTokens);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MarketEvent.refreshTokens()';
}


}




/// @nodoc


class SelectToken implements MarketEvent {
  const SelectToken(this.tokenId);
  

 final  String tokenId;

/// Create a copy of MarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectTokenCopyWith<SelectToken> get copyWith => _$SelectTokenCopyWithImpl<SelectToken>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectToken&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId));
}


@override
int get hashCode => Object.hash(runtimeType,tokenId);

@override
String toString() {
  return 'MarketEvent.selectToken(tokenId: $tokenId)';
}


}

/// @nodoc
abstract mixin class $SelectTokenCopyWith<$Res> implements $MarketEventCopyWith<$Res> {
  factory $SelectTokenCopyWith(SelectToken value, $Res Function(SelectToken) _then) = _$SelectTokenCopyWithImpl;
@useResult
$Res call({
 String tokenId
});




}
/// @nodoc
class _$SelectTokenCopyWithImpl<$Res>
    implements $SelectTokenCopyWith<$Res> {
  _$SelectTokenCopyWithImpl(this._self, this._then);

  final SelectToken _self;
  final $Res Function(SelectToken) _then;

/// Create a copy of MarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tokenId = null,}) {
  return _then(SelectToken(
null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadChart implements MarketEvent {
  const LoadChart({required this.tokenId, this.days = 7});
  

 final  String tokenId;
@JsonKey() final  int days;

/// Create a copy of MarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadChartCopyWith<LoadChart> get copyWith => _$LoadChartCopyWithImpl<LoadChart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadChart&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.days, days) || other.days == days));
}


@override
int get hashCode => Object.hash(runtimeType,tokenId,days);

@override
String toString() {
  return 'MarketEvent.loadChart(tokenId: $tokenId, days: $days)';
}


}

/// @nodoc
abstract mixin class $LoadChartCopyWith<$Res> implements $MarketEventCopyWith<$Res> {
  factory $LoadChartCopyWith(LoadChart value, $Res Function(LoadChart) _then) = _$LoadChartCopyWithImpl;
@useResult
$Res call({
 String tokenId, int days
});




}
/// @nodoc
class _$LoadChartCopyWithImpl<$Res>
    implements $LoadChartCopyWith<$Res> {
  _$LoadChartCopyWithImpl(this._self, this._then);

  final LoadChart _self;
  final $Res Function(LoadChart) _then;

/// Create a copy of MarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tokenId = null,Object? days = null,}) {
  return _then(LoadChart(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ChangeChartRange implements MarketEvent {
  const ChangeChartRange(this.days);
  

 final  int days;

/// Create a copy of MarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeChartRangeCopyWith<ChangeChartRange> get copyWith => _$ChangeChartRangeCopyWithImpl<ChangeChartRange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeChartRange&&(identical(other.days, days) || other.days == days));
}


@override
int get hashCode => Object.hash(runtimeType,days);

@override
String toString() {
  return 'MarketEvent.changeChartRange(days: $days)';
}


}

/// @nodoc
abstract mixin class $ChangeChartRangeCopyWith<$Res> implements $MarketEventCopyWith<$Res> {
  factory $ChangeChartRangeCopyWith(ChangeChartRange value, $Res Function(ChangeChartRange) _then) = _$ChangeChartRangeCopyWithImpl;
@useResult
$Res call({
 int days
});




}
/// @nodoc
class _$ChangeChartRangeCopyWithImpl<$Res>
    implements $ChangeChartRangeCopyWith<$Res> {
  _$ChangeChartRangeCopyWithImpl(this._self, this._then);

  final ChangeChartRange _self;
  final $Res Function(ChangeChartRange) _then;

/// Create a copy of MarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? days = null,}) {
  return _then(ChangeChartRange(
null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SearchTokens implements MarketEvent {
  const SearchTokens(this.query);
  

 final  String query;

/// Create a copy of MarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchTokensCopyWith<SearchTokens> get copyWith => _$SearchTokensCopyWithImpl<SearchTokens>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchTokens&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'MarketEvent.searchTokens(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchTokensCopyWith<$Res> implements $MarketEventCopyWith<$Res> {
  factory $SearchTokensCopyWith(SearchTokens value, $Res Function(SearchTokens) _then) = _$SearchTokensCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchTokensCopyWithImpl<$Res>
    implements $SearchTokensCopyWith<$Res> {
  _$SearchTokensCopyWithImpl(this._self, this._then);

  final SearchTokens _self;
  final $Res Function(SearchTokens) _then;

/// Create a copy of MarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchTokens(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearSelection implements MarketEvent {
  const ClearSelection();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSelection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MarketEvent.clearSelection()';
}


}




/// @nodoc


class StartLiveChart implements MarketEvent {
  const StartLiveChart({required this.tokenId, this.interval = '15m'});
  

 final  String tokenId;
@JsonKey() final  String interval;

/// Create a copy of MarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartLiveChartCopyWith<StartLiveChart> get copyWith => _$StartLiveChartCopyWithImpl<StartLiveChart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartLiveChart&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.interval, interval) || other.interval == interval));
}


@override
int get hashCode => Object.hash(runtimeType,tokenId,interval);

@override
String toString() {
  return 'MarketEvent.startLiveChart(tokenId: $tokenId, interval: $interval)';
}


}

/// @nodoc
abstract mixin class $StartLiveChartCopyWith<$Res> implements $MarketEventCopyWith<$Res> {
  factory $StartLiveChartCopyWith(StartLiveChart value, $Res Function(StartLiveChart) _then) = _$StartLiveChartCopyWithImpl;
@useResult
$Res call({
 String tokenId, String interval
});




}
/// @nodoc
class _$StartLiveChartCopyWithImpl<$Res>
    implements $StartLiveChartCopyWith<$Res> {
  _$StartLiveChartCopyWithImpl(this._self, this._then);

  final StartLiveChart _self;
  final $Res Function(StartLiveChart) _then;

/// Create a copy of MarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tokenId = null,Object? interval = null,}) {
  return _then(StartLiveChart(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StopLiveChart implements MarketEvent {
  const StopLiveChart();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StopLiveChart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MarketEvent.stopLiveChart()';
}


}




/// @nodoc


class ChangeChartInterval implements MarketEvent {
  const ChangeChartInterval(this.interval);
  

 final  String interval;

/// Create a copy of MarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeChartIntervalCopyWith<ChangeChartInterval> get copyWith => _$ChangeChartIntervalCopyWithImpl<ChangeChartInterval>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeChartInterval&&(identical(other.interval, interval) || other.interval == interval));
}


@override
int get hashCode => Object.hash(runtimeType,interval);

@override
String toString() {
  return 'MarketEvent.changeChartInterval(interval: $interval)';
}


}

/// @nodoc
abstract mixin class $ChangeChartIntervalCopyWith<$Res> implements $MarketEventCopyWith<$Res> {
  factory $ChangeChartIntervalCopyWith(ChangeChartInterval value, $Res Function(ChangeChartInterval) _then) = _$ChangeChartIntervalCopyWithImpl;
@useResult
$Res call({
 String interval
});




}
/// @nodoc
class _$ChangeChartIntervalCopyWithImpl<$Res>
    implements $ChangeChartIntervalCopyWith<$Res> {
  _$ChangeChartIntervalCopyWithImpl(this._self, this._then);

  final ChangeChartInterval _self;
  final $Res Function(ChangeChartInterval) _then;

/// Create a copy of MarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? interval = null,}) {
  return _then(ChangeChartInterval(
null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$MarketState {

 List<TokenEntity> get tokens; List<TokenEntity> get searchResults; TokenEntity? get selectedToken; MarketChartEntity? get chart; int get chartDays; bool get isLoading; bool get isLoadingChart; bool get isRefreshing; MarketFailure? get failure; List<CandlestickEntity> get liveCandles; String? get chartInterval; bool get isLiveChartActive;
/// Create a copy of MarketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketStateCopyWith<MarketState> get copyWith => _$MarketStateCopyWithImpl<MarketState>(this as MarketState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketState&&const DeepCollectionEquality().equals(other.tokens, tokens)&&const DeepCollectionEquality().equals(other.searchResults, searchResults)&&(identical(other.selectedToken, selectedToken) || other.selectedToken == selectedToken)&&(identical(other.chart, chart) || other.chart == chart)&&(identical(other.chartDays, chartDays) || other.chartDays == chartDays)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingChart, isLoadingChart) || other.isLoadingChart == isLoadingChart)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.failure, failure) || other.failure == failure)&&const DeepCollectionEquality().equals(other.liveCandles, liveCandles)&&(identical(other.chartInterval, chartInterval) || other.chartInterval == chartInterval)&&(identical(other.isLiveChartActive, isLiveChartActive) || other.isLiveChartActive == isLiveChartActive));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tokens),const DeepCollectionEquality().hash(searchResults),selectedToken,chart,chartDays,isLoading,isLoadingChart,isRefreshing,failure,const DeepCollectionEquality().hash(liveCandles),chartInterval,isLiveChartActive);

@override
String toString() {
  return 'MarketState(tokens: $tokens, searchResults: $searchResults, selectedToken: $selectedToken, chart: $chart, chartDays: $chartDays, isLoading: $isLoading, isLoadingChart: $isLoadingChart, isRefreshing: $isRefreshing, failure: $failure, liveCandles: $liveCandles, chartInterval: $chartInterval, isLiveChartActive: $isLiveChartActive)';
}


}

/// @nodoc
abstract mixin class $MarketStateCopyWith<$Res>  {
  factory $MarketStateCopyWith(MarketState value, $Res Function(MarketState) _then) = _$MarketStateCopyWithImpl;
@useResult
$Res call({
 List<TokenEntity> tokens, List<TokenEntity> searchResults, TokenEntity? selectedToken, MarketChartEntity? chart, int chartDays, bool isLoading, bool isLoadingChart, bool isRefreshing, MarketFailure? failure, List<CandlestickEntity> liveCandles, String? chartInterval, bool isLiveChartActive
});


$TokenEntityCopyWith<$Res>? get selectedToken;$MarketChartEntityCopyWith<$Res>? get chart;$MarketFailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$MarketStateCopyWithImpl<$Res>
    implements $MarketStateCopyWith<$Res> {
  _$MarketStateCopyWithImpl(this._self, this._then);

  final MarketState _self;
  final $Res Function(MarketState) _then;

/// Create a copy of MarketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokens = null,Object? searchResults = null,Object? selectedToken = freezed,Object? chart = freezed,Object? chartDays = null,Object? isLoading = null,Object? isLoadingChart = null,Object? isRefreshing = null,Object? failure = freezed,Object? liveCandles = null,Object? chartInterval = freezed,Object? isLiveChartActive = null,}) {
  return _then(_self.copyWith(
tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as List<TokenEntity>,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<TokenEntity>,selectedToken: freezed == selectedToken ? _self.selectedToken : selectedToken // ignore: cast_nullable_to_non_nullable
as TokenEntity?,chart: freezed == chart ? _self.chart : chart // ignore: cast_nullable_to_non_nullable
as MarketChartEntity?,chartDays: null == chartDays ? _self.chartDays : chartDays // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingChart: null == isLoadingChart ? _self.isLoadingChart : isLoadingChart // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as MarketFailure?,liveCandles: null == liveCandles ? _self.liveCandles : liveCandles // ignore: cast_nullable_to_non_nullable
as List<CandlestickEntity>,chartInterval: freezed == chartInterval ? _self.chartInterval : chartInterval // ignore: cast_nullable_to_non_nullable
as String?,isLiveChartActive: null == isLiveChartActive ? _self.isLiveChartActive : isLiveChartActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MarketState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokenEntityCopyWith<$Res>? get selectedToken {
    if (_self.selectedToken == null) {
    return null;
  }

  return $TokenEntityCopyWith<$Res>(_self.selectedToken!, (value) {
    return _then(_self.copyWith(selectedToken: value));
  });
}/// Create a copy of MarketState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MarketChartEntityCopyWith<$Res>? get chart {
    if (_self.chart == null) {
    return null;
  }

  return $MarketChartEntityCopyWith<$Res>(_self.chart!, (value) {
    return _then(_self.copyWith(chart: value));
  });
}/// Create a copy of MarketState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MarketFailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $MarketFailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}


/// Adds pattern-matching-related methods to [MarketState].
extension MarketStatePatterns on MarketState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketState value)  $default,){
final _that = this;
switch (_that) {
case _MarketState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketState value)?  $default,){
final _that = this;
switch (_that) {
case _MarketState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TokenEntity> tokens,  List<TokenEntity> searchResults,  TokenEntity? selectedToken,  MarketChartEntity? chart,  int chartDays,  bool isLoading,  bool isLoadingChart,  bool isRefreshing,  MarketFailure? failure,  List<CandlestickEntity> liveCandles,  String? chartInterval,  bool isLiveChartActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketState() when $default != null:
return $default(_that.tokens,_that.searchResults,_that.selectedToken,_that.chart,_that.chartDays,_that.isLoading,_that.isLoadingChart,_that.isRefreshing,_that.failure,_that.liveCandles,_that.chartInterval,_that.isLiveChartActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TokenEntity> tokens,  List<TokenEntity> searchResults,  TokenEntity? selectedToken,  MarketChartEntity? chart,  int chartDays,  bool isLoading,  bool isLoadingChart,  bool isRefreshing,  MarketFailure? failure,  List<CandlestickEntity> liveCandles,  String? chartInterval,  bool isLiveChartActive)  $default,) {final _that = this;
switch (_that) {
case _MarketState():
return $default(_that.tokens,_that.searchResults,_that.selectedToken,_that.chart,_that.chartDays,_that.isLoading,_that.isLoadingChart,_that.isRefreshing,_that.failure,_that.liveCandles,_that.chartInterval,_that.isLiveChartActive);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TokenEntity> tokens,  List<TokenEntity> searchResults,  TokenEntity? selectedToken,  MarketChartEntity? chart,  int chartDays,  bool isLoading,  bool isLoadingChart,  bool isRefreshing,  MarketFailure? failure,  List<CandlestickEntity> liveCandles,  String? chartInterval,  bool isLiveChartActive)?  $default,) {final _that = this;
switch (_that) {
case _MarketState() when $default != null:
return $default(_that.tokens,_that.searchResults,_that.selectedToken,_that.chart,_that.chartDays,_that.isLoading,_that.isLoadingChart,_that.isRefreshing,_that.failure,_that.liveCandles,_that.chartInterval,_that.isLiveChartActive);case _:
  return null;

}
}

}

/// @nodoc


class _MarketState extends MarketState {
  const _MarketState({final  List<TokenEntity> tokens = const [], final  List<TokenEntity> searchResults = const [], this.selectedToken, this.chart, this.chartDays = 7, this.isLoading = false, this.isLoadingChart = false, this.isRefreshing = false, this.failure, final  List<CandlestickEntity> liveCandles = const [], this.chartInterval, this.isLiveChartActive = false}): _tokens = tokens,_searchResults = searchResults,_liveCandles = liveCandles,super._();
  

 final  List<TokenEntity> _tokens;
@override@JsonKey() List<TokenEntity> get tokens {
  if (_tokens is EqualUnmodifiableListView) return _tokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tokens);
}

 final  List<TokenEntity> _searchResults;
@override@JsonKey() List<TokenEntity> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}

@override final  TokenEntity? selectedToken;
@override final  MarketChartEntity? chart;
@override@JsonKey() final  int chartDays;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingChart;
@override@JsonKey() final  bool isRefreshing;
@override final  MarketFailure? failure;
 final  List<CandlestickEntity> _liveCandles;
@override@JsonKey() List<CandlestickEntity> get liveCandles {
  if (_liveCandles is EqualUnmodifiableListView) return _liveCandles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_liveCandles);
}

@override final  String? chartInterval;
@override@JsonKey() final  bool isLiveChartActive;

/// Create a copy of MarketState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketStateCopyWith<_MarketState> get copyWith => __$MarketStateCopyWithImpl<_MarketState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketState&&const DeepCollectionEquality().equals(other._tokens, _tokens)&&const DeepCollectionEquality().equals(other._searchResults, _searchResults)&&(identical(other.selectedToken, selectedToken) || other.selectedToken == selectedToken)&&(identical(other.chart, chart) || other.chart == chart)&&(identical(other.chartDays, chartDays) || other.chartDays == chartDays)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingChart, isLoadingChart) || other.isLoadingChart == isLoadingChart)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.failure, failure) || other.failure == failure)&&const DeepCollectionEquality().equals(other._liveCandles, _liveCandles)&&(identical(other.chartInterval, chartInterval) || other.chartInterval == chartInterval)&&(identical(other.isLiveChartActive, isLiveChartActive) || other.isLiveChartActive == isLiveChartActive));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tokens),const DeepCollectionEquality().hash(_searchResults),selectedToken,chart,chartDays,isLoading,isLoadingChart,isRefreshing,failure,const DeepCollectionEquality().hash(_liveCandles),chartInterval,isLiveChartActive);

@override
String toString() {
  return 'MarketState(tokens: $tokens, searchResults: $searchResults, selectedToken: $selectedToken, chart: $chart, chartDays: $chartDays, isLoading: $isLoading, isLoadingChart: $isLoadingChart, isRefreshing: $isRefreshing, failure: $failure, liveCandles: $liveCandles, chartInterval: $chartInterval, isLiveChartActive: $isLiveChartActive)';
}


}

/// @nodoc
abstract mixin class _$MarketStateCopyWith<$Res> implements $MarketStateCopyWith<$Res> {
  factory _$MarketStateCopyWith(_MarketState value, $Res Function(_MarketState) _then) = __$MarketStateCopyWithImpl;
@override @useResult
$Res call({
 List<TokenEntity> tokens, List<TokenEntity> searchResults, TokenEntity? selectedToken, MarketChartEntity? chart, int chartDays, bool isLoading, bool isLoadingChart, bool isRefreshing, MarketFailure? failure, List<CandlestickEntity> liveCandles, String? chartInterval, bool isLiveChartActive
});


@override $TokenEntityCopyWith<$Res>? get selectedToken;@override $MarketChartEntityCopyWith<$Res>? get chart;@override $MarketFailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$MarketStateCopyWithImpl<$Res>
    implements _$MarketStateCopyWith<$Res> {
  __$MarketStateCopyWithImpl(this._self, this._then);

  final _MarketState _self;
  final $Res Function(_MarketState) _then;

/// Create a copy of MarketState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokens = null,Object? searchResults = null,Object? selectedToken = freezed,Object? chart = freezed,Object? chartDays = null,Object? isLoading = null,Object? isLoadingChart = null,Object? isRefreshing = null,Object? failure = freezed,Object? liveCandles = null,Object? chartInterval = freezed,Object? isLiveChartActive = null,}) {
  return _then(_MarketState(
tokens: null == tokens ? _self._tokens : tokens // ignore: cast_nullable_to_non_nullable
as List<TokenEntity>,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<TokenEntity>,selectedToken: freezed == selectedToken ? _self.selectedToken : selectedToken // ignore: cast_nullable_to_non_nullable
as TokenEntity?,chart: freezed == chart ? _self.chart : chart // ignore: cast_nullable_to_non_nullable
as MarketChartEntity?,chartDays: null == chartDays ? _self.chartDays : chartDays // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingChart: null == isLoadingChart ? _self.isLoadingChart : isLoadingChart // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as MarketFailure?,liveCandles: null == liveCandles ? _self._liveCandles : liveCandles // ignore: cast_nullable_to_non_nullable
as List<CandlestickEntity>,chartInterval: freezed == chartInterval ? _self.chartInterval : chartInterval // ignore: cast_nullable_to_non_nullable
as String?,isLiveChartActive: null == isLiveChartActive ? _self.isLiveChartActive : isLiveChartActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MarketState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokenEntityCopyWith<$Res>? get selectedToken {
    if (_self.selectedToken == null) {
    return null;
  }

  return $TokenEntityCopyWith<$Res>(_self.selectedToken!, (value) {
    return _then(_self.copyWith(selectedToken: value));
  });
}/// Create a copy of MarketState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MarketChartEntityCopyWith<$Res>? get chart {
    if (_self.chart == null) {
    return null;
  }

  return $MarketChartEntityCopyWith<$Res>(_self.chart!, (value) {
    return _then(_self.copyWith(chart: value));
  });
}/// Create a copy of MarketState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MarketFailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $MarketFailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
