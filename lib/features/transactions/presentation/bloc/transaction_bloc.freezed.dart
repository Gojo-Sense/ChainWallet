// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionEvent()';
}


}

/// @nodoc
class $TransactionEventCopyWith<$Res>  {
$TransactionEventCopyWith(TransactionEvent _, $Res Function(TransactionEvent) __);
}


/// Adds pattern-matching-related methods to [TransactionEvent].
extension TransactionEventPatterns on TransactionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadTransactionsEvent value)?  load,TResult Function( LoadMoreTransactionsEvent value)?  loadMore,TResult Function( ApplyFilterEvent value)?  applyFilter,TResult Function( ClearFilterEvent value)?  clearFilter,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadTransactionsEvent() when load != null:
return load(_that);case LoadMoreTransactionsEvent() when loadMore != null:
return loadMore(_that);case ApplyFilterEvent() when applyFilter != null:
return applyFilter(_that);case ClearFilterEvent() when clearFilter != null:
return clearFilter(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadTransactionsEvent value)  load,required TResult Function( LoadMoreTransactionsEvent value)  loadMore,required TResult Function( ApplyFilterEvent value)  applyFilter,required TResult Function( ClearFilterEvent value)  clearFilter,}){
final _that = this;
switch (_that) {
case LoadTransactionsEvent():
return load(_that);case LoadMoreTransactionsEvent():
return loadMore(_that);case ApplyFilterEvent():
return applyFilter(_that);case ClearFilterEvent():
return clearFilter(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadTransactionsEvent value)?  load,TResult? Function( LoadMoreTransactionsEvent value)?  loadMore,TResult? Function( ApplyFilterEvent value)?  applyFilter,TResult? Function( ClearFilterEvent value)?  clearFilter,}){
final _that = this;
switch (_that) {
case LoadTransactionsEvent() when load != null:
return load(_that);case LoadMoreTransactionsEvent() when loadMore != null:
return loadMore(_that);case ApplyFilterEvent() when applyFilter != null:
return applyFilter(_that);case ClearFilterEvent() when clearFilter != null:
return clearFilter(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function()?  loadMore,TResult Function( TransactionFilter filter)?  applyFilter,TResult Function()?  clearFilter,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadTransactionsEvent() when load != null:
return load();case LoadMoreTransactionsEvent() when loadMore != null:
return loadMore();case ApplyFilterEvent() when applyFilter != null:
return applyFilter(_that.filter);case ClearFilterEvent() when clearFilter != null:
return clearFilter();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function()  loadMore,required TResult Function( TransactionFilter filter)  applyFilter,required TResult Function()  clearFilter,}) {final _that = this;
switch (_that) {
case LoadTransactionsEvent():
return load();case LoadMoreTransactionsEvent():
return loadMore();case ApplyFilterEvent():
return applyFilter(_that.filter);case ClearFilterEvent():
return clearFilter();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function()?  loadMore,TResult? Function( TransactionFilter filter)?  applyFilter,TResult? Function()?  clearFilter,}) {final _that = this;
switch (_that) {
case LoadTransactionsEvent() when load != null:
return load();case LoadMoreTransactionsEvent() when loadMore != null:
return loadMore();case ApplyFilterEvent() when applyFilter != null:
return applyFilter(_that.filter);case ClearFilterEvent() when clearFilter != null:
return clearFilter();case _:
  return null;

}
}

}

/// @nodoc


class LoadTransactionsEvent extends TransactionEvent {
  const LoadTransactionsEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTransactionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionEvent.load()';
}


}




/// @nodoc


class LoadMoreTransactionsEvent extends TransactionEvent {
  const LoadMoreTransactionsEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMoreTransactionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionEvent.loadMore()';
}


}




/// @nodoc


class ApplyFilterEvent extends TransactionEvent {
  const ApplyFilterEvent(this.filter): super._();
  

 final  TransactionFilter filter;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplyFilterEventCopyWith<ApplyFilterEvent> get copyWith => _$ApplyFilterEventCopyWithImpl<ApplyFilterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplyFilterEvent&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'TransactionEvent.applyFilter(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $ApplyFilterEventCopyWith<$Res> implements $TransactionEventCopyWith<$Res> {
  factory $ApplyFilterEventCopyWith(ApplyFilterEvent value, $Res Function(ApplyFilterEvent) _then) = _$ApplyFilterEventCopyWithImpl;
@useResult
$Res call({
 TransactionFilter filter
});


$TransactionFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$ApplyFilterEventCopyWithImpl<$Res>
    implements $ApplyFilterEventCopyWith<$Res> {
  _$ApplyFilterEventCopyWithImpl(this._self, this._then);

  final ApplyFilterEvent _self;
  final $Res Function(ApplyFilterEvent) _then;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(ApplyFilterEvent(
null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as TransactionFilter,
  ));
}

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionFilterCopyWith<$Res> get filter {
  
  return $TransactionFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc


class ClearFilterEvent extends TransactionEvent {
  const ClearFilterEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearFilterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionEvent.clearFilter()';
}


}




/// @nodoc
mixin _$TransactionState {

 List<Transaction> get transactions; bool get isLoading; bool get isLoadingMore; bool get hasMore; int get currentPage; TransactionFilter? get filter; String? get error;
/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionStateCopyWith<TransactionState> get copyWith => _$TransactionStateCopyWithImpl<TransactionState>(this as TransactionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionState&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(transactions),isLoading,isLoadingMore,hasMore,currentPage,filter,error);

@override
String toString() {
  return 'TransactionState(transactions: $transactions, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, currentPage: $currentPage, filter: $filter, error: $error)';
}


}

/// @nodoc
abstract mixin class $TransactionStateCopyWith<$Res>  {
  factory $TransactionStateCopyWith(TransactionState value, $Res Function(TransactionState) _then) = _$TransactionStateCopyWithImpl;
@useResult
$Res call({
 List<Transaction> transactions, bool isLoading, bool isLoadingMore, bool hasMore, int currentPage, TransactionFilter? filter, String? error
});


$TransactionFilterCopyWith<$Res>? get filter;

}
/// @nodoc
class _$TransactionStateCopyWithImpl<$Res>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._self, this._then);

  final TransactionState _self;
  final $Res Function(TransactionState) _then;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactions = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? currentPage = null,Object? filter = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as TransactionFilter?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionFilterCopyWith<$Res>? get filter {
    if (_self.filter == null) {
    return null;
  }

  return $TransactionFilterCopyWith<$Res>(_self.filter!, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionState].
extension TransactionStatePatterns on TransactionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionState value)  $default,){
final _that = this;
switch (_that) {
case _TransactionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionState value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Transaction> transactions,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int currentPage,  TransactionFilter? filter,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionState() when $default != null:
return $default(_that.transactions,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.currentPage,_that.filter,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Transaction> transactions,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int currentPage,  TransactionFilter? filter,  String? error)  $default,) {final _that = this;
switch (_that) {
case _TransactionState():
return $default(_that.transactions,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.currentPage,_that.filter,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Transaction> transactions,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int currentPage,  TransactionFilter? filter,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _TransactionState() when $default != null:
return $default(_that.transactions,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.currentPage,_that.filter,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionState extends TransactionState {
  const _TransactionState({final  List<Transaction> transactions = const [], this.isLoading = false, this.isLoadingMore = false, this.hasMore = false, this.currentPage = 1, this.filter, this.error}): _transactions = transactions,super._();
  

 final  List<Transaction> _transactions;
@override@JsonKey() List<Transaction> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  int currentPage;
@override final  TransactionFilter? filter;
@override final  String? error;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionStateCopyWith<_TransactionState> get copyWith => __$TransactionStateCopyWithImpl<_TransactionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionState&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_transactions),isLoading,isLoadingMore,hasMore,currentPage,filter,error);

@override
String toString() {
  return 'TransactionState(transactions: $transactions, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, currentPage: $currentPage, filter: $filter, error: $error)';
}


}

/// @nodoc
abstract mixin class _$TransactionStateCopyWith<$Res> implements $TransactionStateCopyWith<$Res> {
  factory _$TransactionStateCopyWith(_TransactionState value, $Res Function(_TransactionState) _then) = __$TransactionStateCopyWithImpl;
@override @useResult
$Res call({
 List<Transaction> transactions, bool isLoading, bool isLoadingMore, bool hasMore, int currentPage, TransactionFilter? filter, String? error
});


@override $TransactionFilterCopyWith<$Res>? get filter;

}
/// @nodoc
class __$TransactionStateCopyWithImpl<$Res>
    implements _$TransactionStateCopyWith<$Res> {
  __$TransactionStateCopyWithImpl(this._self, this._then);

  final _TransactionState _self;
  final $Res Function(_TransactionState) _then;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactions = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? currentPage = null,Object? filter = freezed,Object? error = freezed,}) {
  return _then(_TransactionState(
transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as TransactionFilter?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionFilterCopyWith<$Res>? get filter {
    if (_self.filter == null) {
    return null;
  }

  return $TransactionFilterCopyWith<$Res>(_self.filter!, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

// dart format on
