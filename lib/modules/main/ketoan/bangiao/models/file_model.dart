class FileModel {
  String? sId;
  String? folderId;
  String? sohopdong;
  String? hopdongId;
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
  LichsuKhoitao? lichsuKhoitao;
  List<LichsuCapnhat>? lichsuCapnhat;
  String? createdAt;
  String? updatedAt;

  FileModel(
      {
        this.sId,
        this.folderId,
        this.sohopdong,
        this.hopdongId,
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
        this.lichsuKhoitao,
        this.lichsuCapnhat,
        this.createdAt,
        this.updatedAt});

  FileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    folderId = json['folderId'];
    sohopdong = json['sohopdong'];
    hopdongId = json['hopdongId'];
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
    lichsuKhoitao = json['lichsu_khoitao'] != null
        ? LichsuKhoitao.fromJson(json['lichsu_khoitao'])
        : null;
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
    data['_id'] = sId;
    data['folderId'] = folderId;
    data['sohopdong'] = sohopdong;
    data['hopdongId'] = hopdongId;
    data['loaifile'] = loaifile;
    data['loaimedia'] = loaimedia;
    data['ghichu'] = ghichu;
    data['originalname'] = originalname;
    data['filename'] = filename;
    data['path'] = path;
    data['destination'] = destination;
    data['size'] = size;
    data['folder'] = folder;
    data['mimetype'] = mimetype;
    data['ext'] = ext;
    if (lichsuKhoitao != null) {
      data['lichsu_khoitao'] = lichsuKhoitao!.toJson();
    }
    if (lichsuCapnhat != null) {
      data['lichsu_capnhat'] =
          lichsuCapnhat!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class LichsuKhoitao {
  String? sId;
  String? parentId;
  String? manhanvien;
  String? hoten;
  String? phongbanId;
  String? ngaykhoitao;

  LichsuKhoitao(
      {this.sId,
        this.parentId,
        this.manhanvien,
        this.hoten,
        this.phongbanId,
        this.ngaykhoitao});

  LichsuKhoitao.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    parentId = json['parentId'];
    manhanvien = json['manhanvien'];
    hoten = json['hoten'];
    phongbanId = json['phongbanId'];
    ngaykhoitao = json['ngaykhoitao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['parentId'] = parentId;
    data['manhanvien'] = manhanvien;
    data['hoten'] = hoten;
    data['phongbanId'] = phongbanId;
    data['ngaykhoitao'] = ngaykhoitao;
    return data;
  }
}

class LichsuCapnhat {
  String? sId;
  String? parentId;
  String? manhanvien;
  String? hoten;
  String? phongbanId;
  String? ngaycapnhat;

  LichsuCapnhat(
      {this.sId,
        this.parentId,
        this.manhanvien,
        this.hoten,
        this.phongbanId,
        this.ngaycapnhat});

  LichsuCapnhat.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    parentId = json['parentId'];
    manhanvien = json['manhanvien'];
    hoten = json['hoten'];
    phongbanId = json['phongbanId'];
    ngaycapnhat = json['ngaycapnhat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['parentId'] = parentId;
    data['manhanvien'] = manhanvien;
    data['hoten'] = hoten;
    data['phongbanId'] = phongbanId;
    data['ngaycapnhat'] = ngaycapnhat;
    return data;
  }
}