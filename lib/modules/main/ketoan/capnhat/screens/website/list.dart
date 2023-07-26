

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/gestures.dart';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl/intl.dart';

import '../../../../../../_shared/app_config/app.dart';
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
          MyHomePage(),
          // (data!=null)?PaginatedDataTableDemo(data:data!):Container(),
         // (data!=null)?HomeScreen(data:data!):Container(),

        ],
      ),
    );
  }
}








class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class x extends ConsumerStatefulWidget {
  const x({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _xState();
}

class _xState extends ConsumerState<x> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  ConsumerState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  var _rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;

  var _sortIndex = 0;
  var _sortAsc = true;
  final _searchController = TextEditingController();
  var _customFooter = false;

  @override
  void initState() {
    super.initState();
    _searchController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    var _source = ExampleSource(ref.watch(capnhatProvider.select((value) => value.result)));
    _source.setNextView();

    return  AdvancedPaginatedDataTable(
      addEmptyRows: false,

      source: _source,
      showHorizontalScrollbarAlways: true,
      sortAscending: _sortAsc,
      sortColumnIndex: _sortIndex,
      showFirstLastButtons: true,
      rowsPerPage: _rowsPerPage,
      availableRowsPerPage: const [10, 20, 30, 50],
      onRowsPerPageChanged: (newRowsPerPage) {
        if (newRowsPerPage != null) {
          setState(() {
            _rowsPerPage = newRowsPerPage;
          });
        }
      },
      columns: [
        DataColumn(
          label: const Text('ID'),
          numeric: true,
          onSort: setSort,
        ),
        DataColumn(
          label: const Text('Company'),
          onSort: setSort,
        ),
        DataColumn(
          label: const Text('First name'),
          onSort: setSort,
        ),
        DataColumn(
          label: const Text('Last name'),
          onSort: setSort,
        ),
        DataColumn(
          label: const Text('Phone'),
          onSort: setSort,
        ),
      ],
      //Optianl override to support custom data row text / translation
      getFooterRowText:
          (startRow, pageSize, totalFilter, totalRowsWithoutFilter) {
        final localizations = MaterialLocalizations.of(context);
        var amountText = localizations.pageRowsInfoTitle(
          startRow,
          pageSize,
          totalFilter ?? totalRowsWithoutFilter,
          false,
        );

        if (totalFilter != null) {
          //Filtered data source show addtional information
          amountText += ' filtered from ($totalRowsWithoutFilter)';
        }

        return amountText;
      },
      customTableFooter: _customFooter
          ? (source, offset) {
        const maxPagesToShow = 6;
        const maxPagesBeforeCurrent = 3;
        final lastRequestDetails = source.lastDetails!;
        final rowsForPager = lastRequestDetails.filteredRows ??
            lastRequestDetails.totalRows;
        final totalPages = rowsForPager ~/ _rowsPerPage;
        final currentPage = (offset ~/ _rowsPerPage) + 1;
        final List<int> pageList = [];
        if (currentPage > 1) {
          pageList.addAll(
            List.generate(currentPage - 1, (index) => index + 1),
          );
          //Keep up to 3 pages before current in the list
          pageList.removeWhere(
                (element) =>
            element < currentPage - maxPagesBeforeCurrent,
          );
        }
        pageList.add(currentPage);
        //Add reminding pages after current to the list
        pageList.addAll(
          List.generate(
            maxPagesToShow - (pageList.length - 1),
                (index) => (currentPage + 1) + index,
          ),
        );
        pageList.removeWhere((element) => element > totalPages);

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: pageList
              .map(
                (e) => TextButton(
              onPressed: e != currentPage
                  ? () {
                //Start index is zero based
                source.setNextView(
                  startIndex: (e - 1) * _rowsPerPage,
                );
              }
                  : null,
              child: Text(
                e.toString(),
              ),
            ),
          )
              .toList(),
        );
      }
          : null,
    );
  }

  // ignore: avoid_positional_boolean_parameters
  void setSort(int i, bool asc) => setState(() {
    _sortIndex = i;
    _sortAsc = asc;
  });
}

typedef SelectedCallBack = Function(String id, bool newSelectState);

class ExampleSource extends AdvancedDataTableSource<ItemSearchResultModel> {
  List<String> selectedIds = [];
  String lastSearchTerm = '';
  ExampleSource(this.data);
  final Map? data;
  @override
  DataRow? getRow(int index){

    // ItemSearchResultModel item = lastDetails![index];

    return DataRow(
      cells: [
        // DataCell(Text(id.toString())),
        // DataCell(Text(companyName)),
        // DataCell(Text(firstName)),
        // DataCell(Text(lastName)),
        // DataCell(Text(phone)),
      ],

    );

  }


  @override
  int get selectedRowCount => selectedIds.length;

  // ignore: avoid_positional_boolean_parameters
  void selectedRow(String id, bool newSelectState) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    notifyListeners();
  }

  void filterServerSide(String filterQuery) {
    lastSearchTerm = filterQuery.toLowerCase().trim();
    setNextView();
  }

  @override
  Future<RemoteDataSourceDetails<ItemSearchResultModel>> getNextPage(
      NextPageRequest pageRequest,
      ) async {


    // return RemoteDataSourceDetails(
    //   int.parse(data['totalRows'].toString()),
    //   (data['rows'] as List<dynamic>)
    //       .map(
    //         (json) => CompanyContact.fromJson(json as Map<String, dynamic>),
    //   )
    //       .toList(),
    //   filteredRows: lastSearchTerm.isNotEmpty
    //       ? (data['rows'] as List<dynamic>).length
    //       : null,
    // );


    //the remote data source has to support the pagaing and sorting
    final queryParameter = <String, dynamic>{
      'offset': pageRequest.offset.toString(),
      'pageSize': pageRequest.pageSize.toString(),
      'sortIndex': ((pageRequest.columnSortIndex ?? 0) + 1).toString(),
      'sortAsc': ((pageRequest.sortAscending ?? true) ? 1 : 0).toString(),
      if (lastSearchTerm.isNotEmpty) 'companyFilter': lastSearchTerm,
    };

    final requestUri = Uri.https(
      'example.devowl.de',
      '',
      queryParameter,
    );

    final response = await http.get(requestUri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // return RemoteDataSourceDetails(
      //   int.parse(data['totalRows'].toString()),
      //   (data['rows'] as List<dynamic>)
      //       .map(
      //         (json) => CompanyContact.fromJson(json as Map<String, dynamic>),
      //   )
      //       .toList(),
      //   filteredRows: lastSearchTerm.isNotEmpty
      //       ? (data['rows'] as List<dynamic>).length
      //       : null,
      // );

    } else {
      throw Exception('Unable to query remote server');
    }
  }
}




class CompanyContact {
  final int id;
  final String companyName;
  final String firstName;
  final String lastName;
  final String phone;

  const CompanyContact(
      this.id,
      this.companyName,
      this.firstName,
      this.lastName,
      this.phone,
      );

  DataRow getRow(
      SelectedCallBack callback,
      List<String> selectedIds,
      ) {
    return DataRow(
      cells: [
        DataCell(Text(id.toString())),
        DataCell(Text(companyName)),
        DataCell(Text(firstName)),
        DataCell(Text(lastName)),
        DataCell(Text(phone)),
      ],
      onSelectChanged: (newState) {
        callback(id.toString(), newState ?? false);
      },
      selected: selectedIds.contains(id.toString()),
    );
  }

  factory CompanyContact.fromJson(Map<String, dynamic> json) {
    return CompanyContact(
      json['id'] as int,
      json['companyName'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['phone'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyName': companyName,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
    };
  }
}

































class HomeScreen extends ConsumerStatefulWidget {
   HomeScreen({Key? key, required this.data}) : super(key: key);
  final Map<String, dynamic> data;
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late DataTableSource _data;
  @override
  void initState() {
    // TODO: implement initState
    _data =  MyData(widget.data,context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
            width: double.infinity,
          ),

          PaginatedDataTable(

            source: _data,
            header: const Text('My Products'),
            columns: _columns,
            columnSpacing: 10,
            horizontalMargin: 10,
            rowsPerPage: 10,
            showCheckboxColumn: false,
            onPageChanged: (value) {
              print(widget.data!['info']);
              ref.read(capnhatProvider.notifier).setPage(1,null);

            },
          ),
        ],
      );

  }
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data

  final List<Map<String, dynamic>> _data = List.generate(
      200,
          (index) => {
        "id": index,
        "title": "Item $index",
        "price": Random().nextInt(10000)
      });
  Map<String, dynamic>? data2;
  BuildContext? context;
  int currentPage = 0;
  MyData(this.data2,this.context);





  // InfoResponseModel info = widget.data['info'];
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;



  void setPage(number){
    this.currentPage = number;
  }
  @override
  DataRow getRow(int index) {
    ItemSearchResultModel item = this.data2!['data'][index];
    InfoResponseModel info = this.data2!['info'];
    print("currentPage  ${this.currentPage}");

    return DataRow(
        //color: item.mahopdong=='00000001w'?(MaterialStatePropertyAll(Colors.red)):null,
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
                      context: this.context!,
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
}








List<DataColumn> get _columns {
  return [
    DataColumn2(

      label: const Text(
        '#',
        style: TextStyle(color: Colors.red),
      ),



    ),
    DataColumn2(
      label: const Text(
        'Mã KH',
        style: TextStyle(color: Colors.red),
      ),
      // onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
      fixedWidth: 120,
    ),

    DataColumn2(
        label: const Text(
          'Mã HĐ',
          style: TextStyle(color: Colors.red),
        ),
        fixedWidth: 120,
        ),
    DataColumn2(
        label: const Text(
          'Email',
          style: TextStyle(color: Colors.red),
        ),
        fixedWidth: 240,
        size: ColumnSize.S),
    DataColumn2(
        label: const Text(
          'Ngày ký',
          style: TextStyle(color: Colors.red),
        ),
        fixedWidth: 120,
        size: ColumnSize.S),
    DataColumn2(
        label: const Text(
          'Chức năng',
          style: TextStyle(color: Colors.red),

        ),

        size: ColumnSize.L),
    DataColumn2(
        label: const Text(
          'Ghi chú',
          style: TextStyle(color: Colors.red),
        ),

        size: ColumnSize.L),
    DataColumn2(
      label: const Text(
        'Thao tác',
        style: TextStyle(color: Colors.red),
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

