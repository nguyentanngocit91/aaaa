import 'package:flutter/material.dart';
import 'widgets/header_list_hop_dong.dart';
import 'widgets/box_info_customer.dart';
import 'widgets/row_hop_dong.dart';
import 'widgets/box_search.dart';

class BanGiaoLayout extends StatelessWidget {
  const BanGiaoLayout({Key? key}) : super(key: const Key(pathName));

  static const String pathName = 'bangiao';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BoxSearchBanGiao(),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Thông tin khách hàng'.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const BoxInfoCustomer(
            tenHD: 'Nguyễn Văn Lộc',
            maKH: 'NN1088523',
            nguoiDaiDien: 'Nguyễn Văn Lộc',
            dienThoaiDiDong: '0935937789',
            dienThoaiCoQuan: '',
            email: 'nguyenvanloc031098@gmail.com',
            emailPhu: '',
            daiDienMoi: '',
            maSoThue: '',
            cmnd: '241745980',
            diaChi:
                '62/2 Trương Văn Thành, Phường Hiệp Phú, Thành phố Thủ Đức, Thành phố Hồ Chí Minh',
            ghiChu: '',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Thông tin hợp đồng'.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: const Color(0xFFfbdfdf),
            child: const Column(
              children: [
                HeaderListHopDong(),
                RowHopDong(),
              ],
            ),
          )
        ],
      ),
    );
  }
}


