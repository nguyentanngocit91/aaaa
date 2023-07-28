
class SearchContractCustomer {
	Khachhang? khachhang;
	List<Hopdongs>? hopdongs;

	SearchContractCustomer({this.khachhang, this.hopdongs});

	SearchContractCustomer.fromJson(Map<String, dynamic> json) {
		khachhang = json['khachhang'] != null
				? new Khachhang.fromJson(json['khachhang'])
				: null;
		if (json['hopdongs'] != null) {
			hopdongs = <Hopdongs>[];
			json['hopdongs'].forEach((v) {
				hopdongs!.add(new Hopdongs.fromJson(v));
			});
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.khachhang != null) {
			data['khachhang'] = this.khachhang!.toJson();
		}
		if (this.hopdongs != null) {
			data['hopdongs'] = this.hopdongs!.map((v) => v.toJson()).toList();
		}
		return data;
	}
}

class Khachhang {
	List<Null>? lichsuKhoitao;
	List<Null>? lichsuCapnhat;
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
	Info_Khachhang? info;

	Khachhang(
			{this.lichsuKhoitao,
				this.lichsuCapnhat,
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

	Khachhang.fromJson(Map<String, dynamic> json) {
		/*if (json['lichsu_khoitao'] != null) {
			lichsuKhoitao = <Null>[];
			json['lichsu_khoitao'].forEach((v) {
				lichsuKhoitao!.add(Null.fromJson(v));
			});
		}
		if (json['lichsu_capnhat'] != null) {
			lichsuCapnhat = <Null>[];
			json['lichsu_capnhat'].forEach((v) {
				lichsuCapnhat!.add(Null.fromJson(v));
			});
		}*/
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
		info = json['info'] != null ? new Info_Khachhang.fromJson(json['info']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		/*if (this.lichsuKhoitao != null) {
			data['lichsu_khoitao'] =
					this.lichsuKhoitao!.map((v) => v.toJson()).toList();
		}
		if (this.lichsuCapnhat != null) {
			data['lichsu_capnhat'] =
					this.lichsuCapnhat!.map((v) => v.toJson()).toList();
		}*/
		data['_id'] = this.sId;
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
		return data;
	}
}

class Info_Khachhang {
	String? fax;

	Info_Khachhang({this.fax});

	Info_Khachhang.fromJson(Map<String, dynamic> json) {
		fax = json['fax'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['fax'] = this.fax;
		return data;
	}
}

class Hopdongs {
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
	Info_Hopdong? info;
	String? khachhangId;
	String? tenhopdong;
	Nhanvien? lichsuKhoitao;
	int? tongtien;
	List<Null>? lichsuCapnhat;

	Hopdongs(
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
				this.info,
				this.khachhangId,
				this.tenhopdong,
				this.lichsuKhoitao,
				this.tongtien,
				this.lichsuCapnhat});

	Hopdongs.fromJson(Map<String, dynamic> json) {
		/*if (json['dichvuIds'] != null) {
			dichvuIds = <Null>[];
			json['dichvuIds'].forEach((v) {
				dichvuIds!.add(new Null.fromJson(v));
			});
		}
		if (json['lichsu_thanhtoan'] != null) {
			lichsuThanhtoan = <Null>[];
			json['lichsu_thanhtoan'].forEach((v) {
				lichsuThanhtoan!.add(new Null.fromJson(v));
			});
		}*/
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
				nhanvien!.add(new Nhanvien.fromJson(v));
			});
		}
		ghichu = json['ghichu'];
		info = json['info'] != null ? new Info_Hopdong.fromJson(json['info']) : null;
		khachhangId = json['khachhangId'];
		tenhopdong = json['tenhopdong'];
		lichsuKhoitao = json['lichsu_khoitao'] != null
				? new Nhanvien.fromJson(json['lichsu_khoitao'])
				: null;
		tongtien = json['tongtien'];

		/*if (json['lichsu_capnhat'] != null) {
			lichsuCapnhat = <Null>[];
			json['lichsu_capnhat'].forEach((v) {
				lichsuCapnhat!.add(new Null.fromJson(v));
			});
		}*/
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();

		/*
		if (this.dichvuIds != null) {
			data['dichvuIds'] = this.dichvuIds!.map((v) => v.toJson()).toList();
		}
		if (this.lichsuThanhtoan != null) {
			data['lichsu_thanhtoan'] =
					this.lichsuThanhtoan!.map((v) => v.toJson()).toList();
		}*/
		data['_id'] = this.sId;
		data['sohopdong'] = this.sohopdong;
		data['namhopdong'] = this.namhopdong;
		data['ngaykyhd'] = this.ngaykyhd;
		data['loaihopdong'] = this.loaihopdong;
		data['mahopdongcu'] = this.mahopdongcu;
		data['mahopdong'] = this.mahopdong;
		if (this.nhanvien != null) {
			data['nhanvien'] = this.nhanvien!.map((v) => v.toJson()).toList();
		}
		data['ghichu'] = this.ghichu;
		if (this.info != null) {
			data['info'] = this.info!.toJson();
		}
		data['khachhangId'] = this.khachhangId;
		data['tenhopdong'] = this.tenhopdong;
		if (this.lichsuKhoitao != null) {
			data['lichsu_khoitao'] = this.lichsuKhoitao!.toJson();
		}
		data['tongtien'] = this.tongtien;
	/*	if (this.lichsuCapnhat != null) {
			data['lichsu_capnhat'] =
					this.lichsuCapnhat!.map((v) => v.toJson()).toList();
		}*/
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

class Info_Hopdong {
	String? chucnang;
	String? dungluong;
	String? domain;

	Info_Hopdong({this.chucnang, this.dungluong, this.domain});

	Info_Hopdong.fromJson(Map<String, dynamic> json) {
		chucnang = json['chucnang'];
		dungluong = json['dungluong'];
		domain = json['domain'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['chucnang'] = this.chucnang;
		data['dungluong'] = this.dungluong;
		data['domain'] = this.domain;
		return data;
	}
}
