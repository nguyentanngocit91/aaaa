import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:data_table_2/data_table_2.dart';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl/intl.dart';

import '../../../../../../_shared/utils/helper.dart';
import '../../../../../../_shared/utils/ndgap.dart';

import '../../datatable/datatable2.dart';
import '../../models/inforesponse_model.dart';
import '../../models/item_search_result_model.dart';
import '../../providers/capnhat_provider.dart';
import 'dum.dart';
import 'update.dart';

int _rowsPerPage = 10;
bool _sortAscending = true;
String searchType = 'web';
int? _sortColumnIndex;


class UpgradeWebListLayout extends ConsumerWidget {
  const UpgradeWebListLayout() : super(key: const Key(pathName));

  static const String pathName = 'nang-cap-website';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double hozSpacingWrap = 30;
    double verSpacingWrap = 20;
    String typeHD = 'web';

    var data = ref.watch(capnhatProvider.select((value) => value.result));
    print(data);
    return Scaffold(
      body: ListView(
        children: [
          heading1('TÌM KIẾM THÔNG TIN'),
          ndGapH8(),
          filter(),
          ndGapH8(),
          heading1('TÌM KIẾM WEBSITE'),
          ndGapH8(),
         SizedBox(
           height: 500,
           child: (data!=null)?PaginatedDataTableDemo(data:data!):Container(),
         ),
        ],
      ),
    );
  }
}






































List<DataColumn> get _columns {
  return [
    DataColumn2(
      label: const Text(
        '#',
        style: TextStyle(color: Colors.white),
      ),
      fixedWidth: 70,
    ),
    DataColumn2(
      label: const Text(
        'Mã KH',
        style: TextStyle(color: Colors.white),
      ),
      // onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
      fixedWidth: 150,
    ),
    DataColumn2(
        label: const Text(
          'Mã HĐ',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white),
        ),

        size: ColumnSize.S),
    DataColumn2(
        label: const Text(
          'Mã HĐ',
          style: TextStyle(color: Colors.white),
        ),

        size: ColumnSize.L),
    DataColumn2(
        label: const Text(
          'Email',
          style: TextStyle(color: Colors.white),
        ),

        size: ColumnSize.S),
    DataColumn2(
        label: const Text(
          'Ngày ký',
          style: TextStyle(color: Colors.white),
        ),

        size: ColumnSize.S),
    DataColumn2(
        label: const Text(
          'Chức năng',
          style: TextStyle(color: Colors.white),
        ),

        size: ColumnSize.L),
    DataColumn2(
        label: const Text(
          'Ghi chú',
          style: TextStyle(color: Colors.white),
        ),

        size: ColumnSize.L),
    DataColumn2(
      label: const Text(
        'Thao tác',
        style: TextStyle(color: Colors.white),
      ),

      size: ColumnSize.L,
      fixedWidth: 150,
      //onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
    ),
  ];
}
class PaginatedDataTableDemo extends StatefulWidget {
   PaginatedDataTableDemo({super.key, required this.data });
  final Map<String, dynamic> data;
  @override
  PaginatedDataTableDemoState createState() => PaginatedDataTableDemoState();
}

class PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,

        headingRowColor: MaterialStateColor.resolveWith(
                (states) => Theme.of(context).primaryColor),
        empty: Center(
            child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.grey[200],
                child: const Text('Không có dữ liệu'))),
        columns: _columns,
    rows: List<DataRow>.generate(
    100,
    (index) => DataRow(cells: [
    DataCell(Text('A' * (10 - index % 10))),
    DataCell(Text('A' * (10 - index % 10))),
    DataCell(Text('A' * (10 - index % 10))),
    DataCell(Text('A' * (10 - index % 10))),
    DataCell(Text('A' * (10 - index % 10))),
    DataCell(Text('B' * (10 - (index + 5) % 10))),
    DataCell(Text('C' * (15 - (index + 5) % 10))),
    DataCell(Text('D' * (15 - (index + 10) % 10))),
    DataCell(Text(((index + 0.1) * 25.4).toString()))
    ]))
    );
  }
}


class filter extends ConsumerWidget {
  const filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Colors.black.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 10,
                      children: [
                        textForm(
                            title: 'Mã khách hàng',
                            onchange: (value) {
                              ref
                                  .read(capnhatProvider.notifier)
                                  .onChangeValue('MAKH', value);
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 10,
                      children: [
                        textForm(
                            title: 'Mã hợp đồng',
                            onchange: (value) {
                              ref
                                  .read(capnhatProvider.notifier)
                                  .onChangeValue('MAHD', value);
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Wrap(
                      runSpacing: 10,
                      children: [
                        textForm(
                            title: 'Tên hợp đồng',
                            onchange: (value) {
                              ref
                                  .read(capnhatProvider.notifier)
                                  .onChangeValue('TENHD', value);
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 10,
                      children: [
                        textForm(
                            title: 'Email',
                            onchange: (value) {
                              ref
                                  .read(capnhatProvider.notifier)
                                  .onChangeValue('EMAIL', value);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Wrap(
              runSpacing: 10,
              children: [
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        color: Colors.blue,
                      ),
                      child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      ref.read(capnhatProvider.notifier).setPage(1,null);
                      ref.read(capnhatProvider.notifier).onSearch( searchType);
                      print("Search");
                    },
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        color: Colors.blue,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

