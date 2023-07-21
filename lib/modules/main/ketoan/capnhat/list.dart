import 'dart:convert';
import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../_shared/utils/ndgap.dart';
import 'datatable/datatable2.dart';
import 'models/inforesponse_model.dart';
import 'models/item_search_result_model.dart';
import 'providers/capnhat_provider.dart';

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
          SizedBox(
            height: 700,
            child: AsynData(data: data),
          )
        ],
      ),
    );
  }
}

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "id": index,
            "title": "Item $index",
            "price": Random().nextInt(10000)
          });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}

class AsynData extends StatefulWidget {
  AsynData({
    Key? key,
    this.data,
  }) : super(key: key);

  final Map<String, dynamic>? data;

  @override
  State<AsynData> createState() => _AsynDataState();
}

class _AsynDataState extends State<AsynData> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool _sortAscending = true;
  int? _sortColumnIndex;
  DessertDataSourceAsync? _dessertsDataSource;
  final PaginatorController _controller = PaginatorController();

  bool _dataSourceLoading = false;
  int _initialRow = 0;

  //final  Map<String,dynamic>? data;

  // void didChangeDependencies() {
  //   //
  //   //   _dessertsDataSource ??= getCurrentRouteOption(context) == noData
  //   //       ? DessertDataSourceAsync.empty()
  //   //       : getCurrentRouteOption(context) == asyncErrors
  //   //       ? DessertDataSourceAsync.error()
  //   //       : DessertDataSourceAsync();
  //   //
  //   //   _dataSourceLoading = true;
  //   //
  //   //    if (getCurrentRouteOption(context) == goToLast) {
  //   //     _dataSourceLoading = true;
  //   //     _dessertsDataSource!.getTotalRecords().then((count) => setState(() {
  //   //       print("77777");
  //   //       _initialRow = count - _rowsPerPage;
  //   //       _dataSourceLoading = false;
  //   //     }));
  //   // }
  //   //   print(_dessertsDataSource);
  //   //   super.didChangeDependencies();
  //
  //
  //   // initState is to early to access route options, context is invalid at that stage
  //
  //
  //   if (getCurrentRouteOption(context) == goToLast) {
  //     _dataSourceLoading = true;
  //
  //     _dessertsDataSource!.getTotalRecords().then((count) => setState(() {
  //       _initialRow = count - _rowsPerPage;
  //       _dataSourceLoading = false;
  //
  //     }));
  //   }
  //
  //   super.didChangeDependencies();
  //
  //
  // }

  void sort(
    int columnIndex,
    bool ascending,
  ) {
    var columnName = "name";
    switch (columnIndex) {
      case 1:
        columnName = "calories";
        break;
      case 2:
        columnName = "fat";
        break;
      case 3:
        columnName = "carbs";
        break;
      case 4:
        columnName = "protein";
        break;
      case 5:
        columnName = "sodium";
        break;
      case 6:
        columnName = "calcium";
        break;
      case 7:
        columnName = "iron";
        break;
    }
    //  _dessertsDataSource!.sort(columnName, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
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
        onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
        fixedWidth: 150,
      ),
      DataColumn2(
          label: const Text(
            'Mã HĐ',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white),
          ),
          onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
          size: ColumnSize.S),
      DataColumn2(
          label: const Text(
            'Tên HĐ',
            style: TextStyle(color: Colors.white),
          ),
          onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
          size: ColumnSize.L),
      DataColumn2(
          label: const Text(
            'Email',
            style: TextStyle(color: Colors.white),
          ),
          onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
          size: ColumnSize.S),
      DataColumn2(
          label: const Text(
            'Ngày ký',
            style: TextStyle(color: Colors.white),
          ),
          onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
          size: ColumnSize.S),
      DataColumn2(
          label: const Text(
            'Chức năng',
            style: TextStyle(color: Colors.white),
          ),
          onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
          size: ColumnSize.L),
      DataColumn2(
          label: const Text(
            'Ghi chú',
            style: TextStyle(color: Colors.white),
          ),
          onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _dataSourceLoading = true;

    setState(() {
      if (widget.data == null) {
        _dessertsDataSource = DessertDataSourceAsync.empty();
      } else {
        _initialRow = 1;
        _dataSourceLoading = false;
        _dessertsDataSource = DessertDataSourceAsync(widget.data);
        print(_dessertsDataSource);
      }
    });
    print("_initialRow $_initialRow");
    return AsyncPaginatedDataTable2(
      headingRowColor: MaterialStateColor.resolveWith(
          (states) => Theme.of(context).primaryColor),
      border: TableBorder(
          top: const BorderSide(color: Colors.black),
          bottom: BorderSide(color: Colors.grey[300]!),
          left: BorderSide(color: Colors.grey[300]!),
          right: BorderSide(color: Colors.grey[300]!),
          verticalInside: BorderSide(color: Colors.grey[300]!),
          horizontalInside: const BorderSide(color: Colors.grey, width: 1)),
      horizontalMargin: 20,

      checkboxHorizontalMargin: 12,
      columnSpacing: 2,
      wrapInCard: false,
      // header: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     mainAxisSize: MainAxisSize.max,
      //     children: [
      //       _TitledRangeSelector(
      //           range: const RangeValues(150, 600),
      //           onChanged: (v) {
      //             // If the curren row/current page happens to be larger than
      //             // the total rows/total number of pages what would happen is determined by
      //             // [pageSyncApproach] field
      //             _dessertsDataSource!.caloriesFilter = v;
      //           },
      //           key: _rangeSelectorKey,
      //           title: 'AsyncPaginatedDataTable2',
      //           caption: 'Calories'),
      //       if (kDebugMode && getCurrentRouteOption(context) == custPager)
      //         Row(children: [
      //           OutlinedButton(
      //               onPressed: () => _controller.goToPageWithRow(25),
      //               child: const Text('Go to row 25')),
      //           OutlinedButton(
      //               onPressed: () => _controller.goToRow(5),
      //               child: const Text('Go to row 5'))
      //         ]),
      //       if (getCurrentRouteOption(context) == custPager)
      //         PageNumber(controller: _controller)
      //     ]),
      rowsPerPage: _rowsPerPage,

      // Default - do nothing, autoRows - goToLast, other - goToFirst
      // pageSyncApproach: getCurrentRouteOption(context) == dflt
      //     ? PageSyncApproach.doNothing
      //     : getCurrentRouteOption(context) == autoRows
      //     ? PageSyncApproach.goToLast
      //     : PageSyncApproach.goToFirst,
      minWidth: 800,
      fit: FlexFit.tight,

      onRowsPerPageChanged: (value) {
        // No need to wrap into setState, it will be called inside the widget
        // and trigger rebuild
        //setState(() {
        print('Row per page changed to $value');
        _rowsPerPage = value!;
        //});
      },
      initialFirstRowIndex: 3,
      onPageChanged: (rowIndex) {
        //print(rowIndex / _rowsPerPage);
      },
      sortColumnIndex: _sortColumnIndex,
      sortAscending: _sortAscending,
      sortArrowIcon: Icons.keyboard_arrow_up,
      sortArrowAnimationDuration: const Duration(milliseconds: 0),
      //
      // when select all
      //
      // onSelectAll: (select) => select != null && select
      //     ? (getCurrentRouteOption(context) != selectAllPage
      //     ? _dessertsDataSource!.selectAll()
      //     : _dessertsDataSource!.selectAllOnThePage())
      //     : (getCurrentRouteOption(context) != selectAllPage
      //     ? _dessertsDataSource!.deselectAll()
      //     : _dessertsDataSource!.deselectAllOnThePage()),
      controller: _controller,
      // hidePaginator: getCurrentRouteOption(context) == custPager,
      hidePaginator: false,
      columns: _columns,
      // empty: Center(
      //     child: Container(
      //         padding: const EdgeInsets.all(20),
      //         color: Colors.grey[200],
      //         child: const Text('No data'))
      // ),
      loading: _Loading(),
      errorBuilder: (e) => _ErrorAndRetry(
          e.toString(), () => _dessertsDataSource!.refreshDatasource()),
      source: _dessertsDataSource!,
    );

    // if (getCurrentRouteOption(context) == custPager)
    //   Positioned(bottom: 16, child: CustomPager(_controller))
    // ]);
  }
}

class _ErrorAndRetry extends StatelessWidget {
  const _ErrorAndRetry(this.errorMessage, this.retry);

  final String errorMessage;
  final void Function() retry;

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
            padding: const EdgeInsets.all(10),
            height: 70,
            color: Colors.red,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Oops! $errorMessage',
                      style: const TextStyle(color: Colors.white)),
                  TextButton(
                      onPressed: retry,
                      child:
                          const Row(mainAxisSize: MainAxisSize.min, children: [
                        Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                        Text('Retry', style: TextStyle(color: Colors.white))
                      ]))
                ])),
      );
}

class DessertDataSourceAsync extends AsyncDataTableSource {
  Map<String, dynamic>? data;

  DessertDataSourceAsync(data) {
    this.data = data;
  }

  DessertDataSourceAsync.empty() {
    _empty = true;
    print('DessertDataSourceAsync.empty created');
  }

  DessertDataSourceAsync.error() {
    _errorCounter = 0;
    print('DessertDataSourceAsync.error created');
  }

  bool _empty = false;
  int? _errorCounter;

  RangeValues? _caloriesFilter;

  RangeValues? get caloriesFilter => _caloriesFilter;

  set caloriesFilter(RangeValues? calories) {
    _caloriesFilter = calories;
    refreshDatasource();
  }

  String _sortColumn = "name";
  bool _sortAscending = true;

  void sort(String columnName, bool ascending) {
    _sortColumn = columnName;
    _sortAscending = ascending;
    refreshDatasource();
  }

  getTotalRecords() {
    return 20;
    // return Future<int>.delayed(
    //     const Duration(milliseconds: 0), () => _empty ? 0 : _dessertsX3.length);
  }

  @override
  Future<AsyncRowsResponse> getRows(int start, int end) async {
    print('getRows($start, $end)');
    if (_errorCounter != null) {
      _errorCounter = _errorCounter! + 1;

      if (_errorCounter! % 2 == 1) {
        await Future.delayed(const Duration(milliseconds: 1000));
        throw 'Error #${((_errorCounter! - 1) / 2).round() + 1} has occured';
      }
    }

    var index = start;
    final format = NumberFormat.decimalPercentPattern(
      locale: 'en',
      decimalDigits: 0,
    );
    assert(index >= 0);
    _empty = false;

    int i = 0;
    List<DataRow> lis = [
      for (ItemSearchResultModel dessert in data!['data'])
        DataRow(
          key: ValueKey<int>(i++),
          //  key: ValueKey<int>(dessert.id as int),
          //   selected: dessert.selected,
          //    onSelectChanged: (value) {
          //      if (value != null) {
          //        setRowSelection(ValueKey<int>(dessert.id), value);
          //      }
          //    },

          cells: [
            DataCell(Container(
                child: Text(
              'x',
              softWrap: false,
            ))),
            DataCell(Text(dessert.l1_khachhangId!.makhachhang!.toString())),
            DataCell(Text(dessert.mahopdong!.toString())),
            DataCell(Text(dessert.tenhopdong!.toString())),
            DataCell(Text(dessert.tenhopdong!.toString())),
            DataCell(Text(dessert.tenhopdong!.toString())),
            DataCell(Text(dessert.tenhopdong!.toString())),
            DataCell(Text(dessert.tenhopdong!.toString())),
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
            )),
          ],
        ),
    ];

    // List<DataRow> lis = data!['data'].map((ItemSearchResultModel dessert) {
    //   return DataRow(
    //     //key: ValueKey<int>(1),
    //     //  key: ValueKey<int>(dessert.id as int),
    //     //   selected: dessert.selected,
    //     //    onSelectChanged: (value) {
    //     //      if (value != null) {
    //     //        setRowSelection(ValueKey<int>(dessert.id), value);
    //     //      }
    //     //    },
    //
    //     cells: [
    //       DataCell(Container(
    //           child: Text(
    //             'x',
    //             softWrap: false,
    //           ))),
    //       DataCell(Text(dessert.l1_khachhangId!.makhachhang!.toString())),
    //       DataCell(Text(dessert.mahopdong!.toString())),
    //       DataCell(Text(dessert.tenhopdong!.toString())),
    //       DataCell(Text(dessert.tenhopdong!.toString())),
    //       DataCell(Text(dessert.tenhopdong!.toString())),
    //       DataCell(Text(dessert.tenhopdong!.toString())),
    //       DataCell(Text(dessert.tenhopdong!.toString())),
    //       DataCell(Row(
    //         children: [
    //           GestureDetector(
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                   color: Colors.blue,
    //                   borderRadius: BorderRadius.all(Radius.circular(2.0)),
    //                 ),
    //                 padding: EdgeInsets.all(3.0),
    //                 child: Text(
    //                   'Nâng cấp',
    //                   style: TextStyle(color: Colors.white),
    //                 ),
    //               )),
    //           SizedBox(
    //             width: 5.0,
    //           ),
    //           GestureDetector(
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                   color: Colors.green,
    //                   borderRadius: BorderRadius.all(Radius.circular(2.0)),
    //                 ),
    //                 padding: EdgeInsets.all(3.0),
    //                 child: Text(
    //                   'Cập nhật',
    //                   style: TextStyle(color: Colors.white),
    //                 ),
    //               )),
    //         ],
    //       )),
    //     ],
    //   );
    // }).toList<DataRow>();
    var r = AsyncRowsResponse(
      20,
      lis,
    );

    return r;
  }
}

class _Loading extends StatefulWidget {
  @override
  __LoadingState createState() => __LoadingState();
}

class __LoadingState extends State<_Loading> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: Colors.white.withAlpha(128),
        // at first show shade, if loading takes longer than 0,5s show spinner
        child: FutureBuilder(
            future:
                Future.delayed(const Duration(milliseconds: 500), () => true),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const SizedBox()
                  : Center(
                      child: Container(
                      color: Colors.yellow,
                      padding: const EdgeInsets.all(7),
                      width: 150,
                      height: 50,
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.black,
                            ),
                            Text('Loading..')
                          ]),
                    ));
            }));
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
                // GestureDetector(
                //    child: Container(
                //   padding: EdgeInsets.all(3.0),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(3.0)),
                //     color: Colors.blue,
                //   ),
                //   child: Icon(
                //     Icons.refresh,
                //     color: Colors.white,
                //   ),
                // )),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      ref.read(capnhatProvider.notifier).onSearch('web');
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
