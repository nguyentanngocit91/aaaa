class DomainModel {
  String? sId;
  String? hopdongId;
  String? sohopdong;
  String? tenmien;
  int? sonamdangky;
  String? ngaydangky;
  String? ngaykichhoat;
  String? ngayhethan;
  String? ghichu;

  DomainModel(
      {
        this.sId,
        this.hopdongId,
        this.sohopdong,

        this.tenmien,
        this.sonamdangky,
        this.ngaydangky,
        this.ngaykichhoat,
        this.ngayhethan,
        this.ghichu});

  DomainModel.fromJson(Map<String, dynamic> json) {

    sId = json['_id'];
    hopdongId = json['hopdongId'];
    sohopdong = json['sohopdong'];

    tenmien = json['tenmien'];
    sonamdangky = json['sonamdangky'];
    ngaydangky = json['ngaydangky'];
    ngaykichhoat = json['ngaykichhoat'];
    ngayhethan = json['ngayhethan'];
    ghichu = json['ghichu'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['_id'] = sId;
    data['hopdongId'] = hopdongId;
    data['sohopdong'] = sohopdong;

    data['tenmien'] = tenmien;
    data['sonamdangky'] = sonamdangky;
    data['ngaydangky'] = ngaydangky;
    data['ngaykichhoat'] = ngaykichhoat;
    data['ngayhethan'] = ngayhethan;
    data['ghichu'] = ghichu;

    return data;
  }
}