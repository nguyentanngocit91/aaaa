import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/extensions/date_time_extention.dart';

class DomainModel {
  final bool? defaultRow;
  final int? rowIndex;
  final String? domainName;
  final DateTime? ngayKy;
  final DateTime? ngayDangKy;
  final DateTime? ngayHetHan;
  final int? soNamDangKy;
  final String? ghiChu;

  DomainModel(
      {this.defaultRow = false,
      this.rowIndex,
      this.domainName,
      this.ngayKy,
      this.ngayDangKy,
      this.ngayHetHan,
      this.soNamDangKy,
      this.ghiChu});

  copyWith(
      {bool? defaultRow,
      int? rowIndex,
      String? domainName,
      DateTime? ngayKy,
      DateTime? ngayDangKy,
      DateTime? ngayHetHan,
      int? soNamDangKy,
      String? ghiChu}) {
    return DomainModel(
      defaultRow: defaultRow ?? this.defaultRow,
      rowIndex: rowIndex ?? this.rowIndex,
      domainName: domainName ?? this.domainName,
      ngayKy: ngayKy ?? this.ngayKy,
      ngayDangKy: ngayDangKy ?? this.ngayDangKy,
      ngayHetHan: ngayHetHan ?? this.ngayHetHan,
      soNamDangKy: soNamDangKy ?? this.soNamDangKy,
      ghiChu: ghiChu ?? this.ghiChu,
    );
  }

  Map toJson() => {
        'tenmien': domainName,
        'ngaykyhd': ngayKy?.formatDateTime(formatString: 'yyyy-MM-dd'),
        'sonamdangky': soNamDangKy,
        'ghichu': ghiChu
      };
}

final danhSachDomainProvider =
    NotifierProvider<DanhSachDomainNotifier, List<DomainModel>>(() {
  return DanhSachDomainNotifier();
});

class DanhSachDomainNotifier extends Notifier<List<DomainModel>> {
  @override
  List<DomainModel> build() {
    return [];
  }

  loadDanhSachDomain({required List<dynamic> danhSach}) {
    state = [];
    List<DomainModel> listNew = [];
    int index = 1;
    for (Map item in danhSach) {
      listNew.add(DomainModel(
          rowIndex: index,
          ngayKy: DateTime.parse(item['ngaykyhd']),
          ngayHetHan: (item['ngayhethan']!=null) ? DateTime.parse(item['ngayhethan']) : null,
          domainName: item['tenmien'],
          defaultRow: (index == 1) ? true : false, soNamDangKy: item['sonamdangky'], ghiChu: item['ghichu']));
      index++;
    }
    state = listNew;
  }

  addNewRowDomain({required int index}) {
    final now = DateTime.now();
    final newItem = DomainModel(
        rowIndex: index,
        ngayKy: now,
        ngayHetHan: now.copyWith(year: now.year + 1),
        defaultRow: false);
    state = [...state, newItem];
  }

  lamMoiDanhSach() {
    final now = DateTime.now();
    state = [
      DomainModel(
          rowIndex: 0,
          ngayKy: now,
          ngayHetHan: now.copyWith(year: now.year + 1),
          defaultRow: true)
    ];
  }

  updateDomain({required int rowIndex, required DomainModel newItem}) {
    state = [
      for (DomainModel item in state)
        if (item.rowIndex == rowIndex) newItem else item
    ];
    // state[rowIndex] = newItem;
    // showInfo(state[rowIndex]);
  }

  removeDomain(int rowIndex) {
    if (rowIndex > 0) {
      state = [
        for (DomainModel item in state)
          if (item.rowIndex != rowIndex) item
      ];
    }
  }
}
