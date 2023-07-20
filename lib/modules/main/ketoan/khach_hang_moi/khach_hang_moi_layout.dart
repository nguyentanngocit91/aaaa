import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../_shared/mixins/form_ui_mixins.dart';
import '../../../../_shared/utils/ndgap.dart';

part 'widgets/ma_khach_hang_widget.dart';

part 'widgets/ten_khach_hang_widget.dart';

part 'widgets/dien_thoai_di_dong_widget.dart';

part 'widgets/email_khach_hang_widget.dart';

part 'widgets/email_khach_hang_phu_widget.dart';

part 'widgets/ten_cong_ty_ca_nhan_widget.dart';

part 'widgets/nguoi_dai_dien_moi_widget.dart';

part 'widgets/dien_thoai_co_quan_widget.dart';

part 'widgets/ma_so_thue_widget.dart';

part 'widgets/cccd_widget.dart';

part 'widgets/dia_chi_widget.dart';

part 'widgets/ghi_chu_widget.dart';

part 'widgets/ma_hop_dong_widget.dart';

part 'widgets/ten_hop_dong_widget.dart';

part 'widgets/email_hop_dong_widget.dart';

part 'widgets/tong_gia_tri_widget.dart';

part 'widgets/tong_gia_tri_thu_widget.dart';

part 'widgets/tong_no_widget.dart';
part 'widgets/phuong_thuc_thanh_toan_widget.dart';
part 'widgets/loai_phieu_thu_widget.dart';

GlobalKey<FormState> _formKey = GlobalKey();

class KhachHangMoi extends StatefulWidget {
  const KhachHangMoi({Key? key}) : super(key: const Key(pathName));

  static const pathName = 'khach-hang-moi';

  @override
  State<KhachHangMoi> createState() => _KhachHangMoiState();
}

class _KhachHangMoiState extends State<KhachHangMoi> with FormUIMixins {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            titleForm(context, title: 'Thông tin khách hàng'),
            bodyForm(
              child: Wrap(
                runSpacing: 25,
                children: [
                  Row(
                    children: [
                      const MaKhachHangWidget(),
                      ndGapW16(),
                      const TenKhachHangWidget(),
                      ndGapW16(),
                      const DienThoaiDiDongWidget(),
                      ndGapW16(),
                      const EmailKhachHangWidget(),
                    ],
                  ),
                  Row(
                    children: [
                      const EmailKhachHangPhuWidget(),
                      ndGapW16(),
                      const TenCongTyCaNhanWidget(),
                    ],
                  ),
                  Row(
                    children: [
                      const NguoiDaiDienMoiWidget(),
                      ndGapW16(),
                      const DienThoaiCoQuanWidget(),
                      ndGapW16(),
                      const MaSoThueWidget(),
                      ndGapW16(),
                      const CccdWidget(),
                    ],
                  ),
                  Row(
                    children: [
                      const DiaChiWidget(),
                      ndGapW16(),
                      const GhiChuWidget(),
                    ],
                  ),
                ],
              ),
            ),
            ndGapH40(),
            titleForm(context, title: 'Thông tin hợp đồng'),
            bodyForm(
              child: Wrap(
                runSpacing: 25,
                children: [
                  Row(
                    children: [
                      const MaHopDongWidget(),
                      ndGapW16(),
                      const EmailHopDongWidget(),
                      ndGapW16(),
                      const TongGiaTriWidget(),
                      ndGapW16(),
                      const TongGiaTriThuWidget(),
                      ndGapW16(),
                      const TongNoWidget(),
                    ],
                  )
                ],
              ),
            ),
            ndGapH40(),
            titleForm(context, title: 'Thông tin phiếu thu'),
            bodyForm(
              child: Wrap(
                runSpacing: 25,
                children: [
                  bodyForm(
                    backgroundColor: Colors.grey.shade300,
                    child: Row(
                      children: [
                        const PhuongThucThanhToanWidget(),
                        ndGapW48(),
                        const LoaiPhieuThuWidget(),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const MaHopDongWidget(),
                      ndGapW16(),
                      const EmailHopDongWidget(),
                      ndGapW16(),
                      const TongGiaTriWidget(),
                      ndGapW16(),
                      const TongGiaTriThuWidget(),
                      ndGapW16(),
                      const TongNoWidget(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
