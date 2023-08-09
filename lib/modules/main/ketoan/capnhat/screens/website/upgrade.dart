import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bs_flutter_alert/bs_flutter_alert.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../../../../../_shared/extensions/date_time_extention.dart';
import '../../../../../../_shared/mixins/form_ui_mixins.dart';
import '../../../../../../_shared/utils/currency_text_input_formatter.dart';
import '../../../../../../_shared/utils/debouncer.dart';
import '../../../../../../_shared/utils/helper.dart';
import '../../../../../../_shared/utils/ndgap.dart';
import '../../../../../../_shared/utils/show_ok_alert_dialog.dart';
import '../../../../../../packages/textfield_tags/src/models.dart';
import '../../../khach_hang_moi/providers/kiem_tra_khach_hang_provider.dart';
import '../../../khach_hang_moi/widgets/tags_input_widget.dart';
import '../../models/contract_model.dart';
import '../../models/media_model.dart';
import '../../providers/capnhat_provider.dart';
import '../../providers/danh_sach_domain_provider.dart';
import '../../providers/form_capnhat_provider.dart';
import '../../providers/form_khach_hang_moi_provider.dart';
import '../../providers/nhan_vien_phu_trach_provider.dart';

part 'form_element/form_thong_tin_khach_hang_widget.dart';

part 'form_element/form_thong_tin_hop_dong_widget.dart';

part 'form_element/form_thong_tin_phieu_thu_widget.dart';
part 'form_element/form_thong_tin_website_widget.dart';
// part 'form_element/form_thong_tin_domain_widget.dart';
// part 'form_element/form_thong_tin_hosting_widget.dart';
// part 'form_element/form_thong_tin_app_widget.dart';
part 'form_element/upload_file_hd_widget.dart';

Map<String, String> _loaiPhiethu = {
  'hopdong': 'Hợp đồng',
  'chungtu': 'Chứng từ'
};
GlobalKey<FormState> _formKey = GlobalKey();
final String _typeData = 'website';
List<Map> _resultFile = [];
List<PlatformFile> _files = [];
List<MediaModel> _listMedia = [];
Map<String, TextEditingController> _listController = {};
Map<String, FocusNode> _listFocusNode = {};

class Upgrade extends ConsumerStatefulWidget {
  Upgrade({Key? key, required this.id, required this.contractNumber})
      : super(key: key);
  final String id;
  final String contractNumber;

  @override
  ConsumerState<Upgrade> createState() => _UpdateWebsiteScreenState();
}


class _UpdateWebsiteScreenState extends ConsumerState<Upgrade>
    with FormUIMixins {
  bool isLoading = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _listController.forEach((key, value) {
      _listController[key]!.dispose();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ['sohopdong','tenhopdong','mahopdong','tonggiatri','tongno', 'ngaykyhd', 'ngaybangiao', 'chucnang', 'ghichu']
        .forEach((item) {
      _listController[item] = TextEditingController();
      _listFocusNode[item] = FocusNode();

    });

    Future.delayed(Duration.zero, () async {
      await ref.read(capnhatProvider.notifier).getConstractById(widget.id);
      var res = ref.watch(capnhatProvider.notifier);

      ContractModel? data = await res.state.contract;

      ref.read(formKhachHangMoiProvider.notifier).changeData(
          type: _typeData,
          key: 'sohopdong',
          value: data!.l1_data!.sohopdong);
      ref.read(formKhachHangMoiProvider.notifier).changeData(
          type: _typeData,
          key: 'mahopdong',
          value: data!.l1_data!.mahopdong);
      ref.read(formKhachHangMoiProvider.notifier).changeData(
          type: _typeData,
          key: 'tenhopdong',
          value: '${data!.l1_data!.tenhopdong} (Nâng cấp/ Phụ lục)');
      ref.read(formKhachHangMoiProvider.notifier).changeData(
          type: _typeData,
          key: 'idkhachhang',
          value: data!.l1_data!.khachhangId);



      // _listController!['ngaykyhd']!.text =
      //     Helper.dateFormat(data!.l1_data!.ngaykyhd.toString());
      // _listController!['ngaybangiao']!.text =
      //     Helper.dateFormat(data!.l1_data!.ngaybangiao!);
      // _listController!['chucnang']!.text = data!.l1_data!.chucnang!;
      // _listController!['ghichu']!.text = data!.l1_data!.ghichu!;
    });
  }

  @override
  Widget build(BuildContext context) {
    FormKhachHangMoiState data = ref.read(formKhachHangMoiProvider);
    ref.listen(formKhachHangMoiProvider.select((value) => value.loading),
            (previous, next) {
          if (next == loadingStatus.START) {
            Loading(context).start();
          }
          if (next == loadingStatus.STOP) {
            Future.delayed(Duration(seconds: 1), () async {
              //
              // setState(() {
              //   _listMedia = res.state.media!;
              // });

              Loading(context).stop();


              List<Widget> _msg = [];

              for(String item in data.response!['msg']){
                _msg.add(Text(item.toString()));
              }
              AwesomeDialog(
                context: context,
                autoHide:Duration(seconds: 2),
                width: 400.0,
                dialogType:
                data.response!['status']==true ? DialogType.success : DialogType.error,
                animType: AnimType.scale,
                title: data.response!['status']==true?'Thêm mới thành công':'Có lỗi',
                autoDismiss:true,
                body: _msg.length > 0 ?Column(children: _msg):null,
                btnOk:Container(),
                btnCancel:Container(),

                btnCancelOnPress: () {},
                btnOkOnPress: () {},
              )..show();

            });
            if(data.response!['status']==true){

              Future.delayed(Duration(seconds: 2),() {
                _resetForm(ref);
                context.pop();
              },);
            }
          }
        });

    return SimpleDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(0),
      insetPadding: const EdgeInsets.all(30),
      elevation: 0,

      children: [
        const Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'NÂNG CẤP WEBSITE',
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        const Divider(),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [

                titleForm(context, title: 'Thông tin hợp đồng'),
                bodyForm(
                  child: const FormThongTinHopDongWidget(),
                ),
                ndGapH40(),
                titleForm(context, title: 'Upload file HĐ'),
                bodyForm(
                  child: const UploadFileWidget(),
                ),
                ndGapH40(),
                titleForm(context, title: 'Thông tin phiếu thu'),
                bodyForm(
                  child: const FormThongTinPhieuThuWidget(),
                ),
                const FormThongTinWebsiteWidget(),


                ndGapH24(),
                const _BtnSubmit(),
              ],
            ),
          ),
        ),
      ],
    );

  }
}


class Data extends ConsumerWidget {
  Data({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var data = ref.watch(capnhatProvider.select((value) => value.result));

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF105A6C),
            ),
            child: const Row(
              children: [
                Expanded(flex: 1, child: HeaderRowItem(text: 'STT')),
                Expanded(
                  flex: 3,
                  child: HeaderRowItem(text: 'Ngày tháng'),
                ),
                Expanded(
                  flex: 3,
                  child: HeaderRowItem(text: 'User cập nhật'),
                ),
                Expanded(
                  flex: 4,
                  child: HeaderRowItem(text: 'Loại file'),
                ),
                Expanded(
                  flex: 3,
                  child: HeaderRowItem(text: 'Ghi chú'),
                ),
                Expanded(
                  flex: 2,
                  child: HeaderRowItem(text: 'Thao tác'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 13.0),
          if (_listMedia.length > 0) ...[
            ListView.builder(
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: true,
                itemCount: _listMedia.length,
                itemBuilder: (BuildContext context, index) {
                  // InfoResponseModel info = data['info'];
                  return MediaItem(
                      item: _listMedia[index],
                      index: index + 1,
                      divider: (_listMedia.length - 1 > index));
                }),
          ] else ...[
            const BsAlert(
              closeButton: false,
              margin: EdgeInsets.only(bottom: 10.0),
              style: BsAlertStyle.danger,
              child: Text('Không có dữ liệu', textAlign: TextAlign.center),
            ),
          ],
        ],
      ),
    );
  }
}

class MediaItem extends ConsumerStatefulWidget {
  MediaItem(
      {Key? key,
        required this.item,
        required this.index,
        required this.divider})
      : super(key: key);
  late MediaModel item;
  final int index;
  final bool divider;

  @override
  ConsumerState<MediaItem> createState() => _MediaItemState();
}

class _MediaItemState extends ConsumerState<MediaItem> {
  late String note = widget.item!.ghichu!;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            flex: 1,
            child: BodyRowItem(Text(widget.index.toString())),
          ),
          Expanded(
            flex: 3,
            child: BodyRowItem(Text(Helper.dateFormat(widget.item.createdAt))),
          ),
          Expanded(
            flex: 3,
            child: BodyRowItem(Text(widget.item!.l1_lichsu_khoitao!.hoten!)),
          ),
          Expanded(
            flex: 4,
            child: BodyRowItem(
                Text(_loaiPhiethu[widget.item.loaifile!].toString())),
          ),
          Expanded(
            flex: 3,
            child: BodyRowItem(Text(widget.item.ghichu!)),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF105A6C),
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 7.0, bottom: 7.0),
                  child: GestureDetector(
                    onTap: () {
                      final _formKey = GlobalKey<FormState>();
                      String _selected = widget.item.loaifile.toString();
                      TextEditingController controller =
                      new TextEditingController();
                      controller.text = widget.item.ghichu!;

                      Widget _widget = Container(
                        width: 450,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Loại file'),
                              ndGapH8(),
                              DropdownButtonFormField2<String>(
                                value: _selected,
                                isExpanded: true,
                                decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(vertical: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                hint: const Text(
                                  'Chọn loại file',
                                  style: TextStyle(fontSize: 14),
                                ),
                                items: _loaiPhiethu.entries
                                    .map((e) => DropdownMenuItem<String>(
                                  value: e.key,
                                  child: Text(
                                    e.value,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                                    .toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select.';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _selected = value.toString();
                                  });
                                },

                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.only(right: 8),
                                ),
                                iconStyleData: const IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black45,
                                  ),
                                  iconSize: 24,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                ),
                              ),
                              ndGapH8(),
                              const Text('Ghi chú'),
                              ndGapH8(),
                              TextFormField(
                                controller: controller,
                                maxLines: 3,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'Không bỏ trống.'),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      );
                      TextDialog alert = TextDialog(
                        "Điều chỉnh file",
                        "",
                        _widget,
                            () async {
                          if (_formKey.currentState!.validate()) {


                            var updateMedia = await ref.read(capnhatProvider.notifier).updateMedia({'id': widget.item.id,'ghichu': controller.text,'loaifile': _selected});

                            if(updateMedia['status']==true){
                              Navigator.of(context).pop();
                              setState(() {
                                widget.item = MediaModel.fromJson(updateMedia['data']);

                              });

                            }
                            AwesomeDialog(
                              context: context,
                              autoHide:Duration(seconds: 2),
                              width: 400.0,
                              dialogType:
                              updateMedia['status'] ? DialogType.success : DialogType.error,
                              animType: AnimType.scale,
                              title: updateMedia['message'],
                              autoDismiss:true,

                              btnOk:Container(),
                              btnCancel:Container(),

                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            )..show();


                          }
                        },
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    child: const Text(
                      'Cập nhật',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
          ),
        ],
      ),
      widget.divider ? const Divider() : Container()
    ]);
  }
}

class _BtnSubmit extends ConsumerWidget {
  const _BtnSubmit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            _submitForm(ref);
            // if (_formKey.currentState!.validate()) {
            //
            //   _submitForm(ref);
            //   // _listController.forEach((key, value) {
            //   //   ref
            //   //       .read(formcapnhatProvider.notifier)
            //   //       .onChangeValue(key, value.text);
            //   // });
            //   //
            //   // ref
            //   //     .read(formcapnhatProvider.notifier)
            //   //     .onSubmit(widget.id, widget.contractNumber);
            // } else {
            //   // _listFocusNode.forEach((key, value) {
            //   //   value.requestFocus();
            //   // });
            // }
          },
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(10),
              backgroundColor: Colors.blueAccent),
          child: const Text(
            'Hoàn tất',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        TextButton(
          onPressed: () {
            _resetForm(ref);
            Navigator.of(context,rootNavigator: true).pop();
           // Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(10),
              backgroundColor: Colors.grey),
          child: const Text(
            'Thoát',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ),
      ],
    );
  }
}

_submitForm(WidgetRef ref) {
  if (_formKey.currentState!.validate()) {
    ref.read(formKhachHangMoiProvider.notifier).saveForm(_resultFile);
  }
}

_resetForm(WidgetRef ref){
  _formKey.currentState?.reset();
  ref.refresh(formKhachHangMoiProvider); // reset dữ liệu toàn Form
  ref.refresh(kiemTraKhachHangProvider); // reset dữ liệu thông tin khách hàng cũ
  ref.refresh(nhanVienPhuTrachProvider); // reset dữ liệu nhân viên phụ trách
  Future.delayed(const Duration(milliseconds: 100),(){
    ref.read(danhSachDomainProvider.notifier).lamMoiDanhSach();
  }); // reset danh sách domain
}