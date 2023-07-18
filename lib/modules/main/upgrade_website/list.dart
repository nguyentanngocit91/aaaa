import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../core/utils/ndgap.dart';

class UpgradeWebListLayout extends StatelessWidget {
  const UpgradeWebListLayout() : super(key: const Key(pathName));

  static const String pathName = 'nang-cap-website';

  @override
  Widget build(BuildContext context) {
    double hozSpacingWrap = 30;
    double verSpacingWrap = 20;
    String typeHD = 'web';

    return Scaffold(
      body:listData(),
      // SingleChildScrollView(
      //
      //   child: listData(),
      // )
      // ListView(
      //     shrinkWrap: false,
      //
      //   children: [
      //
      //    // heading1('TÌM KIẾM THÔNG TIN'),
      //    // ndGapH8(),
      //    // filter(),
      //    // ndGapH8(),
      //    // heading1('TÌM KIẾM WEBSITE'),
      //
      //
      //
      //
      //   ],
      // ),
    );



  }



}
Widget listData() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        columns: [
          DataColumn2(
            label: Text('Column A'),
            size: ColumnSize.L,
          ),
          DataColumn(
            label: Text('Column B'),
          ),
          DataColumn(
            label: Text('Column C'),
          ),
          DataColumn(
            label: Text('Column D'),
          ),
          DataColumn(
            label: Text('Column NUMBERS'),
            numeric: true,
          ),
        ],
        rows: List<DataRow>.generate(
            5,
                (index) => DataRow(cells: [
              DataCell(Text('A' * (10 - index % 10))),
              DataCell(Text('B' * (10 - (index + 5) % 10))),
              DataCell(Text('C' * (15 - (index + 5) % 10))),
              DataCell(Text('D' * (15 - (index + 10) % 10))),
              DataCell(Text(((index + 0.1) * 25.4).toString()))
            ]))),
  );



}

  Widget filter(){
    return  Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.all(Radius.circular(5.0)),
        color: Colors.black.withOpacity(0.1),
      ),
      child:  Row(
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
                        textForm('Mã khách hàng'),

                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 10,
                      children: [
                        textForm('Mã hợp đồng'),

                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    flex: 2,
                    child: Wrap(
                      runSpacing: 10,
                      children: [
                        textForm('Tên hợp đồng'),

                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 10,
                      children: [

                        textForm('Email'),
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
                const SizedBox(width: 20,),
                GestureDetector(

                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        color: Colors.blue,
                      ),
                      child: Icon(Icons.refresh,color: Colors.white,),
                    )
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        color: Colors.blue,
                      ),
                      child: Icon(Icons.search,color: Colors.white,),
                    )
                )

              ],
            ),
          ),
        ],
      ),
    );
  }



