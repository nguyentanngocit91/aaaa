
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
import '../../khach_hang_moi/khach_hang_moi_layout.dart';
import '../../khach_hang_moi/providers/form_khach_hang_moi_provider.dart';
import '../../khach_hang_moi/providers/kiem_tra_khach_hang_provider.dart';
import '../models/searchcustomer_model.dart';
import '../providers/ds_hd_provider.dart';

enum HinhThucThanhToan { cod, bank }

class UpdateThongTinKHScreen extends ConsumerStatefulWidget {
  UpdateThongTinKHScreen({Key? key, required this.item}) : super(key: key);
  final SearchCustomerModel item;

  @override
  ConsumerState<UpdateThongTinKHScreen> createState() => _UpdateThongTinKHScreenState();
}
class _UpdateThongTinKHScreenState extends ConsumerState<UpdateThongTinKHScreen>
    with FormUIMixins {

  final Debouncer onSearchDebouncer =
  Debouncer(delay: const Duration(seconds: 2));
  final String _typeData = 'khachhang';
  final TextEditingController _emailController = TextEditingController();
   HinhThucThanhToan? _httt = HinhThucThanhToan.cod;
  @override
  Widget build(BuildContext context) {

    final controllerTenHD = TextEditingController();
    final controllerTongTIEN = TextEditingController();

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

        Container(
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'Không bỏ trống.'),
                            FormBuilderValidators.email(
                                errorText: 'Email không đúng định dạng.')
                          ]),
                          onChanged: (value) {
                            ref.read(formKhachHangMoiProvider.notifier).changeData(
                                key: 'email', value: value, type: _typeData);
                            if (value.isEmail()) {
                              onSearchDebouncer.debounce(
                                    () {
                                  ref
                                      .read(kiemTraKhachHangProvider.notifier)
                                      .kiemTraThongTinKhachHang(email: value);
                                },
                              );
                            }
                          },
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
                          controller: TextEditingController(),
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
                          controller: TextEditingController(),
                          onChanged: (value) {
                            ref.read(formKhachHangMoiProvider.notifier).changeData(
                                key: 'hoten', value: value, type: _typeData);
                          },
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
                          controller:
                          TextEditingController(),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'Không bỏ trống.'),
                          ]),
                          onChanged: (value) {
                            ref.read(formKhachHangMoiProvider.notifier).changeData(
                                key: 'phone', value: value, type: _typeData);
                          },
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
                          controller: TextEditingController(),
                          onChanged: (value) {
                            ref.read(formKhachHangMoiProvider.notifier).changeData(
                                key: 'info',
                                value: {"email_phu": value},
                                type: _typeData);
                          },
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
                          controller: TextEditingController(),
                          onChanged: (value) {
                            ref.read(formKhachHangMoiProvider.notifier).changeData(
                                key: 'congty', value: value, type: _typeData);
                          },
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
                          controller: TextEditingController(),
                          onChanged: (value) {
                            ref.read(formKhachHangMoiProvider.notifier).changeData(
                                key: 'info',
                                value: {"nguoidaidienmoi": value},
                                type: _typeData);
                          },
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
                          controller: TextEditingController(),
                          onChanged: (value) {
                            ref.read(formKhachHangMoiProvider.notifier).changeData(
                                key: 'info',
                                value: {"dienthoaicoquan": value},
                                type: _typeData);
                          },
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
                          controller: TextEditingController(),
                          onChanged: (value) {
                            ref.read(formKhachHangMoiProvider.notifier).changeData(
                                key: 'masothue', value: value, type: _typeData);
                          },
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
                          controller:
                          TextEditingController(),
                          onChanged: (value) {
                            ref.read(formKhachHangMoiProvider.notifier).changeData(
                                key: 'cccd', value: value, type: _typeData);
                          },
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
                          controller: TextEditingController(),
                          readOnly:  false,
                          minLines: 3,
                          maxLines: 3,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'Không bỏ trống.'),
                          ]),
                          onChanged: (value) {
                            ref.read(formKhachHangMoiProvider.notifier).changeData(
                                key: 'diachi', value: value, type: _typeData);
                          },
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
                          controller: TextEditingController(),
                          minLines: 3,
                          maxLines: 3,
                          onChanged: (value) {
                            ref.read(formKhachHangMoiProvider.notifier).changeData(
                                key: 'ghichu',
                                value: value,
                                type: _typeData);
                          },
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
                      String tenHD = controllerTenHD.text;
                      String tongtien = controllerTongTIEN.text;

                      if (tenHD == '' && tongtien == '' ) {
                        isError = true;
                        ShowOkAlertDialog.show(
                            context, 'Thông báo', 'Vui lòng nhập thông tin');
                      }

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
