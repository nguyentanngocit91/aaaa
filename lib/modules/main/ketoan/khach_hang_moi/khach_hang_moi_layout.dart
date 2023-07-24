import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:regexpattern/regexpattern.dart';

import '../../../../_shared/extensions/date_time_extention.dart';
import '../../../../_shared/mixins/form_ui_mixins.dart';
import '../../../../_shared/utils/currency_text_input_formatter.dart';
import '../../../../_shared/utils/debouncer.dart';
import '../../../../_shared/utils/mask_text_input_formatter.dart';
import '../../../../_shared/utils/ndgap.dart';
import 'providers/form_khach_hang_moi_provider.dart';
import 'providers/kiem_tra_khach_hang_provider.dart';

part 'widgets/form_thong_tin_khach_hang_widget.dart';

part 'widgets/form_thong_tin_hop_dong_widget.dart';

part 'widgets/form_thong_tin_phieu_thu_widget.dart';
part 'widgets/form_thong_tin_website_widget.dart';
part 'widgets/form_thong_tin_domain_widget.dart';
part 'widgets/form_thong_tin_hosting_widget.dart';
part 'widgets/form_thong_tin_app_widget.dart';
part 'widgets/upload_file_hd_widget.dart';

GlobalKey<FormState> _formKey = GlobalKey();

enum HinhThucThanhToan { cod, bank }
enum LoaiPhieuThu { phieuthu, phieuthuBG, phieuthuApp, phieuthuBGApp }
enum TrangThaiHosting { kyMoi, phucHoi, nangCap, chuyenDoi }
enum LoaiFileHD { hopDong, chungTuKhac }


HinhThucThanhToan _httt = HinhThucThanhToan.cod;
LoaiPhieuThu _loaiPhieuThu = LoaiPhieuThu.phieuthu;
TrangThaiHosting _trangThaiHosting = TrangThaiHosting.kyMoi;
LoaiFileHD _loaiFileHD = LoaiFileHD.hopDong;

class KhachHangMoi extends ConsumerStatefulWidget {
  const KhachHangMoi({Key? key}) : super(key: const Key(pathName));

  static const pathName = 'khach-hang-moi';

  @override
  ConsumerState createState() => _KhachHangMoiState();
}

class _KhachHangMoiState extends ConsumerState<KhachHangMoi> with FormUIMixins{

  @override
  void initState() {
    super.initState();
    ref.read(formKhachHangMoiProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              titleForm(context, title: 'Thông tin khách hàng'),
              bodyForm(
                child: const FormThongTinKhachHangWidget(),
              ),
              ndGapH40(),
              titleForm(context, title: 'Thông tin hợp đồng'),
              bodyForm(
                child: const FormThongTinHopDongWidget(),
              ),
              ndGapH40(),
              titleForm(context, title: 'Thông tin phiếu thu'),
              bodyForm(
                child: const FormThongTinPhieuThuWidget(),
              ),
              const FormThongTinWebsiteWidget(),
              const FormThongTinDomainWidget(),
              const FormThongTinHostingWidget(),
              const FormThongTinAppWidget(),
              // ndGapH40(),
              // titleForm(context, title: 'Upload file HĐ'),
              // bodyForm(
              //   child: const UploadFileHDWidget(),
              // ),
              ndGapH40(),
              const _BtnSubmit(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BtnSubmit extends ConsumerWidget {
  const _BtnSubmit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FilledButton.icon(
          onPressed: () {
            _submitForm(ref);
          },
          icon: const FaIcon(FontAwesomeIcons.download, size: 16,),
          label: const Text('Lưu Thông Tin'),
        ),
        ndGapW16(),
        FilledButton.icon(
          onPressed: () {
            _resetForm(ref);
          },
          icon: const FaIcon(FontAwesomeIcons.rotate, size: 16,),
          label: const Text('Nhập lại'),
        ),
      ],
    );
  }
}

_submitForm(WidgetRef ref) {
  if (_formKey.currentState!.validate()) {
    ref.read(formKhachHangMoiProvider.notifier).saveForm();
  }
}

_resetForm(WidgetRef ref){
  _formKey.currentState?.reset();
  ref.invalidate(formKhachHangMoiProvider); // reset dữ liệu toàn Form
  ref.invalidate(kiemTraKhachHangProvider); // reset dữ liệu thông tin khách hàng cũ
}