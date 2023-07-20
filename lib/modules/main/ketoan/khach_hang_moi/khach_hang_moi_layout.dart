import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../_shared/mixins/form_ui_mixins.dart';
import '../../../../_shared/utils/ndgap.dart';
import 'providers/form_khach_hang_moi_provider.dart';

part 'widgets/form_thong_tin_khach_hang_widget.dart';

part 'widgets/form_thong_tin_hop_dong_widget.dart';

part 'widgets/form_thong_tin_phieu_thu_widget.dart';

GlobalKey<FormState> _formKey = GlobalKey();

enum HinhThucThanhToan { cod, bank }
enum LoaiPhieuThu { phieuthu, phieuthuBG, phieuthuApp, phieuthuBGApp }

HinhThucThanhToan _httt = HinhThucThanhToan.cod;
LoaiPhieuThu _loaiPhieuThu = LoaiPhieuThu.phieuthu;

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
            ndGapH40(),
            Consumer(
              builder: (context, ref, child) {
                final formState = ref.watch(formKhachHangMoiProvider);
                return Visibility(
                  visible: formState.isHopDongWebsite,
                  child: Wrap(
                    children: [
                      titleForm(context, title: 'Thông tin Website'),
                      bodyForm(
                        child: Text('Form thông tin website'),
                      ),
                    ],
                  ),
                );
              },
            ),
            ndGapH40(),
            const _BtnSubmit(),
          ],
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
          icon: const FaIcon(FontAwesomeIcons.download),
          label: const Text('Lưu Thông Tin'),
        ),
        ndGapW16(),
        FilledButton.icon(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.rotate),
          label: const Text('Nhập lại'),
        ),
      ],
    );
  }

  _submitForm(WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      print('bắt đầu submit...');
      ref.read(formKhachHangMoiProvider.notifier).saveForm();
    }
  }
}
