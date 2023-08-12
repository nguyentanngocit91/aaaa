class KhachHangModel {
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
  String? ghichu;

  KhachHangModel(
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
        this.ghichu,
       });

  KhachHangModel.fromJson(Map<String, dynamic> json) {
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
    ghichu = json['ghichu'];

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
    data['ghichu'] = ghichu;
    return data;
  }
}