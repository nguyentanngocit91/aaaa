class BanGiaoModel {
  String? sId;
  String? sohopdong;
  String? sohopdongcu;
  String? namhopdong;
  String? mahopdong;
  String? loaihopdong;
  String? ngaykyhd;
  String? khachhangId;
  List<Nhanvien>? nhanvien;
  String? ghichu;
  String? tenhopdong;
  double? tongtien;
  String? tenhosting;
  double? dungluong;
  int? sonamdangky;
  String? ngaydangky;
  String? ngayhethan;
  String? tenapp;
  String? tenmien;
  List<TenMien>? danhsachtenmien;
  String? chucnang;
  String? mota;
  String? trangthaiHosting;
  String? ngaybangiao;
  String? ngaykichhoat;
  List<Phieuthus>? phieuthus;

  BanGiaoModel(
      {this.sId,
        this.sohopdong,
        this.sohopdongcu,
        this.namhopdong,
        this.mahopdong,
        this.loaihopdong,
        this.ngaykyhd,
        this.khachhangId,
        this.nhanvien,
        this.ghichu,
        this.tenhopdong,
        this.tongtien,
        this.tenhosting,
        this.dungluong,
        this.sonamdangky,
        this.ngaydangky,
        this.ngayhethan,
        this.tenapp,
        this.tenmien,
        this.danhsachtenmien,
        this.chucnang,
        this.mota,
        this.trangthaiHosting,
        this.ngaybangiao,
        this.ngaykichhoat,
        this.phieuthus});

  BanGiaoModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sohopdong = json['sohopdong'];
    sohopdongcu = json['sohopdongcu'];
    namhopdong = json['namhopdong'];
    mahopdong = json['mahopdong'];
    loaihopdong = json['loaihopdong'];
    ngaykyhd = json['ngaykyhd'];
    khachhangId = json['khachhangId'];
    if (json['nhanvien'] != null) {
      nhanvien = <Nhanvien>[];
      json['nhanvien'].forEach((v) {
        nhanvien!.add(Nhanvien.fromJson(v));
      });
    }
    ghichu = json['ghichu'];
    tenhopdong = json['tenhopdong'];
    tongtien = json['tongtien'].toDouble();
    tenhosting = json['tenhosting'];
    dungluong = json['dungluong'].toDouble();
    sonamdangky = json['sonamdangky'];
    ngaydangky = json['ngaydangky'];
    ngayhethan = json['ngayhethan'];
    tenapp = json['tenapp'];
    tenmien = json['tenmien'];
    if (json['danhsachtenmien'] != null) {
      danhsachtenmien = <TenMien>[];
      json['danhsachtenmien'].forEach((v) { danhsachtenmien!.add(TenMien.fromJson(v)); });
    }
    chucnang = json['chucnang'];
    mota = json['mota'];
    trangthaiHosting = json['trangthai_hosting'];
    ngaybangiao = json['ngaybangiao'];
    ngaykichhoat = json['ngaykichhoat'];
    if (json['phieuthus'] != null) {
      phieuthus = <Phieuthus>[];
      json['phieuthus'].forEach((v) {
        phieuthus!.add(Phieuthus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['sohopdong'] = sohopdong;
    data['sohopdongcu'] = sohopdongcu;
    data['namhopdong'] = namhopdong;
    data['mahopdong'] = mahopdong;
    data['loaihopdong'] = loaihopdong;
    data['ngaykyhd'] = ngaykyhd;
    data['khachhangId'] = khachhangId;
    if (nhanvien != null) {
      data['nhanvien'] = nhanvien!.map((v) => v.toJson()).toList();
    }
    data['ghichu'] = ghichu;

    data['tenhopdong'] = tenhopdong;
    data['tongtien'] = tongtien;
    data['tenhosting'] = tenhosting;
    data['dungluong'] = dungluong;
    data['sonamdangky'] = sonamdangky;
    data['ngaydangky'] = ngaydangky;
    data['ngayhethan'] = ngayhethan;
    data['tenapp'] = tenapp;
    data['tenmien'] = tenmien;
    data['danhsachtenmien'] = danhsachtenmien;
    data['chucnang'] = chucnang;
    data['mota'] = mota;
    data['trangthai_hosting'] = trangthaiHosting;
    data['ngaybangiao'] = ngaybangiao;
    data['ngaykichhoat'] = ngaykichhoat;
    if (phieuthus != null) {
      data['phieuthus'] = phieuthus!.map((v) => v.toJson()).toList();
    }
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
  List<String>? danhsachtenmien;

  Info({this.danhsachtenmien});

  Info.fromJson(Map<String, dynamic> json) {
    danhsachtenmien = json['danhsachtenmien'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['danhsachtenmien'] = danhsachtenmien;
    return data;
  }
}

class Phieuthus {
  double? phiweb;
  double? phinangcapweb;
  double? phihosting;
  double? phinangcaphosting;
  double? phitenmien;
  double? phiapp;
  double? phinangcapapp;
  String? loaiphieuthu;
  String? sId;
  String? maphieuthu;
  String? khachhangId;
  List<Nhanvien>? nhanvien;
  double? tongtien;
  String? ngaytao;
  String? ngaynopcty;
  String? httt;
  bool? isPending;
  String? ghichu;

  Phieuthus(
      {this.phiweb,
        this.phinangcapweb,
        this.phihosting,
        this.phinangcaphosting,
        this.phitenmien,
        this.phiapp,
        this.phinangcapapp,
        this.loaiphieuthu,
        this.sId,
        this.maphieuthu,
        this.khachhangId,
        this.nhanvien,
        this.tongtien,
        this.ngaytao,
        this.ngaynopcty,
        this.httt,
        this.isPending,
        this.ghichu});

  Phieuthus.fromJson(Map<String, dynamic> json) {
    phiweb = json['phiweb'].toDouble();
    phinangcapweb = json['phinangcapweb'].toDouble();
    phihosting = json['phihosting'].toDouble();
    phinangcaphosting = json['phinangcaphosting'].toDouble();
    phitenmien = json['phitenmien'].toDouble();
    phiapp = json['phiapp'].toDouble();
    phinangcapapp = json['phinangcapapp'].toDouble();
    loaiphieuthu = json['loaiphieuthu'];
    sId = json['_id'];
    maphieuthu = json['maphieuthu'];
    khachhangId = json['khachhangId'];
    if (json['nhanvien'] != null) {
      nhanvien = <Nhanvien>[];
      json['nhanvien'].forEach((v) {
        nhanvien!.add(Nhanvien.fromJson(v));
      });
    }
    tongtien = json['tongtien'].toDouble();
    ngaytao = json['ngaytao'];
    ngaynopcty = json['ngaynopcty'];
    httt = json['httt'];
    isPending = json['is_pending'];
    ghichu = json['ghichu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phiweb'] = phiweb;
    data['phinangcapweb'] = phinangcapweb;
    data['phihosting'] = phihosting;
    data['phinangcaphosting'] = phinangcaphosting;
    data['phitenmien'] = phitenmien;
    data['phiapp'] = phiapp;
    data['phinangcapapp'] = phinangcapapp;
    data['loaiphieuthu'] = loaiphieuthu;
    data['_id'] = sId;
    data['maphieuthu'] = maphieuthu;
    data['khachhangId'] = khachhangId;
    if (nhanvien != null) {
      data['nhanvien'] = nhanvien!.map((v) => v.toJson()).toList();
    }
    data['tongtien'] = tongtien;
    data['ngaytao'] = ngaytao;
    data['ngaynopcty'] = ngaynopcty;
    data['httt'] = httt;
    data['is_pending'] = isPending;
    data['ghichu'] = ghichu;
    return data;
  }
}

class TenMien {
  String? tenmien;
  String? ngaykyhd;
  int? sonamdangky;
  String? ghichu;

  TenMien({this.tenmien, this.ngaykyhd, this.sonamdangky, this.ghichu});

  TenMien.fromJson(Map<String, dynamic> json) {
    tenmien = json['tenmien'];
    ngaykyhd = json['ngaykyhd'];
    sonamdangky = json['sonamdangky'];
    ghichu = json['ghichu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['tenmien'] = tenmien;
    data['ngaykyhd'] = ngaykyhd;
    data['sonamdangky'] = sonamdangky;
    data['ghichu'] = ghichu;
    return data;
  }
}