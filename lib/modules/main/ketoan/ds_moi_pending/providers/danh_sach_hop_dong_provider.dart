import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/hopdong_model.dart';
import '../repositories/hop_dong_repository.dart';

class DanhSachHopDongState{
  final int totalRow;
  final int currentPage;
  final int pageSize;
  final List<HopDongModel>? data;
  final bool? isLoading;

  DanhSachHopDongState({this.totalRow=0, this.currentPage=1, this.pageSize=15, this.data, this.isLoading=false});

  DanhSachHopDongState copyWith({int? totalRow, int? currentPage, int? pageSize, List<HopDongModel>? data, bool? isLoading}){
    return DanhSachHopDongState(
        totalRow: totalRow ?? this.totalRow,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading
    );
  }
}

final danhSachHopDongProvider = NotifierProvider<DanhSachHopDongNotifier, DanhSachHopDongState>(() {
  return DanhSachHopDongNotifier();
});

class DanhSachHopDongNotifier extends Notifier<DanhSachHopDongState> {
  final HopDongRepository _hopDongRepository = HopDongRepository();

  @override
  DanhSachHopDongState build() {
    return DanhSachHopDongState(data: []);
  }

  Future<void> fetchData() async {
    state = state.copyWith(isLoading: true);
    final result = await _hopDongRepository.layDanhSach(currentPage: state.currentPage, pageSize: state.pageSize);
    final List<HopDongModel> data = result['data'];
    state = state.copyWith(totalRow: result['totalRow'], data: data, isLoading: false);
  }

  changePageSize({int? pageSize}){
    state = state.copyWith(pageSize: pageSize ?? state.pageSize);
    fetchData();
  }

  changePage({required int currentPage}){
    state = state.copyWith(currentPage: currentPage);
    fetchData();
  }
}
