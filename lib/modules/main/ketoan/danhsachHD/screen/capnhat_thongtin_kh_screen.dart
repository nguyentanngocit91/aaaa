
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../../_shared/mixins/form_ui_mixins.dart';
import '../../../../../_shared/utils/debouncer.dart';
import '../../../../../_shared/utils/helper.dart';
import '../../../../../_shared/utils/ndgap.dart';
import '../../../../../_shared/utils/show_ok_alert_dialog.dart';
import '../../khach_hang_moi/providers/form_khach_hang_moi_provider.dart';
import '../../khach_hang_moi/providers/kiem_tra_khach_hang_provider.dart';
import '../models/customerupdate_model.dart';
import '../models/mediacustomer_model.dart';
import '../models/searchcustomer_model.dart';
import '../providers/ds_hd_provider.dart';
import '../providers/form_update_provider.dart';

Map<String, String> _loaiPhiethu = {
  'hopdong': 'Hợp đồng',
  'chungtu': 'Chứng từ khác'
};
GlobalKey<FormState> _formKey = GlobalKey();
List<Map> _resultFile = [];
List<MediaCustomerModel> _listMedia = [];
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
  Map<String, FocusNode> listFocusNode = {};

  final String _typeData = 'khachhang';
   HinhThucThanhToan? _httt = HinhThucThanhToan.cod;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ['makhachhang', 'email', 'email_phu', 'hoten', 'phone', 'type_customer', 'congty', 'nguoidaidienmoi', 'dienthoaicoquan', 'masothue', 'cccd', 'diachi', 'ghichu'].forEach((item) {
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

      print("${data?.makhachhang!.toString()}+makhachhang");

      listController!['makhachhang']!.text = data!.makhachhang!.toString();
      listController!['email']!.text = data!.email!.toString();
      listController!['email_phu']!.text = data!.l1_info!.email_phu.toString();
      listController!['hoten']!.text = data!.hoten!;
      listController!['phone']!.text = data!.phone!;

      listController!['type_customer']!.text = data!.type!;
      listController!['congty']!.text = data!.congty!;
      listController!['nguoidaidienmoi']!.text = data!.l1_info!.nguoidaidienmoi!;
      listController!['dienthoaicoquan']!.text = data!.l1_info!.dienthoaicoquan!;

      listController!['masothue']!.text = data!.masothue!;
      listController!['cccd']!.text = data!.cccd!;
      listController!['diachi']!.text = data!.diachi!;
      listController!['ghichu']!.text = data!.ghichu!;

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

    print("${listController['email']}+email");

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
                            value: 'ca-nhan',
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
                              ref.read(formKhachHangMoiProvider.notifier).changeData(
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
                      'UPLOAD FILE HĐ',
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
                  child: ResponsiveGridRow(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ResponsiveGridCol(
                          lg: 12,
                          xl:4,
                          md:12,
                          xs: 12,
                          child: Container(
                            padding: Helper.padding(),
                            child: Row(
                              children: [
                                const Text(
                                  'Phương thức thanh toán:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Radio<HinhThucThanhToan>(
                                  value: HinhThucThanhToan.cod,
                                  groupValue: _httt,
                                  onChanged: (HinhThucThanhToan? value) {
                                    setState(() {
                                      _httt = value;
                                    });
                                  },
                                ),
                                const Text('Hợp đồng'),
                                Radio<HinhThucThanhToan>(
                                  value: HinhThucThanhToan.bank,
                                  groupValue: _httt,
                                  onChanged: (HinhThucThanhToan? value) {
                                    setState(() {
                                      _httt = value;
                                    });
                                  },
                                ),
                                const Text('Chứng từ khác'),
                              ],
                            ),
                          ),
                        ),
                        ResponsiveGridCol(
                          lg: 6,
                          xl:4,
                          xs: 12,
                          child: Container(
                            padding: Helper.padding(),
                            child: SizedBox(
                              child: inputUploadFile(context,
                                  //   controller: textEditingController,
                                  validator: FormBuilderValidators.compose([
                                    //    FormBuilderValidators.required(errorText: 'Vui lòng chọn File.')
                                  ]), onTap: () async {
                                    String path = '';
                                    final result =
                                    await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: [
                                        'pdf',
                                        'doc',
                                        'docx',
                                        'xls',
                                        'xlsx'
                                      ],
                                    );
                                    if (result != null) {
                                      PlatformFile file = result.files.first;
                                      //   textEditingController.text = file.name;
                                    } else {
                                      // textEditingController.clear();
                                    }
                                  }),
                            ),
                          ),
                        ),
                        ResponsiveGridCol(
                          xs: 12,
                          lg: 6,
                          xl:4,
                          child: Container(
                            padding: Helper.padding(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    hintText:
                                    'Nhập nội dung ghi chú cho file upload',
                                  ),
                                  // controller: txtGhichu,
                                  maxLines: 3, //or null
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),

                DataTable_UpdateKH(),

                ndGapH24(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [



                    TextButton(
                      onPressed: () {
                        bool isError = false;

                        if (isError == false) {

                          Navigator.of(context).pop();
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



class DataTable_UpdateKH extends ConsumerWidget {
  DataTable_UpdateKH({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
                Expanded(
                    flex:1,
                    child: HeaderRowItem(text: 'STT')),
                Expanded(
                  flex:3,
                  child: HeaderRowItem(text: 'Ngày tháng'),
                ),

                Expanded(
                  flex:3,
                  child: HeaderRowItem(text: 'User cập nhật'),
                ),
                Expanded(
                  flex:4,
                  child: HeaderRowItem(text: 'Loại file'),
                ),
                Expanded(
                  flex:3,
                  child: HeaderRowItem(text: 'Ghi chú'),
                ),
                Expanded(
                  flex:4,
                  child: HeaderRowItem(text: 'Thao tác'),
                ),

              ],
            ),
          ),
          // if(data!=null && data['data'].length > 0)...[
          //   ListView.builder(
          //       padding: const EdgeInsets.all(0),
          //       physics: const NeverScrollableScrollPhysics(),
          //       shrinkWrap: true,
          //       primary: true,
          //       itemCount: data['data'].length,
          //       itemBuilder: (BuildContext context, index) {
          //         InfoResponseModel info = data['info'];
          //         return InfoUpdate(item: data['data'][index], index: info.page! * info.limit! - (info.limit!)+index+1);
          //       }),
          //   GeneratePagin(data['info']),
          // ]else...[
          //   const BsAlert(
          //     closeButton: false,
          //     margin: EdgeInsets.only(bottom: 10.0),
          //     style: BsAlertStyle.danger,
          //     child: Text('Không có dữ liệu',textAlign: TextAlign.center),
          //   ),
          //
          // ],
        ],
      ),
    );
  }
}
