// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: 'actived')
  L1_actived? get l1_actived => throw _privateConstructorUsedError;
  @JsonKey(name: 'locked')
  L1_locked? get l1_locked => throw _privateConstructorUsedError;
  @JsonKey(name: 'permission')
  L1_permission? get l1_permission => throw _privateConstructorUsedError;
  @JsonKey(name: 'trashed')
  L1_trashed? get l1_trashed => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get manhanvien => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int? get dataversion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'actived') L1_actived? l1_actived,
      @JsonKey(name: 'locked') L1_locked? l1_locked,
      @JsonKey(name: 'permission') L1_permission? l1_permission,
      @JsonKey(name: 'trashed') L1_trashed? l1_trashed,
      @JsonKey(name: '_id') String? id,
      String? manhanvien,
      String? username,
      String? password,
      String? token,
      String? role,
      String? createdAt,
      String? updatedAt,
      @JsonKey(name: '__v') int? dataversion});

  $L1_activedCopyWith<$Res>? get l1_actived;
  $L1_lockedCopyWith<$Res>? get l1_locked;
  $L1_permissionCopyWith<$Res>? get l1_permission;
  $L1_trashedCopyWith<$Res>? get l1_trashed;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? l1_actived = freezed,
    Object? l1_locked = freezed,
    Object? l1_permission = freezed,
    Object? l1_trashed = freezed,
    Object? id = freezed,
    Object? manhanvien = freezed,
    Object? username = freezed,
    Object? password = freezed,
    Object? token = freezed,
    Object? role = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? dataversion = freezed,
  }) {
    return _then(_value.copyWith(
      l1_actived: freezed == l1_actived
          ? _value.l1_actived
          : l1_actived // ignore: cast_nullable_to_non_nullable
              as L1_actived?,
      l1_locked: freezed == l1_locked
          ? _value.l1_locked
          : l1_locked // ignore: cast_nullable_to_non_nullable
              as L1_locked?,
      l1_permission: freezed == l1_permission
          ? _value.l1_permission
          : l1_permission // ignore: cast_nullable_to_non_nullable
              as L1_permission?,
      l1_trashed: freezed == l1_trashed
          ? _value.l1_trashed
          : l1_trashed // ignore: cast_nullable_to_non_nullable
              as L1_trashed?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      manhanvien: freezed == manhanvien
          ? _value.manhanvien
          : manhanvien // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      dataversion: freezed == dataversion
          ? _value.dataversion
          : dataversion // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $L1_activedCopyWith<$Res>? get l1_actived {
    if (_value.l1_actived == null) {
      return null;
    }

    return $L1_activedCopyWith<$Res>(_value.l1_actived!, (value) {
      return _then(_value.copyWith(l1_actived: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $L1_lockedCopyWith<$Res>? get l1_locked {
    if (_value.l1_locked == null) {
      return null;
    }

    return $L1_lockedCopyWith<$Res>(_value.l1_locked!, (value) {
      return _then(_value.copyWith(l1_locked: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $L1_permissionCopyWith<$Res>? get l1_permission {
    if (_value.l1_permission == null) {
      return null;
    }

    return $L1_permissionCopyWith<$Res>(_value.l1_permission!, (value) {
      return _then(_value.copyWith(l1_permission: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $L1_trashedCopyWith<$Res>? get l1_trashed {
    if (_value.l1_trashed == null) {
      return null;
    }

    return $L1_trashedCopyWith<$Res>(_value.l1_trashed!, (value) {
      return _then(_value.copyWith(l1_trashed: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'actived') L1_actived? l1_actived,
      @JsonKey(name: 'locked') L1_locked? l1_locked,
      @JsonKey(name: 'permission') L1_permission? l1_permission,
      @JsonKey(name: 'trashed') L1_trashed? l1_trashed,
      @JsonKey(name: '_id') String? id,
      String? manhanvien,
      String? username,
      String? password,
      String? token,
      String? role,
      String? createdAt,
      String? updatedAt,
      @JsonKey(name: '__v') int? dataversion});

  @override
  $L1_activedCopyWith<$Res>? get l1_actived;
  @override
  $L1_lockedCopyWith<$Res>? get l1_locked;
  @override
  $L1_permissionCopyWith<$Res>? get l1_permission;
  @override
  $L1_trashedCopyWith<$Res>? get l1_trashed;
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? l1_actived = freezed,
    Object? l1_locked = freezed,
    Object? l1_permission = freezed,
    Object? l1_trashed = freezed,
    Object? id = freezed,
    Object? manhanvien = freezed,
    Object? username = freezed,
    Object? password = freezed,
    Object? token = freezed,
    Object? role = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? dataversion = freezed,
  }) {
    return _then(_$_UserModel(
      l1_actived: freezed == l1_actived
          ? _value.l1_actived
          : l1_actived // ignore: cast_nullable_to_non_nullable
              as L1_actived?,
      l1_locked: freezed == l1_locked
          ? _value.l1_locked
          : l1_locked // ignore: cast_nullable_to_non_nullable
              as L1_locked?,
      l1_permission: freezed == l1_permission
          ? _value.l1_permission
          : l1_permission // ignore: cast_nullable_to_non_nullable
              as L1_permission?,
      l1_trashed: freezed == l1_trashed
          ? _value.l1_trashed
          : l1_trashed // ignore: cast_nullable_to_non_nullable
              as L1_trashed?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      manhanvien: freezed == manhanvien
          ? _value.manhanvien
          : manhanvien // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      dataversion: freezed == dataversion
          ? _value.dataversion
          : dataversion // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel with DiagnosticableTreeMixin implements _UserModel {
  const _$_UserModel(
      {@JsonKey(name: 'actived') this.l1_actived,
      @JsonKey(name: 'locked') this.l1_locked,
      @JsonKey(name: 'permission') this.l1_permission,
      @JsonKey(name: 'trashed') this.l1_trashed,
      @JsonKey(name: '_id') this.id,
      this.manhanvien,
      this.username,
      this.password,
      this.token,
      this.role,
      this.createdAt,
      this.updatedAt,
      @JsonKey(name: '__v') this.dataversion});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @JsonKey(name: 'actived')
  final L1_actived? l1_actived;
  @override
  @JsonKey(name: 'locked')
  final L1_locked? l1_locked;
  @override
  @JsonKey(name: 'permission')
  final L1_permission? l1_permission;
  @override
  @JsonKey(name: 'trashed')
  final L1_trashed? l1_trashed;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? manhanvien;
  @override
  final String? username;
  @override
  final String? password;
  @override
  final String? token;
  @override
  final String? role;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  @JsonKey(name: '__v')
  final int? dataversion;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(l1_actived: $l1_actived, l1_locked: $l1_locked, l1_permission: $l1_permission, l1_trashed: $l1_trashed, id: $id, manhanvien: $manhanvien, username: $username, password: $password, token: $token, role: $role, createdAt: $createdAt, updatedAt: $updatedAt, dataversion: $dataversion)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('l1_actived', l1_actived))
      ..add(DiagnosticsProperty('l1_locked', l1_locked))
      ..add(DiagnosticsProperty('l1_permission', l1_permission))
      ..add(DiagnosticsProperty('l1_trashed', l1_trashed))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('manhanvien', manhanvien))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('dataversion', dataversion));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.l1_actived, l1_actived) ||
                other.l1_actived == l1_actived) &&
            (identical(other.l1_locked, l1_locked) ||
                other.l1_locked == l1_locked) &&
            (identical(other.l1_permission, l1_permission) ||
                other.l1_permission == l1_permission) &&
            (identical(other.l1_trashed, l1_trashed) ||
                other.l1_trashed == l1_trashed) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.manhanvien, manhanvien) ||
                other.manhanvien == manhanvien) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.dataversion, dataversion) ||
                other.dataversion == dataversion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      l1_actived,
      l1_locked,
      l1_permission,
      l1_trashed,
      id,
      manhanvien,
      username,
      password,
      token,
      role,
      createdAt,
      updatedAt,
      dataversion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: 'actived') final L1_actived? l1_actived,
      @JsonKey(name: 'locked') final L1_locked? l1_locked,
      @JsonKey(name: 'permission') final L1_permission? l1_permission,
      @JsonKey(name: 'trashed') final L1_trashed? l1_trashed,
      @JsonKey(name: '_id') final String? id,
      final String? manhanvien,
      final String? username,
      final String? password,
      final String? token,
      final String? role,
      final String? createdAt,
      final String? updatedAt,
      @JsonKey(name: '__v') final int? dataversion}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  @JsonKey(name: 'actived')
  L1_actived? get l1_actived;
  @override
  @JsonKey(name: 'locked')
  L1_locked? get l1_locked;
  @override
  @JsonKey(name: 'permission')
  L1_permission? get l1_permission;
  @override
  @JsonKey(name: 'trashed')
  L1_trashed? get l1_trashed;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get manhanvien;
  @override
  String? get username;
  @override
  String? get password;
  @override
  String? get token;
  @override
  String? get role;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @JsonKey(name: '__v')
  int? get dataversion;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

L1_actived _$L1_activedFromJson(Map<String, dynamic> json) {
  return _L1_actived.fromJson(json);
}

/// @nodoc
mixin _$L1_actived {
  int? get check => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $L1_activedCopyWith<L1_actived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $L1_activedCopyWith<$Res> {
  factory $L1_activedCopyWith(
          L1_actived value, $Res Function(L1_actived) then) =
      _$L1_activedCopyWithImpl<$Res, L1_actived>;
  @useResult
  $Res call({int? check, String? message});
}

/// @nodoc
class _$L1_activedCopyWithImpl<$Res, $Val extends L1_actived>
    implements $L1_activedCopyWith<$Res> {
  _$L1_activedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? check = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      check: freezed == check
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_L1_activedCopyWith<$Res>
    implements $L1_activedCopyWith<$Res> {
  factory _$$_L1_activedCopyWith(
          _$_L1_actived value, $Res Function(_$_L1_actived) then) =
      __$$_L1_activedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? check, String? message});
}

/// @nodoc
class __$$_L1_activedCopyWithImpl<$Res>
    extends _$L1_activedCopyWithImpl<$Res, _$_L1_actived>
    implements _$$_L1_activedCopyWith<$Res> {
  __$$_L1_activedCopyWithImpl(
      _$_L1_actived _value, $Res Function(_$_L1_actived) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? check = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_L1_actived(
      check: freezed == check
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_L1_actived with DiagnosticableTreeMixin implements _L1_actived {
  const _$_L1_actived({this.check, this.message});

  factory _$_L1_actived.fromJson(Map<String, dynamic> json) =>
      _$$_L1_activedFromJson(json);

  @override
  final int? check;
  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'L1_actived(check: $check, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'L1_actived'))
      ..add(DiagnosticsProperty('check', check))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_L1_actived &&
            (identical(other.check, check) || other.check == check) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, check, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_L1_activedCopyWith<_$_L1_actived> get copyWith =>
      __$$_L1_activedCopyWithImpl<_$_L1_actived>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_L1_activedToJson(
      this,
    );
  }
}

abstract class _L1_actived implements L1_actived {
  const factory _L1_actived({final int? check, final String? message}) =
      _$_L1_actived;

  factory _L1_actived.fromJson(Map<String, dynamic> json) =
      _$_L1_actived.fromJson;

  @override
  int? get check;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_L1_activedCopyWith<_$_L1_actived> get copyWith =>
      throw _privateConstructorUsedError;
}

L1_locked _$L1_lockedFromJson(Map<String, dynamic> json) {
  return _L1_locked.fromJson(json);
}

/// @nodoc
mixin _$L1_locked {
  int? get check => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $L1_lockedCopyWith<L1_locked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $L1_lockedCopyWith<$Res> {
  factory $L1_lockedCopyWith(L1_locked value, $Res Function(L1_locked) then) =
      _$L1_lockedCopyWithImpl<$Res, L1_locked>;
  @useResult
  $Res call({int? check, String? message});
}

/// @nodoc
class _$L1_lockedCopyWithImpl<$Res, $Val extends L1_locked>
    implements $L1_lockedCopyWith<$Res> {
  _$L1_lockedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? check = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      check: freezed == check
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_L1_lockedCopyWith<$Res> implements $L1_lockedCopyWith<$Res> {
  factory _$$_L1_lockedCopyWith(
          _$_L1_locked value, $Res Function(_$_L1_locked) then) =
      __$$_L1_lockedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? check, String? message});
}

/// @nodoc
class __$$_L1_lockedCopyWithImpl<$Res>
    extends _$L1_lockedCopyWithImpl<$Res, _$_L1_locked>
    implements _$$_L1_lockedCopyWith<$Res> {
  __$$_L1_lockedCopyWithImpl(
      _$_L1_locked _value, $Res Function(_$_L1_locked) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? check = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_L1_locked(
      check: freezed == check
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_L1_locked with DiagnosticableTreeMixin implements _L1_locked {
  const _$_L1_locked({this.check, this.message});

  factory _$_L1_locked.fromJson(Map<String, dynamic> json) =>
      _$$_L1_lockedFromJson(json);

  @override
  final int? check;
  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'L1_locked(check: $check, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'L1_locked'))
      ..add(DiagnosticsProperty('check', check))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_L1_locked &&
            (identical(other.check, check) || other.check == check) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, check, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_L1_lockedCopyWith<_$_L1_locked> get copyWith =>
      __$$_L1_lockedCopyWithImpl<_$_L1_locked>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_L1_lockedToJson(
      this,
    );
  }
}

abstract class _L1_locked implements L1_locked {
  const factory _L1_locked({final int? check, final String? message}) =
      _$_L1_locked;

  factory _L1_locked.fromJson(Map<String, dynamic> json) =
      _$_L1_locked.fromJson;

  @override
  int? get check;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_L1_lockedCopyWith<_$_L1_locked> get copyWith =>
      throw _privateConstructorUsedError;
}

L1_permission _$L1_permissionFromJson(Map<String, dynamic> json) {
  return _L1_permission.fromJson(json);
}

/// @nodoc
mixin _$L1_permission {
  int? get check => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $L1_permissionCopyWith<L1_permission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $L1_permissionCopyWith<$Res> {
  factory $L1_permissionCopyWith(
          L1_permission value, $Res Function(L1_permission) then) =
      _$L1_permissionCopyWithImpl<$Res, L1_permission>;
  @useResult
  $Res call({int? check, String? message});
}

/// @nodoc
class _$L1_permissionCopyWithImpl<$Res, $Val extends L1_permission>
    implements $L1_permissionCopyWith<$Res> {
  _$L1_permissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? check = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      check: freezed == check
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_L1_permissionCopyWith<$Res>
    implements $L1_permissionCopyWith<$Res> {
  factory _$$_L1_permissionCopyWith(
          _$_L1_permission value, $Res Function(_$_L1_permission) then) =
      __$$_L1_permissionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? check, String? message});
}

/// @nodoc
class __$$_L1_permissionCopyWithImpl<$Res>
    extends _$L1_permissionCopyWithImpl<$Res, _$_L1_permission>
    implements _$$_L1_permissionCopyWith<$Res> {
  __$$_L1_permissionCopyWithImpl(
      _$_L1_permission _value, $Res Function(_$_L1_permission) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? check = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_L1_permission(
      check: freezed == check
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_L1_permission with DiagnosticableTreeMixin implements _L1_permission {
  const _$_L1_permission({this.check, this.message});

  factory _$_L1_permission.fromJson(Map<String, dynamic> json) =>
      _$$_L1_permissionFromJson(json);

  @override
  final int? check;
  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'L1_permission(check: $check, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'L1_permission'))
      ..add(DiagnosticsProperty('check', check))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_L1_permission &&
            (identical(other.check, check) || other.check == check) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, check, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_L1_permissionCopyWith<_$_L1_permission> get copyWith =>
      __$$_L1_permissionCopyWithImpl<_$_L1_permission>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_L1_permissionToJson(
      this,
    );
  }
}

abstract class _L1_permission implements L1_permission {
  const factory _L1_permission({final int? check, final String? message}) =
      _$_L1_permission;

  factory _L1_permission.fromJson(Map<String, dynamic> json) =
      _$_L1_permission.fromJson;

  @override
  int? get check;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_L1_permissionCopyWith<_$_L1_permission> get copyWith =>
      throw _privateConstructorUsedError;
}

L1_trashed _$L1_trashedFromJson(Map<String, dynamic> json) {
  return _L1_trashed.fromJson(json);
}

/// @nodoc
mixin _$L1_trashed {
  int? get check => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $L1_trashedCopyWith<L1_trashed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $L1_trashedCopyWith<$Res> {
  factory $L1_trashedCopyWith(
          L1_trashed value, $Res Function(L1_trashed) then) =
      _$L1_trashedCopyWithImpl<$Res, L1_trashed>;
  @useResult
  $Res call({int? check, String? message});
}

/// @nodoc
class _$L1_trashedCopyWithImpl<$Res, $Val extends L1_trashed>
    implements $L1_trashedCopyWith<$Res> {
  _$L1_trashedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? check = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      check: freezed == check
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_L1_trashedCopyWith<$Res>
    implements $L1_trashedCopyWith<$Res> {
  factory _$$_L1_trashedCopyWith(
          _$_L1_trashed value, $Res Function(_$_L1_trashed) then) =
      __$$_L1_trashedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? check, String? message});
}

/// @nodoc
class __$$_L1_trashedCopyWithImpl<$Res>
    extends _$L1_trashedCopyWithImpl<$Res, _$_L1_trashed>
    implements _$$_L1_trashedCopyWith<$Res> {
  __$$_L1_trashedCopyWithImpl(
      _$_L1_trashed _value, $Res Function(_$_L1_trashed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? check = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_L1_trashed(
      check: freezed == check
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_L1_trashed with DiagnosticableTreeMixin implements _L1_trashed {
  const _$_L1_trashed({this.check, this.message});

  factory _$_L1_trashed.fromJson(Map<String, dynamic> json) =>
      _$$_L1_trashedFromJson(json);

  @override
  final int? check;
  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'L1_trashed(check: $check, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'L1_trashed'))
      ..add(DiagnosticsProperty('check', check))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_L1_trashed &&
            (identical(other.check, check) || other.check == check) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, check, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_L1_trashedCopyWith<_$_L1_trashed> get copyWith =>
      __$$_L1_trashedCopyWithImpl<_$_L1_trashed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_L1_trashedToJson(
      this,
    );
  }
}

abstract class _L1_trashed implements L1_trashed {
  const factory _L1_trashed({final int? check, final String? message}) =
      _$_L1_trashed;

  factory _L1_trashed.fromJson(Map<String, dynamic> json) =
      _$_L1_trashed.fromJson;

  @override
  int? get check;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_L1_trashedCopyWith<_$_L1_trashed> get copyWith =>
      throw _privateConstructorUsedError;
}
