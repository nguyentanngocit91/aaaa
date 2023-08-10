class SearchCustomerContractModel {
  String? sohopdongcu;
  String? trangthaiHosting;
  String? id;
  String? sohopdong;
  String? namhopdong;
  String? ngaykyhd;
  String? loaihopdong;
  String? mahopdongcu;
  String? mahopdong;
  String? ghichu;
  String? khachhangId;
  String? tenhopdong;
  int? tongtien;
  String? chucnang;
  int? dungluong;
  String? mota;
  String? ngaybangiao;
  String? ngaydangky;
  String? ngayhethan;
  String? ngaykichhoat;
  int? sonamdangky;
  String? tenapp;
  String? tenmien;

  SearchCustomerContractModel(
      {this.sohopdongcu,
        this.trangthaiHosting,
        this.id,
        this.sohopdong,
        this.namhopdong,
        this.ngaykyhd,
        this.loaihopdong,
        this.mahopdongcu,
        this.mahopdong,
        this.ghichu,
        this.khachhangId,
        this.tenhopdong,
        this.tongtien,
        this.chucnang,
        this.dungluong,
        this.mota,
        this.ngaybangiao,
        this.ngaydangky,
        this.ngayhethan,
        this.ngaykichhoat,
        this.sonamdangky,
        this.tenapp,
        this.tenmien

      });


    SearchCustomerContractModel.fromJson(Map<String, dynamic> json) {
    sohopdongcu = json['sohopdongcu'];
    trangthaiHosting = json['trangthai_hosting'];
    id = json['_id'];
    sohopdong = json['sohopdong'];
    namhopdong = json['namhopdong'];
    ngaykyhd = json['ngaykyhd'];
    loaihopdong = json['loaihopdong'];
    mahopdongcu = json['mahopdongcu'];
    mahopdong = json['mahopdong'];
    ghichu = json['ghichu'];
    khachhangId = json['khachhangId'];
    tenhopdong = json['tenhopdong'];
    tongtien = json['tongtien'];


    chucnang = json['chucnang'];
    dungluong = json['dungluong'];
    mota = json['mota'];
    ngaybangiao = json['ngaybangiao'];
    ngaydangky = json['ngaydangky'];
    ngayhethan = json['ngayhethan'];
    ngaykichhoat = json['ngaykichhoat'];

    sonamdangky = json['sonamdangky'];
    tenapp = json['tenapp'];
    tenmien = json['tenmien'];
  }


    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};

    data['sohopdongcu'] = this.sohopdongcu;
    data['trangthai_hosting'] = this.trangthaiHosting;
    data['_id'] = this.id;
    data['sohopdong'] = this.sohopdong;
    data['namhopdong'] = this.namhopdong;
    data['ngaykyhd'] = this.ngaykyhd;
    data['loaihopdong'] = this.loaihopdong;
    data['mahopdongcu'] = this.mahopdongcu;
    data['mahopdong'] = this.mahopdong;
    data['ghichu'] = this.ghichu;
    data['khachhangId'] = this.khachhangId;
    data['tenhopdong'] = this.tenhopdong;
    data['tongtien'] = this.tongtien;
    data['chucnang'] = this.chucnang;
    data['dungluong'] = this.dungluong;
    data['mota'] = this.mota;
    data['ngaybangiao'] = this.ngaybangiao;
    data['ngaydangky'] = this.ngaydangky;
    data['ngayhethan'] = this.ngayhethan;
    data['ngaykichhoat'] = this.ngaykichhoat;
    data['sonamdangky'] = this.sonamdangky;
    data['tenapp'] = this.tenapp;
    data['tenmien'] = this.tenmien;
    return data;
  }


}



class Nhanvien {
  PhongbanId? phongbanId;
  String? manhanvien;
  String? parentId;
  String? sId;
  String? hoten;

  Nhanvien(
      {this.phongbanId, this.manhanvien, this.parentId, this.sId, this.hoten});

  Nhanvien.fromJson(Map<String, dynamic> json) {
    phongbanId = json['phongbanId'] != null
        ? new PhongbanId.fromJson(json['phongbanId'])
        : null;
    manhanvien = json['manhanvien'];
    parentId = json['parentId'];
    sId = json['_id'];
    hoten = json['hoten'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.phongbanId != null) {
      data['phongbanId'] = this.phongbanId!.toJson();
    }
    data['manhanvien'] = this.manhanvien;
    data['parentId'] = this.parentId;
    data['_id'] = this.sId;
    data['hoten'] = this.hoten;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['maphongban'] = this.maphongban;
    data['manhanh'] = this.manhanh;
    data['tenphongban'] = this.tenphongban;
    return data;
  }
}


class Info {
  String? chucnang;
  String? dungluong;
  String? ngayhethan;
  List<String>? domain;

  Info({this.chucnang, this.dungluong, this.ngayhethan, this.domain});

  Info.fromJson(Map<String, dynamic> json) {
    chucnang = json['chucnang'];
    dungluong = json['dungluong'];
    ngayhethan = json['ngayhethan'];
    domain = json['domain'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chucnang'] = this.chucnang;
    data['dungluong'] = this.dungluong;
    data['ngayhethan'] = this.ngayhethan;
    data['domain'] = this.domain;
    return data;
  }
}


class LichsuCapnhat {
  String? sId;
  String? manhanvien;
  String? hoten;
  String? phongbanId;
  String? ngaycapnhat;

  LichsuCapnhat(
      {this.sId,
        this.manhanvien,
        this.hoten,
        this.phongbanId,
        this.ngaycapnhat});

  LichsuCapnhat.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    manhanvien = json['manhanvien'];
    hoten = json['hoten'];
    phongbanId = json['phongbanId'];
    ngaycapnhat = json['ngaycapnhat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['manhanvien'] = this.manhanvien;
    data['hoten'] = this.hoten;
    data['phongbanId'] = this.phongbanId;
    data['ngaycapnhat'] = this.ngaycapnhat;
    return data;
  }
}