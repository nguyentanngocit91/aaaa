class ItemPhieuthuResultModel {
  String? sId;
  String? maphieuthu;
  KhachhangId? khachhangId;
  List<Nhanvien>? nhanvien;
  List<Hopdong>? hopdong;
  List<String>? files;
  double? tongtien;
  double? phiweb;
  double? phinangcapweb;
  double? phihosting;
  double? phinangcaphosting;
  double? phitenmien;
  double? phiapp;
  double? phinangcapapp;
  double? vat;
  String? ngaytao;
  String? ngaynopcty;
  String? httt;
  String? ghichu;
  String? loaiphieuthu;
  bool? isPending;

  ItemPhieuthuResultModel(
      {
        this.sId,
        this.maphieuthu,
        this.khachhangId,
        this.nhanvien,
        this.hopdong,
        this.files,
        this.tongtien,
        this.phiweb,
        this.phinangcapweb,
        this.phihosting,
        this.phinangcaphosting,
        this.phitenmien,
        this.phiapp,
        this.phinangcapapp,
        this.vat,
        this.ngaytao,
        this.ngaynopcty,
        this.httt,
        this.ghichu,
        this.loaiphieuthu,
        this.isPending,
      });

  ItemPhieuthuResultModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    maphieuthu = json['maphieuthu'];

   // phiweb = json['phiweb'].toDouble();
    phiweb = (json['phiweb']!=null)?json['phiweb'].toDouble():0;
    phinangcapweb = (json['phinangcapweb']!=null)?json['phinangcapweb'].toDouble():0;
    phihosting = (json['phihosting']!=null)?json['phihosting'].toDouble():0;
    phinangcaphosting = (json['phinangcaphosting']!=null)?json['phinangcaphosting'].toDouble():0;
    phitenmien = (json['phitenmien']!=null)?json['phitenmien'].toDouble():0;
    phiapp = (json['phiapp']!=null)?json['phiapp'].toDouble():0;
    phinangcapapp = (json['phinangcapapp']!=null)?json['phinangcapapp'].toDouble():0;
    vat = (json['vat']!=null)?json['vat'].toDouble():0;

    /*phihosting = json['phihosting'].toDouble();
    phinangcaphosting = json['phinangcaphosting'].toDouble();
    phitenmien = json['phitenmien'].toDouble();
    phiapp = json['phiapp'].toDouble();
    phinangcapapp = json['phinangcapapp'].toDouble();
    vat = json['vat'];
    */

    loaiphieuthu = json['loaiphieuthu'];
    isPending = json['is_pending'];

    if (json['hopdong'] != null) {
      hopdong = <Hopdong>[];
      json['hopdong'].forEach((v) {
        hopdong!.add(Hopdong.fromJson(v));
      });
    }
    khachhangId = json['khachhangId'] != null
        ? KhachhangId.fromJson(json['khachhangId'])
        : null;
    if (json['nhanvien'] != null) {
      nhanvien = <Nhanvien>[];
      json['nhanvien'].forEach((v) {
        nhanvien!.add(Nhanvien.fromJson(v));
      });
    }
    files = json['files'].cast<String>();
    tongtien = json['tongtien'];
    ngaytao = json['ngaytao'];
    ngaynopcty = json['ngaynopcty'];
    httt = json['httt'];
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
    data['vat'] = vat;

    data['loaiphieuthu'] = loaiphieuthu;
    data['is_pending'] = isPending;

    data['_id'] = sId;
    data['maphieuthu'] = maphieuthu;
    if (hopdong != null) {
      data['hopdong'] = hopdong!.map((v) => v.toJson()).toList();
    }
    if (khachhangId != null) {
      data['khachhangId'] = khachhangId!.toJson();
    }
    if (nhanvien != null) {
      data['nhanvien'] = nhanvien!.map((v) => v.toJson()).toList();
    }
    data['files'] = files;
    data['tongtien'] = tongtien;
    data['ngaytao'] = ngaytao;
    data['ngaynopcty'] = ngaynopcty;
    data['httt'] = httt;
    data['ghichu'] = ghichu;

    return data;
  }
}

class Hopdong {
  String? sId;
  String? mahopdong;
  String? tenhopdong;
  int? tongtien;

  Hopdong({this.sId, this.mahopdong, this.tenhopdong, this.tongtien});

  Hopdong.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mahopdong = json['mahopdong'];
    tenhopdong = json['tenhopdong'];
    tongtien = json['tongtien'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['mahopdong'] = mahopdong;
    data['tenhopdong'] = tenhopdong;
    data['tongtien'] = tongtien;
    return data;
  }
}

class KhachhangId {
  String? sId;
  String? makhachhang;

  KhachhangId({this.sId, this.makhachhang});

  KhachhangId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    makhachhang = json['makhachhang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['makhachhang'] = makhachhang;
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
      {this.phongbanId, this.manhanvien, this.parentId, this.sId, this.hoten});

  Nhanvien.fromJson(Map<String, dynamic> json) {
    phongbanId = json['phongbanId'] != null
        ? PhongbanId.fromJson(json['phongbanId'])
        : null;

    parentId = json['parentId'] != null
        ? ParentId.fromJson(json['parentId'])
        : null;

    manhanvien = json['manhanvien'];
    sId = json['_id'];
    hoten = json['hoten'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (phongbanId != null) {
      data['phongbanId'] = phongbanId!.toJson();
    }
    if (parentId != null) {
      data['parentId'] = parentId!.toJson();
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

  ParentId({this.sId, this.manhanvien, this.hoten});

  ParentId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    manhanvien = json['manhanvien'];
    hoten = json['hoten'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['manhanvien'] = manhanvien;
    data['hoten'] = hoten;
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