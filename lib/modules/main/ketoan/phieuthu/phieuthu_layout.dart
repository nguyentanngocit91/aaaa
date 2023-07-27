import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nn_phanmem/modules/main/ketoan/phieuthu/screen/add_pendding_screen.dart';
import 'widgets/box_search.dart';
import '../../../../_shared/utils/helper.dart';
import 'models/phieu_thu_model.dart';
import 'providers/phieu_thu_provider.dart';
import 'screen/update_phieuthu_screen.dart';
import 'widgets/pt_button.dart';

class PhieuThuLayout extends ConsumerWidget {
  PhieuThuLayout({Key? key}) : super(key: const Key(pathName));
  static const String pathName = 'phieuthu';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listPT = ref.watch(futureListPhieuThuProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          BoxSearchPhieuThu(),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF105A6C),
            ),
            child: const Row(
              children: [
                Expanded(flex: 1, child: HeaderRowItem(text: '#')),
                Expanded(
                  flex: 5,
                  child: HeaderRowItem(text: 'Ngày tháng'),
                ),
                Expanded(
                  flex: 5,
                  child: HeaderRowItem(text: 'Mã KH'),
                ),
                Expanded(
                  flex: 5,
                  child: HeaderRowItem(text: 'Mã HĐ'),
                ),
                Expanded(
                  flex: 5,
                  child: HeaderRowItem(text: 'Số PT'),
                ),
                Expanded(
                  flex: 5,
                  child: HeaderRowItem(text: 'Mã NV'),
                ),
                Expanded(
                  flex: 10,
                  child: HeaderRowItem(text: 'Tên NV'),
                ),
                Expanded(
                  flex: 10,
                  child: HeaderRowItem(text: 'Phòng'),
                ),
                Expanded(
                  flex: 5,
                  child: HeaderRowItem(text: 'Khu vực'),
                ),
                Expanded(
                  flex: 5,
                  child: HeaderRowItem(text: 'HTTT'),
                ),
                Expanded(
                  flex: 5,
                  child: HeaderRowItem(text: 'Tổng thu'),
                ),
                Expanded(
                  flex: 5,
                  child: HeaderRowItem(text: 'Phí web'),
                ),
                Expanded(
                  flex: 5,
                  child: HeaderRowItem(text: 'Phí NC web'),
                ),
                Expanded(
                  flex: 5,
                  child: HeaderRowItem(text: 'Phí hosting'),
                ),
                Expanded(
                  flex: 5,
                  child: HeaderRowItem(text: 'Phí NC hosting'),
                ),
                Expanded(
                  flex: 5,
                  child: HeaderRowItem(text: 'Phí domain'),
                ),
                Expanded(
                  flex: 14,
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
                      return RowInfoPhieuThu(
                        item: data[index],
                        index: index + 1,
                      );
                    });
              } else {
                return const Center(
                  child: Text('Data not found'),
                );
              }
            },
            error: (error, stackTrace) {
              return const Center(
                child: Text('Không load được dữ liệu!'),
              );
            },
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

class RowInfoPhieuThu extends StatelessWidget {
  RowInfoPhieuThu({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final PhieuThuModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    double? phiWeb;
    double? phiNCWeb;
    double? phiHosting = null;
    double? phiNCHosting = null;
    double? phiDomain = null;
    var listHD = item.hopdong;
    if (listHD != null) {
      for (var item in listHD) {
        if (item.loaihopdong != null && item.loaihopdong == 'web') {
          phiWeb = item.tongtien;
        }
        if (item.loaihopdong != null && item.loaihopdong == 'ncweb') {
          phiNCWeb = item.tongtien;
        }
        if (item.loaihopdong != null && item.loaihopdong == 'hosting') {
          phiHosting = item.tongtien;
        }
        if (item.loaihopdong != null && item.loaihopdong == 'nchosting') {
          phiNCHosting = item.tongtien;
        }
        if (item.loaihopdong != null && item.loaihopdong == 'domain') {
          phiDomain = item.tongtien;
        }
      }
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text('$index'),
            ),
            Expanded(
              flex: 5,
              child:
                  Text(DateFormat('yMd').format(DateTime.parse(item.ngaytao!))),
            ),
            Expanded(
              flex: 5,
              child: Text((item.khachhangId!.makhachhang)!),
            ),
            Expanded(
              flex: 5,
              child: Text((item.hopdong![0].mahopdong!)
                  .replaceAll(RegExp(r'[^0-9]'), '')),
            ),
            Expanded(
              flex: 5,
              child: Text(item.maphieuthu!),
            ),
            Expanded(
              flex: 5,
              child: ShowMaNhanVien(
                listNV: item.nhanvien!,
              ),
            ),
            Expanded(
              flex: 10,
              child: ShowTenNhanVien(
                listNV: item.nhanvien!,
              ),
            ),
            const Expanded(
              flex: 10,
              child: Text('Phòng'),
            ),
            Expanded(
              flex: 5,
              child: ShowKhuVuc(
                listNV: item.nhanvien!,
              ),
            ),
            Expanded(
              flex: 5,
              child: (item.httt == 'cod')
                  ? const Text('Tiền mặt')
                  : const Text('Chuyển khoản'),
            ),
            Expanded(
              flex: 5,
              child: Text(Helper.numberFormat(item.tongtien!)),
            ),
            Expanded(
              flex: 5,
              child: (phiWeb != null)
                  ? Text(Helper.numberFormat(phiWeb!))
                  : Text('0 đ'),
            ),
            Expanded(
              flex: 5,
              child: (phiNCWeb != null)
                  ? Text(Helper.numberFormat(phiNCWeb!))
                  : Text('0 đ'),
            ),
            Expanded(
              flex: 5,
              child: (phiHosting != null)
                  ? Text(Helper.numberFormat(phiHosting!))
                  : Text('0 đ'),
            ),
            Expanded(
              flex: 5,
              child: (phiNCHosting != null)
                  ? Text(Helper.numberFormat(phiNCHosting!))
                  : Text('0 đ'),
            ),
            Expanded(
              flex: 5,
              child: (phiDomain != null)
                  ? Text(Helper.numberFormat(phiDomain!))
                  : Text('0 đ'),
            ),
            Expanded(
              flex: 14,
              child: Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return const AddPenddingScreen();
                        },
                      );
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(
                              left: 15, right: 15, top: 0, bottom: 0)),
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color>((states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.white;
                        }
                        return Colors.white;
                      }),
                      overlayColor:
                          MaterialStateProperty.resolveWith<Color>((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.transparent;
                        }
                        return Color(0xffeaf7e5);
                      }),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Pendding',
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return const UpdatePhieuThuScreen();
                        },
                      );
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(
                              left: 15, right: 15, top: 0, bottom: 0)),
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color>((states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.white;
                        }
                        return Colors.white;
                      }),
                      overlayColor:
                          MaterialStateProperty.resolveWith<Color>((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.transparent;
                        }
                        return Color(0xffeaf7e5);
                      }),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Cập nhật',
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        )
                      ],
                    ),
                  ),
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
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
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
            itemBuilder: (context, index) {
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
            itemBuilder: (context, index) {
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
            itemBuilder: (context, index) {
              return Text(listNV[index].phongbanId!.maphongban!);
            })
      ],
    );
  }
}
