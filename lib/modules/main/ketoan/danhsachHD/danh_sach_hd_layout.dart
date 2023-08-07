
import 'package:bs_flutter_alert/bs_flutter_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nn_phanmem/modules/main/ketoan/danhsachHD/screen/capnhat_hopdong_screen.dart';
import 'package:nn_phanmem/modules/main/ketoan/danhsachHD/screen/capnhat_thongtin_kh_screen.dart';
import 'package:nn_phanmem/modules/main/ketoan/danhsachHD/screen/ds_phieuthu_screen.dart';
import 'package:nn_phanmem/modules/main/ketoan/danhsachHD/screen/them_hopdong_moi.dart';
import 'package:nn_phanmem/modules/main/ketoan/danhsachHD/screen/them_phieuthu_screen.dart';

import '../../../../_shared/utils/helper.dart';
import '../../../../_shared/utils/ndgap.dart';
import '../../../../_shared/utils/show_ok_alert_dialog.dart';
import 'models/searchcustomer_model.dart';
import 'models/searchcustomercontract_model.dart';
import 'providers/ds_hd_provider.dart';


class DanhSachHDLayout extends ConsumerWidget {
  const DanhSachHDLayout():super(key:const Key(pathName));
  static const String pathName = 'danh-sach-hd';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          heading1('TÌM KIẾM THÔNG TIN'),
          ndGapH8(),
          FilterHD(),
          ndGapH8(),
          heading1('THÔNG TIN KHÁCH HÀNG'),

         DaTaThongTinKH(),

          heading1('THÔNG TIN HỢP ĐỒNG'),

          DaTaThongTinHD(),


        ],

      ),
    );
  }
}




class DaTaThongTinKH extends ConsumerWidget {
  DaTaThongTinKH({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    var data = ref.watch(dshdProvider.select((value) => value.result));
print("${data?.length}+ppppp");
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF105A6C),
            ),
            child: const Row(
              children: [
                Expanded(
                    flex:1,
                    child: HeaderRowItem(text: '#')),
                Expanded(
                  flex:3,
                  child: HeaderRowItem(text: 'Mã KH'),
                ),

                Expanded(
                  flex:3,
                  child: HeaderRowItem(text: 'Tên KH'),
                ),
                Expanded(
                  flex:3,
                  child: HeaderRowItem(text: 'Tên HĐ'),
                ),
                Expanded(
                  flex:6,
                  child: HeaderRowItem(text: 'Email'),
                ),

                Expanded(
                  flex:7,
                  child: HeaderRowItem(text: 'Ghi chú'),
                ),
                Expanded(
                  flex:4,
                  child: HeaderRowItem(text: 'Thao tác'),
                ),



              ],
            ),
          ),
          if(data!=null && data!.length>0)...[

            if(data['status']==true)...[
              SelectionArea(child:  InfoListCustomer(item:data['khachhang'], index: 1,),),

            ] else ...[

              BsAlert(
                closeButton: false,
                margin: EdgeInsets.only(bottom: 10.0),
                style: BsAlertStyle.danger,
                child: Text('Không tìm thấy thông tin khách hàng ! Vui lòng kiểm tra lại !!!', textAlign: TextAlign.center),
              ),

            ]
          ] else ...[

            BsAlert(
              closeButton: false,
              margin: EdgeInsets.only(bottom: 10.0),
              style: BsAlertStyle.danger,
              child: Text('Vui lòng nhập thông tin cần tìm !!!', textAlign: TextAlign.center),
            ),

          ],



        ],
      ),
    );
  }
}



class DaTaThongTinHD extends ConsumerWidget {
  DaTaThongTinHD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var data = ref.watch(dshdProvider.select((value) => value.result));
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF105A6C),
            ),
            child: const Row(
              children: [
                Expanded(
                    flex:1,
                    child: HeaderRowItem(text: '#')),
                Expanded(
                  flex:3,
                  child: HeaderRowItem(text: 'Mã KH'),
                ),

                Expanded(
                  flex:4,
                  child: HeaderRowItem(text: 'Mã HĐ'),
                ),


                Expanded(
                  flex:6,
                  child: HeaderRowItem(text: 'Tên HĐ'),
                ),

                Expanded(
                  flex:4,
                  child: HeaderRowItem(text: 'Giá trị'),
                ),
                Expanded(
                  flex:6,
                  child: HeaderRowItem(text: 'Ngày khởi tạo'),
                ),


                Expanded(
                  flex:4,
                  child: HeaderRowItem(text: 'Thao tác'),
                ),

              ],
            ),
          ),
          if(data!=null)...[


            if(data['hopdongs'].length>0)...[

              ListView.builder(
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  itemCount: data['hopdongs'].length,
                  itemBuilder: (BuildContext context, index) {
                    return SelectionArea(child:InfoListContract(infoKH:data['khachhang'],item: data['hopdongs'][index], index: index+1,) ,);
                  }),
              // GeneratePagin(data['info']),

            ] else ...[



              BsAlert(
                closeButton: false,
                margin: EdgeInsets.only(bottom: 10.0),
                style: BsAlertStyle.danger,
                child: Text('Không tìm thấy thông tin hợp đồng ! Vui lòng kiểm tra lại !!!', textAlign: TextAlign.center),
              ),

            ]



          ] else ...[

            BsAlert(
              closeButton: false,
              margin: EdgeInsets.only(bottom: 10.0),
              style: BsAlertStyle.danger,
              child: Text('Vui lòng nhập thông tin cần tìm !!!', textAlign: TextAlign.center),
            ),

          ],
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
                      ref.refresh(dshdProvider.notifier).cancelSearch();

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

                     bool isError = false;
                      String maKH = controllerMAKH.text;
                      String maHD = controllerMAHD.text;
                      String tenHD = controllerTenHD.text;
                      String dienThoai = controllerDienThoai.text;
                      String email = controllerEmail.text;


                      if (maKH == '' &&
                          maHD == '' &&
                          tenHD == '' &&
                          dienThoai == '' &&
                          email == '' ) {
                        isError = true;
                        ShowOkAlertDialog.show(
                            context, 'Thông báo', 'Vui lòng nhập thông tin cần tìm');
                      }

                      if (isError == false) {
                        ref.read(dshdProvider.notifier).onSearch();
                      }


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



class HeaderRowItem extends StatelessWidget {
  const HeaderRowItem({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Color(0xFF105A6C),
      ),
      child: Text(text,textAlign: TextAlign.left,style: const TextStyle(color: Colors.white),),
    );
  }
}



class BodyRowItem extends StatelessWidget {
  const BodyRowItem(this.text);
  final Widget text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:7.0,bottom:7.0,left:15.0,right:15.0),
      decoration: const BoxDecoration(

      ),
      child: this.text,
    );
  }
}


class InfoListCustomer extends StatelessWidget {
  InfoListCustomer({Key? key, required this.item, required this.index}) : super(key: key);

  final SearchCustomerModel item;
  final int index;
  @override
  Widget build(BuildContext context) {

    return  Column(
        children: [


          Row(
            children: [
              Expanded(
                flex:1,
                child:  BodyRowItem(Text('$index')),
              ),
              Expanded(
                flex:3,
                child: BodyRowItem(Text(item.makhachhang!)),
              ),
              Expanded(
                flex:3,
                child: BodyRowItem(Text(item.hoten.toString()!)),
              ),
              Expanded(
                flex:3,
                child: BodyRowItem(Text(item.congty!)),
              ),
              Expanded(
                flex:6,
                child: BodyRowItem(Text(item.email!)),
              ),

              Expanded(
                flex:7,
                child: BodyRowItem(Text(item.ghichu.toString()!)),
              ),
              Expanded(
                  flex:4,
                  child: BodyRowItem(Column(
                    children: [

                      GestureDetector(

                        onTap: () {

                          context.go('/${ThemHopDongKyMoi.pathName}/${item.id.toString()}',);
                        },

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
                              return UpdateThongTinKHScreen(id: item.id.toString(),customerNumber: item.makhachhang.toString(),);
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          color: Color(0xFFF29596a),
                          child: Text("Cập nhật KH",style: TextStyle(color: Colors.white),),
                        ),
                      ),






                    ],
                  ),
                  )),


            ],
          ),
          const Divider(),

        ]
    );


  }
}


class InfoListContract extends StatelessWidget {
  InfoListContract({Key? key, required this.infoKH, required this.item, required this.index}) : super(key: key);

  final SearchCustomerModel infoKH;
  final SearchCustomerContractModel item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Row(
            children: [
              Expanded(
                flex:1,
                child:  BodyRowItem(Text('$index')),
              ),

              Expanded(
                flex:3,
                child: BodyRowItem(Text(infoKH.makhachhang!)),
              ),

              Expanded(
                flex:4,
                child: BodyRowItem(Text(item.mahopdong!)),
              ),

              Expanded(
                flex:6,
                child: BodyRowItem(Text(item.tenhopdong!)),
              ),
              Expanded(
                flex:4,
                child: BodyRowItem(Text(Helper.numberFormat(double.parse(item.tongtien.toString())))),
              ),
              Expanded(
                flex:6,
                child: BodyRowItem(Text(DateFormat('yMd').format(DateTime.parse(item.ngaykyhd.toString())))),
              ),
              Expanded(
                  flex:4,
                  child: BodyRowItem(Column(
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
                              return ThemPhieuThuScreen();
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
                              return DSPhieuThuScreen(id: item.id.toString(),);
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
                              return UpdateThongTinHopDongWidget(item:item,);
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          color: Color(0xFFF29596a),
                          child: Text("Cập nhật HĐ",style: TextStyle(color: Colors.white),),
                        ),
                      ),


                    ],
                  ),
                  )),


            ],
          ),
          const Divider(),
        ]
    );


  }
}


