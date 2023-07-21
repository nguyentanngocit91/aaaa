import 'package:flutter/material.dart';
import 'row_domain.dart';
import 'row_hosting.dart';
import 'row_website.dart';
import 'row_phieu_thu.dart';
import '../../../../../_shared/utils/helper.dart';
import '../../../../../_shared/utils/ndgap.dart';

class RowHopDong extends StatelessWidget {
  const RowHopDong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RowInfoHopDong(
          stt: 1,
          maKH: 'NN0818023',
          maHD: '0833023',
          tenHD: 'CÔNG TY TNHH ĐẦU TƯ BẤT ĐỘNG SẢN AN MINH PHÚC',
          giaTri: 5189900,
          giaTriWeb: 0,
          congNo: 0,
          ngayKhoiTao: '07/06/2023',
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
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF03a9f4)),
                    child: const Text(
                      'Xem file HĐ',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              ndGapH8(),
              const RowHosting(
                stt: 1,
                dungLuong: '5GB',
                ngayDangKy: '07/06/2023',
                ngayHetHan: '07/06/2024',
                trangThai: 'Ký mới',
              ),
              ndGapH8(),
              const RowWebsite(
                  stt: 1,
                  chucNang:
                      'CB-MOBILE- GIỎ HÀNG CB- SSL- ĐĂNG KÝ ĐĂNG NHẬP ĐÁNH GIÁ SAO- TÍNH PHI SHIP THEO GIA TỰ NHẬP- SẢN PHẨM SĂP RA MẮT BẢO VỀ EMAIL',
                  ngayKy: '07/06/2023'),
              ndGapH8(),
              const RowDomain(
                  stt: 1,
                  domain: 'nina.com.vn',
                  ngayDangKy: '19/07/2023',
                  ngayHetHan: '19/07/2024'),
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
              ndGapH8(),
              const RowPhieuThu(
                soPhieuThu: '2360660',
                maHD: '0833023',
                maKH: 'NN0818023',
                ngayNop: '07-06-2023',
                loaiPhieuThu: 'Phiếu thu',
                tenKD: 'NGUYỄN THỊ MAI',
                maNV: '29765',
                phong: 'Trọng',
                khuVuc: '5',
                hhtt: 'Tiền mặt',
                tongThu: 5189900,
                ghiChu: '',
              ),
              ndGapH8(),
              const RowPhieuThu(
                isBanGiao: true,
                soPhieuThu: '2360660',
                maHD: '0833023',
                maKH: 'NN0818023',
                ngayNop: '07-06-2023',
                loaiPhieuThu: 'Phiếu thu',
                tenKD: 'NGUYỄN THỊ MAI',
                maNV: '29765',
                phong: 'Trọng',
                khuVuc: '5',
                hhtt: 'Tiền mặt',
                tongThu: 5189900,
                ghiChu: '',
              ),
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
                      ),
                      child: Text(
                        'Đã In BGC'.toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10,),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF018e07),
                      ),
                      child: Text(
                        'Đã In BGW'.toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10,),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFff9800),
                      ),
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
              maHD,
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
