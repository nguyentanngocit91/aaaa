import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:regexpattern/regexpattern.dart';

import '../../../../_shared/extensions/date_time_extention.dart';
import '../../../../_shared/mixins/data_table_mixins.dart';
import '../../../../_shared/mixins/form_ui_mixins.dart';
import '../../../../_shared/utils/currency_text_input_formatter.dart';
import '../../../../_shared/utils/debouncer.dart';
import '../../../../_shared/utils/form_status.dart';
import '../../../../_shared/utils/helper.dart';
import '../../../../_shared/utils/ndgap.dart';
import '../../../../packages/textfield_tags/textfield_tags.dart';
import './models/file_model.dart';
import 'providers/kiem_tra_khach_hang_provider.dart';
import 'providers/nhan_vien_phu_trach_provider.dart';
import 'providers/files_hd_provider.dart';
import 'providers/danh_sach_domain_provider.dart';
import 'providers/sua_phieu_thu_provider.dart';


import 'widgets/tags_input_widget.dart';

part 'widgets/form_thong_tin_khach_hang_widget.dart';

part 'widgets/form_thong_tin_hop_dong_widget.dart';

part 'widgets/form_thong_tin_phieu_thu_widget.dart';

part 'widgets/form_thong_tin_website_widget.dart';

part 'widgets/form_thong_tin_domain_widget.dart';

part 'widgets/form_thong_tin_hosting_widget.dart';

part 'widgets/form_thong_tin_app_widget.dart';

part 'widgets/upload_file_hd_widget.dart';


final GlobalKey<FormState> _formKey = GlobalKey();


class SuaPhieuThuLayout extends ConsumerStatefulWidget {
  const SuaPhieuThuLayout() : super(key: const Key(nameRoute));

  static const String nameRoute = 'sua-phieu-thu';
  static const String pathRoute = ':id';

  @override
  ConsumerState createState() => _SuaPhieuThuLayoutState();
}

class _SuaPhieuThuLayoutState extends ConsumerState<SuaPhieuThuLayout> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0),(){
      print(GoRouterState.of(context).pathParameters['id']);
      ref.read(formPhieuThuProvider.notifier).initData( id: GoRouterState.of(context).pathParameters['id'] ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(formPhieuThuProvider.select((value) => value.isLoading));
    return Scaffold(
      body: (loading==false) ? const FormSuaPhieuThu() : const Center(child: CircularProgressIndicator.adaptive(),),
    );
  }
}

class FormSuaPhieuThu extends ConsumerWidget with FormUIMixins{
  const FormSuaPhieuThu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
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
          icon: const FaIcon(
            FontAwesomeIcons.download,
            size: 16,
          ),
          label: const Text('Lưu Thông Tin'),
        ),
        ndGapW16(),
        FilledButton.icon(
          onPressed: () {
            context.pop();
          },
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            size: 16,
          ),
          label: const Text('Quay lại danh sách'),
        ),
      ],
    );
  }
}

_submitForm(WidgetRef ref) {
  ref.read(formPhieuThuProvider.notifier).batDatSubmit();
  if (_formKey.currentState!.validate()) {
    print('submit...');
    ref.read(formPhieuThuProvider.notifier).saveForm();
  } else {
    ref.read(formPhieuThuProvider.notifier).ketThucSubmit();
  }
}