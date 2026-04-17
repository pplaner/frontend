// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotesFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotesFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotesFailure()';
}


}

/// @nodoc
class $NotesFailureCopyWith<$Res>  {
$NotesFailureCopyWith(NotesFailure _, $Res Function(NotesFailure) __);
}


/// Adds pattern-matching-related methods to [NotesFailure].
extension NotesFailurePatterns on NotesFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _IdNotFound value)?  idNotFound,TResult Function( _SessionLocked value)?  sessionLocked,TResult Function( _NotesCore value)?  core,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdNotFound() when idNotFound != null:
return idNotFound(_that);case _SessionLocked() when sessionLocked != null:
return sessionLocked(_that);case _NotesCore() when core != null:
return core(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _IdNotFound value)  idNotFound,required TResult Function( _SessionLocked value)  sessionLocked,required TResult Function( _NotesCore value)  core,}){
final _that = this;
switch (_that) {
case _IdNotFound():
return idNotFound(_that);case _SessionLocked():
return sessionLocked(_that);case _NotesCore():
return core(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _IdNotFound value)?  idNotFound,TResult? Function( _SessionLocked value)?  sessionLocked,TResult? Function( _NotesCore value)?  core,}){
final _that = this;
switch (_that) {
case _IdNotFound() when idNotFound != null:
return idNotFound(_that);case _SessionLocked() when sessionLocked != null:
return sessionLocked(_that);case _NotesCore() when core != null:
return core(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idNotFound,TResult Function()?  sessionLocked,TResult Function( CoreFailure core)?  core,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdNotFound() when idNotFound != null:
return idNotFound();case _SessionLocked() when sessionLocked != null:
return sessionLocked();case _NotesCore() when core != null:
return core(_that.core);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idNotFound,required TResult Function()  sessionLocked,required TResult Function( CoreFailure core)  core,}) {final _that = this;
switch (_that) {
case _IdNotFound():
return idNotFound();case _SessionLocked():
return sessionLocked();case _NotesCore():
return core(_that.core);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idNotFound,TResult? Function()?  sessionLocked,TResult? Function( CoreFailure core)?  core,}) {final _that = this;
switch (_that) {
case _IdNotFound() when idNotFound != null:
return idNotFound();case _SessionLocked() when sessionLocked != null:
return sessionLocked();case _NotesCore() when core != null:
return core(_that.core);case _:
  return null;

}
}

}

/// @nodoc


class _IdNotFound implements NotesFailure {
  const _IdNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotesFailure.idNotFound()';
}


}




/// @nodoc


class _SessionLocked implements NotesFailure {
  const _SessionLocked();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionLocked);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotesFailure.sessionLocked()';
}


}




/// @nodoc


class _NotesCore implements NotesFailure {
  const _NotesCore(this.core);
  

 final  CoreFailure core;

/// Create a copy of NotesFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotesCoreCopyWith<_NotesCore> get copyWith => __$NotesCoreCopyWithImpl<_NotesCore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotesCore&&(identical(other.core, core) || other.core == core));
}


@override
int get hashCode => Object.hash(runtimeType,core);

@override
String toString() {
  return 'NotesFailure.core(core: $core)';
}


}

/// @nodoc
abstract mixin class _$NotesCoreCopyWith<$Res> implements $NotesFailureCopyWith<$Res> {
  factory _$NotesCoreCopyWith(_NotesCore value, $Res Function(_NotesCore) _then) = __$NotesCoreCopyWithImpl;
@useResult
$Res call({
 CoreFailure core
});


$CoreFailureCopyWith<$Res> get core;

}
/// @nodoc
class __$NotesCoreCopyWithImpl<$Res>
    implements _$NotesCoreCopyWith<$Res> {
  __$NotesCoreCopyWithImpl(this._self, this._then);

  final _NotesCore _self;
  final $Res Function(_NotesCore) _then;

/// Create a copy of NotesFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? core = null,}) {
  return _then(_NotesCore(
null == core ? _self.core : core // ignore: cast_nullable_to_non_nullable
as CoreFailure,
  ));
}

/// Create a copy of NotesFailure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoreFailureCopyWith<$Res> get core {
  
  return $CoreFailureCopyWith<$Res>(_self.core, (value) {
    return _then(_self.copyWith(core: value));
  });
}
}

// dart format on
