import '../models/ban_giao_model.dart';

class BanGiaoState{

  BanGiaoState({this.maHD, this.tenHD, this.email, this.dienThoai, this.domain, this.listHD = const []});
  final String? maHD;
  final String? tenHD;
  final String? email;
  final String? dienThoai;
  final String? domain;
  final List<BanGiaoModel> listHD;

  BanGiaoState copyWith({
    String? maHD,
    String? tenHD,
    String? email,
    String? dienThoai,
    String? domain,
    List<BanGiaoModel>? listHD,
  }) {
    return BanGiaoState(
      maHD: maHD ?? this.maHD,
      tenHD: tenHD ?? this.tenHD,
      email: email ?? this.email,
      dienThoai: dienThoai ?? this.dienThoai,
      domain: domain ?? this.domain,
      listHD: listHD ?? this.listHD,
    );
  }
}