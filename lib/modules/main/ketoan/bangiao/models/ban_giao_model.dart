class BanGiaoModel {
  List<Null>? dichvuIds;
  List<Null>? lichsuThanhtoan;
  String? sId;
  String? sohopdong;
  String? namhopdong;
  String? ngaykyhd;
  String? loaihopdong;
  String? mahopdongcu;
  String? mahopdong;
  List<Nhanvien>? nhanvien;
  String? ghichu;
  KhachhangId? khachhangId;
  String? tenhopdong;
  Nhanvien? lichsuKhoitao;
  double? tongtien;
  List<Null>? lichsuCapnhat;

  BanGiaoModel(
      {this.dichvuIds,
        this.lichsuThanhtoan,
        this.sId,
        this.sohopdong,
        this.namhopdong,
        this.ngaykyhd,
        this.loaihopdong,
        this.mahopdongcu,
        this.mahopdong,
        this.nhanvien,
        this.ghichu,
        this.khachhangId,
        this.tenhopdong,
        this.lichsuKhoitao,
        this.tongtien,
        this.lichsuCapnhat});

  BanGiaoModel.fromJson(Map<String, dynamic> json) {


    sId = json['_id'];
    sohopdong = json['sohopdong'];
    namhopdong = json['namhopdong'];
    ngaykyhd = json['ngaykyhd'];
    loaihopdong = json['loaihopdong'];
    mahopdongcu = json['mahopdongcu'];
    mahopdong = json['mahopdong'];
    if (json['nhanvien'] != null) {
      nhanvien = <Nhanvien>[];
      json['nhanvien'].forEach((v) {
        nhanvien!.add(Nhanvien.fromJson(v));
      });
    }
    ghichu = json['ghichu'];
    khachhangId = json['khachhangId'] != null
        ? KhachhangId.fromJson(json['khachhangId'])
        : null;
    tenhopdong = json['tenhopdong'];
    lichsuKhoitao = json['lichsu_khoitao'] != null
        ? Nhanvien.fromJson(json['lichsu_khoitao'])
        : null;
    tongtien = double.parse(json['tongtien'].toString());

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};


    data['_id'] = sId;
    data['sohopdong'] = sohopdong;
    data['namhopdong'] = namhopdong;
    data['ngaykyhd'] = ngaykyhd;
    data['loaihopdong'] = loaihopdong;
    data['mahopdongcu'] = mahopdongcu;
    data['mahopdong'] = mahopdong;
    if (nhanvien != null) {
      data['nhanvien'] = nhanvien!.map((v) => v.toJson()).toList();
    }
    data['ghichu'] = ghichu;

    if (khachhangId != null) {
      data['khachhangId'] = khachhangId!.toJson();
    }
    data['tenhopdong'] = tenhopdong;
    if (lichsuKhoitao != null) {
      data['lichsu_khoitao'] = lichsuKhoitao!.toJson();
    }
    data['tongtien'] = tongtien;

    return data;
  }
}

class Nhanvien {
  ParentId? parentId;
  PhongbanId? phongbanId;
  String? manhanvien;
  String? sId;
  String? hoten;

  Nhanvien(
      {this.parentId, this.phongbanId, this.manhanvien, this.sId, this.hoten});

  Nhanvien.fromJson(Map<String, dynamic> json) {
    parentId = json['parentId'] != null
        ? ParentId.fromJson(json['parentId'])
        : null;
    phongbanId = json['phongbanId'] != null
        ? PhongbanId.fromJson(json['phongbanId'])
        : null;
    manhanvien = json['manhanvien'];
    sId = json['_id'];
    hoten = json['hoten'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (parentId != null) {
      data['parentId'] = parentId!.toJson();
    }
    if (phongbanId != null) {
      data['phongbanId'] = phongbanId!.toJson();
    }
    data['manhanvien'] = manhanvien;
    data['_id'] = sId;
    data['hoten'] = hoten;
    return data;
  }
}

class ParentId {
  String? sId;
  String? manhanvien;
  String? hoten;
  String? manhanh;

  ParentId({this.sId, this.manhanvien, this.hoten, this.manhanh});

  ParentId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    manhanvien = json['manhanvien'];
    hoten = json['hoten'];
    manhanh = json['manhanh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['manhanvien'] = manhanvien;
    data['hoten'] = hoten;
    data['manhanh'] = manhanh;
    return data;
  }
}

class PhongbanId {
  String? sId;
  String? maphongban;
  String? manhanh;
  String? tenphongban;

  PhongbanId({this.sId, this.maphongban, this.manhanh, this.tenphongban});

  PhongbanId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    maphongban = json['maphongban'];
    manhanh = json['manhanh'];
    tenphongban = json['tenphongban'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['maphongban'] = maphongban;
    data['manhanh'] = manhanh;
    data['tenphongban'] = tenphongban;
    return data;
  }
}

class Info {
  String? chucnang;
  String? dungluong;
  String? domain;

  Info({this.chucnang,this.dungluong, this.domain
  });

  Info.fromJson(Map<String, dynamic> json) {
    chucnang = json['chucnang'];
    dungluong = json['dungluong'];
    domain = json['domain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chucnang'] = chucnang;
    data['dungluong'] = dungluong;
    data['domain'] = domain;
    return data;
  }
}

class KhachhangId {
  String? sId;
  String? makhachhang;
  String? type;
  String? hoten;
  String? phone;
  String? email;
  String? congty;
  String? masothue;
  String? diachi;
  String? cccd;
  Info? info;

  KhachhangId(
      {
        this.sId,
        this.makhachhang,
        this.type,
        this.hoten,
        this.phone,
        this.email,
        this.congty,
        this.masothue,
        this.diachi,
        this.cccd,
        this.info});

  KhachhangId.fromJson(Map<String, dynamic> json) {

    sId = json['_id'];
    makhachhang = json['makhachhang'];
    type = json['type'];
    hoten = json['hoten'];
    phone = json['phone'];
    email = json['email'];
    congty = json['congty'];
    masothue = json['masothue'];
    diachi = json['diachi'];
    cccd = json['cccd'];
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['_id'] = sId;
    data['makhachhang'] = makhachhang;
    data['type'] = type;
    data['hoten'] = hoten;
    data['phone'] = phone;
    data['email'] = email;
    data['congty'] = congty;
    data['masothue'] = masothue;
    data['diachi'] = diachi;
    data['cccd'] = cccd;
    if (info != null) {
      data['info'] = info!.toJson();
    }
    return data;
  }
}
