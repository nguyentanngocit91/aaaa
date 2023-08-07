// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'searchcustomer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchCustomerModel _$SearchCustomerModelFromJson(Map<String, dynamic> json) {
  return _SearchCustomerModel.fromJson(json);
}

/// @nodoc
mixin _$SearchCustomerModel {
  List<dynamic>? get lichsu_khoitao => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get makhachhang => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get hoten => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get congty => throw _privateConstructorUsedError;
  String? get masothue => throw _privateConstructorUsedError;
  String? get diachi => throw _privateConstructorUsedError;
  String? get cccd => throw _privateConstructorUsedError;
  @JsonKey(name: 'info')
  L1_info? get l1_info => throw _privateConstructorUsedError;
  String? get ghichu => throw _privateConstructorUsedError;
  List<dynamic>? get lichsu_capnhat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchCustomerModelCopyWith<SearchCustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCustomerModelCopyWith<$Res> {
  factory $SearchCustomerModelCopyWith(
          SearchCustomerModel value, $Res Function(SearchCustomerModel) then) =
      _$SearchCustomerModelCopyWithImpl<$Res, SearchCustomerModel>;
  @useResult
  $Res call(
      {List<dynamic>? lichsu_khoitao,
      @JsonKey(name: '_id') String? id,
      String? makhachhang,
      String? type,
      String? hoten,
      String? phone,
      String? email,
      String? congty,
      String? masothue,
      String? diachi,
      String? cccd,
      @JsonKey(name: 'info') L1_info? l1_info,
      String? ghichu,
      List<dynamic>? lichsu_capnhat});

  $L1_infoCopyWith<$Res>? get l1_info;
}

/// @nodoc
class _$SearchCustomerModelCopyWithImpl<$Res, $Val extends SearchCustomerModel>
    implements $SearchCustomerModelCopyWith<$Res> {
  _$SearchCustomerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lichsu_khoitao = freezed,
    Object? id = freezed,
    Object? makhachhang = freezed,
    Object? type = freezed,
    Object? hoten = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? congty = freezed,
    Object? masothue = freezed,
    Object? diachi = freezed,
    Object? cccd = freezed,
    Object? l1_info = freezed,
    Object? ghichu = freezed,
    Object? lichsu_capnhat = freezed,
  }) {
    return _then(_value.copyWith(
      lichsu_khoitao: freezed == lichsu_khoitao
          ? _value.lichsu_khoitao
          : lichsu_khoitao // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      makhachhang: freezed == makhachhang
          ? _value.makhachhang
          : makhachhang // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      hoten: freezed == hoten
          ? _value.hoten
          : hoten // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      congty: freezed == congty
          ? _value.congty
          : congty // ignore: cast_nullable_to_non_nullable
              as String?,
      masothue: freezed == masothue
          ? _value.masothue
          : masothue // ignore: cast_nullable_to_non_nullable
              as String?,
      diachi: freezed == diachi
          ? _value.diachi
          : diachi // ignore: cast_nullable_to_non_nullable
              as String?,
      cccd: freezed == cccd
          ? _value.cccd
          : cccd // ignore: cast_nullable_to_non_nullable
              as String?,
      l1_info: freezed == l1_info
          ? _value.l1_info
          : l1_info // ignore: cast_nullable_to_non_nullable
              as L1_info?,
      ghichu: freezed == ghichu
          ? _value.ghichu
          : ghichu // ignore: cast_nullable_to_non_nullable
              as String?,
      lichsu_capnhat: freezed == lichsu_capnhat
          ? _value.lichsu_capnhat
          : lichsu_capnhat // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $L1_infoCopyWith<$Res>? get l1_info {
    if (_value.l1_info == null) {
      return null;
    }

    return $L1_infoCopyWith<$Res>(_value.l1_info!, (value) {
      return _then(_value.copyWith(l1_info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SearchCustomerModelCopyWith<$Res>
    implements $SearchCustomerModelCopyWith<$Res> {
  factory _$$_SearchCustomerModelCopyWith(_$_SearchCustomerModel value,
          $Res Function(_$_SearchCustomerModel) then) =
      __$$_SearchCustomerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic>? lichsu_khoitao,
      @JsonKey(name: '_id') String? id,
      String? makhachhang,
      String? type,
      String? hoten,
      String? phone,
      String? email,
      String? congty,
      String? masothue,
      String? diachi,
      String? cccd,
      @JsonKey(name: 'info') L1_info? l1_info,
      String? ghichu,
      List<dynamic>? lichsu_capnhat});

  @override
  $L1_infoCopyWith<$Res>? get l1_info;
}

/// @nodoc
class __$$_SearchCustomerModelCopyWithImpl<$Res>
    extends _$SearchCustomerModelCopyWithImpl<$Res, _$_SearchCustomerModel>
    implements _$$_SearchCustomerModelCopyWith<$Res> {
  __$$_SearchCustomerModelCopyWithImpl(_$_SearchCustomerModel _value,
      $Res Function(_$_SearchCustomerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lichsu_khoitao = freezed,
    Object? id = freezed,
    Object? makhachhang = freezed,
    Object? type = freezed,
    Object? hoten = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? congty = freezed,
    Object? masothue = freezed,
    Object? diachi = freezed,
    Object? cccd = freezed,
    Object? l1_info = freezed,
    Object? ghichu = freezed,
    Object? lichsu_capnhat = freezed,
  }) {
    return _then(_$_SearchCustomerModel(
      lichsu_khoitao: freezed == lichsu_khoitao
          ? _value._lichsu_khoitao
          : lichsu_khoitao // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      makhachhang: freezed == makhachhang
          ? _value.makhachhang
          : makhachhang // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      hoten: freezed == hoten
          ? _value.hoten
          : hoten // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      congty: freezed == congty
          ? _value.congty
          : congty // ignore: cast_nullable_to_non_nullable
              as String?,
      masothue: freezed == masothue
          ? _value.masothue
          : masothue // ignore: cast_nullable_to_non_nullable
              as String?,
      diachi: freezed == diachi
          ? _value.diachi
          : diachi // ignore: cast_nullable_to_non_nullable
              as String?,
      cccd: freezed == cccd
          ? _value.cccd
          : cccd // ignore: cast_nullable_to_non_nullable
              as String?,
      l1_info: freezed == l1_info
          ? _value.l1_info
          : l1_info // ignore: cast_nullable_to_non_nullable
              as L1_info?,
      ghichu: freezed == ghichu
          ? _value.ghichu
          : ghichu // ignore: cast_nullable_to_non_nullable
              as String?,
      lichsu_capnhat: freezed == lichsu_capnhat
          ? _value._lichsu_capnhat
          : lichsu_capnhat // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchCustomerModel
    with DiagnosticableTreeMixin
    implements _SearchCustomerModel {
  const _$_SearchCustomerModel(
      {final List<dynamic>? lichsu_khoitao,
      @JsonKey(name: '_id') this.id,
      this.makhachhang,
      this.type,
      this.hoten,
      this.phone,
      this.email,
      this.congty,
      this.masothue,
      this.diachi,
      this.cccd,
      @JsonKey(name: 'info') this.l1_info,
      this.ghichu,
      final List<dynamic>? lichsu_capnhat})
      : _lichsu_khoitao = lichsu_khoitao,
        _lichsu_capnhat = lichsu_capnhat;

  factory _$_SearchCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$$_SearchCustomerModelFromJson(json);

  final List<dynamic>? _lichsu_khoitao;
  @override
  List<dynamic>? get lichsu_khoitao {
    final value = _lichsu_khoitao;
    if (value == null) return null;
    if (_lichsu_khoitao is EqualUnmodifiableListView) return _lichsu_khoitao;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? makhachhang;
  @override
  final String? type;
  @override
  final String? hoten;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? congty;
  @override
  final String? masothue;
  @override
  final String? diachi;
  @override
  final String? cccd;
  @override
  @JsonKey(name: 'info')
  final L1_info? l1_info;
  @override
  final String? ghichu;
  final List<dynamic>? _lichsu_capnhat;
  @override
  List<dynamic>? get lichsu_capnhat {
    final value = _lichsu_capnhat;
    if (value == null) return null;
    if (_lichsu_capnhat is EqualUnmodifiableListView) return _lichsu_capnhat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchCustomerModel(lichsu_khoitao: $lichsu_khoitao, id: $id, makhachhang: $makhachhang, type: $type, hoten: $hoten, phone: $phone, email: $email, congty: $congty, masothue: $masothue, diachi: $diachi, cccd: $cccd, l1_info: $l1_info, ghichu: $ghichu, lichsu_capnhat: $lichsu_capnhat)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchCustomerModel'))
      ..add(DiagnosticsProperty('lichsu_khoitao', lichsu_khoitao))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('makhachhang', makhachhang))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('hoten', hoten))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('congty', congty))
      ..add(DiagnosticsProperty('masothue', masothue))
      ..add(DiagnosticsProperty('diachi', diachi))
      ..add(DiagnosticsProperty('cccd', cccd))
      ..add(DiagnosticsProperty('l1_info', l1_info))
      ..add(DiagnosticsProperty('ghichu', ghichu))
      ..add(DiagnosticsProperty('lichsu_capnhat', lichsu_capnhat));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchCustomerModel &&
            const DeepCollectionEquality()
                .equals(other._lichsu_khoitao, _lichsu_khoitao) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.makhachhang, makhachhang) ||
                other.makhachhang == makhachhang) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.hoten, hoten) || other.hoten == hoten) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.congty, congty) || other.congty == congty) &&
            (identical(other.masothue, masothue) ||
                other.masothue == masothue) &&
            (identical(other.diachi, diachi) || other.diachi == diachi) &&
            (identical(other.cccd, cccd) || other.cccd == cccd) &&
            (identical(other.l1_info, l1_info) || other.l1_info == l1_info) &&
            (identical(other.ghichu, ghichu) || other.ghichu == ghichu) &&
            const DeepCollectionEquality()
                .equals(other._lichsu_capnhat, _lichsu_capnhat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lichsu_khoitao),
      id,
      makhachhang,
      type,
      hoten,
      phone,
      email,
      congty,
      masothue,
      diachi,
      cccd,
      l1_info,
      ghichu,
      const DeepCollectionEquality().hash(_lichsu_capnhat));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchCustomerModelCopyWith<_$_SearchCustomerModel> get copyWith =>
      __$$_SearchCustomerModelCopyWithImpl<_$_SearchCustomerModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchCustomerModelToJson(
      this,
    );
  }
}

abstract class _SearchCustomerModel implements SearchCustomerModel {
  const factory _SearchCustomerModel(
      {final List<dynamic>? lichsu_khoitao,
      @JsonKey(name: '_id') final String? id,
      final String? makhachhang,
      final String? type,
      final String? hoten,
      final String? phone,
      final String? email,
      final String? congty,
      final String? masothue,
      final String? diachi,
      final String? cccd,
      @JsonKey(name: 'info') final L1_info? l1_info,
      final String? ghichu,
      final List<dynamic>? lichsu_capnhat}) = _$_SearchCustomerModel;

  factory _SearchCustomerModel.fromJson(Map<String, dynamic> json) =
      _$_SearchCustomerModel.fromJson;

  @override
  List<dynamic>? get lichsu_khoitao;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get makhachhang;
  @override
  String? get type;
  @override
  String? get hoten;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get congty;
  @override
  String? get masothue;
  @override
  String? get diachi;
  @override
  String? get cccd;
  @override
  @JsonKey(name: 'info')
  L1_info? get l1_info;
  @override
  String? get ghichu;
  @override
  List<dynamic>? get lichsu_capnhat;
  @override
  @JsonKey(ignore: true)
  _$$_SearchCustomerModelCopyWith<_$_SearchCustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

L1_info _$L1_infoFromJson(Map<String, dynamic> json) {
  return _L1_info.fromJson(json);
}

/// @nodoc
mixin _$L1_info {
  String? get email_phu => throw _privateConstructorUsedError;
  String? get nguoidaidienmoi => throw _privateConstructorUsedError;
  String? get dienthoaicoquan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $L1_infoCopyWith<L1_info> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $L1_infoCopyWith<$Res> {
  factory $L1_infoCopyWith(L1_info value, $Res Function(L1_info) then) =
      _$L1_infoCopyWithImpl<$Res, L1_info>;
  @useResult
  $Res call(
      {String? email_phu, String? nguoidaidienmoi, String? dienthoaicoquan});
}

/// @nodoc
class _$L1_infoCopyWithImpl<$Res, $Val extends L1_info>
    implements $L1_infoCopyWith<$Res> {
  _$L1_infoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email_phu = freezed,
    Object? nguoidaidienmoi = freezed,
    Object? dienthoaicoquan = freezed,
  }) {
    return _then(_value.copyWith(
      email_phu: freezed == email_phu
          ? _value.email_phu
          : email_phu // ignore: cast_nullable_to_non_nullable
              as String?,
      nguoidaidienmoi: freezed == nguoidaidienmoi
          ? _value.nguoidaidienmoi
          : nguoidaidienmoi // ignore: cast_nullable_to_non_nullable
              as String?,
      dienthoaicoquan: freezed == dienthoaicoquan
          ? _value.dienthoaicoquan
          : dienthoaicoquan // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_L1_infoCopyWith<$Res> implements $L1_infoCopyWith<$Res> {
  factory _$$_L1_infoCopyWith(
          _$_L1_info value, $Res Function(_$_L1_info) then) =
      __$$_L1_infoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email_phu, String? nguoidaidienmoi, String? dienthoaicoquan});
}

/// @nodoc
class __$$_L1_infoCopyWithImpl<$Res>
    extends _$L1_infoCopyWithImpl<$Res, _$_L1_info>
    implements _$$_L1_infoCopyWith<$Res> {
  __$$_L1_infoCopyWithImpl(_$_L1_info _value, $Res Function(_$_L1_info) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email_phu = freezed,
    Object? nguoidaidienmoi = freezed,
    Object? dienthoaicoquan = freezed,
  }) {
    return _then(_$_L1_info(
      email_phu: freezed == email_phu
          ? _value.email_phu
          : email_phu // ignore: cast_nullable_to_non_nullable
              as String?,
      nguoidaidienmoi: freezed == nguoidaidienmoi
          ? _value.nguoidaidienmoi
          : nguoidaidienmoi // ignore: cast_nullable_to_non_nullable
              as String?,
      dienthoaicoquan: freezed == dienthoaicoquan
          ? _value.dienthoaicoquan
          : dienthoaicoquan // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_L1_info with DiagnosticableTreeMixin implements _L1_info {
  const _$_L1_info(
      {this.email_phu, this.nguoidaidienmoi, this.dienthoaicoquan});

  factory _$_L1_info.fromJson(Map<String, dynamic> json) =>
      _$$_L1_infoFromJson(json);

  @override
  final String? email_phu;
  @override
  final String? nguoidaidienmoi;
  @override
  final String? dienthoaicoquan;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'L1_info(email_phu: $email_phu, nguoidaidienmoi: $nguoidaidienmoi, dienthoaicoquan: $dienthoaicoquan)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'L1_info'))
      ..add(DiagnosticsProperty('email_phu', email_phu))
      ..add(DiagnosticsProperty('nguoidaidienmoi', nguoidaidienmoi))
      ..add(DiagnosticsProperty('dienthoaicoquan', dienthoaicoquan));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_L1_info &&
            (identical(other.email_phu, email_phu) ||
                other.email_phu == email_phu) &&
            (identical(other.nguoidaidienmoi, nguoidaidienmoi) ||
                other.nguoidaidienmoi == nguoidaidienmoi) &&
            (identical(other.dienthoaicoquan, dienthoaicoquan) ||
                other.dienthoaicoquan == dienthoaicoquan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email_phu, nguoidaidienmoi, dienthoaicoquan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_L1_infoCopyWith<_$_L1_info> get copyWith =>
      __$$_L1_infoCopyWithImpl<_$_L1_info>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_L1_infoToJson(
      this,
    );
  }
}

abstract class _L1_info implements L1_info {
  const factory _L1_info(
      {final String? email_phu,
      final String? nguoidaidienmoi,
      final String? dienthoaicoquan}) = _$_L1_info;

  factory _L1_info.fromJson(Map<String, dynamic> json) = _$_L1_info.fromJson;

  @override
  String? get email_phu;
  @override
  String? get nguoidaidienmoi;
  @override
  String? get dienthoaicoquan;
  @override
  @JsonKey(ignore: true)
  _$$_L1_infoCopyWith<_$_L1_info> get copyWith =>
      throw _privateConstructorUsedError;
}
