class CustomerUpdateModel {
  String? id;
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
  String? ghichu;

  CustomerUpdateModel(
      {
        this.id,
        this.makhachhang,
        this.type,
        this.hoten,
        this.phone,
        this.email,
        this.congty,
        this.masothue,
        this.diachi,
        this.cccd,
        this.info,
        this.ghichu
      });
  CustomerUpdateModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    makhachhang = json['makhachhang'];
    type = json['type'];
    hoten = json['hoten'];
    phone = json['phone'];
    email = json['email'];
    congty = json['congty'];
    masothue = json['masothue'];
    diachi = json['diachi'];
    cccd = json['cccd'];
    info = json['info'] != null ?  Info.fromJson(json['info']) : null;
    ghichu = json['ghichu'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['_id'] = this.id;
    data['makhachhang'] = this.makhachhang;
    data['type'] = this.type;
    data['hoten'] = this.hoten;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['congty'] = this.congty;
    data['masothue'] = this.masothue;
    data['diachi'] = this.diachi;
    data['cccd'] = this.cccd;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    data['ghichu'] = this.ghichu;
    return data;
  }
}

class Info {
  String? fax;
  String? emailPhu;
  String? nguoidaidienmoi;
  String? dienthoaicoquan;

  Info({this.fax,this.emailPhu, this.nguoidaidienmoi, this.dienthoaicoquan});

  Info.fromJson(Map<String, dynamic> json) {
    fax = json['fax'];
    emailPhu = json['email_phu'];
    nguoidaidienmoi = json['nguoidaidienmoi'];
    dienthoaicoquan = json['dienthoaicoquan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fax'] = this.fax;
    data['email_phu'] = this.emailPhu;
    data['nguoidaidienmoi'] = this.nguoidaidienmoi;
    data['dienthoaicoquan'] = this.dienthoaicoquan;
    return data;
  }
}