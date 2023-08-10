

import '../../../../../_shared/utils/form_status.dart';
import '../models/ban_giao_model.dart';
import '../models/khach_hang_model.dart';

class BanGiaoState{

  BanGiaoState({this.status = FormStatus.pure,this.errorMessage = '',this.maHD, this.tenHD, this.email, this.dienThoai, this.domain, this.listHD = const [], this.khachHang});

  final FormStatus status;
  final String? errorMessage;
  final String? maHD;
  final String? tenHD;
  final String? email;
  final String? dienThoai;
  final String? domain;
  final List<BanGiaoModel> listHD;
  final KhachHangModel? khachHang;

  BanGiaoState copyWith({
    FormStatus? status,
    String? errorMessage,
    String? maHD,
    String? tenHD,
    String? email,
    String? dienThoai,
    String? domain,
    List<BanGiaoModel>? listHD,
    KhachHangModel? khachHang,
  }) {
    return BanGiaoState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      maHD: maHD ?? this.maHD,
      tenHD: tenHD ?? this.tenHD,
      email: email ?? this.email,
      dienThoai: dienThoai ?? this.dienThoai,
      domain: domain ?? this.domain,
      listHD: listHD ?? this.listHD,
      khachHang: khachHang ?? this.khachHang,
    );
  }
}