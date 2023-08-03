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
part 'form_element/form_thong_tin_domain_widget.dart';
part 'form_element/form_thong_tin_hosting_widget.dart';
part 'form_element/form_thong_tin_app_widget.dart';
part 'form_element/upload_file_hd_widget.dart';
















Map<String, String> _loaiPhiethu = {
  'hopdong': 'Hợp đồng',
  'chungtu': 'Chứng từ'
};
GlobalKey<FormState> _formKey = GlobalKey();
String _updateType = 'web';
List<Map> _resultFile = [];
List<MediaModel> _listMedia = [];

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
  Map<String, TextEditingController> listController = {};
  Map<String, FocusNode> listFocusNode = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ['mahopdong', 'ngaykyhd', 'ngaybangiao', 'chucnang', 'ghichu']
        .forEach((item) {
      listController[item] = TextEditingController();
      listFocusNode[item] = FocusNode();
    });
    Future.delayed(Duration.zero, () async {
      await ref.read(capnhatProvider.notifier).getConstractById(widget.id);
      var res = ref.watch(capnhatProvider.notifier);
      ContractModel? data = res.state.contract;
      setState(() {
        _listMedia = res.state.media!;
      });

      listController!['mahopdong']!.text = data!.l1_data!.mahopdong.toString();
      listController!['ngaykyhd']!.text =
          Helper.dateFormat(data!.l1_data!.ngaykyhd.toString());
      listController!['ngaybangiao']!.text =
          Helper.dateFormat(data!.l1_data!.ngaybangiao!);
      listController!['chucnang']!.text = data!.l1_data!.chucnang!;
      listController!['ghichu']!.text = data!.l1_data!.ghichu!;
    });
  }

  @override
  Widget build(BuildContext context) {
    // FormCapNhatNotifier data = ref.read(formcapnhatProvider.notifier);
    // ref.listen(formcapnhatProvider.select((value) => value.loading),
    //         (previous, next) {
    //       if (next == loadingStatus.START) {
    //         Loading(context).start();
    //       }
    //       if (next == loadingStatus.STOP) {
    //         Future.delayed(Duration(seconds: 1), () async {
    //           await ref.read(capnhatProvider.notifier).getConstractById(widget.id);
    //           var res = ref.watch(capnhatProvider.notifier);
    //           setState(() {
    //             _listMedia = res.state.media!;
    //           });
    //           Loading(context).stop();
    //           if (data.state.success == true) {
    //             setState(() {
    //               _resultFile = [];
    //             });
    //
    //           }
    //           AwesomeDialog(
    //             context: context,
    //             autoHide:Duration(seconds: 2),
    //             width: 400.0,
    //             dialogType:
    //             data.state.success ? DialogType.success : DialogType.error,
    //             animType: AnimType.scale,
    //             title: data.state.message,
    //             autoDismiss:true,
    //
    //             btnOk:Container(),
    //             btnCancel:Container(),
    //
    //             btnCancelOnPress: () {},
    //             btnOkOnPress: () {},
    //           )..show();
    //
    //         });
    //       }
    //     });

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
        Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                titleForm(context, title: 'Thông tin khách hàng'),
                bodyForm(
                  child: const FormThongTinKhachHangWidget(),
                ),
                // ndGapH40(),
                // titleForm(context, title: 'Thông tin hợp đồng'),
                // bodyForm(
                //   child: const FormThongTinHopDongWidget(),
                // ),
                // ndGapH40(),
                // titleForm(context, title: 'Thông tin phiếu thu'),
                // bodyForm(
                //   child: const FormThongTinPhieuThuWidget(),
                // ),
                // const FormThongTinWebsiteWidget(),
                // const FormThongTinDomainWidget(),
                // const FormThongTinHostingWidget(),
                // const FormThongTinAppWidget(),
                ndGapH40(),
                titleForm(context, title: 'Upload file HĐ'),
                // bodyForm(
                //   child: const UploadFileHDWidget(),
                // ),
                ndGapH40(),
                const _BtnSubmit(),
              ],
            ),
          ),
        ),
      ],
    );

  }
}

class UploadFileWidget extends ConsumerStatefulWidget {
  const UploadFileWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<UploadFileWidget> createState() => _UploadFileWidgetState();
}

class _UploadFileWidgetState extends ConsumerState<UploadFileWidget>
    with FormUIMixins {
  TextEditingController _uploadController = new TextEditingController();
  TextEditingController _noteController = new TextEditingController();
  List<PlatformFile> _files = [];

  String _radioValue = '';

  List<Widget> _uploadType() {
    List<Widget> radioButtons = [];
    _loaiPhiethu.forEach((key, value) {
      radioButtons.add(
        Row(
          children: [
            Radio<String>(
              value: key,
              groupValue: _radioValue,
              onChanged: (value) {
                setState(() {
                  _radioValue = value!;
                });
              },
            ),
            GestureDetector(
                child: Text(value),
                onTap: () => setState(() {
                  _radioValue = key;
                }))
          ],
        ),
      );
    });
    return radioButtons;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // result = ref.watch(formcapnhatProvider.select((value) => value.uploadList)

    return Column(
      children: [
        ResponsiveGridRow(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResponsiveGridCol(
                lg: 12,
                xl: 4,
                md: 12,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Row(
                    children: [
                      const Text(
                        'Loại file:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ..._uploadType()
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                lg: 6,
                xl: 3,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: SizedBox(
                    child: inputUploadFile(context,
                        controller: _uploadController,
                        validator: FormBuilderValidators.compose([
                          //    FormBuilderValidators.required(errorText: 'Vui lòng chọn File.')
                        ]), onTap: () async {
                          String path = '';
                          final result = await FilePicker.platform.pickFiles(
                            allowMultiple: true,
                            type: FileType.custom,
                            allowedExtensions: [
                              'pdf',
                              'doc',
                              'docx',
                              'xls',
                              'xlsx',
                              'jpg',
                              'png',
                            ],
                          );
                          if (result != null) {
                            List<String> name = [];
                            for (var file in result.files) {
                              name.add(file.name);
                            }
                            _files = result.files;
                            _uploadController.text = name.join(",");
                          } else {
                            _uploadController.clear();
                          }
                        }),
                  ),
                ),
              ),
              ResponsiveGridCol(
                xs: 12,
                lg: 6,
                xl: 5,
                child: Padding(
                  padding: Helper.padding(),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 10,
                        child: TextFormField(
                          controller: _noteController,
                          decoration: InputDecoration(
                            hintText: 'Nhập nội dung ghi chú cho file upload',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: TextButton(
                          onPressed: () {
                            bool next = true;
                            if (_uploadController.text == '') {
                              Helper.toast(
                                  messenge: 'Vui lòng chọn file tải lên',
                                  context: context);
                              next = false;
                            }
                            if (next && _radioValue == '') {
                              Helper.toast(
                                  messenge: 'Vui lòng chọn loại file',
                                  context: context);
                              next = false;
                            }
                            if (next) {
                              List<PlatformFile> _tmpFile = [];
                              List<String> fileSelected = [];
                              List<String> pathFiles = [];
                              // print(result);

                              if (_resultFile.length > 0) {
                                _resultFile.forEach((element) {
                                  pathFiles
                                      .add(element['file'].path.toString());
                                });
                              }

                              _files.forEach((element) {
                                if (pathFiles.indexOf(element.path!) == -1) {
                                  _tmpFile.add(element);
                                }
                              });
                              if (_tmpFile.length == 0) {
                                Helper.toast(
                                    messenge: 'Vui lòng chọn file tải lên',
                                    context: context);
                                return;
                              }

                              setState(() {
                                for (PlatformFile file in _tmpFile) {
                                  Map tmp = {
                                    'type': _radioValue,
                                    'typeName': _loaiPhiethu[_radioValue],
                                    'note': _noteController.text,
                                    'file': file
                                  };
                                  _resultFile.add(tmp);
                                }
                                _noteController.text = '';
                                _uploadController.text = '';
                                _radioValue = '';
                              });
                              ref
                                  .read(formcapnhatProvider.notifier)
                                  .setFile(_resultFile);
                            }
                          },
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(
                                top: 16,
                                bottom: 16,
                                left: 10,
                                right: 10,
                              ),
                              backgroundColor: Colors.blueAccent),
                          child: const Text(
                            'THÊM',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
        const SizedBox(height: 5.0),
        if (_resultFile.length > 0) ...[
          SingleChildScrollView(
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
                        flex: 2,
                        child: HeaderRowItem(text: 'Loại file'),
                      ),
                      Expanded(
                        flex: 3,
                        child: HeaderRowItem(text: 'Tên file'),
                      ),
                      Expanded(
                        flex: 3,
                        child: HeaderRowItem(text: 'Ghi chú'),
                      ),
                      Expanded(
                        flex: 1,
                        child: HeaderRowItem(text: 'Xoá'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                if (_resultFile.length > 0) ...[
                  ListView.builder(
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: true,
                      itemCount: _resultFile.length,
                      itemBuilder: (BuildContext context, index) {
                        var item = _resultFile[index];
                        PlatformFile file = item['file'];

                        return Column(
                          children: [
                            Row(children: [
                              Expanded(
                                flex: 1,
                                child: BodyRowItem(Text("${index + 1}")),
                              ),
                              Expanded(
                                flex: 2,
                                child: BodyRowItem(Text(item['typeName'])),
                              ),
                              Expanded(
                                flex: 3,
                                child: BodyRowItem(Text(file.name)),
                              ),
                              Expanded(
                                flex: 3,
                                child: BodyRowItem(Text(item['note'])),
                              ),
                              Flexible(
                                  flex: 1,
                                  child: BodyRowItem(TextButton(
                                    onPressed: () {
                                      ConfirmDialog alert = ConfirmDialog(
                                        "Xác nhận",
                                        "Xoá file đã chọn?",
                                            () {
                                          setState(() {
                                            _resultFile.removeAt(index);
                                          });

                                          Navigator.of(context).pop();
                                        },
                                      );
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert;
                                        },
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.only(
                                        top: 16,
                                        bottom: 16,
                                        left: 10,
                                        right: 10,
                                      ),
                                      backgroundColor: Colors.blueAccent,
                                      alignment: Alignment.center,
                                      iconColor: Colors.white,
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.delete_outline_sharp,
                                          size: 15.0,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text('Xoá',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.0)),
                                      ],
                                    ),
                                  ))),
                            ]),
                            _resultFile.length - 1 > index
                                ? const Divider()
                                : Container()
                          ],
                        );
                      }),
                ]
              ],
            ),
          )
        ]
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
  ref.refresh(formKhachHangMoiProvider); // reset dữ liệu toàn Form
  ref.refresh(kiemTraKhachHangProvider); // reset dữ liệu thông tin khách hàng cũ
  ref.refresh(nhanVienPhuTrachProvider); // reset dữ liệu nhân viên phụ trách
  Future.delayed(const Duration(milliseconds: 100),(){
    ref.read(danhSachDomainProvider.notifier).lamMoiDanhSach();
  }); // reset danh sách domain
}