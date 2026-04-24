// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'core_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoreFailure implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CoreFailure'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoreFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CoreFailure()';
}


}

/// @nodoc
class $CoreFailureCopyWith<$Res>  {
$CoreFailureCopyWith(CoreFailure _, $Res Function(CoreFailure) __);
}


/// Adds pattern-matching-related methods to [CoreFailure].
extension CoreFailurePatterns on CoreFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Network value)?  network,TResult Function( _Api value)?  api,TResult Function( _Storage value)?  storage,TResult Function( _Crypto value)?  crypto,TResult Function( _Unexpected value)?  unexpected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Network() when network != null:
return network(_that);case _Api() when api != null:
return api(_that);case _Storage() when storage != null:
return storage(_that);case _Crypto() when crypto != null:
return crypto(_that);case _Unexpected() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Network value)  network,required TResult Function( _Api value)  api,required TResult Function( _Storage value)  storage,required TResult Function( _Crypto value)  crypto,required TResult Function( _Unexpected value)  unexpected,}){
final _that = this;
switch (_that) {
case _Network():
return network(_that);case _Api():
return api(_that);case _Storage():
return storage(_that);case _Crypto():
return crypto(_that);case _Unexpected():
return unexpected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Network value)?  network,TResult? Function( _Api value)?  api,TResult? Function( _Storage value)?  storage,TResult? Function( _Crypto value)?  crypto,TResult? Function( _Unexpected value)?  unexpected,}){
final _that = this;
switch (_that) {
case _Network() when network != null:
return network(_that);case _Api() when api != null:
return api(_that);case _Storage() when storage != null:
return storage(_that);case _Crypto() when crypto != null:
return crypto(_that);case _Unexpected() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  network,TResult Function( int statusCode,  String? message)?  api,TResult Function( String message)?  storage,TResult Function( String message)?  crypto,TResult Function( Object e)?  unexpected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Network() when network != null:
return network();case _Api() when api != null:
return api(_that.statusCode,_that.message);case _Storage() when storage != null:
return storage(_that.message);case _Crypto() when crypto != null:
return crypto(_that.message);case _Unexpected() when unexpected != null:
return unexpected(_that.e);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  network,required TResult Function( int statusCode,  String? message)  api,required TResult Function( String message)  storage,required TResult Function( String message)  crypto,required TResult Function( Object e)  unexpected,}) {final _that = this;
switch (_that) {
case _Network():
return network();case _Api():
return api(_that.statusCode,_that.message);case _Storage():
return storage(_that.message);case _Crypto():
return crypto(_that.message);case _Unexpected():
return unexpected(_that.e);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  network,TResult? Function( int statusCode,  String? message)?  api,TResult? Function( String message)?  storage,TResult? Function( String message)?  crypto,TResult? Function( Object e)?  unexpected,}) {final _that = this;
switch (_that) {
case _Network() when network != null:
return network();case _Api() when api != null:
return api(_that.statusCode,_that.message);case _Storage() when storage != null:
return storage(_that.message);case _Crypto() when crypto != null:
return crypto(_that.message);case _Unexpected() when unexpected != null:
return unexpected(_that.e);case _:
  return null;

}
}

}

/// @nodoc


class _Network with DiagnosticableTreeMixin implements CoreFailure {
  const _Network();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CoreFailure.network'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Network);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CoreFailure.network()';
}


}




/// @nodoc


class _Api with DiagnosticableTreeMixin implements CoreFailure {
  const _Api(this.statusCode, this.message);
  

 final  int statusCode;
 final  String? message;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiCopyWith<_Api> get copyWith => __$ApiCopyWithImpl<_Api>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CoreFailure.api'))
    ..add(DiagnosticsProperty('statusCode', statusCode))..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Api&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,statusCode,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CoreFailure.api(statusCode: $statusCode, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ApiCopyWith<$Res> implements $CoreFailureCopyWith<$Res> {
  factory _$ApiCopyWith(_Api value, $Res Function(_Api) _then) = __$ApiCopyWithImpl;
@useResult
$Res call({
 int statusCode, String? message
});




}
/// @nodoc
class __$ApiCopyWithImpl<$Res>
    implements _$ApiCopyWith<$Res> {
  __$ApiCopyWithImpl(this._self, this._then);

  final _Api _self;
  final $Res Function(_Api) _then;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? message = freezed,}) {
  return _then(_Api(
null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Storage with DiagnosticableTreeMixin implements CoreFailure {
  const _Storage(this.message);
  

 final  String message;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorageCopyWith<_Storage> get copyWith => __$StorageCopyWithImpl<_Storage>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CoreFailure.storage'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Storage&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CoreFailure.storage(message: $message)';
}


}

/// @nodoc
abstract mixin class _$StorageCopyWith<$Res> implements $CoreFailureCopyWith<$Res> {
  factory _$StorageCopyWith(_Storage value, $Res Function(_Storage) _then) = __$StorageCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$StorageCopyWithImpl<$Res>
    implements _$StorageCopyWith<$Res> {
  __$StorageCopyWithImpl(this._self, this._then);

  final _Storage _self;
  final $Res Function(_Storage) _then;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Storage(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Crypto with DiagnosticableTreeMixin implements CoreFailure {
  const _Crypto(this.message);
  

 final  String message;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CryptoCopyWith<_Crypto> get copyWith => __$CryptoCopyWithImpl<_Crypto>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CoreFailure.crypto'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Crypto&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CoreFailure.crypto(message: $message)';
}


}

/// @nodoc
abstract mixin class _$CryptoCopyWith<$Res> implements $CoreFailureCopyWith<$Res> {
  factory _$CryptoCopyWith(_Crypto value, $Res Function(_Crypto) _then) = __$CryptoCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$CryptoCopyWithImpl<$Res>
    implements _$CryptoCopyWith<$Res> {
  __$CryptoCopyWithImpl(this._self, this._then);

  final _Crypto _self;
  final $Res Function(_Crypto) _then;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Crypto(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Unexpected with DiagnosticableTreeMixin implements CoreFailure {
  const _Unexpected(this.e);
  

 final  Object e;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnexpectedCopyWith<_Unexpected> get copyWith => __$UnexpectedCopyWithImpl<_Unexpected>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CoreFailure.unexpected'))
    ..add(DiagnosticsProperty('e', e));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unexpected&&const DeepCollectionEquality().equals(other.e, e));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(e));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CoreFailure.unexpected(e: $e)';
}


}

/// @nodoc
abstract mixin class _$UnexpectedCopyWith<$Res> implements $CoreFailureCopyWith<$Res> {
  factory _$UnexpectedCopyWith(_Unexpected value, $Res Function(_Unexpected) _then) = __$UnexpectedCopyWithImpl;
@useResult
$Res call({
 Object e
});




}
/// @nodoc
class __$UnexpectedCopyWithImpl<$Res>
    implements _$UnexpectedCopyWith<$Res> {
  __$UnexpectedCopyWithImpl(this._self, this._then);

  final _Unexpected _self;
  final $Res Function(_Unexpected) _then;

/// Create a copy of CoreFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? e = null,}) {
  return _then(_Unexpected(
null == e ? _self.e : e ,
  ));
}


}

// dart format on
