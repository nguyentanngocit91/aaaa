import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nn_phanmem/modules/main/ketoan/danhsachHD/screen/capnhat_hopdong_screen.dart';
import 'package:nn_phanmem/modules/main/ketoan/danhsachHD/screen/capnhat_thongtin_kh_screen.dart';

import '../../../../_shared/utils/ndgap.dart';
import 'providers/ds_hd_provider.dart';


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
          FilterHD(),
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
                                        child: Text("Thêm PT",style: TextStyle(color: Colors.white),),
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
                                        child: Text("Ds phiếu thu",style: TextStyle(color: Colors.white),),
                                      ),
                                    ),


                                    SizedBox(height: 3,),

                                    GestureDetector(
                                      onTap: () {
                                        showDialog<void>(
                                          context: context,
                                          barrierDismissible: false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return const UpdateThongTinHopDongWidget();
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


class FilterHD extends ConsumerWidget {
  const FilterHD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final controllerMAKH = TextEditingController();
    final controllerMAHD = TextEditingController();
    final controllerTenHD = TextEditingController();
    final controllerDienThoai = TextEditingController();
    final controllerEmail = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        color: Colors.black.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
           Expanded(
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
                          title: 'Mã KH',
                          onchange: (value) {
                            ref.read(dshdProvider.notifier).onChangeValue("MAKH", value);

                          },
                        controller: controllerMAKH,


                          ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      textForm(
                          title: 'Mã HĐ',
                          onchange: (value) {
                            ref.read(dshdProvider.notifier).onChangeValue("MAHD", value);

                          },
                          controller: controllerMAHD,),



                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Wrap(
                    runSpacing: 10,
                    children: [

                      textForm(
                          title: 'Tên HĐ',
                          onchange: (value) {
                            ref.read(dshdProvider.notifier).onChangeValue("TENHD", value);
                          },
                      controller: controllerTenHD,
                      ),
                    ],
                  ),
                ),


                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Wrap(
                    runSpacing: 10,
                    children: [

                      textForm(
                          title: 'Điện thoại',
                          onchange: (value) {

                            ref.read(dshdProvider.notifier).onChangeValue("DIENTHOAI", value);

                          },
                        controller: controllerDienThoai,

                      ),

                    ],
                  ),
                ),


                SizedBox(
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

                            ref.read(dshdProvider.notifier).onChangeValue("EMAIL", value);

                          },
                        controller: controllerEmail,

                      ),


                    ],
                  ),
                ),
              ],
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
                      controllerMAKH.clear();
                      controllerEmail.clear();
                      controllerDienThoai.clear();
                      controllerMAHD.clear();
                      controllerTenHD.clear();
                      ref.refresh(dshdProvider.notifier).onSearch("web");

                    },
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        color: Color(0xff930000),
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
                      ref.read(dshdProvider.notifier).onSearch("web");
                      print("Submit Tìm kiếm ");
                    },
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        color: Color(0xff930000),
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
Widget textForm({required String title, required onchange,required controller}){
  return TextFormField(

    controller: controller,
    onChanged: onchange,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      label: Text(title),
      fillColor: Colors.white,
      filled: true,
      border: InputBorder.none,
      hoverColor: Colors.white,
      hintStyle: const TextStyle(fontSize: 15),
      contentPadding:
      const EdgeInsets.only(left: 15, bottom: 5, top: 5, right: 15),
      hintText: title,),
    style: const TextStyle(fontSize: 13),
  );
}
