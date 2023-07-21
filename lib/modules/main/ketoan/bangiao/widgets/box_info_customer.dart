import 'package:flutter/material.dart';
import 'rich_text_info.dart';
import 'item_row_info.dart';

class BoxInfoCustomer extends StatelessWidget {
  const BoxInfoCustomer({
    super.key,
    required this.tenHD,
    required this.maKH,
    required this.nguoiDaiDien,
    required this.dienThoaiDiDong,
    required this.dienThoaiCoQuan,
    required this.email,
    required this.emailPhu,
    required this.daiDienMoi,
    required this.maSoThue,
    required this.cmnd,
    required this.diaChi,
    required this.ghiChu,
  });

  final String tenHD;
  final String maKH;
  final String nguoiDaiDien;
  final String dienThoaiDiDong;
  final String dienThoaiCoQuan;
  final String email;
  final String emailPhu;
  final String daiDienMoi;
  final String maSoThue;
  final String cmnd;
  final String diaChi;
  final String ghiChu;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFdcdbdb)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.white,
                  child: Wrap(
                    children: [
                      RichTextInfo(
                        title: 'Tên Cty/Cá nhân',
                        content: tenHD,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(' - '),
                      const SizedBox(
                        width: 5,
                      ),
                      RichTextInfo(
                        title: 'Mã khách hàng',
                        content: maKH,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.white,
                  lastColum: true,
                  child: RichTextInfo(
                    title: 'Tên khách hàng',
                    content: nguoiDaiDien,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.white,
                  child: RichTextInfo(
                    title: 'Điện thoại',
                    content: dienThoaiDiDong,
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.white,
                  lastColum: true,
                  child: RichTextInfo(
                    title: 'Cơ quan',
                    content: dienThoaiCoQuan,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.white,
                  child: RichTextInfo(
                    title: 'Email',
                    content: email,
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.white,
                  lastColum: true,
                  child: RichTextInfo(
                    title: 'Email phụ',
                    content: emailPhu,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.white,
                  child: RichTextInfo(
                    title: 'Người đại diện mới',
                    content: daiDienMoi,
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.white,
                  lastColum: true,
                  child: RichTextInfo(
                    title: 'Mã số thuế',
                    content: maSoThue,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.white,
                  child: RichTextInfo(
                    title: 'Mã số thuế',
                    content: maSoThue,
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.white,
                  lastColum: true,
                  child: RichTextInfo(
                    title: 'CMND',
                    content: cmnd,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.white,
                  lastRow: true,
                  child: RichTextInfo(
                    title: 'Địa chỉ',
                    content: diaChi,
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.white,
                  lastColum: true,
                  lastRow: true,
                  child: RichTextInfo(
                    title: 'Ghi chú',
                    content: ghiChu,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
