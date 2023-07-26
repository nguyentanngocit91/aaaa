import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../khach_hang_moi_layout.dart';

final danhSachDomainProvider = NotifierProvider<DanhSachDomainNotifier, List<RowDomainWidget>>(() {
  return DanhSachDomainNotifier();
});

class DanhSachDomainNotifier extends Notifier<List<RowDomainWidget>> {
  @override
  List<RowDomainWidget> build() {
    return [];
  }

  addRowDomain(RowDomainWidget newItem) {
    state = [...state, newItem];
  }

  lamMoiDanhSach(RowDomainWidget newItem){
    state.clear();
    state = [newItem];
  }

  removeDomain(int rowIndex) {
    print('xoa: $rowIndex');
    state.forEach((element) {
      print(element.rowIndex);
    });
    if(rowIndex>0){
      state = [
        for(RowDomainWidget item in state)
          if(item.rowIndex!=rowIndex) item
      ];
    }
    print('--------- update -------');
    state.forEach((element) {
      print(element.rowIndex);
    });
  }
}
