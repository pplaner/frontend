// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure()';
}


}

/// @nodoc
class $AuthFailureCopyWith<$Res>  {
$AuthFailureCopyWith(AuthFailure _, $Res Function(AuthFailure) __);
}


/// Adds pattern-matching-related methods to [AuthFailure].
extension AuthFailurePatterns on AuthFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InvalidCredentials value)?  invalidCredentials,TResult Function( _EmailAlreadyInUse value)?  emailAlreadyInUse,TResult Function( _AuthCore value)?  core,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvalidCredentials() when invalidCredentials != null:
return invalidCredentials(_that);case _EmailAlreadyInUse() when emailAlreadyInUse != null:
return emailAlreadyInUse(_that);case _AuthCore() when core != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InvalidCredentials value)  invalidCredentials,required TResult Function( _EmailAlreadyInUse value)  emailAlreadyInUse,required TResult Function( _AuthCore value)  core,}){
final _that = this;
switch (_that) {
case _InvalidCredentials():
return invalidCredentials(_that);case _EmailAlreadyInUse():
return emailAlreadyInUse(_that);case _AuthCore():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InvalidCredentials value)?  invalidCredentials,TResult? Function( _EmailAlreadyInUse value)?  emailAlreadyInUse,TResult? Function( _AuthCore value)?  core,}){
final _that = this;
switch (_that) {
case _InvalidCredentials() when invalidCredentials != null:
return invalidCredentials(_that);case _EmailAlreadyInUse() when emailAlreadyInUse != null:
return emailAlreadyInUse(_that);case _AuthCore() when core != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  invalidCredentials,TResult Function()?  emailAlreadyInUse,TResult Function( CoreFailure core)?  core,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvalidCredentials() when invalidCredentials != null:
return invalidCredentials();case _EmailAlreadyInUse() when emailAlreadyInUse != null:
return emailAlreadyInUse();case _AuthCore() when core != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  invalidCredentials,required TResult Function()  emailAlreadyInUse,required TResult Function( CoreFailure core)  core,}) {final _that = this;
switch (_that) {
case _InvalidCredentials():
return invalidCredentials();case _EmailAlreadyInUse():
return emailAlreadyInUse();case _AuthCore():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  invalidCredentials,TResult? Function()?  emailAlreadyInUse,TResult? Function( CoreFailure core)?  core,}) {final _that = this;
switch (_that) {
case _InvalidCredentials() when invalidCredentials != null:
return invalidCredentials();case _EmailAlreadyInUse() when emailAlreadyInUse != null:
return emailAlreadyInUse();case _AuthCore() when core != null:
return core(_that.core);case _:
  return null;

}
}

}

/// @nodoc


class _InvalidCredentials implements AuthFailure {
  const _InvalidCredentials();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidCredentials);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.invalidCredentials()';
}


}




/// @nodoc


class _EmailAlreadyInUse implements AuthFailure {
  const _EmailAlreadyInUse();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailAlreadyInUse);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.emailAlreadyInUse()';
}


}




/// @nodoc


class _AuthCore implements AuthFailure {
  const _AuthCore(this.core);
  

 final  CoreFailure core;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthCoreCopyWith<_AuthCore> get copyWith => __$AuthCoreCopyWithImpl<_AuthCore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthCore&&(identical(other.core, core) || other.core == core));
}


@override
int get hashCode => Object.hash(runtimeType,core);

@override
String toString() {
  return 'AuthFailure.core(core: $core)';
}


}

/// @nodoc
abstract mixin class _$AuthCoreCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory _$AuthCoreCopyWith(_AuthCore value, $Res Function(_AuthCore) _then) = __$AuthCoreCopyWithImpl;
@useResult
$Res call({
 CoreFailure core
});


$CoreFailureCopyWith<$Res> get core;

}
/// @nodoc
class __$AuthCoreCopyWithImpl<$Res>
    implements _$AuthCoreCopyWith<$Res> {
  __$AuthCoreCopyWithImpl(this._self, this._then);

  final _AuthCore _self;
  final $Res Function(_AuthCore) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? core = null,}) {
  return _then(_AuthCore(
null == core ? _self.core : core // ignore: cast_nullable_to_non_nullable
as CoreFailure,
  ));
}

/// Create a copy of AuthFailure
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
