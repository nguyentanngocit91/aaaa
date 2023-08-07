import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../_shared/extensions/date_time_extention.dart';
import '../../../../../_shared/mixins/data_table_mixins.dart';
import '../../../../../_shared/mixins/form_ui_mixins.dart';
import '../../../../../_shared/utils/helper.dart';
import '../../../../../packages/number_paginator/number_paginator.dart';
import '../providers/danh_sach_hop_dong_provider.dart';

final GlobalKey<FormState> _keyFormPending = GlobalKey();

class DanhSachLayout extends ConsumerStatefulWidget {
  const DanhSachLayout({super.key});

  @override
  ConsumerState createState() => _DanhSachLayoutState();
}

class _DanhSachLayoutState extends ConsumerState<DanhSachLayout>
    with DataTableMixins, FormUIMixins {

  final TextEditingController _soHopDongController = TextEditingController();
  final TextEditingController _tenHopDongController = TextEditingController();

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
    final danhSanh = danhSachHopDongState.dataPhieuThu ?? [];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            bodyForm(
              child: Form(
                key: _keyFormPending,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: _soHopDongController,
                        decoration: const InputDecoration(hintText: 'Số hợp đồng'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: _tenHopDongController,
                        decoration: const InputDecoration(hintText: 'Tên hợp đồng'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      height: 48,
                      child: FilledButton.icon(
                          onPressed: () {
                            if(_soHopDongController.text.isNotEmpty || _tenHopDongController.text.isNotEmpty){
                              List<String> dsfilter = [];
                              if(_soHopDongController.text.isNotEmpty){
                                dsfilter.add('sohopdong=${_soHopDongController.text}');
                              }
                              if(_tenHopDongController.text.isNotEmpty){
                                dsfilter.add('tenhopdong=${_tenHopDongController.text}');
                              }
                              ref.read(danhSachHopDongProvider.notifier).changeFilter(filters: dsfilter);
                            }else{
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  title: const Text("Thông Báo"),
                                  content: const Text('Vui lòng nhập Số Hợp Đồng hoặc Tên Hợp Đồng !'),
                                  actions: [
                                    FilledButton(onPressed: (){Navigator.pop(context);}, child: const Text('Đã hiểu'))
                                  ],
                                );
                              },);
                            }
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 15,
                          ),
                          label: const Text('Tìm kiếm')),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      height: 48,
                      child: FilledButton.icon(
                          onPressed: () {
                            _tenHopDongController.clear();
                            _soHopDongController.clear();
                            ref.read(danhSachHopDongProvider.notifier).reset();
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.xmark,
                            size: 15,
                          ),
                          label: const Text('Reset')),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
        (danhSanh.isNotEmpty) ? Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: dataTableWidget(
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
                              return Colors.white;
                            } else {
                              return Colors.grey.shade100;
                            }
                          },
                        ),
                        cells: [
                          DataCell(
                              Text(item.l1_khachhangId!.makhachhang.toString())),
                          DataCell(Text(item.hopdong![0]['sohopdong'].toString())),
                          DataCell(Text((item.hopdong![0]['tenhopdong'] != null)
                              ? item.hopdong![0]['tenhopdong'].toString()
                              : 'Uknow')),
                          DataCell(Text(DateTime.parse(item.ngaytao.toString())
                              .formatDateTime(formatString: 'dd-MM-yyyy'))),
                          DataCell(Text(Helper.numberFormat(
                              double.parse(item.tongtien.toString()),
                              symbol: ''))),
                          DataCell(
                            IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.pencil,
                                  color: Colors.blue,
                                  size: 17,
                                )),
                          ),
                        ],
                      );
                    }),
                  ),
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
            ) : const Center(child: Text('Không có dữ liệu'),),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _soHopDongController.dispose();
    _tenHopDongController.dispose();
  }
}
