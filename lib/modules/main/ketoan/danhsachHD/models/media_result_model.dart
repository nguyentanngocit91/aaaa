class MediaResultModel {
  LichsuKhoitao? lichsuKhoitao;
  String? id;
  String? folderId;
  String? sohopdong;
  String? khachhangId;
  String? loaifile;
  String? loaimedia;
  String? ghichu;
  String? originalname;
  String? filename;
  String? path;
  String? destination;
  int? size;
  String? folder;
  String? mimetype;
  String? ext;
  List<LichsuCapnhat>? lichsuCapnhat;
  String? createdAt;
  String? updatedAt;

  MediaResultModel({
        this.lichsuKhoitao,
        this.id,
        this.folderId,
        this.sohopdong,
        this.khachhangId,
        this.loaifile,
        this.loaimedia,
        this.ghichu,
        this.originalname,
        this.filename,
        this.path,
        this.destination,
        this.size,
        this.folder,
        this.mimetype,
        this.ext,
        this.lichsuCapnhat,
        this.createdAt,
        this.updatedAt
      });

  MediaResultModel.fromJson(Map<String, dynamic> json) {
    lichsuKhoitao = json['lichsu_khoitao'] != null
        ? LichsuKhoitao.fromJson(json['lichsu_khoitao'])
        : null;
    id = json['_id'];
    folderId = json['folderId'];
    sohopdong = json['sohopdong'];
    khachhangId = json['khachhangId'];
    loaifile = json['loaifile'];
    loaimedia = json['loaimedia'];
    ghichu = json['ghichu'];
    originalname = json['originalname'];
    filename = json['filename'];
    path = json['path'];
    destination = json['destination'];
    size = json['size'];
    folder = json['folder'];
    mimetype = json['mimetype'];
    ext = json['ext'];

    if (json['lichsu_capnhat'] != null) {
      lichsuCapnhat = <LichsuCapnhat>[];
      json['lichsu_capnhat'].forEach((v) {
        lichsuCapnhat!.add(LichsuCapnhat.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lichsuKhoitao != null) {
      data['lichsu_khoitao'] = lichsuKhoitao!.toJson();
    }
    data['_id'] = this.id;
    data['folderId'] = this.folderId;
    data['sohopdong'] = this.sohopdong;
    data['khachhangId'] = this.khachhangId;
    data['loaifile'] = this.loaifile;
    data['loaimedia'] = this.loaimedia;
    data['ghichu'] = this.ghichu;
    data['originalname'] = this.originalname;
    data['filename'] = this.filename;
    data['path'] = this.path;
    data['destination'] = this.destination;
    data['size'] = this.size;
    data['folder'] = this.folder;
    data['mimetype'] = this.mimetype;
    data['ext'] = this.ext;
    if (lichsuCapnhat != null) {
      data['lichsu_capnhat'] = lichsuCapnhat!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }


}

class LichsuKhoitao {
  ParentId? parentId;
  PhongbanId? phongbanId;
  String? id;
  String? manhanvien;
  String? hoten;

  LichsuKhoitao(
      {this.parentId, this.phongbanId, this.id, this.manhanvien, this.hoten});

  LichsuKhoitao.fromJson(Map<String, dynamic> json) {
    parentId = json['parentId'] != null
        ? new ParentId.fromJson(json['parentId'])
        : null;
    phongbanId = json['phongbanId'] != null
        ? new PhongbanId.fromJson(json['phongbanId'])
        : null;
    id = json['_id'];
    manhanvien = json['manhanvien'];
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


    data['_id'] = this.id;
    data['manhanvien'] = this.manhanvien;
    data['hoten'] = this.hoten;
    return data;
  }
}

class ParentId {
  String? id;
  String? manhanvien;
  String? hoten;

  ParentId({this.id, this.manhanvien, this.hoten});

  ParentId.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    manhanvien = json['manhanvien'];
    hoten = json['hoten'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.id;
    data['manhanvien'] = this.manhanvien;
    data['hoten'] = this.hoten;
    return data;
  }
}

class PhongbanId {
  String? id;
  String? maphongban;
  String? manhanh;
  String? tenphongban;

  PhongbanId({this.id, this.maphongban, this.manhanh, this.tenphongban});

  PhongbanId.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    maphongban = json['maphongban'];
    manhanh = json['manhanh'];
    tenphongban = json['tenphongban'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.id;
    data['maphongban'] = this.maphongban;
    data['manhanh'] = this.manhanh;
    data['tenphongban'] = this.tenphongban;
    return data;
  }
}


class LichsuCapnhat {
  String? id;
  String? manhanvien;
  String? hoten;

  LichsuCapnhat({this.id, this.manhanvien, this.hoten});

  LichsuCapnhat.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    manhanvien = json['manhanvien'];
    hoten = json['hoten'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.id;
    data['manhanvien'] = this.manhanvien;
    data['hoten'] = this.hoten;
    return data;
  }
}