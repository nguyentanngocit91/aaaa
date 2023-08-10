
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bs_flutter_alert/bs_flutter_alert.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../../../../_shared/mixins/form_ui_mixins.dart';
import '../../../../../_shared/utils/helper.dart';
import '../../../../../_shared/utils/ndgap.dart';
import '../../../../../_shared/utils/show_ok_alert_dialog.dart';
import '../models/customerupdate_model.dart';
import '../models/media_result_model.dart';
import '../providers/ds_hd_provider.dart';
import '../providers/form_update_provider.dart';

Map<String, String> _loaiPhiethu = {
  'chungtu': 'Chứng từ khác'
};

String _loaiFileHD = 'chungtu';

GlobalKey<FormState> _formKey = GlobalKey();
List<Map> _resultFile = [];
List<MediaResultModel> _listMedia = [];
enum HinhThucThanhToan { cod, bank }

class UpdateThongTinKHScreen extends ConsumerStatefulWidget {
  UpdateThongTinKHScreen({Key? key, required this.id,required this.customerNumber}) : super(key: key);
  final String id;
  final String customerNumber;

  @override
  ConsumerState<UpdateThongTinKHScreen> createState() => _UpdateThongTinKHScreenState();
}
class _UpdateThongTinKHScreenState extends ConsumerState<UpdateThongTinKHScreen>
    with FormUIMixins {

  bool isLoading = true;
  Map<String, TextEditingController> listController = {};
  String typeKH='ca-nhan';

  Map<String, FocusNode> listFocusNode = {};
  final String _typeData = 'khachhang';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ['makhachhang', 'email', 'email_phu', 'hoten', 'phone', 'congty', 'nguoidaidienmoi', 'dienthoaicoquan', 'masothue', 'cccd', 'diachi', 'ghichu'].forEach((item) {
      listController[item] = TextEditingController();
      listFocusNode[item] = FocusNode();
    });

    Future.delayed(Duration.zero, () async {
      print("${widget.id}+widget.id");
      await ref.read(dshdProvider.notifier).getCustomerById(widget.id);
      var res = ref.watch(dshdProvider.notifier);
      CustomerUpdateModel? data = res.state.customer;

      setState(() {
        _listMedia = res.state.media!;
      });

      typeKH = data!.type.toString();
      print("${data?.ghichu!.toString()}+ghichu");

      listController!['makhachhang']!.text = data!.makhachhang!.toString();
      listController!['email']!.text = data!.email!.toString();
      listController!['email_phu']!.text = data!.info!.emailPhu.toString();
      listController!['hoten']!.text = data!.hoten.toString();
      listController!['phone']!.text = data!.phone.toString();


      listController!['congty']!.text = data!.congty.toString();
      listController!['nguoidaidienmoi']!.text = data!.info!.nguoidaidienmoi.toString();
      listController!['dienthoaicoquan']!.text = data!.info!.dienthoaicoquan.toString();

      listController!['masothue']!.text = data!.masothue.toString();
      listController!['cccd']!.text = data!.cccd.toString();
      listController!['diachi']!.text = data!.diachi.toString();
      listController!['ghichu']!.text = data!.ghichu.toString();

    });
  }
  @override

  Widget build(BuildContext context) {

    FormUpdateNotifier data = ref.read(formUpdateProvider.notifier);
    ref.listen(formUpdateProvider.select((value) => value.loading),
            (previous, next) {
          if (next == loadingStatus.START) {
            Loading(context).start();
          }
          if (next == loadingStatus.STOP) {
            Future.delayed(Duration(seconds: 1), () {
              ref.read(dshdProvider.notifier).reload();
              Loading(context).stop();
              if (data.state.success == true) {
                setState(() {
                  _resultFile = [];
                });
              }
              AwesomeDialog(
                context: context,
                width: 400.0,
                dialogType:
                data.state.success ? DialogType.success : DialogType.error,
                animType: AnimType.scale,
                title: 'Thông báo',
                desc: data.state.message,
                btnCancelOnPress: () {},
                btnOkOnPress: () {},
              )..show();
            });
          }
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
                'Cập nhật thông tin khách hàng'.toUpperCase(),
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
          child:  Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [


                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          lableTextForm(
                            'Email khách hàng',
                          ),
                          TextFormField(
                            controller: listController['email'],
                            focusNode: listFocusNode['email'],
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Không bỏ trống.'),
                              FormBuilderValidators.email(
                                  errorText: 'Email không đúng định dạng.')
                            ]),
                          ),
                        ],
                      ),
                    ),


                    ndGapW16(),
                    Expanded(
                      child: Column(
                        children: [
                          lableTextForm('Mã khách hàng'),
                          TextFormField(
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.black12,
                            ),
                            readOnly: true,

                            controller: listController['makhachhang'],
                            focusNode: listFocusNode['makhachhang'],

                          ),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      child: Column(
                        children: [
                          lableTextForm('Tên khách hàng'),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            readOnly:  false,
                            controller: listController['hoten'],
                            focusNode: listFocusNode['hoten'],

                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Không bỏ trống.'),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      child: Column(
                        children: [
                          lableTextForm('Điện thoại di động'),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            readOnly:false,
                            controller: listController['phone'],
                            focusNode: listFocusNode['phone'],
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Không bỏ trống.'),
                            ]),

                          ),
                        ],
                      ),
                    ),


                  ],
                ),

                ndGapH24(),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          lableTextForm('Email khách hàng (email phụ)'),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            readOnly:  false,

                            controller: listController['email_phu'],
                            focusNode: listFocusNode['email_phu'],

                            /*onChanged: (value) {
                              ref.read(formKhachHangMoiProvider.notifier).changeData(
                                  key: 'info',
                                  value: {"email_phu": value},
                                  type: _typeData);
                            },*/
                          ),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          lableTextForm('Loại Khách hàng'),
                          DropdownButtonFormField(
                            value:  typeKH,
                            items: const [
                              DropdownMenuItem<String>(
                                value: 'ca-nhan',
                                child: Text('Cá Nhân'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'cong-ty',
                                child: Text('Công Ty'),
                              ),
                            ],
                            onChanged: (value) {
                              ref.read(formUpdateProvider.notifier).changeData(
                                  key: 'type', value: value, type: _typeData);


                            },
                          ),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          lableTextForm('Tên Công ty /  Cá Nhân'),
                          TextFormField(
                            readOnly: false,
                            controller: listController['congty'],
                            focusNode: listFocusNode['congty'],

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ndGapH24(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          lableTextForm('Người đại diện mới'),
                          TextFormField(
                            readOnly:  false,
                            controller: listController['nguoidaidienmoi'],
                            focusNode: listFocusNode['nguoidaidienmoi'],
                          ),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      child: Column(
                        children: [
                          lableTextForm('Điện thoại cơ quan'),
                          TextFormField(
                            readOnly: false,
                            controller: listController['dienthoaicoquan'],
                            focusNode: listFocusNode['dienthoaicoquan'],
                          ),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      child: Column(
                        children: [
                          lableTextForm('Mã số thuế'),
                          TextFormField(
                            readOnly: false,
                            controller: listController['masothue'],
                            focusNode: listFocusNode['masothue'],
                          ),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      child: Column(
                        children: [
                          lableTextForm('CCCD / CMND'),
                          TextFormField(
                            readOnly:  false,
                            controller: listController['cccd'],
                            focusNode: listFocusNode['cccd'],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ndGapH24(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          lableTextForm('Địa chỉ'),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: listController['diachi'],
                            focusNode: listFocusNode['diachi'],
                            readOnly:  false,
                            minLines: 3,
                            maxLines: 3,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Không bỏ trống.'),
                            ]),

                          ),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      child: Column(
                        children: [
                          lableTextForm('Ghi chú'),
                          TextFormField(
                            readOnly: false,
                            controller: listController['ghichu'],
                            focusNode: listFocusNode['ghichu'],
                            minLines: 3,
                            maxLines: 3,

                          ),
                        ],
                      ),
                    ),
                  ],
                ),



                ndGapH24(),

                const Row(
                  children: [
                    const Icon(
                      Icons.text_snippet_outlined,
                      color: Color(0xFF105a6c),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'UPLOAD CHỨNG TỪ',
                      style: const TextStyle(color: Color(0xFF105a6c)),
                    ),
                  ],
                ),

                ndGapH24(),

                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFf5f5f5),
                    border: Border.all(color: const Color(0xFFdcdbdb)),
                  ),
                  child: UploadFileWidget(),
                ),

                ndGapH24(),

                DataUploadMediaCustomer(),

                ndGapH24(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          print("${listController["email_phu"]?.text.toString()}+email_phu");

                          Map<String, String> _typeInfo = {
                            'email_phu': listController["email_phu"]!.text.toString(),
                            'nguoidaidienmoi': listController["nguoidaidienmoi"]!.text.toString(),
                            'dienthoaicoquan':listController["dienthoaicoquan"]!.text.toString(),
                          };
                          print("${_typeInfo}+array _typeInfo  _typeInfo");

                          listController.forEach((key, value) {
                             if(key=="email_phu" ||  key=="nguoidaidienmoi" ||  key=="dienthoaicoquan"){
                               ref.read(formUpdateProvider.notifier).changeData(key: 'info', value: _typeInfo, type: _typeData);
                             } else{
                               ref.read(formUpdateProvider.notifier).changeData(key: key, value: value.text, type: _typeData);
                             }

                          });
                          ref.read(formUpdateProvider.notifier).onSubmit(widget.id, widget.customerNumber);
                        } else {
                          listFocusNode.forEach((key, value) {
                            value.requestFocus();
                          });
                        }
                      },

                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.blueAccent),
                      child: const Text(
                        'Cập nhật',
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
                        Navigator.of(context).pop();
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
                )


              ],),
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

  String _radioValue = 'Chứng từ khác';

  List<Widget> _uploadType() {
    List<Widget> radioButtons = [];
    _loaiPhiethu.forEach((key, value) {
      //print(value);
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

                      Radio<String>(
                        value: 'chungtu',
                        groupValue: _loaiFileHD,
                        onChanged: (value) {
                          setState(() {
                            _loaiFileHD = value!;
                          });
                        },
                      ),
                      const Text('Chứng từ khác'),

                      //..._uploadType()
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
                         // print(result?.files.first.bytes);
                          if (result != null && result?.files.first != null) {
                            List<String> name = [];
                            for (var file in result.files) {
                              name.add(file.name);
                            }
                            _files = result.files;
                            _uploadController.text = name.join(",");
                           // print( _uploadController.text);
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
                              // print(_resultFile.length);

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
                             // print(_tmpFile.length);
                              setState(() {
                                for (PlatformFile file in _tmpFile) {
                                  Map tmp = {
                                    /*'type': _radioValue,
                                    'typeName': _loaiPhiethu[_radioValue],*/
                                    'type': "chungtu",
                                    'typeName': "chứng từ khác",
                                    'note': _noteController.text,
                                    'file': file
                                  };
                                  _resultFile.add(tmp);
                                }
                                _noteController.text = '';
                                _uploadController.text = '';
                                _radioValue = '';
                              });
                            // print("${_resultFile}+_resultFile");
                              ref.read(formUpdateProvider.notifier).setFile(_resultFile);
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
            child: BodyRowItem(Text(Helper.dateFormat(widget.item.createdAt))),
          ),
          Expanded(
            flex: 3,
            child: BodyRowItem(Text(widget.item!.lichsuKhoitao!.hoten!)),
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
