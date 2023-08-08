class DomainModel {
  String? sId;
  String? sohopdong;
  KhachhangId? khachhangId;
  String? tenmien;
  int? sonamdangky;
  String? ngaykyhd;
  String? ngaykichhoat;
  String? ngayhethan;
  String? ghichu;
  LichsuKhoitao? lichsuKhoitao;

  DomainModel(
      {this.sId,
        this.sohopdong,
        this.khachhangId,
        this.tenmien,
        this.sonamdangky,
        this.ngaykyhd,
        this.ngaykichhoat,
        this.ngayhethan,
        this.ghichu,
        this.lichsuKhoitao,
        });

  DomainModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sohopdong = json['sohopdong'];
    khachhangId = json['khachhangId'] != null
        ? KhachhangId.fromJson(json['khachhangId'])
        : null;

    tenmien = json['tenmien'];
    sonamdangky = json['sonamdangky'];
    ngaykyhd = json['ngaykyhd'];
    ngaykichhoat = json['ngaykichhoat'];
    ngayhethan = json['ngayhethan'];
    ghichu = json['ghichu'];

    lichsuKhoitao = json['lichsu_khoitao'] != null
        ? LichsuKhoitao.fromJson(json['lichsu_khoitao'])
        : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['sohopdong'] = sohopdong;
    if (khachhangId != null) {
      data['khachhangId'] = khachhangId!.toJson();
    }

    data['tenmien'] = tenmien;
    data['sonamdangky'] = sonamdangky;
    data['ngaykyhd'] = ngaykyhd;
    data['ngaykichhoat'] = ngaykichhoat;
    data['ngayhethan'] = ngayhethan;
    data['ghichu'] = ghichu;

    if (lichsuKhoitao != null) {
      data['lichsu_khoitao'] = lichsuKhoitao!.toJson();
    }

    return data;
  }
}

class KhachhangId {
  String? sId;
  String? makhachhang;
  String? hoten;
  String? congty;
  String? masothue;
  String? cccd;
  String? phone;
  String? email;
  String? diachi;
  Info? info;
  String? ghichu;
  LichsuKhoitao? lichsuKhoitao;
  String? type;

  KhachhangId(
      {this.sId,
        this.makhachhang,
        this.hoten,
        this.congty,
        this.masothue,
        this.cccd,
        this.phone,
        this.email,
        this.diachi,
        this.info,
        this.ghichu,
        this.lichsuKhoitao,
        this.type});

  KhachhangId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    makhachhang = json['makhachhang'];
    hoten = json['hoten'];
    congty = json['congty'];
    masothue = json['masothue'];
    cccd = json['cccd'];
    phone = json['phone'];
    email = json['email'];
    diachi = json['diachi'];
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    ghichu = json['ghichu'];
    lichsuKhoitao = json['lichsu_khoitao'] != null
        ? LichsuKhoitao.fromJson(json['lichsu_khoitao'])
        : null;

    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['makhachhang'] = makhachhang;
    data['hoten'] = hoten;
    data['congty'] = congty;
    data['masothue'] = masothue;
    data['cccd'] = cccd;
    data['phone'] = phone;
    data['email'] = email;
    data['diachi'] = diachi;
    if (info != null) {
      data['info'] = info!.toJson();
    }
    data['ghichu'] = ghichu;
    if (lichsuKhoitao != null) {
      data['lichsu_khoitao'] = lichsuKhoitao!.toJson();
    }
    data['type'] = type;
    return data;
  }
}

class Info {
  String? dienthoaicoquan;

  Info({this.dienthoaicoquan});

  Info.fromJson(Map<String, dynamic> json) {
    dienthoaicoquan = json['dienthoaicoquan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dienthoaicoquan'] = dienthoaicoquan;
    return data;
  }
}

class LichsuKhoitao {
  String? sId;
  String? manhanvien;
  String? hoten;
  String? phongbanId;
  String? ngaykhoitao;

  LichsuKhoitao(
      {this.sId,
        this.manhanvien,
        this.hoten,
        this.phongbanId,
        this.ngaykhoitao});

  LichsuKhoitao.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    manhanvien = json['manhanvien'];
    hoten = json['hoten'];
    phongbanId = json['phongbanId'];
    ngaykhoitao = json['ngaykhoitao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['manhanvien'] = manhanvien;
    data['hoten'] = hoten;
    data['phongbanId'] = phongbanId;
    data['ngaykhoitao'] = ngaykhoitao;
    return data;
  }
}