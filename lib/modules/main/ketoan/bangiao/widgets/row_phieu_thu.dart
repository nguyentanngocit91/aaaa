import 'package:flutter/material.dart';
import '../../../../../_shared/utils/helper.dart';
import 'item_row_info.dart';
import 'rich_text_info.dart';

class RowPhieuThu extends StatelessWidget {
  const RowPhieuThu({
    Key? key,
    required this.soPhieuThu,
    required this.maHD,
    required this.maKH,
    required this.ngayNop,
    required this.loaiPhieuThu,
    this.phiWeb = 0,
    this.phiNCWeb = 0,
    this.phiHosting = 0,
    this.phiNCHosting = 0,
    this.phiDomain = 0,
    this.phiApp = 0,
    required this.tenKD,
    required this.maNV,
    required this.phong,
    required this.khuVuc,
    required this.hhtt,
    this.tongThu = 0,
    required this.ghiChu,
    this.isBanGiao = false,
  }) : super(key: key);

  final String soPhieuThu;
  final String maHD;
  final String maKH;
  final String ngayNop;
  final String loaiPhieuThu;
  final double phiWeb;
  final double phiNCWeb;
  final double phiHosting;
  final double phiNCHosting;
  final double phiDomain;
  final double phiApp;
  final String tenKD;
  final String maNV;
  final String phong;
  final String khuVuc;
  final String hhtt;
  final double tongThu;
  final String ghiChu;
  final bool isBanGiao;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFCCCCCC)),
        color: (isBanGiao) ? const Color(0xFFcaecfb) : Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.black.withOpacity(0.05),
                  child: RichTextInfo(
                    title: 'Số PT',
                    content: soPhieuThu,
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.black.withOpacity(0.05),
                  child: RichTextInfo(
                    title: 'Mã HĐ',
                    content: maHD,
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.black.withOpacity(0.05),
                  child: RichTextInfo(
                    title: 'Mã KH',
                    content: maKH,
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.black.withOpacity(0.05),
                  child: RichTextInfo(
                    title: 'Ngày nộp',
                    content: ngayNop,
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.black.withOpacity(0.05),
                  lastColum: true,
                  child: RichTextInfo(
                    title: 'Loại phiếu',
                    content: loaiPhieuThu,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ItemRowInfo(
                  child: RichTextInfo(
                    title: 'Phí web',
                    content: Helper.numberFormat(phiWeb),
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  child: RichTextInfo(
                    title: 'Phí NC web',
                    content: Helper.numberFormat(phiNCWeb),
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  child: RichTextInfo(
                    title: 'Phí hosting',
                    content: Helper.numberFormat(phiHosting),
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  child: RichTextInfo(
                    title: 'Phí NC hosting',
                    content: Helper.numberFormat(phiNCHosting),
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  lastColum: true,
                  child: RichTextInfo(
                    title: 'Phí domain',
                    content: Helper.numberFormat(phiDomain),
                  ),
                ),
              ),
            ],
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ItemRowInfo(
                    colorBG: Colors.black.withOpacity(0.05),
                    lastRow: true,
                    child: RichTextInfo(
                      title: 'Phí App',
                      content: Helper.numberFormat(phiApp),
                    ),
                  ),
                ),
                Expanded(
                  child: ItemRowInfo(
                    colorBG: Colors.black.withOpacity(0.05),
                    lastRow: true,
                    child: Wrap(
                      children: [
                        RichTextInfo(
                          title: 'Tên KD',
                          content: tenKD,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RichTextInfo(
                          title: 'Mã NV',
                          content: maNV,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RichTextInfo(
                          title: 'Phòng',
                          content: phong,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RichTextInfo(
                          title: 'KV',
                          content: khuVuc,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ItemRowInfo(
                    colorBG: Colors.black.withOpacity(0.05),
                    lastRow: true,
                    child: RichTextInfo(
                      title: 'PT Thanh toán',
                      content: hhtt,
                    ),
                  ),
                ),
                Expanded(
                  child: ItemRowInfo(
                    colorBG: Colors.black.withOpacity(0.05),
                    lastRow: true,
                    child: RichTextInfo(
                      title: 'Tổng thu',
                      content: Helper.numberFormat(tongThu),
                    ),
                  ),
                ),
                Expanded(
                  child: ItemRowInfo(
                    colorBG: Colors.black.withOpacity(0.05),
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
          ),
        ],
      ),
    );
  }
}
