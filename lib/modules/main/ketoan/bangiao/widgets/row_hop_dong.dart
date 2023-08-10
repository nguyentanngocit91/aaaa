import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/ban_giao_model.dart';
import '../providers/list_file_provider.dart';
import 'list_file_of_hop_dong.dart';
import 'row_app.dart';
import 'row_domain.dart';
import 'row_hosting.dart';
import 'row_website.dart';
import 'row_phieu_thu.dart';
import '../../../../../_shared/utils/helper.dart';
import '../../../../../_shared/utils/ndgap.dart';

Map<String, String> statusHosting = {
  'kymoi': 'Ký mới',
  'phuhoi': 'Phục hồi',
  'nangcap': 'Nâng cấp',
  'chuyendoi': 'Chuyển đổi',
};


class RowHopDong extends StatelessWidget {
  const RowHopDong({Key? key, required this.index,required this.maKH, required this.item})
      : super(key: key);
  final int index;
  final String maKH;
  final BanGiaoModel item;

  @override
  Widget build(BuildContext context) {
    String? maHD = item.mahopdong;
    String? soHD = item.sohopdong;
    String? tenHD = item.tenhopdong;
    double? giaTri = item.tongtien;
    String? ngayKyHopDong = item.ngaykyhd;
    String? loaiHopDong = item.loaihopdong;

    String? ngayHetHan = item.ngayhethan;
    String? trangThaiHosting = statusHosting[item.trangthaiHosting];
    String? chucNang = item.chucnang;
    double? dungLuong = item.dungluong;

    List<Phieuthus>? listPhieuThu = item.phieuthus;

    print(listPhieuThu?.length);

    return Column(
      children: [
        RowInfoHopDong(
          stt: index,
          maKH: maKH,
          maHD: (maHD != null) ? maHD : '',
          tenHD: (tenHD != null) ? tenHD : '',
          giaTri: (giaTri != null) ? giaTri : 0.0,
          giaTriWeb: 0,
          congNo: 0,
          ngayKhoiTao: (ngayKyHopDong != null)
              ? DateFormat('dd-MM-yyyy').format(DateTime.parse(ngayKyHopDong))
              : '-',
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 5),
                      decoration: const BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Color(0xffff9800), width: 3))),
                      child: const Text(
                        'THÔNG TIN HỢP ĐỒNG',
                        style: TextStyle(
                            color: Color(0xFFe41d09),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,

                        barrierDismissible: true, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Danh sách file'.toUpperCase(),
                              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              actions: <Widget>[
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
                              ],
                              content: ListFileOfHopDong(soHopDong: (soHD!=null)?soHD:'',));
                        },
                      );
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF03a9f4)),
                    child: const SelectionContainer.disabled(
                      child: Text(
                        'Xem file HĐ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              ndGapH8(),
              (loaiHopDong != null && loaiHopDong == 'hosting')
                  ? RowHosting(
                      stt: 1,
                      dungLuong: (dungLuong!=null)?'${Helper.convertMBtoGB(dungLuong)}GB':'',
                      ngayDangKy: (ngayKyHopDong!=null)?DateFormat('dd-MM-yyyy').format(DateTime.parse(ngayKyHopDong)):'',
                      ngayHetHan: (ngayHetHan!=null)?DateFormat('dd-MM-yyyy').format(DateTime.parse(ngayHetHan)):'',
                      trangThai: (trangThaiHosting!=null)?trangThaiHosting:'',
                    )
                  : const SizedBox(),
              ndGapH8(),
              (loaiHopDong != null && loaiHopDong == 'web')
                  ?  RowWebsite(
                      stt: 1,
                      chucNang:
                      (chucNang!=null)?chucNang:'',
                      ngayKy: (ngayKyHopDong!=null)?DateFormat('dd-MM-yyyy').format(DateTime.parse(ngayKyHopDong)):'')
                  : const SizedBox(),
              ndGapH8(),
              (loaiHopDong != null && loaiHopDong == 'domain')
                  ? const RowDomain(
                      stt: 1,
                      domain: 'nina.com.vn',
                      ngayDangKy: '19/07/2023',
                      ngayHetHan: '19/07/2024')
                  : const SizedBox(),
              ndGapH8(),
              (loaiHopDong != null && loaiHopDong == 'app')
                  ? RowApp(
                      stt: 1,
                      chucNang:
                      (chucNang!=null)?chucNang:'',
                      ngayKy: (ngayKyHopDong!=null)?DateFormat('dd-MM-yyyy').format(DateTime.parse(ngayKyHopDong)):'')
                  : const SizedBox(),
              ndGapH8(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 5),
                      decoration: const BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Color(0xffff9800), width: 3))),
                      child: const Text(
                        'DANH SÁCH PHIẾU THU',
                        style: TextStyle(
                            color: Color(0xFFe41d09),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              (listPhieuThu!=null)?
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listPhieuThu.length,
                  itemBuilder: (context,index){
                return RowPhieuThu(
                 item: listPhieuThu[index],
                );
              }):const SizedBox(),


              ndGapH12(),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF018e07),
                          padding: const EdgeInsets.all(10)),
                      child: Text(
                        'Đã In BGC'.toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF018e07),
                          padding: const EdgeInsets.all(10)),
                      child: Text(
                        'Đã In BGW'.toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFff9800),
                          padding: const EdgeInsets.all(10)),
                      child: Text(
                        'In phiếu'.toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class RowInfoHopDong extends StatelessWidget {
  const RowInfoHopDong({
    super.key,
    required this.stt,
    required this.maKH,
    required this.maHD,
    required this.tenHD,
    required this.giaTri,
    required this.giaTriWeb,
    required this.congNo,
    required this.ngayKhoiTao,
  });
  final int stt;
  final String maKH;
  final String maHD;
  final String tenHD;
  final double giaTri;
  final double giaTriWeb;
  final double congNo;
  final String ngayKhoiTao;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Color(0xFF8a0607),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Text(stt.toString(),
                  style: const TextStyle(color: Colors.white))),
          Expanded(
            flex: 10,
            child: Text(maKH, style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            flex: 10,
            child: Text(
              maHD.toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            flex: 50,
            child: Text(tenHD, style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            flex: 10,
            child: Text(Helper.numberFormat(giaTri),
                style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            flex: 10,
            child: Text(Helper.numberFormat(giaTriWeb),
                style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            flex: 10,
            child: Text(Helper.numberFormat(congNo),
                style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            flex: 10,
            child:
                Text(ngayKhoiTao, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
