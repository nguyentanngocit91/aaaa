class DanhSachBlacklistModel {
  DanhSachBlacklistModel({
    this.id,
    this.sohopdong,
    this.ghichu,
    this.info,
    this.trangthai,
    this.lichsuKhoitao,
    this.lichsuCapnhat,
  });

  DanhSachBlacklistModel.fromJson(dynamic json) {
    print(json['lichsu_capnhat']);
    id = json['_id'];
    sohopdong = json['sohopdong'];
    ghichu = json['ghichu'];
    info = json['info'];
    trangthai = json['trangthai'];
    lichsuKhoitao = json['lichsu_khoitao'] != null
        ? LichsuKhoitao.fromJson(json['lichsu_khoitao'])
        : null;
    lichsuCapnhat = (json['lichsu_capnhat'] as List).isNotEmpty
        ? LichsuCapnhat.fromJson(json['lichsu_capnhat'])
        : null;
  }

  String? id;
  String? sohopdong;
  String? ghichu;
  dynamic info;
  num? trangthai;
  LichsuKhoitao? lichsuKhoitao;
  LichsuCapnhat? lichsuCapnhat;

  DanhSachBlacklistModel copyWith({
    String? id,
    String? sohopdong,
    String? ghichu,
    dynamic info,
    num? trangthai,
    LichsuKhoitao? lichsuKhoitao,
    LichsuCapnhat? lichsuCapnhat,
  }) =>
      DanhSachBlacklistModel(
        id: id ?? this.id,
        sohopdong: sohopdong ?? this.sohopdong,
        ghichu: ghichu ?? this.ghichu,
        info: info ?? this.info,
        trangthai: trangthai ?? this.trangthai,
        lichsuKhoitao: lichsuKhoitao ?? this.lichsuKhoitao,
        lichsuCapnhat: lichsuCapnhat ?? this.lichsuCapnhat,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['sohopdong'] = sohopdong;
    map['ghichu'] = ghichu;
    map['info'] = info;
    map['trangthai'] = trangthai;
    if (lichsuKhoitao != null) {
      map['lichsu_khoitao'] = lichsuKhoitao?.toJson();
    }
    if (lichsuCapnhat != null) {
      map['lichsu_capnhat'] = lichsuCapnhat?.toJson();
    }
    return map;
  }
}

class LichsuCapnhat {
  LichsuCapnhat({
    this.id,
    this.manhanvien,
    this.hoten,
    this.phongbanId,
    this.ngaykhoitao,
  });

  LichsuCapnhat.fromJson(dynamic json) {
    id = json['_id'];
    manhanvien = json['manhanvien'];
    hoten = json['hoten'];
    phongbanId = json['phongbanId'];
    ngaykhoitao = json['ngaykhoitao'];
  }

  String? id;
  String? manhanvien;
  String? hoten;
  String? phongbanId;
  String? ngaykhoitao;

  LichsuCapnhat copyWith({
    String? id,
    String? manhanvien,
    String? hoten,
    String? phongbanId,
    String? ngaykhoitao,
  }) =>
      LichsuCapnhat(
        id: id ?? this.id,
        manhanvien: manhanvien ?? this.manhanvien,
        hoten: hoten ?? this.hoten,
        phongbanId: phongbanId ?? this.phongbanId,
        ngaykhoitao: ngaykhoitao ?? this.ngaykhoitao,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['manhanvien'] = manhanvien;
    map['hoten'] = hoten;
    map['phongbanId'] = phongbanId;
    map['ngaykhoitao'] = ngaykhoitao;
    return map;
  }
}

class LichsuKhoitao {
  LichsuKhoitao({
    this.id,
    this.manhanvien,
    this.hoten,
    this.phongbanId,
    this.ngaykhoitao,
  });

  LichsuKhoitao.fromJson(dynamic json) {
    id = json['_id'];
    manhanvien = json['manhanvien'];
    hoten = json['hoten'];
    phongbanId = json['phongbanId'];
    ngaykhoitao = json['ngaykhoitao'];
  }

  String? id;
  String? manhanvien;
  String? hoten;
  String? phongbanId;
  String? ngaykhoitao;

  LichsuKhoitao copyWith({
    String? id,
    String? manhanvien,
    String? hoten,
    String? phongbanId,
    String? ngaykhoitao,
  }) =>
      LichsuKhoitao(
        id: id ?? this.id,
        manhanvien: manhanvien ?? this.manhanvien,
        hoten: hoten ?? this.hoten,
        phongbanId: phongbanId ?? this.phongbanId,
        ngaykhoitao: ngaykhoitao ?? this.ngaykhoitao,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['manhanvien'] = manhanvien;
    map['hoten'] = hoten;
    map['phongbanId'] = phongbanId;
    map['ngaykhoitao'] = ngaykhoitao;
    return map;
  }
}
