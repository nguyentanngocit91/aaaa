import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../_shared/utils/helper.dart';
import 'models/phieu_thu_model.dart';
import 'providers/phieu_thu_provider.dart';
import 'screen/update_phieuthu_screen.dart';
import 'widgets/pt_button.dart';

class PhieuThuLayout extends ConsumerWidget {
  PhieuThuLayout({Key? key}) : super(key: const Key(pathName));

  static const String pathName = 'phieuthu';

  TextEditingController dateInputFrom = TextEditingController();
  TextEditingController dateInputTo = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listPT = ref.watch(futureListPhieuThuProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFf5f5f5),
              border: Border.all(color: const Color(0xFFdcdbdb)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Số phiếu thu',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const SizedBox(
                  width: 130,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Mã HĐ',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: dateInputFrom,
                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        dateInputFrom.text =
                            formattedDate; //set output date to TextField value.
                      } else {}
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: dateInputTo,
                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        dateInputTo.text =
                            formattedDate; //set output date to TextField value.
                      } else {}
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                PtButton(
                  title: 'Tìm kiếm',
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 5,
                ),
                PtButton(
                  title: 'Export DS Phiếu Thu',
                  icon: const Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                  width: 200,
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 5,
                ),
                PtButton(
                  title: 'Export DS Pending',
                  icon: const Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                  width: 200,
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 5,
                ),
                PtButton(
                  title: 'Reset',
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
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
                  flex:5,
                  child: HeaderRowItem(text: 'Ngày tháng'),
                ),
                Expanded(
                  flex:5,
                  child: HeaderRowItem(text: 'Mã KH'),
                ),
                Expanded(
                  flex:5,
                  child: HeaderRowItem(text: 'Mã HĐ'),
                ),
                Expanded(
                  flex:5,
                  child: HeaderRowItem(text: 'Số PT'),
                ),
                Expanded(
                  flex:5,
                  child: HeaderRowItem(text: 'Mã NV'),
                ),
                Expanded(
                  flex:10,
                  child: HeaderRowItem(text: 'Tên NV'),
                ),
                Expanded(
                  flex:10,
                  child: HeaderRowItem(text: 'Phòng'),
                ),
                Expanded(
                  flex:5,
                  child: HeaderRowItem(text: 'Khu vực'),
                ),
                Expanded(
                  flex:5,
                  child: HeaderRowItem(text: 'HTTT'),
                ),
                Expanded(
                  flex:5,
                  child: HeaderRowItem(text: 'Tổng thu'),
                ),
                Expanded(
                  flex:5,
                  child: HeaderRowItem(text: 'Phí web'),
                ),
                Expanded(
                  flex:5,
                  child: HeaderRowItem(text: 'Phí NC web'),
                ),
                Expanded(
                  flex:5,
                  child: HeaderRowItem(text: 'Phí hosting'),
                ),
                Expanded(
                  flex:5,
                  child: HeaderRowItem(text: 'Phí NC hosting'),
                ),
                Expanded(
                  flex:5,
                  child: HeaderRowItem(text: 'Phí domain'),
                ),
                Expanded(
                  flex:14,
                  child: HeaderRowItem(text: 'Thao tác'),
                ),
              ],
            ),
          ),
          listPT.when(
            data: (List<PhieuThuModel>? data) {
              if (data != null) {
                return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    primary: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, index) {
                      return RowInfoPhieuThu(item: data[index], index: index+1,);
                    });
              } else {
                return const Center(
                  child: Text('Data not found'),
                );
              }
            },
            error: (error, stackTrace) {
              return const Center(child: Text('Không load được dữ liệu!'),);
            },
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

class RowInfoPhieuThu extends StatelessWidget{
  const RowInfoPhieuThu({Key? key, required this.item, required this.index,}) : super(key: key);

  final PhieuThuModel item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex:1,
                child:  Text('$index'),
            ),
            Expanded(
              flex:5,
              child: Text(DateFormat('yMd').format(DateTime.parse(item.ngaytao!))),
            ),
            Expanded(
              flex:5,
              child: Text((item.khachhangId!.makhachhang)!),
            ),
            Expanded(
              flex:5,
              child: Text((item.hopdong![0].mahopdong!).replaceAll(new RegExp(r'[^0-9]'),'')),
            ),
            Expanded(
              flex:5,
              child: Text(item.maphieuthu!),
            ),
            Expanded(
              flex:5,
              child: ShowMaNhanVien(listNV: item.nhanvien!,),
            ),
            Expanded(
              flex:10,
              child: ShowTenNhanVien(listNV: item.nhanvien!,),
            ),
            const Expanded(
              flex:10,
              child: Text('Phòng'),
            ),
            Expanded(
              flex:5,
              child: ShowKhuVuc(listNV: item.nhanvien!,),
            ),
            Expanded(
              flex:5,
              child: (item.httt=='cod')?const Text('Tiền mặt'):const Text('Chuyển khoản'),
            ),
            Expanded(
              flex:5,
              child: Text('${item.tongtien}'),
            ),
            const Expanded(
              flex:5,
              child: Text( 'Phí web'),
            ),
            const Expanded(
              flex:5,
              child: Text('Phí NC web'),
            ),
            const Expanded(
              flex:5,
              child: Text('Phí hosting'),
            ),
            const Expanded(
              flex:5,
              child: Text('Phí NC hosting'),
            ),
            const Expanded(
              flex:5,
              child: Text('Phí domain'),
            ),
            Expanded(
              flex:14,
              child: Row(
                children: [
                  TextButton(onPressed: (){}, child: Text('Pending'),),
                  TextButton(onPressed: (){}, child: Text('Cập nhật phiếu thu'),),
                ],
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}

class HeaderRowItem extends StatelessWidget {
  const HeaderRowItem({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Color(0xFF105A6C),
      ),
      child: Text(text,style: const TextStyle(color: Colors.white),),
    );
  }
}

class ShowTenNhanVien extends StatelessWidget {
  const ShowTenNhanVien({Key? key, required this.listNV}) : super(key: key);
  final List<Nhanvien> listNV;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listNV.length,
            shrinkWrap: true,
            itemBuilder: (context, index){
          return Text(listNV[index].hoten!);
        })
      ],
    );
  }
}

class ShowMaNhanVien extends StatelessWidget {
  const ShowMaNhanVien({Key? key, required this.listNV}) : super(key: key);
  final List<Nhanvien> listNV;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listNV.length,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return Text(listNV[index].manhanvien!);
            })
      ],
    );
  }
}

class ShowKhuVuc extends StatelessWidget {
  const ShowKhuVuc({Key? key, required this.listNV}) : super(key: key);
  final List<Nhanvien> listNV;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listNV.length,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return Text(listNV[index].phongbanId!.maphongban!);
            })
      ],
    );
  }
}