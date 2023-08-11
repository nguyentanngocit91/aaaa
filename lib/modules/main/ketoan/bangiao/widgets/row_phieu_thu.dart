import 'package:flutter/material.dart';
import '../../../../../_shared/utils/helper.dart';
import '../models/ban_giao_model.dart';
import 'item_row_info.dart';
import 'rich_text_info.dart';

class RowPhieuThu extends StatelessWidget {
  const RowPhieuThu({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Phieuthus item;

  @override
  Widget build(BuildContext context) {

     String? soPhieuThu = item.maphieuthu;
     String maHD = '';
     String maKH = '';
     String? ngayNop = item.ngaynopcty;
     String? loaiPhieuThu = item.loaiphieuthu;
     double? phiWeb = item.phiweb;
     double? phiNCWeb = item.phinangcapweb;
     double? phiHosting = item.phihosting;
     double? phiNCHosting = item.phinangcaphosting;
     double? phiDomain = item.phitenmien;
     double? phiApp = item.phiapp;
     String tenKD ='';
     String maNV = '';
     String phong = '';
     String khuVuc = '';
     String hhtt = '';
     double? tongThu = item.tongtien;
     String? ghiChu = item.ghichu;
     bool isBanGiao = false;

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
                    content: (soPhieuThu!=null)?soPhieuThu:'',
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
                    content: ngayNop.toString(),
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  colorBG: Colors.black.withOpacity(0.05),
                  lastColum: true,
                  child: RichTextInfo(
                    title: 'Loại phiếu',
                    content: loaiPhieuThu.toString(),
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
                    content: Helper.numberFormat(phiWeb!),
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  child: RichTextInfo(
                    title: 'Phí NC web',
                    content: Helper.numberFormat(phiNCWeb!),
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  child: RichTextInfo(
                    title: 'Phí hosting',
                    content: Helper.numberFormat(phiHosting!),
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  child: RichTextInfo(
                    title: 'Phí NC hosting',
                    content: Helper.numberFormat(phiNCHosting!),
                  ),
                ),
              ),
              Expanded(
                child: ItemRowInfo(
                  lastColum: true,
                  child: RichTextInfo(
                    title: 'Phí domain',
                    content: Helper.numberFormat(phiDomain!),
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
                      content: Helper.numberFormat(phiApp!),
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
                      content: Helper.numberFormat(tongThu!),
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
                      content: ghiChu.toString(),
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
