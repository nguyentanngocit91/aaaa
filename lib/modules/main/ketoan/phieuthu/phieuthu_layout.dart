import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'screen/add_pendding_screen.dart';
import '../../../../_shared/utils/form_status.dart';
import 'widgets/box_search.dart';
import '../../../../_shared/utils/helper.dart';
import 'models/phieu_thu_model.dart';
import 'providers/phieu_thu_provider.dart';
import 'screen/update_phieuthu_screen.dart';

class PhieuThuLayout extends ConsumerStatefulWidget {
  const PhieuThuLayout({Key? key}) : super(key: const Key(pathName));
  static const String pathName = 'phieuthu';

  @override
  ConsumerState createState() => _PhieuThuLayoutState();
}
class _PhieuThuLayoutState extends ConsumerState<PhieuThuLayout> {

  @override
  initState() {
    super.initState();
    _init();
  }

  _init() async {
    await ref.read(phieuThuProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {

    final listPT = ref.watch(phieuThuProvider).listPhieuThu;
    var statusForm = ref.watch(phieuThuProvider).status;
    return SingleChildScrollView(
      child: Column(
        children: [
          BoxSearchPhieuThu(),
          const SizedBox(
            height: 20,
          ),

          (listPT.isNotEmpty)?Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF105A6C),
                ),
                child: const Row(
                  children: [
                    Expanded(flex: 2, child: HeaderRowItem(text: '#')),
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
              ListView.builder(
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  itemCount: listPT.length,
                  itemBuilder: (BuildContext context, index) {
                    return SelectionArea(
                      child: RowInfoPhieuThu(
                        item: listPT[index],
                        index: index + 1,
                      ),
                    );
                  })
            ],
          ): const SizedBox(),

          (statusForm == FormStatus.submissionInProgress)
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox(),
        ],
      ),
    );
  }
}

class RowInfoPhieuThu extends StatelessWidget {
  const RowInfoPhieuThu({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final PhieuThuModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    double? phiWeb = item.phiweb;
    double? phiNCWeb = item.phinangcapweb;
    double? phiHosting = item.phihosting;
    double? phiNCHosting = item.phinangcaphosting;
    double? phiDomain = item.phitenmien;
    bool? isPending = item.isPending;
    //String? ngayTao = item.ngaytao;
    String? ngayNop = item.ngaynopcty;
    String? maKhachHang = item.khachhangId?.makhachhang;
    String? maHopDong = item.hopdong?[0].mahopdong;
    String? maPhieuThu = item.maphieuthu;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration:BoxDecoration(
            color: (isPending != null && isPending)
                ? Colors.red.withOpacity(0.1)
                : Colors.transparent,
            border:const Border(bottom:BorderSide(width:1,color:Colors.black12))
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text('$index',style: AppTextStyles.defaultTextStyle,),
              ),
              Expanded(
                flex: 5,
                child: (ngayNop != null)
                    ? Text(DateFormat('yMd').format(DateTime.parse(ngayNop),
                ),style: AppTextStyles.defaultTextStyle,
                )
                    : const Text('-'),
              ),
              Expanded(
                flex: 5,
                child:
                    (maKhachHang != null) ? Text(maKhachHang,style: AppTextStyles.defaultTextStyle,) : const Text('-'),
              ),
              Expanded(
                flex: 5,
                child: (maHopDong != null)
                    ? Text(maHopDong.replaceAll(RegExp(r'[^0-9]'), ''),style: AppTextStyles.defaultTextStyle,)
                    : const Text('-'),
              ),
              Expanded(
                flex: 5,
                child:
                    (maPhieuThu != null) ? Text(maPhieuThu,style: AppTextStyles.defaultTextStyle,) : const Text('-'),
              ),
              Expanded(
                flex: 5,
                child: ShowMaNhanVien(
                  listNV: item.nhanvien,
                ),
              ),
              Expanded(
                flex: 10,
                child: ShowTenNhanVien(
                  listNV: item.nhanvien,
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
                    ? const Text('Tiền mặt',style: AppTextStyles.defaultTextStyle,)
                    : const Text('Chuyển khoản',style: AppTextStyles.defaultTextStyle,),
              ),
              Expanded(
                flex: 5,
                child: Text(Helper.numberFormat(item.tongtien!),style: AppTextStyles.defaultTextStyle,),
              ),
              Expanded(
                flex: 5,
                child: (phiWeb != null)
                    ? Text(Helper.numberFormat(phiWeb),style: AppTextStyles.defaultTextStyle,)
                    : const Text('0 đ'),
              ),
              Expanded(
                flex: 5,
                child: (phiNCWeb != null)
                    ? Text(Helper.numberFormat(phiNCWeb),style: AppTextStyles.defaultTextStyle,)
                    : const Text('0 đ'),
              ),
              Expanded(
                flex: 5,
                child: (phiHosting != null)
                    ? Text(Helper.numberFormat(phiHosting),style: AppTextStyles.defaultTextStyle,)
                    : const Text('0 đ'),
              ),
              Expanded(
                flex: 5,
                child: (phiNCHosting != null)
                    ? Text(Helper.numberFormat(phiNCHosting),style: AppTextStyles.defaultTextStyle,)
                    : const Text('0 đ'),
              ),
              Expanded(
                flex: 5,
                child: (phiDomain != null)
                    ? Text(Helper.numberFormat(phiDomain),style: AppTextStyles.defaultTextStyle,)
                    : const Text('0 đ'),
              ),
                Expanded(
              flex: 14,
              child: SelectionContainer.disabled(
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
                            const EdgeInsets.only(
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
                          return const Color(0xffeaf7e5);
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
                    const SizedBox(
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
                            const EdgeInsets.only(
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
                          return const Color(0xffeaf7e5);
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
            ),
            ],
          ),
        ),
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
                    return (hoTen != null) ? Text(hoTen,style: AppTextStyles.defaultTextStyle,) : const Text('-');
                  })
            ],
          )
        : const Text('-');
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
                        ? Text(maNhanVien,style: AppTextStyles.defaultTextStyle,)
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
                        ? Text(maPhongBan,style: AppTextStyles.defaultTextStyle,)
                        : const Text('-');
                  })
            ],
          )
        : const Text('-');
  }
}

class AppTextStyles {
  static const TextStyle defaultTextStyle = TextStyle(
    fontSize: 13,
    color: Colors.black,
    // Thêm các thuộc tính khác tùy theo yêu cầu
  );
}

