

import 'package:data_table_2/data_table_2.dart';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl/intl.dart';

import '../../../../../../_shared/utils/helper.dart';
import '../../../../../../_shared/utils/ndgap.dart';

import '../../models/inforesponse_model.dart';
import '../../models/item_search_result_model.dart';
import '../../providers/capnhat_provider.dart';
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

    return Scaffold(
      body: ListView(
        children: [
          heading1('TÌM KIẾM THÔNG TIN'),
          ndGapH8(),
          filter(),
          ndGapH8(),
          heading1('TÌM KIẾM WEBSITE'),
          ndGapH8(),
          (data!=null)?PaginatedDataTableDemo(data:data!):Container(),

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
      fixedWidth: 50,
    ),
    DataColumn2(
      label: const Text(
        'Mã KH',
        style: TextStyle(color: Colors.white),
      ),
      // onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
      fixedWidth: 120,
    ),

    DataColumn2(
        label: const Text(
          'Mã HĐ',
          style: TextStyle(color: Colors.white),
        ),
        fixedWidth: 120,
        ),
    DataColumn2(
        label: const Text(
          'Email',
          style: TextStyle(color: Colors.white),
        ),
        fixedWidth: 240,
        size: ColumnSize.S),
    DataColumn2(
        label: const Text(
          'Ngày ký',
          style: TextStyle(color: Colors.white),
        ),
        fixedWidth: 120,
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

    var data = widget.data['data'];
    InfoResponseModel info = widget.data['info'];
    print(info.total);
    print(info);
   
    return Stack(
      children: [

        SizedBox(
        height: 700,
        child: DataTable2(

            columnSpacing: 12,
            horizontalMargin: 12,


            headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Theme.of(context).primaryColor),
            empty: Center(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.grey[200],
                    child: const Text('Không có dữ liệu'))),
            columns: _columns,
            rows: List<DataRow>.generate(
                data.length,
                    (index) {
                  ItemSearchResultModel item = data[index];

                  return DataRow(
                      cells: [

                        DataCell(Text(((index * info.page!)+1).toString())),
                        DataCell(Text(item.l1_khachhangId!.makhachhang!)),
                        DataCell(Text(item.mahopdong!)),

                        DataCell(Text(item.l1_khachhangId!.email!)),
                        DataCell(Text(Helper.dateFormat(item.ngaykyhd))),
                        DataCell(Text(item.l1_info!.chucnang.toString())),
                        DataCell(Text(item.ghichu.toString())),

                        DataCell(Row(
                          children: [
                            GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                  ),
                                  padding: EdgeInsets.all(3.0),
                                  child: Text(
                                    'Nâng cấp',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                            SizedBox(
                              width: 5.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  showDialog<void>(
                                    context: context!,
                                    barrierDismissible: false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return UpdateWebsite(id: item.id!);
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                  ),
                                  padding: EdgeInsets.all(3.0),
                                  child: Text(
                                    'Cập nhật',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ],
                        ))
                      ]);
                }

            )
        )
    ),

      
        
      ],
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

