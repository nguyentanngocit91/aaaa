import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nn_phanmem/modules/main/ketoan/danhsachHD/screen/update_thongtin_kh_screen.dart';

import '../../../../_shared/utils/ndgap.dart';


class DanhSachHDLayout extends StatelessWidget {
  const DanhSachHDLayout():super(key:const Key(pathName));
  static const String pathName = 'danh-sach-hd';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          heading1('TÌM KIẾM THÔNG TIN'),
          ndGapH8(),
          filter(),
          ndGapH8(),
          heading1('THÔNG TIN KHÁCH HÀNG'),

          SizedBox(
            height: 330,
            child:   Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: DataTable2(
                    dataRowHeight: 80,
                      horizontalMargin: 12,
                      columnSpacing: 10,
                      minWidth: 600,
                      headingRowColor: MaterialStateProperty.all(const Color(0xFFF29596a)),
                      headingTextStyle: const TextStyle(color: Colors.white),
                      columns: const [
                        DataColumn2(
                          label: Text('#'),
                          size: ColumnSize.S,
                        ),

                        DataColumn(
                          label: Text('Mã KH'),
                        ),
                        DataColumn(
                          label: Text('Tên KH'),
                        ),
                        DataColumn(
                          label: Text('Tên HĐ'),
                        ),
                        DataColumn(
                          label: Text('Email'),
                        ),
                        DataColumn2(
                          label: Text('Ghi chú'),
                          size: ColumnSize.L,
                        ),
                        DataColumn(
                          label: Text('Thao tác'),

                        ),
                      ],
                      rows: List<DataRow>.generate(
                          100,
                              (index) => DataRow(cells: [
                            DataCell(Text((index+1).toString())),
                            DataCell(Text('82350$index')),
                            DataCell(Text('Nguyen$index')),
                            DataCell(Text('Tu Huy A $index')),
                            DataCell(Text('abc$index@yahoo.com')),
                            DataCell(Text('faker $index')),

                           DataCell(

                               Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,

                                 children: [

                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      color: Color(0xFFF29596a),
                                      child: Text("Thêm HĐ ký mới",style: TextStyle(color: Colors.white),),
                                    ),
                                  ),

                             SizedBox(height: 3,),

                             GestureDetector(
                               onTap: () {
                                 showDialog<void>(
                                   context: context,
                                   barrierDismissible: false, // user must tap button!
                                   builder: (BuildContext context) {
                                     return UpdateThongTinKHScreen();
                                   },
                                 );
                               },
                               child: Container(
                                 padding: EdgeInsets.all(5),
                                 color: Color(0xFFF29596a),
                                 child: Text("Cập nhật KH",style: TextStyle(color: Colors.white),),
                               ),
                             ),

                                ],)),


                          ]))),
                ),
              ),
            ),
          ),

          heading1('THÔNG TIN HỢP ĐỒNG'),


          SizedBox(
            height: 500,
            child:   Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: DataTable2(
                      dataRowHeight: 150,
                      horizontalMargin: 12,
                      columnSpacing: 10,
                      minWidth: 600,
                      headingRowColor: MaterialStateProperty.all(const Color(0xFFF29596a)),
                      headingTextStyle: const TextStyle(color: Colors.white),
                      columns: const [
                        DataColumn2(
                          label: Text('#'),
                          size: ColumnSize.S,
                        ),

                        DataColumn(
                          label: Text('Mã KH'),
                        ),
                        DataColumn(
                          label: Text('Tên KH'),
                        ),
                        DataColumn(
                          label: Text('Tên HĐ'),
                        ),
                        DataColumn(
                          label: Text('Email'),
                        ),
                        DataColumn2(
                          label: Text('Ghi chú'),
                          size: ColumnSize.L,
                        ),
                        DataColumn(
                            label: Text('Thao tác'),

                        ),
                      ],
                      rows: List<DataRow>.generate(
                          100,
                              (index) => DataRow(cells: [
                            DataCell(Text((index+1).toString())),
                            DataCell(Text('82350$index')),
                            DataCell(Text('Nguyen$index')),
                            DataCell(Text('Tu Huy A $index')),
                            DataCell(Text('abc$index@yahoo.com')),
                            DataCell(Text('faker $index')),

                            DataCell(

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        color: Color(0xFFF29596a),
                                        child: Text("Mua thêm",style: TextStyle(color: Colors.white),),
                                      ),
                                    ),

                                    SizedBox(height:3,),

                                    GestureDetector(
                                      onTap: () {
                                        showDialog<void>(
                                          context: context,
                                          barrierDismissible: false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return UpdateThongTinKHScreen();
                                          },
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        color: Color(0xFFF29596a),
                                        child: Text("Thêm PT",style: TextStyle(color: Colors.white),),
                                      ),
                                    ),


                                    SizedBox(height:3,),

                                    GestureDetector(
                                      onTap: () {
                                        showDialog<void>(
                                          context: context,
                                          barrierDismissible: false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return UpdateThongTinKHScreen();
                                          },
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        color: Color(0xFFF29596a),
                                        child: Text("Ds Phiếu Thu",style: TextStyle(color: Colors.white),),
                                      ),
                                    ),


                                    SizedBox(height:3,),

                                    GestureDetector(
                                      onTap: () {
                                        showDialog<void>(
                                          context: context,
                                          barrierDismissible: false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return UpdateThongTinKHScreen();
                                          },
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        color: Color(0xFFF29596a),
                                        child: Text("Cập nhật HĐ",style: TextStyle(color: Colors.white),),
                                      ),
                                    ),


                                  ],)),


                          ]))),
                ),
              ),
            ),
          ),


        ],

      ),
    );
  }
}

Widget filter() {
  TextEditingController maKHController = TextEditingController();
  TextEditingController maHDController = TextEditingController();
  TextEditingController tenHDController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController =TextEditingController();
  String _searchResult = '';

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
                      // textForm('Mã KH',maKHController),
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
                      // textForm('Mã HĐ',maHDController),
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
                      // textForm('Tên HĐ',tenHDController),
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
                      // textForm('Điện thoại',phoneController),
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
                      // textForm('Email',emailController),
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
                onTap: () {
                  print("Reset load tìm kiếm");
                },
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      color: Color(0xFF3a819f),
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
                  print("Submit Tìm kiếm ${maKHController.text}");
                },
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      color: Color(0xFFF3a819f),
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
