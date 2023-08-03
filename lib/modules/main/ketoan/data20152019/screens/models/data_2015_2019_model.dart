class Data20152019Model {
  Data20152019Model({
      this.id, 
      this.ngaynop, 
      this.sophieuthu, 
      this.nguoithutien, 
      this.msnv, 
      this.phong, 
      this.khuvuc, 
      this.stt, 
      this.hienthi, 
      this.ngaytao, 
      this.ngaysua, 
      this.tenhopdong, 
      this.emaiKh, 
      this.dungluonghost, 
      this.tenmien, 
      this.chucnang, 
      this.mahost, 
      this.maweb, 
      this.ghichu, 
      this.tenNvkd, 
      this.tenKh, 
      this.tenCty, 
      this.diachiCty, 
      this.dienthoaiCq, 
      this.mst, 
      this.ngayKiweb, 
      this.ngayNopweb, 
      this.ngayNop, 
      this.ngayTra, 
      this.tienWeb, 
      this.tienNcweb, 
      this.tienHost, 
      this.tienNchost, 
      this.phiTenmien, 
      this.thanhtoanL1, 
      this.thanhtoanL2, 
      this.tongnhan, 
      this.conlai, 
      this.dienthoaiDd, 
      this.ctyMoi, 
      this.hostMoi, 
      this.cmnd, 
      this.ngayKihost, 
      this.ngayKitenmien,});

  Data20152019Model.fromJson(dynamic json) {
    id = json['id'];
    ngaynop = json['ngaynop'];
    sophieuthu = json['sophieuthu'];
    nguoithutien = json['nguoithutien'];
    msnv = json['msnv'];
    phong = json['phong'];
    khuvuc = json['khuvuc'];
    stt = json['stt'];
    hienthi = json['hienthi'];
    ngaytao = json['ngaytao'];
    ngaysua = json['ngaysua'];
    tenhopdong = json['tenhopdong'];
    emaiKh = json['emai_kh'];
    dungluonghost = json['dungluonghost'];
    tenmien = json['tenmien'];
    chucnang = json['chucnang'];
    mahost = json['mahost'];
    maweb = json['maweb'];
    ghichu = json['ghichu'];
    tenNvkd = json['ten_nvkd'];
    tenKh = json['ten_kh'];
    tenCty = json['ten_cty'];
    diachiCty = json['diachi_cty'];
    dienthoaiCq = json['dienthoai_cq'];
    mst = json['mst'];
    ngayKiweb = json['ngay_kiweb'];
    ngayNopweb = json['ngay_nopweb'];
    ngayNop = json['ngay_nop'];
    ngayTra = json['ngay_tra'];
    tienWeb = json['tien_web'];
    tienNcweb = json['tien_ncweb'];
    tienHost = json['tien_host'];
    tienNchost = json['tien_nchost'];
    phiTenmien = json['phi_tenmien'];
    thanhtoanL1 = json['thanhtoan_l1'];
    thanhtoanL2 = json['thanhtoan_l2'];
    tongnhan = json['tongnhan'];
    conlai = json['conlai'];
    dienthoaiDd = json['dienthoai_dd'];
    ctyMoi = json['cty_moi'];
    hostMoi = json['host_moi'];
    cmnd = json['cmnd'];
    ngayKihost = json['ngay_kihost'];
    ngayKitenmien = json['ngay_kitenmien'];
  }
  String? id;
  String? ngaynop;
  String? sophieuthu;
  String? nguoithutien;
  String? msnv;
  String? phong;
  String? khuvuc;
  String? stt;
  String? hienthi;
  String? ngaytao;
  String? ngaysua;
  String? tenhopdong;
  String? emaiKh;
  String? dungluonghost;
  String? tenmien;
  String? chucnang;
  String? mahost;
  String? maweb;
  String? ghichu;
  String? tenNvkd;
  String? tenKh;
  String? tenCty;
  String? diachiCty;
  String? dienthoaiCq;
  String? mst;
  String? ngayKiweb;
  String? ngayNopweb;
  String? ngayNop;
  String? ngayTra;
  String? tienWeb;
  String? tienNcweb;
  String? tienHost;
  String? tienNchost;
  String? phiTenmien;
  String? thanhtoanL1;
  String? thanhtoanL2;
  String? tongnhan;
  String? conlai;
  String? dienthoaiDd;
  String? ctyMoi;
  String? hostMoi;
  String? cmnd;
  String? ngayKihost;
  String? ngayKitenmien;
Data20152019Model copyWith({  String? id,
  String? ngaynop,
  String? sophieuthu,
  String? nguoithutien,
  String? msnv,
  String? phong,
  String? khuvuc,
  String? stt,
  String? hienthi,
  String? ngaytao,
  String? ngaysua,
  String? tenhopdong,
  String? emaiKh,
  String? dungluonghost,
  String? tenmien,
  String? chucnang,
  String? mahost,
  String? maweb,
  String? ghichu,
  String? tenNvkd,
  String? tenKh,
  String? tenCty,
  String? diachiCty,
  String? dienthoaiCq,
  String? mst,
  String? ngayKiweb,
  String? ngayNopweb,
  String? ngayNop,
  String? ngayTra,
  String? tienWeb,
  String? tienNcweb,
  String? tienHost,
  String? tienNchost,
  String? phiTenmien,
  String? thanhtoanL1,
  String? thanhtoanL2,
  String? tongnhan,
  String? conlai,
  String? dienthoaiDd,
  String? ctyMoi,
  String? hostMoi,
  String? cmnd,
  String? ngayKihost,
  String? ngayKitenmien,
}) => Data20152019Model(  id: id ?? this.id,
  ngaynop: ngaynop ?? this.ngaynop,
  sophieuthu: sophieuthu ?? this.sophieuthu,
  nguoithutien: nguoithutien ?? this.nguoithutien,
  msnv: msnv ?? this.msnv,
  phong: phong ?? this.phong,
  khuvuc: khuvuc ?? this.khuvuc,
  stt: stt ?? this.stt,
  hienthi: hienthi ?? this.hienthi,
  ngaytao: ngaytao ?? this.ngaytao,
  ngaysua: ngaysua ?? this.ngaysua,
  tenhopdong: tenhopdong ?? this.tenhopdong,
  emaiKh: emaiKh ?? this.emaiKh,
  dungluonghost: dungluonghost ?? this.dungluonghost,
  tenmien: tenmien ?? this.tenmien,
  chucnang: chucnang ?? this.chucnang,
  mahost: mahost ?? this.mahost,
  maweb: maweb ?? this.maweb,
  ghichu: ghichu ?? this.ghichu,
  tenNvkd: tenNvkd ?? this.tenNvkd,
  tenKh: tenKh ?? this.tenKh,
  tenCty: tenCty ?? this.tenCty,
  diachiCty: diachiCty ?? this.diachiCty,
  dienthoaiCq: dienthoaiCq ?? this.dienthoaiCq,
  mst: mst ?? this.mst,
  ngayKiweb: ngayKiweb ?? this.ngayKiweb,
  ngayNopweb: ngayNopweb ?? this.ngayNopweb,
  ngayNop: ngayNop ?? this.ngayNop,
  ngayTra: ngayTra ?? this.ngayTra,
  tienWeb: tienWeb ?? this.tienWeb,
  tienNcweb: tienNcweb ?? this.tienNcweb,
  tienHost: tienHost ?? this.tienHost,
  tienNchost: tienNchost ?? this.tienNchost,
  phiTenmien: phiTenmien ?? this.phiTenmien,
  thanhtoanL1: thanhtoanL1 ?? this.thanhtoanL1,
  thanhtoanL2: thanhtoanL2 ?? this.thanhtoanL2,
  tongnhan: tongnhan ?? this.tongnhan,
  conlai: conlai ?? this.conlai,
  dienthoaiDd: dienthoaiDd ?? this.dienthoaiDd,
  ctyMoi: ctyMoi ?? this.ctyMoi,
  hostMoi: hostMoi ?? this.hostMoi,
  cmnd: cmnd ?? this.cmnd,
  ngayKihost: ngayKihost ?? this.ngayKihost,
  ngayKitenmien: ngayKitenmien ?? this.ngayKitenmien,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['ngaynop'] = ngaynop;
    map['sophieuthu'] = sophieuthu;
    map['nguoithutien'] = nguoithutien;
    map['msnv'] = msnv;
    map['phong'] = phong;
    map['khuvuc'] = khuvuc;
    map['stt'] = stt;
    map['hienthi'] = hienthi;
    map['ngaytao'] = ngaytao;
    map['ngaysua'] = ngaysua;
    map['tenhopdong'] = tenhopdong;
    map['emai_kh'] = emaiKh;
    map['dungluonghost'] = dungluonghost;
    map['tenmien'] = tenmien;
    map['chucnang'] = chucnang;
    map['mahost'] = mahost;
    map['maweb'] = maweb;
    map['ghichu'] = ghichu;
    map['ten_nvkd'] = tenNvkd;
    map['ten_kh'] = tenKh;
    map['ten_cty'] = tenCty;
    map['diachi_cty'] = diachiCty;
    map['dienthoai_cq'] = dienthoaiCq;
    map['mst'] = mst;
    map['ngay_kiweb'] = ngayKiweb;
    map['ngay_nopweb'] = ngayNopweb;
    map['ngay_nop'] = ngayNop;
    map['ngay_tra'] = ngayTra;
    map['tien_web'] = tienWeb;
    map['tien_ncweb'] = tienNcweb;
    map['tien_host'] = tienHost;
    map['tien_nchost'] = tienNchost;
    map['phi_tenmien'] = phiTenmien;
    map['thanhtoan_l1'] = thanhtoanL1;
    map['thanhtoan_l2'] = thanhtoanL2;
    map['tongnhan'] = tongnhan;
    map['conlai'] = conlai;
    map['dienthoai_dd'] = dienthoaiDd;
    map['cty_moi'] = ctyMoi;
    map['host_moi'] = hostMoi;
    map['cmnd'] = cmnd;
    map['ngay_kihost'] = ngayKihost;
    map['ngay_kitenmien'] = ngayKitenmien;
    return map;
  }

}