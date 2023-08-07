import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../_shared/extensions/date_time_extention.dart';
import '../../../../../_shared/mixins/data_table_mixins.dart';
import '../../../../../_shared/utils/helper.dart';
import '../../../../../packages/number_paginator/number_paginator.dart';
import '../providers/danh_sach_hop_dong_provider.dart';

class DanhSachLayout extends ConsumerStatefulWidget {
  const DanhSachLayout({super.key});

  @override
  ConsumerState createState() => _DanhSachLayoutState();
}

class _DanhSachLayoutState extends ConsumerState<DanhSachLayout>
    with DataTableMixins {
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
    final danhSanh = danhSachHopDongState.data ?? [];
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              dataTableWidget(
                context: context,
                columns: [
                  DataColumn(label: Text('Mã Khách Hàng'.toUpperCase())),
                  DataColumn(label: Text('Số Hợp Đồng'.toUpperCase())),
                  DataColumn(label: Text('Tên Hợp Đồng'.toUpperCase())),
                  DataColumn(label: Text('Ngày ký'.toUpperCase())),
                  DataColumn(label: Text('Tổng giá trị'.toUpperCase())),
                  DataColumn(label: Text(''.toUpperCase())),
                ],
                rows: List.generate(danhSanh.length, (index) {
                  final item = danhSanh[index];
                  return DataRow.byIndex(
                      index: index,
                      color: MaterialStateColor.resolveWith(
                        (states) {
                          if (index % 2 == 0) {
                            return Colors.grey.shade100;
                          } else {
                            return Colors.white;
                          }
                        },
                      ),
                      cells: [
                        DataCell(
                            Text(item.l1_khachhangId!.makhachhang.toString())),
                        DataCell(Text(item.mahopdong.toString())),
                        DataCell(Text(item.tenhopdong.toString())),
                        DataCell(Text(DateTime.parse(item.ngaykyhd.toString())
                            .formatDateTime(formatString: 'dd-MM-yyyy'))),
                        DataCell(Text(Helper.numberFormat(
                            double.parse(item.tongtien.toString()),
                            symbol: ''))),
                        DataCell(Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.pencil,
                                  color: Colors.blue,
                                  size: 17,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.trash,
                                  color: Colors.redAccent,
                                  size: 17,
                                )),
                          ],
                        )),
                      ]);
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 600,
                  child: NumberPaginator(
                    numberPages: (danhSachHopDongState.totalRow /
                            danhSachHopDongState.pageSize)
                        .ceil(),
                    onPageChange: (page) {
                      ref
                          .read(danhSachHopDongProvider.notifier)
                          .changePage(currentPage: page + 1);
                    },
                    config: NumberPaginatorUIConfig(
                        buttonSelectedBackgroundColor:
                            Theme.of(context).primaryColor,
                        buttonUnselectedForegroundColor: Colors.grey,
                        mainAxisAlignment: MainAxisAlignment.center),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
