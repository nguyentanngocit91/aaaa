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
  List<dynamic>? get dichvuIds => throw _privateConstructorUsedError;
  List<dynamic>? get files => throw _privateConstructorUsedError;
  List<dynamic>? get lichsu_thanhtoan => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get sohopdong => throw _privateConstructorUsedError;
  String? get namhopdong => throw _privateConstructorUsedError;
  String? get ngaykyhd => throw _privateConstructorUsedError;
  String? get loaihopdong => throw _privateConstructorUsedError;
  String? get mahopdongcu => throw _privateConstructorUsedError;
  String? get mahopdong => throw _privateConstructorUsedError;
  List<dynamic>? get nhanvien => throw _privateConstructorUsedError;
  String? get ghichu => throw _privateConstructorUsedError;
  String? get khachhangId => throw _privateConstructorUsedError;
  String? get tenhopdong => throw _privateConstructorUsedError;
  @JsonKey(name: 'lichsu_khoitao')
  L2_lichsu_khoitao? get l2_lichsu_khoitao =>
      throw _privateConstructorUsedError;
  int? get tongtien => throw _privateConstructorUsedError;
  List<dynamic>? get lichsu_capnhat => throw _privateConstructorUsedError;
  String? get chucnang => throw _privateConstructorUsedError;
  int? get dungluong => throw _privateConstructorUsedError;
  String? get mota => throw _privateConstructorUsedError;
  String? get ngaybangiao => throw _privateConstructorUsedError;
  String? get ngaydangky => throw _privateConstructorUsedError;
  String? get ngayhethan => throw _privateConstructorUsedError;
  String? get ngaykichhoat => throw _privateConstructorUsedError;
  List<dynamic>? get ngayupstore => throw _privateConstructorUsedError;
  int? get sonamdangky => throw _privateConstructorUsedError;
  String? get tenapp => throw _privateConstructorUsedError;
  String? get tenmien => throw _privateConstructorUsedError;

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
      {List<dynamic>? dichvuIds,
      List<dynamic>? files,
      List<dynamic>? lichsu_thanhtoan,
      @JsonKey(name: '_id') String? id,
      String? sohopdong,
      String? namhopdong,
      String? ngaykyhd,
      String? loaihopdong,
      String? mahopdongcu,
      String? mahopdong,
      List<dynamic>? nhanvien,
      String? ghichu,
      String? khachhangId,
      String? tenhopdong,
      @JsonKey(name: 'lichsu_khoitao') L2_lichsu_khoitao? l2_lichsu_khoitao,
      int? tongtien,
      List<dynamic>? lichsu_capnhat,
      String? chucnang,
      int? dungluong,
      String? mota,
      String? ngaybangiao,
      String? ngaydangky,
      String? ngayhethan,
      String? ngaykichhoat,
      List<dynamic>? ngayupstore,
      int? sonamdangky,
      String? tenapp,
      String? tenmien});

  $L2_lichsu_khoitaoCopyWith<$Res>? get l2_lichsu_khoitao;
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
    Object? dichvuIds = freezed,
    Object? files = freezed,
    Object? lichsu_thanhtoan = freezed,
    Object? id = freezed,
    Object? sohopdong = freezed,
    Object? namhopdong = freezed,
    Object? ngaykyhd = freezed,
    Object? loaihopdong = freezed,
    Object? mahopdongcu = freezed,
    Object? mahopdong = freezed,
    Object? nhanvien = freezed,
    Object? ghichu = freezed,
    Object? khachhangId = freezed,
    Object? tenhopdong = freezed,
    Object? l2_lichsu_khoitao = freezed,
    Object? tongtien = freezed,
    Object? lichsu_capnhat = freezed,
    Object? chucnang = freezed,
    Object? dungluong = freezed,
    Object? mota = freezed,
    Object? ngaybangiao = freezed,
    Object? ngaydangky = freezed,
    Object? ngayhethan = freezed,
    Object? ngaykichhoat = freezed,
    Object? ngayupstore = freezed,
    Object? sonamdangky = freezed,
    Object? tenapp = freezed,
    Object? tenmien = freezed,
  }) {
    return _then(_value.copyWith(
      dichvuIds: freezed == dichvuIds
          ? _value.dichvuIds
          : dichvuIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      lichsu_thanhtoan: freezed == lichsu_thanhtoan
          ? _value.lichsu_thanhtoan
          : lichsu_thanhtoan // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sohopdong: freezed == sohopdong
          ? _value.sohopdong
          : sohopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      namhopdong: freezed == namhopdong
          ? _value.namhopdong
          : namhopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      ngaykyhd: freezed == ngaykyhd
          ? _value.ngaykyhd
          : ngaykyhd // ignore: cast_nullable_to_non_nullable
              as String?,
      loaihopdong: freezed == loaihopdong
          ? _value.loaihopdong
          : loaihopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      mahopdongcu: freezed == mahopdongcu
          ? _value.mahopdongcu
          : mahopdongcu // ignore: cast_nullable_to_non_nullable
              as String?,
      mahopdong: freezed == mahopdong
          ? _value.mahopdong
          : mahopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      nhanvien: freezed == nhanvien
          ? _value.nhanvien
          : nhanvien // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      ghichu: freezed == ghichu
          ? _value.ghichu
          : ghichu // ignore: cast_nullable_to_non_nullable
              as String?,
      khachhangId: freezed == khachhangId
          ? _value.khachhangId
          : khachhangId // ignore: cast_nullable_to_non_nullable
              as String?,
      tenhopdong: freezed == tenhopdong
          ? _value.tenhopdong
          : tenhopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      l2_lichsu_khoitao: freezed == l2_lichsu_khoitao
          ? _value.l2_lichsu_khoitao
          : l2_lichsu_khoitao // ignore: cast_nullable_to_non_nullable
              as L2_lichsu_khoitao?,
      tongtien: freezed == tongtien
          ? _value.tongtien
          : tongtien // ignore: cast_nullable_to_non_nullable
              as int?,
      lichsu_capnhat: freezed == lichsu_capnhat
          ? _value.lichsu_capnhat
          : lichsu_capnhat // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      chucnang: freezed == chucnang
          ? _value.chucnang
          : chucnang // ignore: cast_nullable_to_non_nullable
              as String?,
      dungluong: freezed == dungluong
          ? _value.dungluong
          : dungluong // ignore: cast_nullable_to_non_nullable
              as int?,
      mota: freezed == mota
          ? _value.mota
          : mota // ignore: cast_nullable_to_non_nullable
              as String?,
      ngaybangiao: freezed == ngaybangiao
          ? _value.ngaybangiao
          : ngaybangiao // ignore: cast_nullable_to_non_nullable
              as String?,
      ngaydangky: freezed == ngaydangky
          ? _value.ngaydangky
          : ngaydangky // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayhethan: freezed == ngayhethan
          ? _value.ngayhethan
          : ngayhethan // ignore: cast_nullable_to_non_nullable
              as String?,
      ngaykichhoat: freezed == ngaykichhoat
          ? _value.ngaykichhoat
          : ngaykichhoat // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayupstore: freezed == ngayupstore
          ? _value.ngayupstore
          : ngayupstore // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      sonamdangky: freezed == sonamdangky
          ? _value.sonamdangky
          : sonamdangky // ignore: cast_nullable_to_non_nullable
              as int?,
      tenapp: freezed == tenapp
          ? _value.tenapp
          : tenapp // ignore: cast_nullable_to_non_nullable
              as String?,
      tenmien: freezed == tenmien
          ? _value.tenmien
          : tenmien // ignore: cast_nullable_to_non_nullable
              as String?,
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
}

/// @nodoc
abstract class _$$_L1_dataCopyWith<$Res> implements $L1_dataCopyWith<$Res> {
  factory _$$_L1_dataCopyWith(
          _$_L1_data value, $Res Function(_$_L1_data) then) =
      __$$_L1_dataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic>? dichvuIds,
      List<dynamic>? files,
      List<dynamic>? lichsu_thanhtoan,
      @JsonKey(name: '_id') String? id,
      String? sohopdong,
      String? namhopdong,
      String? ngaykyhd,
      String? loaihopdong,
      String? mahopdongcu,
      String? mahopdong,
      List<dynamic>? nhanvien,
      String? ghichu,
      String? khachhangId,
      String? tenhopdong,
      @JsonKey(name: 'lichsu_khoitao') L2_lichsu_khoitao? l2_lichsu_khoitao,
      int? tongtien,
      List<dynamic>? lichsu_capnhat,
      String? chucnang,
      int? dungluong,
      String? mota,
      String? ngaybangiao,
      String? ngaydangky,
      String? ngayhethan,
      String? ngaykichhoat,
      List<dynamic>? ngayupstore,
      int? sonamdangky,
      String? tenapp,
      String? tenmien});

  @override
  $L2_lichsu_khoitaoCopyWith<$Res>? get l2_lichsu_khoitao;
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
    Object? dichvuIds = freezed,
    Object? files = freezed,
    Object? lichsu_thanhtoan = freezed,
    Object? id = freezed,
    Object? sohopdong = freezed,
    Object? namhopdong = freezed,
    Object? ngaykyhd = freezed,
    Object? loaihopdong = freezed,
    Object? mahopdongcu = freezed,
    Object? mahopdong = freezed,
    Object? nhanvien = freezed,
    Object? ghichu = freezed,
    Object? khachhangId = freezed,
    Object? tenhopdong = freezed,
    Object? l2_lichsu_khoitao = freezed,
    Object? tongtien = freezed,
    Object? lichsu_capnhat = freezed,
    Object? chucnang = freezed,
    Object? dungluong = freezed,
    Object? mota = freezed,
    Object? ngaybangiao = freezed,
    Object? ngaydangky = freezed,
    Object? ngayhethan = freezed,
    Object? ngaykichhoat = freezed,
    Object? ngayupstore = freezed,
    Object? sonamdangky = freezed,
    Object? tenapp = freezed,
    Object? tenmien = freezed,
  }) {
    return _then(_$_L1_data(
      dichvuIds: freezed == dichvuIds
          ? _value._dichvuIds
          : dichvuIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      files: freezed == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      lichsu_thanhtoan: freezed == lichsu_thanhtoan
          ? _value._lichsu_thanhtoan
          : lichsu_thanhtoan // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sohopdong: freezed == sohopdong
          ? _value.sohopdong
          : sohopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      namhopdong: freezed == namhopdong
          ? _value.namhopdong
          : namhopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      ngaykyhd: freezed == ngaykyhd
          ? _value.ngaykyhd
          : ngaykyhd // ignore: cast_nullable_to_non_nullable
              as String?,
      loaihopdong: freezed == loaihopdong
          ? _value.loaihopdong
          : loaihopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      mahopdongcu: freezed == mahopdongcu
          ? _value.mahopdongcu
          : mahopdongcu // ignore: cast_nullable_to_non_nullable
              as String?,
      mahopdong: freezed == mahopdong
          ? _value.mahopdong
          : mahopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      nhanvien: freezed == nhanvien
          ? _value._nhanvien
          : nhanvien // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      ghichu: freezed == ghichu
          ? _value.ghichu
          : ghichu // ignore: cast_nullable_to_non_nullable
              as String?,
      khachhangId: freezed == khachhangId
          ? _value.khachhangId
          : khachhangId // ignore: cast_nullable_to_non_nullable
              as String?,
      tenhopdong: freezed == tenhopdong
          ? _value.tenhopdong
          : tenhopdong // ignore: cast_nullable_to_non_nullable
              as String?,
      l2_lichsu_khoitao: freezed == l2_lichsu_khoitao
          ? _value.l2_lichsu_khoitao
          : l2_lichsu_khoitao // ignore: cast_nullable_to_non_nullable
              as L2_lichsu_khoitao?,
      tongtien: freezed == tongtien
          ? _value.tongtien
          : tongtien // ignore: cast_nullable_to_non_nullable
              as int?,
      lichsu_capnhat: freezed == lichsu_capnhat
          ? _value._lichsu_capnhat
          : lichsu_capnhat // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      chucnang: freezed == chucnang
          ? _value.chucnang
          : chucnang // ignore: cast_nullable_to_non_nullable
              as String?,
      dungluong: freezed == dungluong
          ? _value.dungluong
          : dungluong // ignore: cast_nullable_to_non_nullable
              as int?,
      mota: freezed == mota
          ? _value.mota
          : mota // ignore: cast_nullable_to_non_nullable
              as String?,
      ngaybangiao: freezed == ngaybangiao
          ? _value.ngaybangiao
          : ngaybangiao // ignore: cast_nullable_to_non_nullable
              as String?,
      ngaydangky: freezed == ngaydangky
          ? _value.ngaydangky
          : ngaydangky // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayhethan: freezed == ngayhethan
          ? _value.ngayhethan
          : ngayhethan // ignore: cast_nullable_to_non_nullable
              as String?,
      ngaykichhoat: freezed == ngaykichhoat
          ? _value.ngaykichhoat
          : ngaykichhoat // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayupstore: freezed == ngayupstore
          ? _value._ngayupstore
          : ngayupstore // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      sonamdangky: freezed == sonamdangky
          ? _value.sonamdangky
          : sonamdangky // ignore: cast_nullable_to_non_nullable
              as int?,
      tenapp: freezed == tenapp
          ? _value.tenapp
          : tenapp // ignore: cast_nullable_to_non_nullable
              as String?,
      tenmien: freezed == tenmien
          ? _value.tenmien
          : tenmien // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_L1_data with DiagnosticableTreeMixin implements _L1_data {
  const _$_L1_data(
      {final List<dynamic>? dichvuIds,
      final List<dynamic>? files,
      final List<dynamic>? lichsu_thanhtoan,
      @JsonKey(name: '_id') this.id,
      this.sohopdong,
      this.namhopdong,
      this.ngaykyhd,
      this.loaihopdong,
      this.mahopdongcu,
      this.mahopdong,
      final List<dynamic>? nhanvien,
      this.ghichu,
      this.khachhangId,
      this.tenhopdong,
      @JsonKey(name: 'lichsu_khoitao') this.l2_lichsu_khoitao,
      this.tongtien,
      final List<dynamic>? lichsu_capnhat,
      this.chucnang,
      this.dungluong,
      this.mota,
      this.ngaybangiao,
      this.ngaydangky,
      this.ngayhethan,
      this.ngaykichhoat,
      final List<dynamic>? ngayupstore,
      this.sonamdangky,
      this.tenapp,
      this.tenmien})
      : _dichvuIds = dichvuIds,
        _files = files,
        _lichsu_thanhtoan = lichsu_thanhtoan,
        _nhanvien = nhanvien,
        _lichsu_capnhat = lichsu_capnhat,
        _ngayupstore = ngayupstore;

  factory _$_L1_data.fromJson(Map<String, dynamic> json) =>
      _$$_L1_dataFromJson(json);

  final List<dynamic>? _dichvuIds;
  @override
  List<dynamic>? get dichvuIds {
    final value = _dichvuIds;
    if (value == null) return null;
    if (_dichvuIds is EqualUnmodifiableListView) return _dichvuIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _files;
  @override
  List<dynamic>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? sohopdong;
  @override
  final String? namhopdong;
  @override
  final String? ngaykyhd;
  @override
  final String? loaihopdong;
  @override
  final String? mahopdongcu;
  @override
  final String? mahopdong;
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
  final String? khachhangId;
  @override
  final String? tenhopdong;
  @override
  @JsonKey(name: 'lichsu_khoitao')
  final L2_lichsu_khoitao? l2_lichsu_khoitao;
  @override
  final int? tongtien;
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
  final String? chucnang;
  @override
  final int? dungluong;
  @override
  final String? mota;
  @override
  final String? ngaybangiao;
  @override
  final String? ngaydangky;
  @override
  final String? ngayhethan;
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
  final int? sonamdangky;
  @override
  final String? tenapp;
  @override
  final String? tenmien;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'L1_data(dichvuIds: $dichvuIds, files: $files, lichsu_thanhtoan: $lichsu_thanhtoan, id: $id, sohopdong: $sohopdong, namhopdong: $namhopdong, ngaykyhd: $ngaykyhd, loaihopdong: $loaihopdong, mahopdongcu: $mahopdongcu, mahopdong: $mahopdong, nhanvien: $nhanvien, ghichu: $ghichu, khachhangId: $khachhangId, tenhopdong: $tenhopdong, l2_lichsu_khoitao: $l2_lichsu_khoitao, tongtien: $tongtien, lichsu_capnhat: $lichsu_capnhat, chucnang: $chucnang, dungluong: $dungluong, mota: $mota, ngaybangiao: $ngaybangiao, ngaydangky: $ngaydangky, ngayhethan: $ngayhethan, ngaykichhoat: $ngaykichhoat, ngayupstore: $ngayupstore, sonamdangky: $sonamdangky, tenapp: $tenapp, tenmien: $tenmien)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'L1_data'))
      ..add(DiagnosticsProperty('dichvuIds', dichvuIds))
      ..add(DiagnosticsProperty('files', files))
      ..add(DiagnosticsProperty('lichsu_thanhtoan', lichsu_thanhtoan))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('sohopdong', sohopdong))
      ..add(DiagnosticsProperty('namhopdong', namhopdong))
      ..add(DiagnosticsProperty('ngaykyhd', ngaykyhd))
      ..add(DiagnosticsProperty('loaihopdong', loaihopdong))
      ..add(DiagnosticsProperty('mahopdongcu', mahopdongcu))
      ..add(DiagnosticsProperty('mahopdong', mahopdong))
      ..add(DiagnosticsProperty('nhanvien', nhanvien))
      ..add(DiagnosticsProperty('ghichu', ghichu))
      ..add(DiagnosticsProperty('khachhangId', khachhangId))
      ..add(DiagnosticsProperty('tenhopdong', tenhopdong))
      ..add(DiagnosticsProperty('l2_lichsu_khoitao', l2_lichsu_khoitao))
      ..add(DiagnosticsProperty('tongtien', tongtien))
      ..add(DiagnosticsProperty('lichsu_capnhat', lichsu_capnhat))
      ..add(DiagnosticsProperty('chucnang', chucnang))
      ..add(DiagnosticsProperty('dungluong', dungluong))
      ..add(DiagnosticsProperty('mota', mota))
      ..add(DiagnosticsProperty('ngaybangiao', ngaybangiao))
      ..add(DiagnosticsProperty('ngaydangky', ngaydangky))
      ..add(DiagnosticsProperty('ngayhethan', ngayhethan))
      ..add(DiagnosticsProperty('ngaykichhoat', ngaykichhoat))
      ..add(DiagnosticsProperty('ngayupstore', ngayupstore))
      ..add(DiagnosticsProperty('sonamdangky', sonamdangky))
      ..add(DiagnosticsProperty('tenapp', tenapp))
      ..add(DiagnosticsProperty('tenmien', tenmien));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_L1_data &&
            const DeepCollectionEquality()
                .equals(other._dichvuIds, _dichvuIds) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            const DeepCollectionEquality()
                .equals(other._lichsu_thanhtoan, _lichsu_thanhtoan) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sohopdong, sohopdong) ||
                other.sohopdong == sohopdong) &&
            (identical(other.namhopdong, namhopdong) ||
                other.namhopdong == namhopdong) &&
            (identical(other.ngaykyhd, ngaykyhd) ||
                other.ngaykyhd == ngaykyhd) &&
            (identical(other.loaihopdong, loaihopdong) ||
                other.loaihopdong == loaihopdong) &&
            (identical(other.mahopdongcu, mahopdongcu) ||
                other.mahopdongcu == mahopdongcu) &&
            (identical(other.mahopdong, mahopdong) ||
                other.mahopdong == mahopdong) &&
            const DeepCollectionEquality().equals(other._nhanvien, _nhanvien) &&
            (identical(other.ghichu, ghichu) || other.ghichu == ghichu) &&
            (identical(other.khachhangId, khachhangId) ||
                other.khachhangId == khachhangId) &&
            (identical(other.tenhopdong, tenhopdong) ||
                other.tenhopdong == tenhopdong) &&
            (identical(other.l2_lichsu_khoitao, l2_lichsu_khoitao) ||
                other.l2_lichsu_khoitao == l2_lichsu_khoitao) &&
            (identical(other.tongtien, tongtien) ||
                other.tongtien == tongtien) &&
            const DeepCollectionEquality()
                .equals(other._lichsu_capnhat, _lichsu_capnhat) &&
            (identical(other.chucnang, chucnang) ||
                other.chucnang == chucnang) &&
            (identical(other.dungluong, dungluong) ||
                other.dungluong == dungluong) &&
            (identical(other.mota, mota) || other.mota == mota) &&
            (identical(other.ngaybangiao, ngaybangiao) ||
                other.ngaybangiao == ngaybangiao) &&
            (identical(other.ngaydangky, ngaydangky) ||
                other.ngaydangky == ngaydangky) &&
            (identical(other.ngayhethan, ngayhethan) ||
                other.ngayhethan == ngayhethan) &&
            (identical(other.ngaykichhoat, ngaykichhoat) ||
                other.ngaykichhoat == ngaykichhoat) &&
            const DeepCollectionEquality()
                .equals(other._ngayupstore, _ngayupstore) &&
            (identical(other.sonamdangky, sonamdangky) ||
                other.sonamdangky == sonamdangky) &&
            (identical(other.tenapp, tenapp) || other.tenapp == tenapp) &&
            (identical(other.tenmien, tenmien) || other.tenmien == tenmien));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(_dichvuIds),
        const DeepCollectionEquality().hash(_files),
        const DeepCollectionEquality().hash(_lichsu_thanhtoan),
        id,
        sohopdong,
        namhopdong,
        ngaykyhd,
        loaihopdong,
        mahopdongcu,
        mahopdong,
        const DeepCollectionEquality().hash(_nhanvien),
        ghichu,
        khachhangId,
        tenhopdong,
        l2_lichsu_khoitao,
        tongtien,
        const DeepCollectionEquality().hash(_lichsu_capnhat),
        chucnang,
        dungluong,
        mota,
        ngaybangiao,
        ngaydangky,
        ngayhethan,
        ngaykichhoat,
        const DeepCollectionEquality().hash(_ngayupstore),
        sonamdangky,
        tenapp,
        tenmien
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
      {final List<dynamic>? dichvuIds,
      final List<dynamic>? files,
      final List<dynamic>? lichsu_thanhtoan,
      @JsonKey(name: '_id') final String? id,
      final String? sohopdong,
      final String? namhopdong,
      final String? ngaykyhd,
      final String? loaihopdong,
      final String? mahopdongcu,
      final String? mahopdong,
      final List<dynamic>? nhanvien,
      final String? ghichu,
      final String? khachhangId,
      final String? tenhopdong,
      @JsonKey(name: 'lichsu_khoitao')
      final L2_lichsu_khoitao? l2_lichsu_khoitao,
      final int? tongtien,
      final List<dynamic>? lichsu_capnhat,
      final String? chucnang,
      final int? dungluong,
      final String? mota,
      final String? ngaybangiao,
      final String? ngaydangky,
      final String? ngayhethan,
      final String? ngaykichhoat,
      final List<dynamic>? ngayupstore,
      final int? sonamdangky,
      final String? tenapp,
      final String? tenmien}) = _$_L1_data;

  factory _L1_data.fromJson(Map<String, dynamic> json) = _$_L1_data.fromJson;

  @override
  List<dynamic>? get dichvuIds;
  @override
  List<dynamic>? get files;
  @override
  List<dynamic>? get lichsu_thanhtoan;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get sohopdong;
  @override
  String? get namhopdong;
  @override
  String? get ngaykyhd;
  @override
  String? get loaihopdong;
  @override
  String? get mahopdongcu;
  @override
  String? get mahopdong;
  @override
  List<dynamic>? get nhanvien;
  @override
  String? get ghichu;
  @override
  String? get khachhangId;
  @override
  String? get tenhopdong;
  @override
  @JsonKey(name: 'lichsu_khoitao')
  L2_lichsu_khoitao? get l2_lichsu_khoitao;
  @override
  int? get tongtien;
  @override
  List<dynamic>? get lichsu_capnhat;
  @override
  String? get chucnang;
  @override
  int? get dungluong;
  @override
  String? get mota;
  @override
  String? get ngaybangiao;
  @override
  String? get ngaydangky;
  @override
  String? get ngayhethan;
  @override
  String? get ngaykichhoat;
  @override
  List<dynamic>? get ngayupstore;
  @override
  int? get sonamdangky;
  @override
  String? get tenapp;
  @override
  String? get tenmien;
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
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  String? get manhanvien => throw _privateConstructorUsedError;
  String? get hoten => throw _privateConstructorUsedError;
  @JsonKey(name: 'phongbanId')
  L3_phongbanId? get l3_phongbanId => throw _privateConstructorUsedError;

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
      {@JsonKey(name: '_id') String? id,
      String? parentId,
      String? manhanvien,
      String? hoten,
      @JsonKey(name: 'phongbanId') L3_phongbanId? l3_phongbanId});

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
    Object? id = freezed,
    Object? parentId = freezed,
    Object? manhanvien = freezed,
    Object? hoten = freezed,
    Object? l3_phongbanId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      manhanvien: freezed == manhanvien
          ? _value.manhanvien
          : manhanvien // ignore: cast_nullable_to_non_nullable
              as String?,
      hoten: freezed == hoten
          ? _value.hoten
          : hoten // ignore: cast_nullable_to_non_nullable
              as String?,
      l3_phongbanId: freezed == l3_phongbanId
          ? _value.l3_phongbanId
          : l3_phongbanId // ignore: cast_nullable_to_non_nullable
              as L3_phongbanId?,
    ) as $Val);
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
      {@JsonKey(name: '_id') String? id,
      String? parentId,
      String? manhanvien,
      String? hoten,
      @JsonKey(name: 'phongbanId') L3_phongbanId? l3_phongbanId});

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
    Object? id = freezed,
    Object? parentId = freezed,
    Object? manhanvien = freezed,
    Object? hoten = freezed,
    Object? l3_phongbanId = freezed,
  }) {
    return _then(_$_L2_lichsu_khoitao(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      manhanvien: freezed == manhanvien
          ? _value.manhanvien
          : manhanvien // ignore: cast_nullable_to_non_nullable
              as String?,
      hoten: freezed == hoten
          ? _value.hoten
          : hoten // ignore: cast_nullable_to_non_nullable
              as String?,
      l3_phongbanId: freezed == l3_phongbanId
          ? _value.l3_phongbanId
          : l3_phongbanId // ignore: cast_nullable_to_non_nullable
              as L3_phongbanId?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_L2_lichsu_khoitao
    with DiagnosticableTreeMixin
    implements _L2_lichsu_khoitao {
  const _$_L2_lichsu_khoitao(
      {@JsonKey(name: '_id') this.id,
      this.parentId,
      this.manhanvien,
      this.hoten,
      @JsonKey(name: 'phongbanId') this.l3_phongbanId});

  factory _$_L2_lichsu_khoitao.fromJson(Map<String, dynamic> json) =>
      _$$_L2_lichsu_khoitaoFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? parentId;
  @override
  final String? manhanvien;
  @override
  final String? hoten;
  @override
  @JsonKey(name: 'phongbanId')
  final L3_phongbanId? l3_phongbanId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'L2_lichsu_khoitao(id: $id, parentId: $parentId, manhanvien: $manhanvien, hoten: $hoten, l3_phongbanId: $l3_phongbanId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'L2_lichsu_khoitao'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('parentId', parentId))
      ..add(DiagnosticsProperty('manhanvien', manhanvien))
      ..add(DiagnosticsProperty('hoten', hoten))
      ..add(DiagnosticsProperty('l3_phongbanId', l3_phongbanId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_L2_lichsu_khoitao &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.manhanvien, manhanvien) ||
                other.manhanvien == manhanvien) &&
            (identical(other.hoten, hoten) || other.hoten == hoten) &&
            (identical(other.l3_phongbanId, l3_phongbanId) ||
                other.l3_phongbanId == l3_phongbanId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, parentId, manhanvien, hoten, l3_phongbanId);

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
          {@JsonKey(name: '_id') final String? id,
          final String? parentId,
          final String? manhanvien,
          final String? hoten,
          @JsonKey(name: 'phongbanId') final L3_phongbanId? l3_phongbanId}) =
      _$_L2_lichsu_khoitao;

  factory _L2_lichsu_khoitao.fromJson(Map<String, dynamic> json) =
      _$_L2_lichsu_khoitao.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get parentId;
  @override
  String? get manhanvien;
  @override
  String? get hoten;
  @override
  @JsonKey(name: 'phongbanId')
  L3_phongbanId? get l3_phongbanId;
  @override
  @JsonKey(ignore: true)
  _$$_L2_lichsu_khoitaoCopyWith<_$_L2_lichsu_khoitao> get copyWith =>
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
