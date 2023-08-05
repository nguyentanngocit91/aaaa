import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/extensions/date_time_extention.dart';
import '../../../../../_shared/utils/helper.dart';
import '../models/hopdong_model.dart';
import '../providers/danh_sach_hop_dong_provider.dart';

class DanhSachLayout extends ConsumerStatefulWidget {
  const DanhSachLayout({super.key});

  @override
  ConsumerState createState() => _DanhSachLayoutState();
}

class _DanhSachLayoutState extends ConsumerState<DanhSachLayout> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      ref.read(danhSachHopDongProvider.notifier).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final danhSachHopDongState = ref.watch(danhSachHopDongProvider);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: (danhSachHopDongState.isLoading == true)
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  child: PaginatedDataTable(
                    source: HopDongData(
                        data: danhSachHopDongState.data ?? [],
                        totalRow: danhSachHopDongState.totalRow),
                    header: Text('Danh sách hợp đồng mới & Pending'),
                    headingRowHeight: 50,
                    showFirstLastButtons: true,
                    columns: const [
                      DataColumn(label: Text('Mã Khách Hàng')),
                      DataColumn(label: Text('Số Hợp Đồng')),
                      DataColumn(label: Text('Tên Hợp Đồng')),
                      DataColumn(label: Text('Ngày ký')),
                      DataColumn(label: Text('Tổng giá trị')),
                    ],
                    columnSpacing: 100,
                    rowsPerPage: danhSachHopDongState.pageSize,
                    showCheckboxColumn: false,
                    availableRowsPerPage: const [10, 20, 50, 100],
                    onRowsPerPageChanged: (value) {
                      ref
                          .read(danhSachHopDongProvider.notifier)
                          .changePageSize(pageSize: value);
                    },
                    onPageChanged: (value) {
                      ref.read(danhSachHopDongProvider.notifier).changePage(
                          currentPage: danhSachHopDongState.currentPage + 1);
                    },
                  ),
                ),
        ),
      ),
    );
  }
}

class HopDongData extends DataTableSource {
  final List<HopDongModel> data;
  final int totalRow;

  HopDongData({required this.data, required this.totalRow});

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => totalRow;

  @override
  int get selectedRowCount => 0;


  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final item = data[index];

    return DataRow(cells: [
      DataCell(Text(item.l1_khachhangId!.makhachhang.toString())),
      DataCell(Text(item.mahopdong.toString())),
      DataCell(Text(item.tenhopdong.toString())),
      DataCell(Text(DateTime.parse(item.ngaykyhd.toString())
          .formatDateTime(formatString: 'dd-MM-yyyy'))),
      DataCell(Text(Helper.numberFormat(double.parse(item.tongtien.toString()),
          symbol: ''))),
    ]);
  }
}
