import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/hop_dong_ky_moi_repository.dart';

class NhanVienPhuTrachState {
  final List<Map>? maNhanViens;
  final bool? loading;
  final bool daNhap;

  NhanVienPhuTrachState({this.maNhanViens, this.loading = false, this.daNhap=false});

  copyWith({List<Map>? maNhanViens, bool? loading, bool? daNhap}) {
    return NhanVienPhuTrachState(
      maNhanViens: maNhanViens ?? this.maNhanViens,
      loading: loading ?? this.loading,
      daNhap: daNhap ?? this.daNhap
    );
  }
}

final nhanVienPhuTrachProvider =
    NotifierProvider<NhanVienPhuTrachNotifier, NhanVienPhuTrachState>(() {
  return NhanVienPhuTrachNotifier();
});

class NhanVienPhuTrachNotifier extends Notifier<NhanVienPhuTrachState> {
  final HopDongKyMoiRepository _hopDongKyMoiRepository =
  HopDongKyMoiRepository();

  @override
  NhanVienPhuTrachState build() {
    return NhanVienPhuTrachState();
  }

  bool kiemTraDaNhap(){
    if(state.maNhanViens!=null || state.maNhanViens!.isNotEmpty) return true;
    return false;
  }

  Future<bool> themMaNhanVien(String maNhanVien) async {
    state = state.copyWith(loading: true);
    final Map? data = await layThongTinNhanVien(maNhanVien);
    if (data != null) {
      final checkExits = state.maNhanViens?.any((element) => element.values.contains(maNhanVien)) ?? false;
      if(!checkExits){
        state = state.copyWith(maNhanViens: [...state.maNhanViens ?? [], data], loading: false, daNhap: true);
        return true;
      }
      state = state.copyWith(loading: false);
      return true;
    }
    state = state.copyWith(loading: false);
    return false;
  }

  xoaNhanVien(String maNhanVien){
    state = state.copyWith(maNhanViens: [
      for(var nv in state.maNhanViens ?? [])
        if(nv['manhanvien'].toString().toUpperCase()!=maNhanVien.toUpperCase()) nv
    ]);
  }

  Future<Map?> layThongTinNhanVien(String maNhanVien) async {
    return await _hopDongKyMoiRepository.thongTinNhanVien(
        maNhanVien: maNhanVien.toUpperCase());
  }

  Map chiTietNhanVien(String maNhanVien) => state.maNhanViens!.firstWhere((nv) => nv['manhanvien'] == maNhanVien);

  String? showThongTinNhanVienInput({required String field}){
    List<String> list = [];

    switch(field){
      case 'maphongban':
        for(var nv in state.maNhanViens ?? []){
          list.add(nv['phongbanId'][field]);
        }
      case 'parentId_hoten':
        for(var nv in state.maNhanViens ?? []){
          if(nv['parentId']?['hoten']!=null) {
            list.add(nv['parentId']?['hoten']);
          } else {
            list.add(nv['hoten']);
          }
        }
      default:
        for(var nv in state.maNhanViens ?? []){
          list.add(nv[field]);
        }
    }

    if(list.isNotEmpty){
      return list.join(' , ');
    }
    return null;
  }
}
