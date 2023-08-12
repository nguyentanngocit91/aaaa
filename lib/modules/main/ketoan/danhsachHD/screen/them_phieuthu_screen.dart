import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bs_flutter_alert/bs_flutter_alert.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../../_shared/utils/show_ok_alert_dialog.dart';
import '../models/media_result_model.dart';
import '../models/searchcustomercontract_model.dart';
import '../providers/ds_hd_provider.dart';
import '../providers/files_hd_provider.dart';
import '../providers/form_hop_dong_ky_moi_provider.dart';
import '../providers/form_them_phieuthu_provider.dart';
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



Map<String, String> _loaiPhiethu = {
  'chungtukhac': 'Chứng từ khác'
};
final GlobalKey<FormState> _formKey = GlobalKey();
List<Map> _resultFile = [];
List<MediaResultModel> _listMedia = [];

class ThemPhieuThuScreen extends ConsumerStatefulWidget {

  const ThemPhieuThuScreen({Key? key, required this.item}) : super(key: key);

  final SearchCustomerContractModel? item;

  @override
  ConsumerState createState() => _ThemPhieuThuScreenState();
}

class _ThemPhieuThuScreenState
  extends ConsumerState<ThemPhieuThuScreen> with FormUIMixins {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      print("${widget.item!.id.toString()}+widget.id");
      await ref.read(dshdProvider.notifier).getContractById(widget.item!.id.toString(),widget.item!.sohopdong.toString());
      var res = ref.watch(dshdProvider.notifier);
      setState(() {
        _listMedia = res.state.media!;
      });

    });

  }

  Widget build(BuildContext context) {

    FormThemPhieuThuNotifier data = ref.read(formThemPhieuThuProvider.notifier);
    //ref.listen(formThemPhieuThuProvider.select((value) => value.loading),
    ref.listen(formThemPhieuThuProvider.select((value) => value.status),
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
        //_resetForm(ref);
       // Loading(context).stop();
        Future.delayed(Duration(seconds: 1), () {
          ref.read(dshdProvider.notifier).reload();
          Loading(context).stop();
          if (data.state.success == true) {
            setState(() {
              _resultFile = [];
            });

            showDialog(
              //barrierDismissible:false,
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
          else{

            Loading(context).stop();
            showDialog(
              //barrierDismissible:false,
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

        });

      }

         /*if (next == loadingStatus.START) {
            Loading(context).start();
          }*/

         /* if (next == loadingStatus.STOP) {
            Future.delayed(Duration(seconds: 1), () {
              ref.read(dshdProvider.notifier).reload();
              Loading(context).stop();
              if (data.state.success == true) {
                setState(() {
                  _resultFile = [];
                });

                showDialog(
                  //barrierDismissible:false,
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
              else{

                Loading(context).stop();
                showDialog(
                  //barrierDismissible:false,
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

            });
          }*/
        });



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

        Form(
        key: _formKey,
          child:Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                titleForm(context, title: 'Thông tin hợp đồng'),
                bodyForm(
                  child: FormThongTinHopDongWidget(item: widget.item),
                ),
                ndGapH24(),

                titleForm(context, title: 'Upload file HĐ'),
                bodyForm(
                  child: const UploadFileHDWidget(),
                ),
                DataUploadMediaCustomer(),

                ndGapH24(),
                titleForm(context, title: 'Thông tin phiếu thu'),
                bodyForm(
                  child: const FormThongTinPhieuThuWidget(),
                ),

                ndGapH24(),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    FilledButton.icon(
                      onPressed: () {
                        ref.read(formThemPhieuThuProvider.notifier).batDatSubmit();
                        if (_formKey.currentState!.validate()) {
                          ref.read(formThemPhieuThuProvider.notifier).onSubmit(widget.item!.id.toString(), widget.item!.sohopdong.toString());
                        } else {
                          ref.read(formThemPhieuThuProvider.notifier).ketThucSubmit();
                        }


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
                        Navigator.of(context).pop();
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.outdent,
                        size: 16,
                      ),
                      label: const Text('Thoát'),
                    ),


                  ],
                )



                //const _BtnSubmit(),

              ],),
          ),
        )





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
  ref.read(formHopDongKyMoiProvider.notifier).batDatSubmit();
  if (_formKey.currentState!.validate()) {
    ref.read(formHopDongKyMoiProvider.notifier).saveForm();
  } else {
    ref.read(formHopDongKyMoiProvider.notifier).ketThucSubmit();
  }


}

_resetForm(WidgetRef ref) {
  _formKey.currentState?.reset();
  ref.refresh(formHopDongKyMoiProvider); // reset dữ liệu toàn Form
  ref.refresh(
      kiemTraKhachHangProvider); // reset dữ liệu thông tin khách hàng cũ
  ref.refresh(nhanVienPhuTrachProvider); // reset dữ liệu nhân viên phụ trách
  Future.delayed(const Duration(milliseconds: 100), () {
    ref.read(danhSachDomainProvider.notifier).lamMoiDanhSach();
  }); // reset danh sách domain
  ref.refresh(fileHDProvider);
}




class DataUploadMediaCustomer extends ConsumerWidget {
  DataUploadMediaCustomer({Key? key}) : super(key: key);

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
          //const SizedBox(height: 13.0),
          if (_listMedia.length > 0) ...[
            ListView.builder(
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: true,
                itemCount: _listMedia.length,
                itemBuilder: (BuildContext context, index) {
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
  late MediaResultModel item;
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
            child: BodyRowItem(Text(Helper.dateFormat(widget.item.createdAt.toString()))),
          ),
          Expanded(
            flex: 3,
            child: BodyRowItem(Text(widget.item!.lichsuKhoitao!.hoten!.toString())),
          ),
          Expanded(
            flex: 4,
            child: BodyRowItem(
                Text(_loaiPhiethu[widget.item.loaifile!].toString())),
          ),
          Expanded(
            flex: 3,
            child: BodyRowItem(Text(widget.item.ghichu!.toString())),
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
                      controller.text = widget.item.ghichu!.toString();

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


                            var updateMedia = await ref.read(dshdProvider.notifier).updateMedia({'id': widget.item.id,'ghichu': controller.text,'loaifile': _selected});

                            if(updateMedia['status']==true){
                              Navigator.of(context).pop();
                              setState(() {
                                widget.item = MediaResultModel.fromJson(updateMedia['data']);

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


