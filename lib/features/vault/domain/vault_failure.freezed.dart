// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vault_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VaultFailure implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VaultFailure'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VaultFailure()';
}


}

/// @nodoc
class $VaultFailureCopyWith<$Res>  {
$VaultFailureCopyWith(VaultFailure _, $Res Function(VaultFailure) __);
}


/// Adds pattern-matching-related methods to [VaultFailure].
extension VaultFailurePatterns on VaultFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _VaultLocked value)?  vaultLocked,TResult Function( _VaultNotInitialized value)?  vaultNotInitialized,TResult Function( _InvalidSecret value)?  invalidSecret,TResult Function( _VaultCore value)?  core,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VaultLocked() when vaultLocked != null:
return vaultLocked(_that);case _VaultNotInitialized() when vaultNotInitialized != null:
return vaultNotInitialized(_that);case _InvalidSecret() when invalidSecret != null:
return invalidSecret(_that);case _VaultCore() when core != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _VaultLocked value)  vaultLocked,required TResult Function( _VaultNotInitialized value)  vaultNotInitialized,required TResult Function( _InvalidSecret value)  invalidSecret,required TResult Function( _VaultCore value)  core,}){
final _that = this;
switch (_that) {
case _VaultLocked():
return vaultLocked(_that);case _VaultNotInitialized():
return vaultNotInitialized(_that);case _InvalidSecret():
return invalidSecret(_that);case _VaultCore():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _VaultLocked value)?  vaultLocked,TResult? Function( _VaultNotInitialized value)?  vaultNotInitialized,TResult? Function( _InvalidSecret value)?  invalidSecret,TResult? Function( _VaultCore value)?  core,}){
final _that = this;
switch (_that) {
case _VaultLocked() when vaultLocked != null:
return vaultLocked(_that);case _VaultNotInitialized() when vaultNotInitialized != null:
return vaultNotInitialized(_that);case _InvalidSecret() when invalidSecret != null:
return invalidSecret(_that);case _VaultCore() when core != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  vaultLocked,TResult Function()?  vaultNotInitialized,TResult Function()?  invalidSecret,TResult Function( CoreFailure core)?  core,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VaultLocked() when vaultLocked != null:
return vaultLocked();case _VaultNotInitialized() when vaultNotInitialized != null:
return vaultNotInitialized();case _InvalidSecret() when invalidSecret != null:
return invalidSecret();case _VaultCore() when core != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  vaultLocked,required TResult Function()  vaultNotInitialized,required TResult Function()  invalidSecret,required TResult Function( CoreFailure core)  core,}) {final _that = this;
switch (_that) {
case _VaultLocked():
return vaultLocked();case _VaultNotInitialized():
return vaultNotInitialized();case _InvalidSecret():
return invalidSecret();case _VaultCore():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  vaultLocked,TResult? Function()?  vaultNotInitialized,TResult? Function()?  invalidSecret,TResult? Function( CoreFailure core)?  core,}) {final _that = this;
switch (_that) {
case _VaultLocked() when vaultLocked != null:
return vaultLocked();case _VaultNotInitialized() when vaultNotInitialized != null:
return vaultNotInitialized();case _InvalidSecret() when invalidSecret != null:
return invalidSecret();case _VaultCore() when core != null:
return core(_that.core);case _:
  return null;

}
}

}

/// @nodoc


class _VaultLocked with DiagnosticableTreeMixin implements VaultFailure {
  const _VaultLocked();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VaultFailure.vaultLocked'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VaultLocked);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VaultFailure.vaultLocked()';
}


}




/// @nodoc


class _VaultNotInitialized with DiagnosticableTreeMixin implements VaultFailure {
  const _VaultNotInitialized();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VaultFailure.vaultNotInitialized'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VaultNotInitialized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VaultFailure.vaultNotInitialized()';
}


}




/// @nodoc


class _InvalidSecret with DiagnosticableTreeMixin implements VaultFailure {
  const _InvalidSecret();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VaultFailure.invalidSecret'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidSecret);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VaultFailure.invalidSecret()';
}


}




/// @nodoc


class _VaultCore with DiagnosticableTreeMixin implements VaultFailure {
  const _VaultCore(this.core);
  

 final  CoreFailure core;

/// Create a copy of VaultFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VaultCoreCopyWith<_VaultCore> get copyWith => __$VaultCoreCopyWithImpl<_VaultCore>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VaultFailure.core'))
    ..add(DiagnosticsProperty('core', core));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VaultCore&&(identical(other.core, core) || other.core == core));
}


@override
int get hashCode => Object.hash(runtimeType,core);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VaultFailure.core(core: $core)';
}


}

/// @nodoc
abstract mixin class _$VaultCoreCopyWith<$Res> implements $VaultFailureCopyWith<$Res> {
  factory _$VaultCoreCopyWith(_VaultCore value, $Res Function(_VaultCore) _then) = __$VaultCoreCopyWithImpl;
@useResult
$Res call({
 CoreFailure core
});


$CoreFailureCopyWith<$Res> get core;

}
/// @nodoc
class __$VaultCoreCopyWithImpl<$Res>
    implements _$VaultCoreCopyWith<$Res> {
  __$VaultCoreCopyWithImpl(this._self, this._then);

  final _VaultCore _self;
  final $Res Function(_VaultCore) _then;

/// Create a copy of VaultFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? core = null,}) {
  return _then(_VaultCore(
null == core ? _self.core : core // ignore: cast_nullable_to_non_nullable
as CoreFailure,
  ));
}

/// Create a copy of VaultFailure
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
