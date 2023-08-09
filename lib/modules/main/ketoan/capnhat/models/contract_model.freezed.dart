// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContractModel _$ContractModelFromJson(Map<String, dynamic> json) {
  return _ContractModel.fromJson(json);
}

/// @nodoc
mixin _$ContractModel {
  @JsonKey(name: 'data')
  L1_data? get l1_data => throw _privateConstructorUsedError;
  List<dynamic>? get apps => throw _privateConstructorUsedError;
  List<dynamic>? get webs => throw _privateConstructorUsedError;
  List<dynamic>? get hostings => throw _privateConstructorUsedError;
  List<dynamic>? get domains => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContractModelCopyWith<ContractModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractModelCopyWith<$Res> {
  factory $ContractModelCopyWith(
          ContractModel value, $Res Function(ContractModel) then) =
      _$ContractModelCopyWithImpl<$Res, ContractModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data') L1_data? l1_data,
      List<dynamic>? apps,
      List<dynamic>? webs,
      List<dynamic>? hostings,
      List<dynamic>? domains});

  $L1_dataCopyWith<$Res>? get l1_data;
}

/// @nodoc
class _$ContractModelCopyWithImpl<$Res, $Val extends ContractModel>
    implements $ContractModelCopyWith<$Res> {
  _$ContractModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? l1_data = freezed,
    Object? apps = freezed,
    Object? webs = freezed,
    Object? hostings = freezed,
    Object? domains = freezed,
  }) {
    return _then(_value.copyWith(
      l1_data: freezed == l1_data
          ? _value.l1_data
          : l1_data // ignore: cast_nullable_to_non_nullable
              as L1_data?,
      apps: freezed == apps
          ? _value.apps
          : apps // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      webs: freezed == webs
          ? _value.webs
          : webs // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      hostings: freezed == hostings
          ? _value.hostings
          : hostings // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      domains: freezed == domains
          ? _value.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $L1_dataCopyWith<$Res>? get l1_data {
    if (_value.l1_data == null) {
      return null;
    }

    return $L1_dataCopyWith<$Res>(_value.l1_data!, (value) {
      return _then(_value.copyWith(l1_data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ContractModelCopyWith<$Res>
    implements $ContractModelCopyWith<$Res> {
  factory _$$_ContractModelCopyWith(
          _$_ContractModel value, $Res Function(_$_ContractModel) then) =
      __$$_ContractModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data') L1_data? l1_data,
      List<dynamic>? apps,
      List<dynamic>? webs,
      List<dynamic>? hostings,
      List<dynamic>? domains});

  @override
  $L1_dataCopyWith<$Res>? get l1_data;
}

/// @nodoc
class __$$_ContractModelCopyWithImpl<$Res>
    extends _$ContractModelCopyWithImpl<$Res, _$_ContractModel>
    implements _$$_ContractModelCopyWith<$Res> {
  __$$_ContractModelCopyWithImpl(
      _$_ContractModel _value, $Res Function(_$_ContractModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? l1_data = freezed,
    Object? apps = freezed,
    Object? webs = freezed,
    Object? hostings = freezed,
    Object? domains = freezed,
  }) {
    return _then(_$_ContractModel(
      l1_data: freezed == l1_data
          ? _value.l1_data
          : l1_data // ignore: cast_nullable_to_non_nullable
              as L1_data?,
      apps: freezed == apps
          ? _value._apps
          : apps // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      webs: freezed == webs
          ? _value._webs
          : webs // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      hostings: freezed == hostings
          ? _value._hostings
          : hostings // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      domains: freezed == domains
          ? _value._domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContractModel with DiagnosticableTreeMixin implements _ContractModel {
  const _$_ContractModel(
      {@JsonKey(name: 'data') this.l1_data,
      final List<dynamic>? apps,
      final List<dynamic>? webs,
      final List<dynamic>? hostings,
      final List<dynamic>? domains})
      : _apps = apps,
        _webs = webs,
        _hostings = hostings,
        _domains = domains;

  factory _$_ContractModel.fromJson(Map<String, dynamic> json) =>
      _$$_ContractModelFromJson(json);

  @override
  @JsonKey(name: 'data')
  final L1_data? l1_data;
  final List<dynamic>? _apps;
  @override
  List<dynamic>? get apps {
    final value = _apps;
    if (value == null) return null;
    if (_apps is EqualUnmodifiableListView) return _apps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _webs;
  @override
  List<dynamic>? get webs {
    final value = _webs;
    if (value == null) return null;
    if (_webs is EqualUnmodifiableListView) return _webs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _hostings;
  @override
  List<dynamic>? get hostings {
    final value = _hostings;
    if (value == null) return null;
    if (_hostings is EqualUnmodifiableListView) return _hostings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _domains;
  @override
  List<dynamic>? get domains {
    final value = _domains;
    if (value == null) return null;
    if (_domains is EqualUnmodifiableListView) return _domains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ContractModel(l1_data: $l1_data, apps: $apps, webs: $webs, hostings: $hostings, domains: $domains)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ContractModel'))
      ..add(DiagnosticsProperty('l1_data', l1_data))
      ..add(DiagnosticsProperty('apps', apps))
      ..add(DiagnosticsProperty('webs', webs))
      ..add(DiagnosticsProperty('hostings', hostings))
      ..add(DiagnosticsProperty('domains', domains));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContractModel &&
            (identical(other.l1_data, l1_data) || other.l1_data == l1_data) &&
            const DeepCollectionEquality().equals(other._apps, _apps) &&
            const DeepCollectionEquality().equals(other._webs, _webs) &&
            const DeepCollectionEquality().equals(other._hostings, _hostings) &&
            const DeepCollectionEquality().equals(other._domains, _domains));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      l1_data,
      const DeepCollectionEquality().hash(_apps),
      const DeepCollectionEquality().hash(_webs),
      const DeepCollectionEquality().hash(_hostings),
      const DeepCollectionEquality().hash(_domains));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContractModelCopyWith<_$_ContractModel> get copyWith =>
      __$$_ContractModelCopyWithImpl<_$_ContractModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContractModelToJson(
      this,
    );
  }
}

abstract class _ContractModel implements ContractModel {
  const factory _ContractModel(
      {@JsonKey(name: 'data') final L1_data? l1_data,
      final List<dynamic>? apps,
      final List<dynamic>? webs,
      final List<dynamic>? hostings,
      final List<dynamic>? domains}) = _$_ContractModel;

  factory _ContractModel.fromJson(Map<String, dynamic> json) =
      _$_ContractModel.fromJson;

  @override
  @JsonKey(name: 'data')
  L1_data? get l1_data;
  @override
  List<dynamic>? get apps;
  @override
  List<dynamic>? get webs;
  @override
  List<dynamic>? get hostings;
  @override
  List<dynamic>? get domains;
  @override
  @JsonKey(ignore: true)
  _$$_ContractModelCopyWith<_$_ContractModel> get copyWith =>
      throw _privateConstructorUsedError;
}

L1_data _$L1_dataFromJson(Map<String, dynamic> json) {
  return _L1_data.fromJson(json);
}

/// @nodoc
mixin _$L1_data {
  @JsonKey(name: 'lichsu_khoitao')
  L2_lichsu_khoitao? get l2_lichsu_khoitao =>
      throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get sohopdong => throw _privateConstructorUsedError;
  String? get sohopdongcu => throw _privateConstructorUsedError;
  String? get namhopdong => throw _privateConstructorUsedError;
  String? get mahopdong => throw _privateConstructorUsedError;
  String? get loaihopdong => throw _privateConstructorUsedError;
  String? get ngaykyhd => throw _privateConstructorUsedError;
  String? get khachhangId => throw _privateConstructorUsedError;
  List<dynamic>? get nhanvien => throw _privateConstructorUsedError;
  String? get ghichu => throw _privateConstructorUsedError;
  @JsonKey(name: 'info')
  L2_info? get l2_info => throw _privateConstructorUsedError;
  List<dynamic>? get dichvuIds => throw _privateConstructorUsedError;
  String? get tenhopdong => throw _privateConstructorUsedError;
  List<dynamic>? get lichsu_capnhat => throw _privateConstructorUsedError;
  int? get tongtien => throw _privateConstructorUsedError;
  List<dynamic>? get files => throw _privateConstructorUsedError;
  String? get tenhosting => throw _privateConstructorUsedError;
  int? get dungluong => throw _privateConstructorUsedError;
  int? get sonamdangky => throw _privateConstructorUsedError;
  String? get ngaydangky => throw _privateConstructorUsedError;
  String? get ngayhethan => throw _privateConstructorUsedError;
  String? get tenapp => throw _privateConstructorUsedError;
  String? get tenmien => throw _privateConstructorUsedError;
  List<dynamic>? get danhsachtenmien => throw _privateConstructorUsedError;
  String? get chucnang => throw _privateConstructorUsedError;
  String? get mota => throw _privateConstructorUsedError;
  String? get trangthai_hosting => throw _privateConstructorUsedError;
  List<dynamic>? get lichsu_thanhtoan => throw _privateConstructorUsedError;
  String? get ngaybangiao => throw _privateConstructorUsedError;
  String? get ngaykichhoat => throw _privateConstructorUsedError;
  List<dynamic>? get ngayupstore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $L1_dataCopyWith<L1_data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $L1_dataCopyWith<$Res> {
  factory $L1_dataCopyWith(L1_data value, $Res Function(L1_data) then) =
      _$L1_dataCopyWithImpl<$Res, L1_data>;
  @useResult
  $Res call(
      {@JsonKey(name: 'lichsu_khoitao') L2_lichsu_khoitao? l2_lichsu_khoitao,
      @JsonKey(name: '_id') String? id,
      String? sohopdong,
      String? sohopdongcu,
      String? namhopdong,
      String? mahopdong,
      String? loaihopdong,
      String? ngaykyhd,
      String? khachhangId,
      List<dynamic>? nhanvien,
      String? ghichu,
      @JsonKey(name: 'info') L2_info? l2_info,
      List<dynamic>? dichvuIds,
      String? tenhopdong,
      List<dynamic>? lichsu_capnhat,
      int? tongtien,
      List<dynamic>? files,
      String? tenhosting,
      int? dungluong,
      int? sonamdangky,
      String? ngaydangky,
      String? ngayhethan,
      String? tenapp,
      String? tenmien,
      List<dynamic>? danhsachtenmien,
      String? chucnang,
      String? mota,
      String? trangthai_hosting,
      List<dynamic>? lichsu_thanhtoan,
      String? ngaybangiao,
      String? ngaykichhoat,
      List<dynamic>? ngayupstore});

  $L2_lichsu_khoitaoCopyWith<$Res>? get l2_lichsu_khoitao;
  $L2_infoCopyWith<$Res>? get l2_info;
}

/// @nodoc
class _$L1_dataCopyWithImpl<$Res, $Val extends L1_data>
    implements $L1_dataCopyWith<$Res> {
  _$L1_dataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? l2_lichsu_khoitao = freezed,
    Object? id = freezed,
    Object? sohopdong = freezed,
    Object? sohopdongcu = freezed,
    Object? namhopdong = freezed,
    Object? mahopdong = freezed,
    Object? loaihopdong = freezed,
    Object? ngaykyhd = freezed,
    Object? khachhangId = freezed,
    Object? nhanvien = freezed,
    Object? ghichu = freezed,
    Object? l2_info = freezed,
    Object? dichvuIds = freezed,
    Object? tenhopdong = freezed,
    Object? lichsu_capnhat = freezed,
    Object? tongtien = freezed,
    Object? files = freezed,
    Object? tenhosting = freezed,
    Object? dungluong = freezed,
    Object? sonamdangky = freezed,
    Object? ngaydangky = freezed,
    Object? ngayhethan = freezed,
    Object? tenapp = freezed,
    Object? tenmien = freezed,
    Object? danhsachtenmien = freezed,
    Object? chucnang = freezed,
    Object? mota = freezed,
    Object? trangthai_hosting = freezed,
    Object? lichsu_thanhtoan = freezed,
    Object? ngaybangiao = freezed,
    Object? ngaykichhoat = freezed,
    Object? ngayupstore = freezed,
  }) {
    return _then(_value.copyWith(
      l2_lichsu_khoitao: freezed == l2_lichsu_khoitao
          ? _value.l2_lichsu_khoitao
          : l2_lichsu_khoitao // ignore: cast_nullable_to_non_nullable
              as L2_lichsu_khoitao?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sohopdong: freezed == sohopdong
          ? _value.sohopdong
          : sohopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      sohopdongcu: freezed == sohopdongcu
          ? _value.sohopdongcu
          : sohopdongcu // ignore: cast_nullable_to_non_nullable
              as String?,
      namhopdong: freezed == namhopdong
          ? _value.namhopdong
          : namhopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      mahopdong: freezed == mahopdong
          ? _value.mahopdong
          : mahopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      loaihopdong: freezed == loaihopdong
          ? _value.loaihopdong
          : loaihopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      ngaykyhd: freezed == ngaykyhd
          ? _value.ngaykyhd
          : ngaykyhd // ignore: cast_nullable_to_non_nullable
              as String?,
      khachhangId: freezed == khachhangId
          ? _value.khachhangId
          : khachhangId // ignore: cast_nullable_to_non_nullable
              as String?,
      nhanvien: freezed == nhanvien
          ? _value.nhanvien
          : nhanvien // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      ghichu: freezed == ghichu
          ? _value.ghichu
          : ghichu // ignore: cast_nullable_to_non_nullable
              as String?,
      l2_info: freezed == l2_info
          ? _value.l2_info
          : l2_info // ignore: cast_nullable_to_non_nullable
              as L2_info?,
      dichvuIds: freezed == dichvuIds
          ? _value.dichvuIds
          : dichvuIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      tenhopdong: freezed == tenhopdong
          ? _value.tenhopdong
          : tenhopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      lichsu_capnhat: freezed == lichsu_capnhat
          ? _value.lichsu_capnhat
          : lichsu_capnhat // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      tongtien: freezed == tongtien
          ? _value.tongtien
          : tongtien // ignore: cast_nullable_to_non_nullable
              as int?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      tenhosting: freezed == tenhosting
          ? _value.tenhosting
          : tenhosting // ignore: cast_nullable_to_non_nullable
              as String?,
      dungluong: freezed == dungluong
          ? _value.dungluong
          : dungluong // ignore: cast_nullable_to_non_nullable
              as int?,
      sonamdangky: freezed == sonamdangky
          ? _value.sonamdangky
          : sonamdangky // ignore: cast_nullable_to_non_nullable
              as int?,
      ngaydangky: freezed == ngaydangky
          ? _value.ngaydangky
          : ngaydangky // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayhethan: freezed == ngayhethan
          ? _value.ngayhethan
          : ngayhethan // ignore: cast_nullable_to_non_nullable
              as String?,
      tenapp: freezed == tenapp
          ? _value.tenapp
          : tenapp // ignore: cast_nullable_to_non_nullable
              as String?,
      tenmien: freezed == tenmien
          ? _value.tenmien
          : tenmien // ignore: cast_nullable_to_non_nullable
              as String?,
      danhsachtenmien: freezed == danhsachtenmien
          ? _value.danhsachtenmien
          : danhsachtenmien // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      chucnang: freezed == chucnang
          ? _value.chucnang
          : chucnang // ignore: cast_nullable_to_non_nullable
              as String?,
      mota: freezed == mota
          ? _value.mota
          : mota // ignore: cast_nullable_to_non_nullable
              as String?,
      trangthai_hosting: freezed == trangthai_hosting
          ? _value.trangthai_hosting
          : trangthai_hosting // ignore: cast_nullable_to_non_nullable
              as String?,
      lichsu_thanhtoan: freezed == lichsu_thanhtoan
          ? _value.lichsu_thanhtoan
          : lichsu_thanhtoan // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      ngaybangiao: freezed == ngaybangiao
          ? _value.ngaybangiao
          : ngaybangiao // ignore: cast_nullable_to_non_nullable
              as String?,
      ngaykichhoat: freezed == ngaykichhoat
          ? _value.ngaykichhoat
          : ngaykichhoat // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayupstore: freezed == ngayupstore
          ? _value.ngayupstore
          : ngayupstore // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $L2_lichsu_khoitaoCopyWith<$Res>? get l2_lichsu_khoitao {
    if (_value.l2_lichsu_khoitao == null) {
      return null;
    }

    return $L2_lichsu_khoitaoCopyWith<$Res>(_value.l2_lichsu_khoitao!, (value) {
      return _then(_value.copyWith(l2_lichsu_khoitao: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $L2_infoCopyWith<$Res>? get l2_info {
    if (_value.l2_info == null) {
      return null;
    }

    return $L2_infoCopyWith<$Res>(_value.l2_info!, (value) {
      return _then(_value.copyWith(l2_info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_L1_dataCopyWith<$Res> implements $L1_dataCopyWith<$Res> {
  factory _$$_L1_dataCopyWith(
          _$_L1_data value, $Res Function(_$_L1_data) then) =
      __$$_L1_dataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'lichsu_khoitao') L2_lichsu_khoitao? l2_lichsu_khoitao,
      @JsonKey(name: '_id') String? id,
      String? sohopdong,
      String? sohopdongcu,
      String? namhopdong,
      String? mahopdong,
      String? loaihopdong,
      String? ngaykyhd,
      String? khachhangId,
      List<dynamic>? nhanvien,
      String? ghichu,
      @JsonKey(name: 'info') L2_info? l2_info,
      List<dynamic>? dichvuIds,
      String? tenhopdong,
      List<dynamic>? lichsu_capnhat,
      int? tongtien,
      List<dynamic>? files,
      String? tenhosting,
      int? dungluong,
      int? sonamdangky,
      String? ngaydangky,
      String? ngayhethan,
      String? tenapp,
      String? tenmien,
      List<dynamic>? danhsachtenmien,
      String? chucnang,
      String? mota,
      String? trangthai_hosting,
      List<dynamic>? lichsu_thanhtoan,
      String? ngaybangiao,
      String? ngaykichhoat,
      List<dynamic>? ngayupstore});

  @override
  $L2_lichsu_khoitaoCopyWith<$Res>? get l2_lichsu_khoitao;
  @override
  $L2_infoCopyWith<$Res>? get l2_info;
}

/// @nodoc
class __$$_L1_dataCopyWithImpl<$Res>
    extends _$L1_dataCopyWithImpl<$Res, _$_L1_data>
    implements _$$_L1_dataCopyWith<$Res> {
  __$$_L1_dataCopyWithImpl(_$_L1_data _value, $Res Function(_$_L1_data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? l2_lichsu_khoitao = freezed,
    Object? id = freezed,
    Object? sohopdong = freezed,
    Object? sohopdongcu = freezed,
    Object? namhopdong = freezed,
    Object? mahopdong = freezed,
    Object? loaihopdong = freezed,
    Object? ngaykyhd = freezed,
    Object? khachhangId = freezed,
    Object? nhanvien = freezed,
    Object? ghichu = freezed,
    Object? l2_info = freezed,
    Object? dichvuIds = freezed,
    Object? tenhopdong = freezed,
    Object? lichsu_capnhat = freezed,
    Object? tongtien = freezed,
    Object? files = freezed,
    Object? tenhosting = freezed,
    Object? dungluong = freezed,
    Object? sonamdangky = freezed,
    Object? ngaydangky = freezed,
    Object? ngayhethan = freezed,
    Object? tenapp = freezed,
    Object? tenmien = freezed,
    Object? danhsachtenmien = freezed,
    Object? chucnang = freezed,
    Object? mota = freezed,
    Object? trangthai_hosting = freezed,
    Object? lichsu_thanhtoan = freezed,
    Object? ngaybangiao = freezed,
    Object? ngaykichhoat = freezed,
    Object? ngayupstore = freezed,
  }) {
    return _then(_$_L1_data(
      l2_lichsu_khoitao: freezed == l2_lichsu_khoitao
          ? _value.l2_lichsu_khoitao
          : l2_lichsu_khoitao // ignore: cast_nullable_to_non_nullable
              as L2_lichsu_khoitao?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sohopdong: freezed == sohopdong
          ? _value.sohopdong
          : sohopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      sohopdongcu: freezed == sohopdongcu
          ? _value.sohopdongcu
          : sohopdongcu // ignore: cast_nullable_to_non_nullable
              as String?,
      namhopdong: freezed == namhopdong
          ? _value.namhopdong
          : namhopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      mahopdong: freezed == mahopdong
          ? _value.mahopdong
          : mahopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      loaihopdong: freezed == loaihopdong
          ? _value.loaihopdong
          : loaihopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      ngaykyhd: freezed == ngaykyhd
          ? _value.ngaykyhd
          : ngaykyhd // ignore: cast_nullable_to_non_nullable
              as String?,
      khachhangId: freezed == khachhangId
          ? _value.khachhangId
          : khachhangId // ignore: cast_nullable_to_non_nullable
              as String?,
      nhanvien: freezed == nhanvien
          ? _value._nhanvien
          : nhanvien // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      ghichu: freezed == ghichu
          ? _value.ghichu
          : ghichu // ignore: cast_nullable_to_non_nullable
              as String?,
      l2_info: freezed == l2_info
          ? _value.l2_info
          : l2_info // ignore: cast_nullable_to_non_nullable
              as L2_info?,
      dichvuIds: freezed == dichvuIds
          ? _value._dichvuIds
          : dichvuIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      tenhopdong: freezed == tenhopdong
          ? _value.tenhopdong
          : tenhopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      lichsu_capnhat: freezed == lichsu_capnhat
          ? _value._lichsu_capnhat
          : lichsu_capnhat // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      tongtien: freezed == tongtien
          ? _value.tongtien
          : tongtien // ignore: cast_nullable_to_non_nullable
              as int?,
      files: freezed == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      tenhosting: freezed == tenhosting
          ? _value.tenhosting
          : tenhosting // ignore: cast_nullable_to_non_nullable
              as String?,
      dungluong: freezed == dungluong
          ? _value.dungluong
          : dungluong // ignore: cast_nullable_to_non_nullable
              as int?,
      sonamdangky: freezed == sonamdangky
          ? _value.sonamdangky
          : sonamdangky // ignore: cast_nullable_to_non_nullable
              as int?,
      ngaydangky: freezed == ngaydangky
          ? _value.ngaydangky
          : ngaydangky // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayhethan: freezed == ngayhethan
          ? _value.ngayhethan
          : ngayhethan // ignore: cast_nullable_to_non_nullable
              as String?,
      tenapp: freezed == tenapp
          ? _value.tenapp
          : tenapp // ignore: cast_nullable_to_non_nullable
              as String?,
      tenmien: freezed == tenmien
          ? _value.tenmien
          : tenmien // ignore: cast_nullable_to_non_nullable
              as String?,
      danhsachtenmien: freezed == danhsachtenmien
          ? _value._danhsachtenmien
          : danhsachtenmien // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      chucnang: freezed == chucnang
          ? _value.chucnang
          : chucnang // ignore: cast_nullable_to_non_nullable
              as String?,
      mota: freezed == mota
          ? _value.mota
          : mota // ignore: cast_nullable_to_non_nullable
              as String?,
      trangthai_hosting: freezed == trangthai_hosting
          ? _value.trangthai_hosting
          : trangthai_hosting // ignore: cast_nullable_to_non_nullable
              as String?,
      lichsu_thanhtoan: freezed == lichsu_thanhtoan
          ? _value._lichsu_thanhtoan
          : lichsu_thanhtoan // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      ngaybangiao: freezed == ngaybangiao
          ? _value.ngaybangiao
          : ngaybangiao // ignore: cast_nullable_to_non_nullable
              as String?,
      ngaykichhoat: freezed == ngaykichhoat
          ? _value.ngaykichhoat
          : ngaykichhoat // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayupstore: freezed == ngayupstore
          ? _value._ngayupstore
          : ngayupstore // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_L1_data with DiagnosticableTreeMixin implements _L1_data {
  const _$_L1_data(
      {@JsonKey(name: 'lichsu_khoitao') this.l2_lichsu_khoitao,
      @JsonKey(name: '_id') this.id,
      this.sohopdong,
      this.sohopdongcu,
      this.namhopdong,
      this.mahopdong,
      this.loaihopdong,
      this.ngaykyhd,
      this.khachhangId,
      final List<dynamic>? nhanvien,
      this.ghichu,
      @JsonKey(name: 'info') this.l2_info,
      final List<dynamic>? dichvuIds,
      this.tenhopdong,
      final List<dynamic>? lichsu_capnhat,
      this.tongtien,
      final List<dynamic>? files,
      this.tenhosting,
      this.dungluong,
      this.sonamdangky,
      this.ngaydangky,
      this.ngayhethan,
      this.tenapp,
      this.tenmien,
      final List<dynamic>? danhsachtenmien,
      this.chucnang,
      this.mota,
      this.trangthai_hosting,
      final List<dynamic>? lichsu_thanhtoan,
      this.ngaybangiao,
      this.ngaykichhoat,
      final List<dynamic>? ngayupstore})
      : _nhanvien = nhanvien,
        _dichvuIds = dichvuIds,
        _lichsu_capnhat = lichsu_capnhat,
        _files = files,
        _danhsachtenmien = danhsachtenmien,
        _lichsu_thanhtoan = lichsu_thanhtoan,
        _ngayupstore = ngayupstore;

  factory _$_L1_data.fromJson(Map<String, dynamic> json) =>
      _$$_L1_dataFromJson(json);

  @override
  @JsonKey(name: 'lichsu_khoitao')
  final L2_lichsu_khoitao? l2_lichsu_khoitao;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? sohopdong;
  @override
  final String? sohopdongcu;
  @override
  final String? namhopdong;
  @override
  final String? mahopdong;
  @override
  final String? loaihopdong;
  @override
  final String? ngaykyhd;
  @override
  final String? khachhangId;
  final List<dynamic>? _nhanvien;
  @override
  List<dynamic>? get nhanvien {
    final value = _nhanvien;
    if (value == null) return null;
    if (_nhanvien is EqualUnmodifiableListView) return _nhanvien;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? ghichu;
  @override
  @JsonKey(name: 'info')
  final L2_info? l2_info;
  final List<dynamic>? _dichvuIds;
  @override
  List<dynamic>? get dichvuIds {
    final value = _dichvuIds;
    if (value == null) return null;
    if (_dichvuIds is EqualUnmodifiableListView) return _dichvuIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? tenhopdong;
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
  final int? tongtien;
  final List<dynamic>? _files;
  @override
  List<dynamic>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? tenhosting;
  @override
  final int? dungluong;
  @override
  final int? sonamdangky;
  @override
  final String? ngaydangky;
  @override
  final String? ngayhethan;
  @override
  final String? tenapp;
  @override
  final String? tenmien;
  final List<dynamic>? _danhsachtenmien;
  @override
  List<dynamic>? get danhsachtenmien {
    final value = _danhsachtenmien;
    if (value == null) return null;
    if (_danhsachtenmien is EqualUnmodifiableListView) return _danhsachtenmien;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? chucnang;
  @override
  final String? mota;
  @override
  final String? trangthai_hosting;
  final List<dynamic>? _lichsu_thanhtoan;
  @override
  List<dynamic>? get lichsu_thanhtoan {
    final value = _lichsu_thanhtoan;
    if (value == null) return null;
    if (_lichsu_thanhtoan is EqualUnmodifiableListView)
      return _lichsu_thanhtoan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? ngaybangiao;
  @override
  final String? ngaykichhoat;
  final List<dynamic>? _ngayupstore;
  @override
  List<dynamic>? get ngayupstore {
    final value = _ngayupstore;
    if (value == null) return null;
    if (_ngayupstore is EqualUnmodifiableListView) return _ngayupstore;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'L1_data(l2_lichsu_khoitao: $l2_lichsu_khoitao, id: $id, sohopdong: $sohopdong, sohopdongcu: $sohopdongcu, namhopdong: $namhopdong, mahopdong: $mahopdong, loaihopdong: $loaihopdong, ngaykyhd: $ngaykyhd, khachhangId: $khachhangId, nhanvien: $nhanvien, ghichu: $ghichu, l2_info: $l2_info, dichvuIds: $dichvuIds, tenhopdong: $tenhopdong, lichsu_capnhat: $lichsu_capnhat, tongtien: $tongtien, files: $files, tenhosting: $tenhosting, dungluong: $dungluong, sonamdangky: $sonamdangky, ngaydangky: $ngaydangky, ngayhethan: $ngayhethan, tenapp: $tenapp, tenmien: $tenmien, danhsachtenmien: $danhsachtenmien, chucnang: $chucnang, mota: $mota, trangthai_hosting: $trangthai_hosting, lichsu_thanhtoan: $lichsu_thanhtoan, ngaybangiao: $ngaybangiao, ngaykichhoat: $ngaykichhoat, ngayupstore: $ngayupstore)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'L1_data'))
      ..add(DiagnosticsProperty('l2_lichsu_khoitao', l2_lichsu_khoitao))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('sohopdong', sohopdong))
      ..add(DiagnosticsProperty('sohopdongcu', sohopdongcu))
      ..add(DiagnosticsProperty('namhopdong', namhopdong))
      ..add(DiagnosticsProperty('mahopdong', mahopdong))
      ..add(DiagnosticsProperty('loaihopdong', loaihopdong))
      ..add(DiagnosticsProperty('ngaykyhd', ngaykyhd))
      ..add(DiagnosticsProperty('khachhangId', khachhangId))
      ..add(DiagnosticsProperty('nhanvien', nhanvien))
      ..add(DiagnosticsProperty('ghichu', ghichu))
      ..add(DiagnosticsProperty('l2_info', l2_info))
      ..add(DiagnosticsProperty('dichvuIds', dichvuIds))
      ..add(DiagnosticsProperty('tenhopdong', tenhopdong))
      ..add(DiagnosticsProperty('lichsu_capnhat', lichsu_capnhat))
      ..add(DiagnosticsProperty('tongtien', tongtien))
      ..add(DiagnosticsProperty('files', files))
      ..add(DiagnosticsProperty('tenhosting', tenhosting))
      ..add(DiagnosticsProperty('dungluong', dungluong))
      ..add(DiagnosticsProperty('sonamdangky', sonamdangky))
      ..add(DiagnosticsProperty('ngaydangky', ngaydangky))
      ..add(DiagnosticsProperty('ngayhethan', ngayhethan))
      ..add(DiagnosticsProperty('tenapp', tenapp))
      ..add(DiagnosticsProperty('tenmien', tenmien))
      ..add(DiagnosticsProperty('danhsachtenmien', danhsachtenmien))
      ..add(DiagnosticsProperty('chucnang', chucnang))
      ..add(DiagnosticsProperty('mota', mota))
      ..add(DiagnosticsProperty('trangthai_hosting', trangthai_hosting))
      ..add(DiagnosticsProperty('lichsu_thanhtoan', lichsu_thanhtoan))
      ..add(DiagnosticsProperty('ngaybangiao', ngaybangiao))
      ..add(DiagnosticsProperty('ngaykichhoat', ngaykichhoat))
      ..add(DiagnosticsProperty('ngayupstore', ngayupstore));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_L1_data &&
            (identical(other.l2_lichsu_khoitao, l2_lichsu_khoitao) ||
                other.l2_lichsu_khoitao == l2_lichsu_khoitao) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sohopdong, sohopdong) ||
                other.sohopdong == sohopdong) &&
            (identical(other.sohopdongcu, sohopdongcu) ||
                other.sohopdongcu == sohopdongcu) &&
            (identical(other.namhopdong, namhopdong) ||
                other.namhopdong == namhopdong) &&
            (identical(other.mahopdong, mahopdong) ||
                other.mahopdong == mahopdong) &&
            (identical(other.loaihopdong, loaihopdong) ||
                other.loaihopdong == loaihopdong) &&
            (identical(other.ngaykyhd, ngaykyhd) ||
                other.ngaykyhd == ngaykyhd) &&
            (identical(other.khachhangId, khachhangId) ||
                other.khachhangId == khachhangId) &&
            const DeepCollectionEquality().equals(other._nhanvien, _nhanvien) &&
            (identical(other.ghichu, ghichu) || other.ghichu == ghichu) &&
            (identical(other.l2_info, l2_info) || other.l2_info == l2_info) &&
            const DeepCollectionEquality()
                .equals(other._dichvuIds, _dichvuIds) &&
            (identical(other.tenhopdong, tenhopdong) ||
                other.tenhopdong == tenhopdong) &&
            const DeepCollectionEquality()
                .equals(other._lichsu_capnhat, _lichsu_capnhat) &&
            (identical(other.tongtien, tongtien) ||
                other.tongtien == tongtien) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.tenhosting, tenhosting) ||
                other.tenhosting == tenhosting) &&
            (identical(other.dungluong, dungluong) ||
                other.dungluong == dungluong) &&
            (identical(other.sonamdangky, sonamdangky) ||
                other.sonamdangky == sonamdangky) &&
            (identical(other.ngaydangky, ngaydangky) ||
                other.ngaydangky == ngaydangky) &&
            (identical(other.ngayhethan, ngayhethan) ||
                other.ngayhethan == ngayhethan) &&
            (identical(other.tenapp, tenapp) || other.tenapp == tenapp) &&
            (identical(other.tenmien, tenmien) || other.tenmien == tenmien) &&
            const DeepCollectionEquality()
                .equals(other._danhsachtenmien, _danhsachtenmien) &&
            (identical(other.chucnang, chucnang) ||
                other.chucnang == chucnang) &&
            (identical(other.mota, mota) || other.mota == mota) &&
            (identical(other.trangthai_hosting, trangthai_hosting) ||
                other.trangthai_hosting == trangthai_hosting) &&
            const DeepCollectionEquality()
                .equals(other._lichsu_thanhtoan, _lichsu_thanhtoan) &&
            (identical(other.ngaybangiao, ngaybangiao) ||
                other.ngaybangiao == ngaybangiao) &&
            (identical(other.ngaykichhoat, ngaykichhoat) ||
                other.ngaykichhoat == ngaykichhoat) &&
            const DeepCollectionEquality()
                .equals(other._ngayupstore, _ngayupstore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        l2_lichsu_khoitao,
        id,
        sohopdong,
        sohopdongcu,
        namhopdong,
        mahopdong,
        loaihopdong,
        ngaykyhd,
        khachhangId,
        const DeepCollectionEquality().hash(_nhanvien),
        ghichu,
        l2_info,
        const DeepCollectionEquality().hash(_dichvuIds),
        tenhopdong,
        const DeepCollectionEquality().hash(_lichsu_capnhat),
        tongtien,
        const DeepCollectionEquality().hash(_files),
        tenhosting,
        dungluong,
        sonamdangky,
        ngaydangky,
        ngayhethan,
        tenapp,
        tenmien,
        const DeepCollectionEquality().hash(_danhsachtenmien),
        chucnang,
        mota,
        trangthai_hosting,
        const DeepCollectionEquality().hash(_lichsu_thanhtoan),
        ngaybangiao,
        ngaykichhoat,
        const DeepCollectionEquality().hash(_ngayupstore)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_L1_dataCopyWith<_$_L1_data> get copyWith =>
      __$$_L1_dataCopyWithImpl<_$_L1_data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_L1_dataToJson(
      this,
    );
  }
}

abstract class _L1_data implements L1_data {
  const factory _L1_data(
      {@JsonKey(name: 'lichsu_khoitao')
      final L2_lichsu_khoitao? l2_lichsu_khoitao,
      @JsonKey(name: '_id') final String? id,
      final String? sohopdong,
      final String? sohopdongcu,
      final String? namhopdong,
      final String? mahopdong,
      final String? loaihopdong,
      final String? ngaykyhd,
      final String? khachhangId,
      final List<dynamic>? nhanvien,
      final String? ghichu,
      @JsonKey(name: 'info') final L2_info? l2_info,
      final List<dynamic>? dichvuIds,
      final String? tenhopdong,
      final List<dynamic>? lichsu_capnhat,
      final int? tongtien,
      final List<dynamic>? files,
      final String? tenhosting,
      final int? dungluong,
      final int? sonamdangky,
      final String? ngaydangky,
      final String? ngayhethan,
      final String? tenapp,
      final String? tenmien,
      final List<dynamic>? danhsachtenmien,
      final String? chucnang,
      final String? mota,
      final String? trangthai_hosting,
      final List<dynamic>? lichsu_thanhtoan,
      final String? ngaybangiao,
      final String? ngaykichhoat,
      final List<dynamic>? ngayupstore}) = _$_L1_data;

  factory _L1_data.fromJson(Map<String, dynamic> json) = _$_L1_data.fromJson;

  @override
  @JsonKey(name: 'lichsu_khoitao')
  L2_lichsu_khoitao? get l2_lichsu_khoitao;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get sohopdong;
  @override
  String? get sohopdongcu;
  @override
  String? get namhopdong;
  @override
  String? get mahopdong;
  @override
  String? get loaihopdong;
  @override
  String? get ngaykyhd;
  @override
  String? get khachhangId;
  @override
  List<dynamic>? get nhanvien;
  @override
  String? get ghichu;
  @override
  @JsonKey(name: 'info')
  L2_info? get l2_info;
  @override
  List<dynamic>? get dichvuIds;
  @override
  String? get tenhopdong;
  @override
  List<dynamic>? get lichsu_capnhat;
  @override
  int? get tongtien;
  @override
  List<dynamic>? get files;
  @override
  String? get tenhosting;
  @override
  int? get dungluong;
  @override
  int? get sonamdangky;
  @override
  String? get ngaydangky;
  @override
  String? get ngayhethan;
  @override
  String? get tenapp;
  @override
  String? get tenmien;
  @override
  List<dynamic>? get danhsachtenmien;
  @override
  String? get chucnang;
  @override
  String? get mota;
  @override
  String? get trangthai_hosting;
  @override
  List<dynamic>? get lichsu_thanhtoan;
  @override
  String? get ngaybangiao;
  @override
  String? get ngaykichhoat;
  @override
  List<dynamic>? get ngayupstore;
  @override
  @JsonKey(ignore: true)
  _$$_L1_dataCopyWith<_$_L1_data> get copyWith =>
      throw _privateConstructorUsedError;
}

L2_lichsu_khoitao _$L2_lichsu_khoitaoFromJson(Map<String, dynamic> json) {
  return _L2_lichsu_khoitao.fromJson(json);
}

/// @nodoc
mixin _$L2_lichsu_khoitao {
  @JsonKey(name: 'parentId')
  L3_parentId? get l3_parentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'phongbanId')
  L3_phongbanId? get l3_phongbanId => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get manhanvien => throw _privateConstructorUsedError;
  String? get hoten => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $L2_lichsu_khoitaoCopyWith<L2_lichsu_khoitao> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $L2_lichsu_khoitaoCopyWith<$Res> {
  factory $L2_lichsu_khoitaoCopyWith(
          L2_lichsu_khoitao value, $Res Function(L2_lichsu_khoitao) then) =
      _$L2_lichsu_khoitaoCopyWithImpl<$Res, L2_lichsu_khoitao>;
  @useResult
  $Res call(
      {@JsonKey(name: 'parentId') L3_parentId? l3_parentId,
      @JsonKey(name: 'phongbanId') L3_phongbanId? l3_phongbanId,
      @JsonKey(name: '_id') String? id,
      String? manhanvien,
      String? hoten});

  $L3_parentIdCopyWith<$Res>? get l3_parentId;
  $L3_phongbanIdCopyWith<$Res>? get l3_phongbanId;
}

/// @nodoc
class _$L2_lichsu_khoitaoCopyWithImpl<$Res, $Val extends L2_lichsu_khoitao>
    implements $L2_lichsu_khoitaoCopyWith<$Res> {
  _$L2_lichsu_khoitaoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? l3_parentId = freezed,
    Object? l3_phongbanId = freezed,
    Object? id = freezed,
    Object? manhanvien = freezed,
    Object? hoten = freezed,
  }) {
    return _then(_value.copyWith(
      l3_parentId: freezed == l3_parentId
          ? _value.l3_parentId
          : l3_parentId // ignore: cast_nullable_to_non_nullable
              as L3_parentId?,
      l3_phongbanId: freezed == l3_phongbanId
          ? _value.l3_phongbanId
          : l3_phongbanId // ignore: cast_nullable_to_non_nullable
              as L3_phongbanId?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      manhanvien: freezed == manhanvien
          ? _value.manhanvien
          : manhanvien // ignore: cast_nullable_to_non_nullable
              as String?,
      hoten: freezed == hoten
          ? _value.hoten
          : hoten // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $L3_parentIdCopyWith<$Res>? get l3_parentId {
    if (_value.l3_parentId == null) {
      return null;
    }

    return $L3_parentIdCopyWith<$Res>(_value.l3_parentId!, (value) {
      return _then(_value.copyWith(l3_parentId: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $L3_phongbanIdCopyWith<$Res>? get l3_phongbanId {
    if (_value.l3_phongbanId == null) {
      return null;
    }

    return $L3_phongbanIdCopyWith<$Res>(_value.l3_phongbanId!, (value) {
      return _then(_value.copyWith(l3_phongbanId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_L2_lichsu_khoitaoCopyWith<$Res>
    implements $L2_lichsu_khoitaoCopyWith<$Res> {
  factory _$$_L2_lichsu_khoitaoCopyWith(_$_L2_lichsu_khoitao value,
          $Res Function(_$_L2_lichsu_khoitao) then) =
      __$$_L2_lichsu_khoitaoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'parentId') L3_parentId? l3_parentId,
      @JsonKey(name: 'phongbanId') L3_phongbanId? l3_phongbanId,
      @JsonKey(name: '_id') String? id,
      String? manhanvien,
      String? hoten});

  @override
  $L3_parentIdCopyWith<$Res>? get l3_parentId;
  @override
  $L3_phongbanIdCopyWith<$Res>? get l3_phongbanId;
}

/// @nodoc
class __$$_L2_lichsu_khoitaoCopyWithImpl<$Res>
    extends _$L2_lichsu_khoitaoCopyWithImpl<$Res, _$_L2_lichsu_khoitao>
    implements _$$_L2_lichsu_khoitaoCopyWith<$Res> {
  __$$_L2_lichsu_khoitaoCopyWithImpl(
      _$_L2_lichsu_khoitao _value, $Res Function(_$_L2_lichsu_khoitao) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? l3_parentId = freezed,
    Object? l3_phongbanId = freezed,
    Object? id = freezed,
    Object? manhanvien = freezed,
    Object? hoten = freezed,
  }) {
    return _then(_$_L2_lichsu_khoitao(
      l3_parentId: freezed == l3_parentId
          ? _value.l3_parentId
          : l3_parentId // ignore: cast_nullable_to_non_nullable
              as L3_parentId?,
      l3_phongbanId: freezed == l3_phongbanId
          ? _value.l3_phongbanId
          : l3_phongbanId // ignore: cast_nullable_to_non_nullable
              as L3_phongbanId?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      manhanvien: freezed == manhanvien
          ? _value.manhanvien
          : manhanvien // ignore: cast_nullable_to_non_nullable
              as String?,
      hoten: freezed == hoten
          ? _value.hoten
          : hoten // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_L2_lichsu_khoitao
    with DiagnosticableTreeMixin
    implements _L2_lichsu_khoitao {
  const _$_L2_lichsu_khoitao(
      {@JsonKey(name: 'parentId') this.l3_parentId,
      @JsonKey(name: 'phongbanId') this.l3_phongbanId,
      @JsonKey(name: '_id') this.id,
      this.manhanvien,
      this.hoten});

  factory _$_L2_lichsu_khoitao.fromJson(Map<String, dynamic> json) =>
      _$$_L2_lichsu_khoitaoFromJson(json);

  @override
  @JsonKey(name: 'parentId')
  final L3_parentId? l3_parentId;
  @override
  @JsonKey(name: 'phongbanId')
  final L3_phongbanId? l3_phongbanId;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? manhanvien;
  @override
  final String? hoten;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'L2_lichsu_khoitao(l3_parentId: $l3_parentId, l3_phongbanId: $l3_phongbanId, id: $id, manhanvien: $manhanvien, hoten: $hoten)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'L2_lichsu_khoitao'))
      ..add(DiagnosticsProperty('l3_parentId', l3_parentId))
      ..add(DiagnosticsProperty('l3_phongbanId', l3_phongbanId))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('manhanvien', manhanvien))
      ..add(DiagnosticsProperty('hoten', hoten));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_L2_lichsu_khoitao &&
            (identical(other.l3_parentId, l3_parentId) ||
                other.l3_parentId == l3_parentId) &&
            (identical(other.l3_phongbanId, l3_phongbanId) ||
                other.l3_phongbanId == l3_phongbanId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.manhanvien, manhanvien) ||
                other.manhanvien == manhanvien) &&
            (identical(other.hoten, hoten) || other.hoten == hoten));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, l3_parentId, l3_phongbanId, id, manhanvien, hoten);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_L2_lichsu_khoitaoCopyWith<_$_L2_lichsu_khoitao> get copyWith =>
      __$$_L2_lichsu_khoitaoCopyWithImpl<_$_L2_lichsu_khoitao>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_L2_lichsu_khoitaoToJson(
      this,
    );
  }
}

abstract class _L2_lichsu_khoitao implements L2_lichsu_khoitao {
  const factory _L2_lichsu_khoitao(
      {@JsonKey(name: 'parentId') final L3_parentId? l3_parentId,
      @JsonKey(name: 'phongbanId') final L3_phongbanId? l3_phongbanId,
      @JsonKey(name: '_id') final String? id,
      final String? manhanvien,
      final String? hoten}) = _$_L2_lichsu_khoitao;

  factory _L2_lichsu_khoitao.fromJson(Map<String, dynamic> json) =
      _$_L2_lichsu_khoitao.fromJson;

  @override
  @JsonKey(name: 'parentId')
  L3_parentId? get l3_parentId;
  @override
  @JsonKey(name: 'phongbanId')
  L3_phongbanId? get l3_phongbanId;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get manhanvien;
  @override
  String? get hoten;
  @override
  @JsonKey(ignore: true)
  _$$_L2_lichsu_khoitaoCopyWith<_$_L2_lichsu_khoitao> get copyWith =>
      throw _privateConstructorUsedError;
}

L2_info _$L2_infoFromJson(Map<String, dynamic> json) {
  return _L2_info.fromJson(json);
}

/// @nodoc
mixin _$L2_info {
  List<dynamic>? get danhsachtenmien => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $L2_infoCopyWith<L2_info> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $L2_infoCopyWith<$Res> {
  factory $L2_infoCopyWith(L2_info value, $Res Function(L2_info) then) =
      _$L2_infoCopyWithImpl<$Res, L2_info>;
  @useResult
  $Res call({List<dynamic>? danhsachtenmien});
}

/// @nodoc
class _$L2_infoCopyWithImpl<$Res, $Val extends L2_info>
    implements $L2_infoCopyWith<$Res> {
  _$L2_infoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? danhsachtenmien = freezed,
  }) {
    return _then(_value.copyWith(
      danhsachtenmien: freezed == danhsachtenmien
          ? _value.danhsachtenmien
          : danhsachtenmien // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_L2_infoCopyWith<$Res> implements $L2_infoCopyWith<$Res> {
  factory _$$_L2_infoCopyWith(
          _$_L2_info value, $Res Function(_$_L2_info) then) =
      __$$_L2_infoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? danhsachtenmien});
}

/// @nodoc
class __$$_L2_infoCopyWithImpl<$Res>
    extends _$L2_infoCopyWithImpl<$Res, _$_L2_info>
    implements _$$_L2_infoCopyWith<$Res> {
  __$$_L2_infoCopyWithImpl(_$_L2_info _value, $Res Function(_$_L2_info) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? danhsachtenmien = freezed,
  }) {
    return _then(_$_L2_info(
      danhsachtenmien: freezed == danhsachtenmien
          ? _value._danhsachtenmien
          : danhsachtenmien // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_L2_info with DiagnosticableTreeMixin implements _L2_info {
  const _$_L2_info({final List<dynamic>? danhsachtenmien})
      : _danhsachtenmien = danhsachtenmien;

  factory _$_L2_info.fromJson(Map<String, dynamic> json) =>
      _$$_L2_infoFromJson(json);

  final List<dynamic>? _danhsachtenmien;
  @override
  List<dynamic>? get danhsachtenmien {
    final value = _danhsachtenmien;
    if (value == null) return null;
    if (_danhsachtenmien is EqualUnmodifiableListView) return _danhsachtenmien;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'L2_info(danhsachtenmien: $danhsachtenmien)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'L2_info'))
      ..add(DiagnosticsProperty('danhsachtenmien', danhsachtenmien));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_L2_info &&
            const DeepCollectionEquality()
                .equals(other._danhsachtenmien, _danhsachtenmien));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_danhsachtenmien));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_L2_infoCopyWith<_$_L2_info> get copyWith =>
      __$$_L2_infoCopyWithImpl<_$_L2_info>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_L2_infoToJson(
      this,
    );
  }
}

abstract class _L2_info implements L2_info {
  const factory _L2_info({final List<dynamic>? danhsachtenmien}) = _$_L2_info;

  factory _L2_info.fromJson(Map<String, dynamic> json) = _$_L2_info.fromJson;

  @override
  List<dynamic>? get danhsachtenmien;
  @override
  @JsonKey(ignore: true)
  _$$_L2_infoCopyWith<_$_L2_info> get copyWith =>
      throw _privateConstructorUsedError;
}

L3_parentId _$L3_parentIdFromJson(Map<String, dynamic> json) {
  return _L3_parentId.fromJson(json);
}

/// @nodoc
mixin _$L3_parentId {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get manhanvien => throw _privateConstructorUsedError;
  String? get hoten => throw _privateConstructorUsedError;
  String? get manhanh => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $L3_parentIdCopyWith<L3_parentId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $L3_parentIdCopyWith<$Res> {
  factory $L3_parentIdCopyWith(
          L3_parentId value, $Res Function(L3_parentId) then) =
      _$L3_parentIdCopyWithImpl<$Res, L3_parentId>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? manhanvien,
      String? hoten,
      String? manhanh});
}

/// @nodoc
class _$L3_parentIdCopyWithImpl<$Res, $Val extends L3_parentId>
    implements $L3_parentIdCopyWith<$Res> {
  _$L3_parentIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? manhanvien = freezed,
    Object? hoten = freezed,
    Object? manhanh = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      manhanvien: freezed == manhanvien
          ? _value.manhanvien
          : manhanvien // ignore: cast_nullable_to_non_nullable
              as String?,
      hoten: freezed == hoten
          ? _value.hoten
          : hoten // ignore: cast_nullable_to_non_nullable
              as String?,
      manhanh: freezed == manhanh
          ? _value.manhanh
          : manhanh // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_L3_parentIdCopyWith<$Res>
    implements $L3_parentIdCopyWith<$Res> {
  factory _$$_L3_parentIdCopyWith(
          _$_L3_parentId value, $Res Function(_$_L3_parentId) then) =
      __$$_L3_parentIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? manhanvien,
      String? hoten,
      String? manhanh});
}

/// @nodoc
class __$$_L3_parentIdCopyWithImpl<$Res>
    extends _$L3_parentIdCopyWithImpl<$Res, _$_L3_parentId>
    implements _$$_L3_parentIdCopyWith<$Res> {
  __$$_L3_parentIdCopyWithImpl(
      _$_L3_parentId _value, $Res Function(_$_L3_parentId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? manhanvien = freezed,
    Object? hoten = freezed,
    Object? manhanh = freezed,
  }) {
    return _then(_$_L3_parentId(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      manhanvien: freezed == manhanvien
          ? _value.manhanvien
          : manhanvien // ignore: cast_nullable_to_non_nullable
              as String?,
      hoten: freezed == hoten
          ? _value.hoten
          : hoten // ignore: cast_nullable_to_non_nullable
              as String?,
      manhanh: freezed == manhanh
          ? _value.manhanh
          : manhanh // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_L3_parentId with DiagnosticableTreeMixin implements _L3_parentId {
  const _$_L3_parentId(
      {@JsonKey(name: '_id') this.id,
      this.manhanvien,
      this.hoten,
      this.manhanh});

  factory _$_L3_parentId.fromJson(Map<String, dynamic> json) =>
      _$$_L3_parentIdFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? manhanvien;
  @override
  final String? hoten;
  @override
  final String? manhanh;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'L3_parentId(id: $id, manhanvien: $manhanvien, hoten: $hoten, manhanh: $manhanh)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'L3_parentId'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('manhanvien', manhanvien))
      ..add(DiagnosticsProperty('hoten', hoten))
      ..add(DiagnosticsProperty('manhanh', manhanh));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_L3_parentId &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.manhanvien, manhanvien) ||
                other.manhanvien == manhanvien) &&
            (identical(other.hoten, hoten) || other.hoten == hoten) &&
            (identical(other.manhanh, manhanh) || other.manhanh == manhanh));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, manhanvien, hoten, manhanh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_L3_parentIdCopyWith<_$_L3_parentId> get copyWith =>
      __$$_L3_parentIdCopyWithImpl<_$_L3_parentId>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_L3_parentIdToJson(
      this,
    );
  }
}

abstract class _L3_parentId implements L3_parentId {
  const factory _L3_parentId(
      {@JsonKey(name: '_id') final String? id,
      final String? manhanvien,
      final String? hoten,
      final String? manhanh}) = _$_L3_parentId;

  factory _L3_parentId.fromJson(Map<String, dynamic> json) =
      _$_L3_parentId.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get manhanvien;
  @override
  String? get hoten;
  @override
  String? get manhanh;
  @override
  @JsonKey(ignore: true)
  _$$_L3_parentIdCopyWith<_$_L3_parentId> get copyWith =>
      throw _privateConstructorUsedError;
}

L3_phongbanId _$L3_phongbanIdFromJson(Map<String, dynamic> json) {
  return _L3_phongbanId.fromJson(json);
}

/// @nodoc
mixin _$L3_phongbanId {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get maphongban => throw _privateConstructorUsedError;
  String? get manhanh => throw _privateConstructorUsedError;
  String? get tenphongban => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $L3_phongbanIdCopyWith<L3_phongbanId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $L3_phongbanIdCopyWith<$Res> {
  factory $L3_phongbanIdCopyWith(
          L3_phongbanId value, $Res Function(L3_phongbanId) then) =
      _$L3_phongbanIdCopyWithImpl<$Res, L3_phongbanId>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? maphongban,
      String? manhanh,
      String? tenphongban});
}

/// @nodoc
class _$L3_phongbanIdCopyWithImpl<$Res, $Val extends L3_phongbanId>
    implements $L3_phongbanIdCopyWith<$Res> {
  _$L3_phongbanIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? maphongban = freezed,
    Object? manhanh = freezed,
    Object? tenphongban = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      maphongban: freezed == maphongban
          ? _value.maphongban
          : maphongban // ignore: cast_nullable_to_non_nullable
              as String?,
      manhanh: freezed == manhanh
          ? _value.manhanh
          : manhanh // ignore: cast_nullable_to_non_nullable
              as String?,
      tenphongban: freezed == tenphongban
          ? _value.tenphongban
          : tenphongban // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_L3_phongbanIdCopyWith<$Res>
    implements $L3_phongbanIdCopyWith<$Res> {
  factory _$$_L3_phongbanIdCopyWith(
          _$_L3_phongbanId value, $Res Function(_$_L3_phongbanId) then) =
      __$$_L3_phongbanIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? maphongban,
      String? manhanh,
      String? tenphongban});
}

/// @nodoc
class __$$_L3_phongbanIdCopyWithImpl<$Res>
    extends _$L3_phongbanIdCopyWithImpl<$Res, _$_L3_phongbanId>
    implements _$$_L3_phongbanIdCopyWith<$Res> {
  __$$_L3_phongbanIdCopyWithImpl(
      _$_L3_phongbanId _value, $Res Function(_$_L3_phongbanId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? maphongban = freezed,
    Object? manhanh = freezed,
    Object? tenphongban = freezed,
  }) {
    return _then(_$_L3_phongbanId(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      maphongban: freezed == maphongban
          ? _value.maphongban
          : maphongban // ignore: cast_nullable_to_non_nullable
              as String?,
      manhanh: freezed == manhanh
          ? _value.manhanh
          : manhanh // ignore: cast_nullable_to_non_nullable
              as String?,
      tenphongban: freezed == tenphongban
          ? _value.tenphongban
          : tenphongban // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_L3_phongbanId with DiagnosticableTreeMixin implements _L3_phongbanId {
  const _$_L3_phongbanId(
      {@JsonKey(name: '_id') this.id,
      this.maphongban,
      this.manhanh,
      this.tenphongban});

  factory _$_L3_phongbanId.fromJson(Map<String, dynamic> json) =>
      _$$_L3_phongbanIdFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? maphongban;
  @override
  final String? manhanh;
  @override
  final String? tenphongban;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'L3_phongbanId(id: $id, maphongban: $maphongban, manhanh: $manhanh, tenphongban: $tenphongban)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'L3_phongbanId'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('maphongban', maphongban))
      ..add(DiagnosticsProperty('manhanh', manhanh))
      ..add(DiagnosticsProperty('tenphongban', tenphongban));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_L3_phongbanId &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.maphongban, maphongban) ||
                other.maphongban == maphongban) &&
            (identical(other.manhanh, manhanh) || other.manhanh == manhanh) &&
            (identical(other.tenphongban, tenphongban) ||
                other.tenphongban == tenphongban));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, maphongban, manhanh, tenphongban);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_L3_phongbanIdCopyWith<_$_L3_phongbanId> get copyWith =>
      __$$_L3_phongbanIdCopyWithImpl<_$_L3_phongbanId>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_L3_phongbanIdToJson(
      this,
    );
  }
}

abstract class _L3_phongbanId implements L3_phongbanId {
  const factory _L3_phongbanId(
      {@JsonKey(name: '_id') final String? id,
      final String? maphongban,
      final String? manhanh,
      final String? tenphongban}) = _$_L3_phongbanId;

  factory _L3_phongbanId.fromJson(Map<String, dynamic> json) =
      _$_L3_phongbanId.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get maphongban;
  @override
  String? get manhanh;
  @override
  String? get tenphongban;
  @override
  @JsonKey(ignore: true)
  _$$_L3_phongbanIdCopyWith<_$_L3_phongbanId> get copyWith =>
      throw _privateConstructorUsedError;
}
