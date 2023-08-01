import 'package:bs_flutter_alert/bs_flutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../_shared/mixins/form_ui_mixins.dart';
import '../../../../../_shared/utils/helper.dart';
import '../models/item_phieuthu_result_model.dart';
import '../providers/ds_hd_provider.dart';


class DSPhieuThuScreen extends ConsumerStatefulWidget {
  DSPhieuThuScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  ConsumerState<DSPhieuThuScreen> createState() => _DSPhieuThuScreenState();
}

class _DSPhieuThuScreenState extends ConsumerState<DSPhieuThuScreen> with FormUIMixins {
  bool isLoading = true;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,() async {
      await ref.read(dshdProvider.notifier).getDSPhieuThuById(widget.id);
    });
  }


  Widget build(BuildContext context) {
    var listPT = ref.watch(dshdProvider.select((value) => value.listPhieuThu));
    print("${listPT?.length}++++data ItemPhieuthuResultModel");
    return  SimpleDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(0),
      insetPadding: EdgeInsets.all(30),
      elevation: 0,

      children: [
        Stack(
          children: [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Danh Sách Phiếu Thu'.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 14.0,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close, color: Colors.red,weight: 20,size: 25),
                  ),
                ),
              ),
            ),


          ],
        ),

        const Divider(),

        Container(
          padding: const EdgeInsets.all(20),
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
                      child: HeaderRowItem(text: 'Ngày tháng'),
                    ),

                    Expanded(
                      flex:3,
                      child: HeaderRowItem(text: 'Mã KH'),
                    ),

                    Expanded(
                      flex:3,
                      child: HeaderRowItem(text: 'Mã HĐ'),
                    ),


                    Expanded(
                      flex:3,
                      child: HeaderRowItem(text: 'Số PT'),
                    ),

                    Expanded(
                      flex: 3,
                      child: HeaderRowItem(text: 'Mã NV'),
                    ),


                    Expanded(
                      flex:3,
                      child: HeaderRowItem(text: 'Tên NV'),
                    ),

                    Expanded(
                      flex: 3,
                      child: HeaderRowItem(text: 'Phòng'),
                    ),


                    Expanded(
                      flex: 2,
                      child: HeaderRowItem(text: 'Khu vực'),
                    ),

                    Expanded(
                      flex: 3,
                      child: HeaderRowItem(text: 'HTTT'),
                    ),

                    Expanded(
                      flex: 3,
                      child: HeaderRowItem(text: 'Tổng thu'),
                    ),

                    Expanded(
                      flex: 3,
                      child: HeaderRowItem(text: 'Phí web'),
                    ),
                    Expanded(
                      flex: 3,
                      child: HeaderRowItem(text: 'Phí NC web'),
                    ),
                    Expanded(
                      flex: 3,
                      child: HeaderRowItem(text: 'Phí hosting'),
                    ),
                    Expanded(
                      flex: 3,
                      child: HeaderRowItem(text: 'Phí NC hosting'),
                    ),
                    Expanded(
                      flex: 3,
                      child: HeaderRowItem(text: 'Phí domain'),
                    ),


                    Expanded(
                      flex:4,
                      child: HeaderRowItem(text: 'Ghi chú'),
                    ),



                  ],
                ),
              ),



              if(listPT.isNotEmpty)...[

                SizedBox(
                    height: 200,
                    width: double.maxFinite,
                      child:SingleChildScrollView(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: true,
                            itemCount: listPT.length,
                            itemBuilder: (BuildContext context, index) {
                              return ListPhieuThuContract(item:listPT[index] , index: index+1,);

                            }),
                      ),
                    ),

              ] else ...[
                const BsAlert(
                  closeButton: false,
                  margin: EdgeInsets.only(bottom: 10.0),
                  style: BsAlertStyle.danger,
                  child: Text('Không tìm thấy thông tin Phiếu Thu ! Vui lòng kiểm tra lại !!!', textAlign: TextAlign.center),
                ),

              ],

                Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.grey),
                    child: const Text(
                      'Thoát',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),


                  ]
                ),

            ],),
        ),


      ],

    );


  }

}




class ListPhieuThuContract extends StatelessWidget {
  ListPhieuThuContract({Key? key, required this.item, required this.index}) : super(key: key);
  final ItemPhieuthuResultModel item;
  final int index;
  @override
  Widget build(BuildContext context) {

    double? phiWeb = double.parse(item.phiweb.toString());
    double? phiNCWeb = double.parse(item.phinangcapweb.toString());
    double? phiHosting = double.parse(item.phihosting.toString());
    double? phiNCHosting = double.parse(item.phinangcaphosting.toString());
    double? phiDomain = double.parse(item.phitenmien.toString());
    bool? isPending = item.isPending;
    String? ngayNop = item.ngaynopcty;
    String? maKhachHang = item.khachhangId!.makhachhang.toString();
    String? maHopDong = item.hopdong?[0].mahopdong;
    String? maPhieuThu = item.maphieuthu;
    String? ghichu = item.ghichu;

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
                child:(ngayNop != null) ? BodyRowItem(Text(DateFormat('yMd').format(DateTime.parse(ngayNop)))): BodyRowItem(Text('-')) ,
              ),

              Expanded(
                flex: 3,
                child:
                (maKhachHang != null) ? BodyRowItem(Text(maKhachHang)) : BodyRowItem(const Text('-')),
              ),

              Expanded(
                flex: 3,
                child: (maHopDong != null)
                    ? BodyRowItem(Text(maHopDong.replaceAll(RegExp(r'[^0-9]'), '')))
                    : BodyRowItem(const Text('-')),
              ),

              Expanded(
                flex: 3,
                child:
                (maPhieuThu != null) ? BodyRowItem(Text(maPhieuThu)) : BodyRowItem(const Text('-')),
              ),

              Expanded(
                flex: 3,
                child: BodyRowItem(ShowMaNhanVien(
                  listNV: item.nhanvien,
                ),)
              ),


              Expanded(
                flex: 3,
                child: BodyRowItem(ShowTenNhanVien(
                  listNV: item.nhanvien,
                ),),
              ),

               Expanded(
                flex: 3,
                child: BodyRowItem(Text('Phòng'),),
              ),

              Expanded(
                flex: 3,
                child: BodyRowItem(ShowKhuVuc(
                  listNV: item.nhanvien!,
                ),),
              ),

              Expanded(
                flex: 3,
                child: (item.httt == 'cod')
                    ? BodyRowItem(const Text('Tiền mặt'))
                    : BodyRowItem(const Text('Chuyển khoản')),
              ),

              Expanded(
                flex:3,
                child: BodyRowItem(Text(Helper.numberFormat(double.parse(item.tongtien.toString())))),
              ),

              Expanded(
                flex: 3,
                child: (phiWeb != null)
                    ? BodyRowItem(Text(Helper.numberFormat(phiWeb)))
                    : BodyRowItem(const Text('0 đ')),
              ),

              Expanded(
                flex: 3,
                child: (phiNCWeb != null)
                    ? BodyRowItem(Text(Helper.numberFormat(phiNCWeb)))
                    : BodyRowItem(const Text('0 đ')),
              ),

              Expanded(
                flex: 3,
                child: (phiHosting != null)
                    ? BodyRowItem(Text(Helper.numberFormat(phiHosting)))
                    : BodyRowItem(const Text('0 đ')),
              ),

              Expanded(
                flex: 3,
                child: (phiNCHosting != null)
                    ? BodyRowItem(Text(Helper.numberFormat(phiNCHosting)))
                    : BodyRowItem(const Text('0 đ')),
              ),

              Expanded(
                flex: 3,
                child: (phiDomain != null)
                    ? BodyRowItem(Text(Helper.numberFormat(phiDomain)))
                    : BodyRowItem(const Text('0 đ')),
              ),

              Expanded(
                flex: 4,
                child:
                (ghichu != null) ? BodyRowItem(Text(ghichu)) : BodyRowItem(const Text('-')),
              ),


            ],
          ),

          const Divider(),
        ]
    );


  }
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





class ShowMaNhanVien extends StatelessWidget {
  const ShowMaNhanVien({Key? key, required this.listNV}) : super(key: key);
  final List<Nhanvien>? listNV;
  @override
  Widget build(BuildContext context) {
    final list = listNV;
    return (list != null)
        ? Wrap(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              String? maNhanVien = list[index].manhanvien;
              return (maNhanVien != null)
                  ? Text(maNhanVien)
                  : const Text('-');
            })
      ],
    )
        : const Text('-');
  }
}

class ShowKhuVuc extends StatelessWidget {
  const ShowKhuVuc({Key? key, required this.listNV}) : super(key: key);
  final List<Nhanvien>? listNV;
  @override
  Widget build(BuildContext context) {
    final list = listNV;
    return (list != null)
        ? Wrap(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              String? maPhongBan = list[index].phongbanId?.maphongban;
              return (maPhongBan != null)
                  ? Text(maPhongBan)
                  : const Text('-');
            })
      ],
    )
        : const Text('-');
  }
}


class ShowTenNhanVien extends StatelessWidget {
  const ShowTenNhanVien({Key? key, required this.listNV}) : super(key: key);
  final List<Nhanvien>? listNV;
  @override
  Widget build(BuildContext context) {
    final list = listNV;
    return (list != null)
        ? Wrap(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              String? hoTen = list[index].hoten;
              return (hoTen != null) ? Text(hoTen) : const Text('-');
            })
      ],
    )
        : const Text('-');
  }
}