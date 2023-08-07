import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:regexpattern/regexpattern.dart';

import '../../../../../_shared/extensions/date_time_extention.dart';
import '../../../../../_shared/mixins/form_ui_mixins.dart';
import '../../../../../_shared/utils/currency_text_input_formatter.dart';
import '../../../../../_shared/utils/debouncer.dart';
import '../../../../../_shared/utils/form_status.dart';
import '../../../../../_shared/utils/helper.dart';
import '../../../../../_shared/utils/ndgap.dart';
import '../../../../../packages/textfield_tags/src/models.dart';

import '../models/searchcustomer_model.dart';
import '../providers/files_hd_provider.dart';
import '../providers/form_khach_hang_moi_provider.dart';
import '../providers/kiem_tra_khach_hang_provider.dart';
import '../providers/nhan_vien_phu_trach_provider.dart';
import '../providers/danh_sach_domain_provider.dart';
import '../widgets/tags_input_widget.dart';

part '../widgets/form_thong_tin_khach_hang_widget.dart';

part '../widgets/form_thong_tin_hop_dong_widget.dart';

part '../widgets/form_thong_tin_phieu_thu_widget.dart';

part '../widgets/form_thong_tin_website_widget.dart';

part '../widgets/form_thong_tin_domain_widget.dart';

part '../widgets/form_thong_tin_hosting_widget.dart';

part '../widgets/form_thong_tin_app_widget.dart';

part '../widgets/upload_file_hd_widget.dart';


final GlobalKey<FormState> _formKey = GlobalKey();

class ThemHopDongKyMoi extends ConsumerStatefulWidget {
  const ThemHopDongKyMoi({Key? key,this.id}) : super(key: const Key(pathName));

  final String? id;

  static const pathName = 'them-hop-dong-moi';
  //final SearchCustomerModel item;

  @override
  ConsumerState createState() => _ThemHopDongKyMoiState();
}

class _ThemHopDongKyMoiState extends ConsumerState<ThemHopDongKyMoi> with FormUIMixins {
  @override
  Widget build(BuildContext context) {
    ref.listen(formKhachHangMoiProvider.select((value) => value.formStatus),
            (previous, next) {
          if (next == FormStatus.submissionInProgress) {
            Loading(context).start();
          }
          if (next == FormStatus.submissionCanceled) {
            Loading(context).stop();
          }
          if (next == FormStatus.submissionFailure) {
            Loading(context).stop();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('XIN LỖI'),
                  content: Text('Đã có lỗi trong quá trình thêm dữ liệu...'),
                  actions: [
                    FilledButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
          }
          if (next == FormStatus.submissionSuccess) {
            _resetForm(ref);
            Loading(context).stop();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('THÀNH CÔNG'),
                  content: Text('Dữ liệu đã được thêm thành công.'),
                  actions: [
                    FilledButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
          }
        });

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
              ndGapH40(),
              titleForm(context, title: 'Upload file HĐ'),
              bodyForm(
                child: const UploadFileHDWidget(),
              ),
              ndGapH40(),
              const _BtnSubmit(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _resetForm(ref);
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
          icon: const FaIcon(
            FontAwesomeIcons.download,
            size: 16,
          ),
          label: const Text('Lưu Thông Tin'),
        ),
        ndGapW16(),
        FilledButton.icon(
          onPressed: () {
            _resetForm(ref);
          },
          icon: const FaIcon(
            FontAwesomeIcons.rotate,
            size: 16,
          ),
          label: const Text('Nhập lại'),
        ),
      ],
    );
  }
}

_submitForm(WidgetRef ref) {
  ref.read(formKhachHangMoiProvider.notifier).batDatSubmit();
  if (_formKey.currentState!.validate()) {
    ref.read(formKhachHangMoiProvider.notifier).saveForm();
  } else {
    ref.read(formKhachHangMoiProvider.notifier).ketThucSubmit();
  }
}

_resetForm(WidgetRef ref) {
  _formKey.currentState?.reset();
  ref.refresh(formKhachHangMoiProvider); // reset dữ liệu toàn Form
  ref.refresh(
      kiemTraKhachHangProvider); // reset dữ liệu thông tin khách hàng cũ
  ref.refresh(nhanVienPhuTrachProvider); // reset dữ liệu nhân viên phụ trách
  Future.delayed(const Duration(milliseconds: 100), () {
    ref.read(danhSachDomainProvider.notifier).lamMoiDanhSach();
  }); // reset danh sách domain
  ref.refresh(fileHDProvider);
}
