import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../providers/files_hd_provider.dart';
import '../providers/form_khach_hang_moi_provider.dart';
import '../providers/kiem_tra_khach_hang_provider.dart';
import '../providers/nhan_vien_phu_trach_provider.dart';
import '../providers/danh_sach_domain_provider.dart';

import '../../../../../_shared/extensions/date_time_extention.dart';
import '../../../../../_shared/mixins/form_ui_mixins.dart';
import '../../../../../_shared/utils/currency_text_input_formatter.dart';
import '../../../../../_shared/utils/form_status.dart';
import '../../../../../_shared/utils/helper.dart';
import '../../../../../_shared/utils/ndgap.dart';
import '../../../../../packages/textfield_tags/src/models.dart';

import '../widgets/form_them_phieuthu/tags_input_widget.dart';

part '../widgets/form_them_phieuthu/form_thong_tin_hop_dong_widget.dart';
part '../widgets/form_them_phieuthu/form_thong_tin_phieu_thu_widget.dart';
part '../widgets/form_them_phieuthu/upload_file_hd_widget.dart';

final GlobalKey<FormState> _formKey = GlobalKey();

class ThemPhieuThuScreen extends ConsumerStatefulWidget {
  const ThemPhieuThuScreen({super.key});
  static const String nameRoute = 'them-hop-dong-moi';
  static const String pathRoute = ':makhachang';
  //final SearchCustomerModel item;
  @override
  ConsumerState createState() => _ThemPhieuThuScreenState();
}

class _ThemPhieuThuScreenState extends ConsumerState<ThemPhieuThuScreen> with FormUIMixins {

  @override
  Widget build(BuildContext context) {
    return  SimpleDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(0),
      insetPadding: EdgeInsets.all(30),
      elevation: 0,

      children: [
        Stack(
          children: [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Thêm Phiếu Thu'.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 14.0,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close, color: Colors.red),
                  ),
                ),
              ),
            ),


          ],
        ),

        const Divider(),

        SizedBox(
          height: MediaQuery.of(context).size.height,
          child:      SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                titleForm(context, title: 'Thông tin hợp đồng'),
                bodyForm(
                  child: const FormThongTinHopDongWidget(),
                ),
                ndGapH24(),

                titleForm(context, title: 'Upload file HĐ'),
                bodyForm(
                  child: const UploadFileHDWidget(),
                ),

                ndGapH24(),
                titleForm(context, title: 'Thông tin phiếu thu'),
                bodyForm(
                  child: const FormThongTinPhieuThuWidget(),
                ),

                ndGapH24(),
                const _BtnSubmit(),

              ],),
          ),

        ),



      ],

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



