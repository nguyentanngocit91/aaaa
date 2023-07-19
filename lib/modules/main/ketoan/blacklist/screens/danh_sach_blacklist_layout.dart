import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class DanhSachBlacklistLayout extends StatefulWidget {
  const DanhSachBlacklistLayout({Key? key}) : super(key: const Key(pathName));

  static const String pathName = 'danh-sach-blacklist';

  @override
  State<DanhSachBlacklistLayout> createState() =>
      _DanhSachBlacklistLayoutState();
}

class _DanhSachBlacklistLayoutState extends State<DanhSachBlacklistLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Column(
          children: [
            Container(
              width:double.maxFinite,
              child:Text("ddd"),
              decoration:BoxDecoration(
                color:Color(0xfff5f5f5),
                border:Border.all(width:1,color:Color(0xffdcdbdb))
              ),
            ),
            Expanded(
              child:DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 600,
                  columns: const[
                    DataColumn2(
                      label: Text('#'),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text('Mã HĐ'),
                    ),
                    DataColumn(
                      label: Text('Ghi chú'),
                    ),

                    DataColumn(
                      label: Text('Thao tác'),

                    )
                  ],
                  rows: List<DataRow>.generate(
                      100,
                          (index) => DataRow(cells: [
                        DataCell(Text((index+1).toString())),
                        DataCell(Text('A' * (10 - index % 10))),
                        DataCell(Text('B' * (10 - (index + 5) % 10))),



                        DataCell( TextButton(onPressed:(){
                          print("row"+index.toString());
                        }, child:Container(child:Icon(Icons.close),),))
                      ]))),
            )
          ],
        ),
      ),
    );
  }
}



