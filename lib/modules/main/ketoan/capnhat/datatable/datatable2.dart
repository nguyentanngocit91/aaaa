// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';


import 'custom_pager.dart';
import 'data_sources.dart';

class AsyncPaginatedDataTable2Demo extends StatefulWidget {
   AsyncPaginatedDataTable2Demo({super.key, required this.data});
  final Map<String,dynamic>? data;
  @override
  AsyncPaginatedDataTable2DemoState createState() =>
      AsyncPaginatedDataTable2DemoState();
}

class AsyncPaginatedDataTable2DemoState
    extends State<AsyncPaginatedDataTable2Demo> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool _sortAscending = true;
  int? _sortColumnIndex;
  DessertDataSourceAsync? _dessertsDataSource;
  final PaginatorController _controller = PaginatorController();

  bool _dataSourceLoading = false;
  int _initialRow = 0;

  @override
  void didChangeDependencies() {
  //
  //   _dessertsDataSource ??= getCurrentRouteOption(context) == noData
  //       ? DessertDataSourceAsync.empty()
  //       : getCurrentRouteOption(context) == asyncErrors
  //       ? DessertDataSourceAsync.error()
  //       : DessertDataSourceAsync();
  //
  //   _dataSourceLoading = true;
  //
  //    if (getCurrentRouteOption(context) == goToLast) {
  //     _dataSourceLoading = true;
  //     _dessertsDataSource!.getTotalRecords().then((count) => setState(() {
  //       print("77777");
  //       _initialRow = count - _rowsPerPage;
  //       _dataSourceLoading = false;
  //     }));
  // }
  //   print(_dessertsDataSource);
  //   super.didChangeDependencies();


    // initState is to early to access route options, context is invalid at that stage
    print("_dessertsDataSource $_dessertsDataSource");
    _dessertsDataSource ??= getCurrentRouteOption(context) == noData
        ? DessertDataSourceAsync.empty()
        : getCurrentRouteOption(context) == asyncErrors
        ? DessertDataSourceAsync.error()
        : DessertDataSourceAsync();

    if (getCurrentRouteOption(context) == goToLast) {
      _dataSourceLoading = true;

      _dessertsDataSource!.getTotalRecords().then((count) => setState(() {
        _initialRow = count - _rowsPerPage;
        _dataSourceLoading = false;

      }));
    }
    print("_dessertsDataSource ${_dessertsDataSource.toString()}");
    super.didChangeDependencies();


  }

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
    _dessertsDataSource!.sort(columnName, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  void dispose() {
    _dessertsDataSource!.dispose();
    super.dispose();
  }

  List<DataColumn> get _columns {
    return [

      DataColumn2(
        label: const Text('#',style: TextStyle(color: Colors.white),),

        fixedWidth: 70,

      ),
      DataColumn2(
        label: const Text('Mã KH',style: TextStyle(color: Colors.white),),
        onSort: (columnIndex, ascending) => sort(columnIndex, ascending),

        fixedWidth: 150,

      ),
      DataColumn2(
        label: const Text('Mã HĐ',textAlign: TextAlign.left, style: TextStyle(color: Colors.white),),

        onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
        size: ColumnSize.S
      ),
      DataColumn2(
        label: const Text('Tên HĐ',style: TextStyle(color: Colors.white),),

        onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
          size: ColumnSize.L
      ),
      DataColumn2(
        label: const Text('Email',style: TextStyle(color: Colors.white),),

        onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
          size: ColumnSize.S
      ),
      DataColumn2(
        label: const Text('Ngày ký',style: TextStyle(color: Colors.white),),

        onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
          size: ColumnSize.S
      ),
      DataColumn2(
        label: const Text('Chức năng',style: TextStyle(color: Colors.white),),

        onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
          size: ColumnSize.L
      ),
      DataColumn2(
        label: const Text('Ghi chú',style: TextStyle(color: Colors.white),),

        onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
          size: ColumnSize.L
      ),
      DataColumn2(
        label: const Text('Thao tác',style: TextStyle(color: Colors.white),),

          size: ColumnSize.L,
        fixedWidth: 150,
        //onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
      ),
    ];
  }

  // Use global key to avoid rebuilding state of _TitledRangeSelector
  // upon AsyncPaginatedDataTable2 refreshes, e.g. upon page switches
  final GlobalKey _rangeSelectorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // Last ppage example uses extra API call to get the number of items in datasource
    if (_dataSourceLoading) return  CircularProgressIndicator();
    return Stack(alignment: Alignment.bottomCenter, children: [
      AsyncPaginatedDataTable2(
          headingRowColor:
          MaterialStateColor.resolveWith((states) => Theme.of(context).primaryColor),

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
          initialFirstRowIndex: _initialRow,
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
          empty: Center(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.grey[200],
                  child: const Text('No data'))
          ),
          loading: _Loading(),
          errorBuilder: (e) => _ErrorAndRetry(
              e.toString(), () => _dessertsDataSource!.refreshDatasource()),
          source: _dessertsDataSource!
      ),


      if (getCurrentRouteOption(context) == custPager)
        Positioned(bottom: 16, child: CustomPager(_controller))
    ]);
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
//
// class _TitledRangeSelector extends StatefulWidget {
//   const _TitledRangeSelector(
//       {super.key,
//         required this.onChanged,
//         this.title = "",
//         this.caption = "",
//         this.range = const RangeValues(0, 100)});
//
//   final String title;
//   final String caption;
//   final Duration titleToSelectorSwitch = const Duration(seconds: 2);
//   final RangeValues range;
//   final Function(RangeValues) onChanged;
//
//   @override
//   State<_TitledRangeSelector> createState() => _TitledRangeSelectorState();
// }
//
// class _TitledRangeSelectorState extends State<_TitledRangeSelector> {
//   bool _titleVisible = true;
//   RangeValues _values = const RangeValues(0, 100);
//
//   @override
//   void initState() {
//     super.initState();
//
//     _values = widget.range;
//
//     Timer(
//         widget.titleToSelectorSwitch,
//             () => setState(() {
//           _titleVisible = false;
//         }));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(alignment: Alignment.centerLeft, children: [
//       AnimatedOpacity(
//           opacity: _titleVisible ? 1 : 0,
//           duration: const Duration(milliseconds: 1000),
//           child: Align(
//               alignment: Alignment.centerLeft, child: Text(widget.title))),
//       AnimatedOpacity(
//           opacity: _titleVisible ? 0 : 1,
//           duration: const Duration(milliseconds: 1000),
//           child: SizedBox(
//               width: 340,
//               child: Theme(
//                   data: blackSlider(context),
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         DefaultTextStyle(
//                             style: const TextStyle(
//                                 fontSize: 15, color: Colors.black),
//                             child: Padding(
//                                 padding:
//                                 const EdgeInsets.symmetric(horizontal: 20),
//                                 child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         _values.start.toStringAsFixed(0),
//                                       ),
//                                       Text(
//                                         widget.caption,
//                                       ),
//                                       Text(
//                                         _values.end.toStringAsFixed(0),
//                                       )
//                                     ]))),
//                         SizedBox(
//                             height: 24,
//                             child: RangeSlider(
//                               values: _values,
//                               divisions: 9,
//                               min: widget.range.start,
//                               max: widget.range.end,
//                               onChanged: (v) {
//                                 setState(() {
//                                   _values = v;
//                                 });
//                                 widget.onChanged(v);
//                               },
//                             ))
//                       ]))))
//     ]);
//   }
// }
//
//


String getCurrentRouteOption(BuildContext context) {
  var isEmpty = ModalRoute.of(context) != null &&
      ModalRoute.of(context)!.settings.arguments != null &&
      ModalRoute.of(context)!.settings.arguments is String
      ? ModalRoute.of(context)!.settings.arguments as String
      : '';

  return isEmpty;
}
const noData = 'No data';
const asyncErrors = "Errors/Retries";
const goToLast = "Start at last page";
const custPager = 'Custom pager';