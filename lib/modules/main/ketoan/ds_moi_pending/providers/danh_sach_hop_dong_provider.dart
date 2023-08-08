import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/hopdong_model.dart';
import '../models/phieu_thu_model.dart';
import '../repositories/hop_dong_repository.dart';

class DanhSachHopDongState {
  final int totalRow;
  final int currentPage;
  final int pageSize;
  final List<HopDongModel>? data;
  final List<PhieuThuModel>? dataPhieuThu;
  final List<String>? filters;
  final bool? isLoading;

  DanhSachHopDongState(
      {this.totalRow = 0,
      this.currentPage = 1,
      this.pageSize = 10,
      this.data,
      this.dataPhieuThu,
      this.filters,
      this.isLoading = true});

  DanhSachHopDongState copyWith(
      {int? totalRow,
      int? currentPage,
      int? pageSize,
      List<HopDongModel>? data,
      List<PhieuThuModel>? dataPhieuThu,
      List<String>? filters,
      bool? isLoading}) {
    return DanhSachHopDongState(
        totalRow: totalRow ?? this.totalRow,
        currentPage: currentPage ?? this.currentPage,
        pageSize: pageSize ?? this.pageSize,
        data: data ?? this.data,
        dataPhieuThu: dataPhieuThu ?? this.dataPhieuThu,
        filters: filters ?? this.filters,
        isLoading: isLoading ?? this.isLoading);
  }
}

final danhSachHopDongProvider =
    NotifierProvider.autoDispose<DanhSachHopDongNotifier, DanhSachHopDongState>(
        () {
  return DanhSachHopDongNotifier();
});

class DanhSachHopDongNotifier
    extends AutoDisposeNotifier<DanhSachHopDongState> {
  final HopDongRepository _hopDongRepository = HopDongRepository();

  @override
  DanhSachHopDongState build() {
    return DanhSachHopDongState(data: [], dataPhieuThu: []);
  }

  Future<void> fetchData() async {
    final result = await _hopDongRepository.layDanhSachPhieuThu(
        currentPage: state.currentPage,
        pageSize: state.pageSize,
        filters: state.filters);
    final List<PhieuThuModel> data = result['data'];
    state = state.copyWith(
        totalRow: result['totalRow'], dataPhieuThu: data, isLoading: false);
  }

  changePageSize({int? pageSize}) {
    state = state.copyWith(pageSize: pageSize ?? state.pageSize, currentPage: 1);
    fetchData();
  }

  changePage({required int currentPage}) {
    state = state.copyWith(currentPage: currentPage);
    fetchData();
  }

  changeFilter({required List<String> filters}) {
    state = state.copyWith(filters: filters, currentPage: 1);
    fetchData();
  }

  reset(){
    state = DanhSachHopDongState();
    fetchData();
  }
}
