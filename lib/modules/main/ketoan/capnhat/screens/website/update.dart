import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:responsive_ui/responsive_ui.dart';

import '../../../../../../_shared/mixins/form_ui_mixins.dart';
import '../../../../../../_shared/utils/helper.dart';
import '../../../../../../_shared/utils/ndgap.dart';
import '../../models/contract_model.dart';
import '../../providers/capnhat_provider.dart';

enum HinhThucThanhToan { cod, bank }

enum LoaiPhieuThu { phieuthu, phieuthuBG, phieuthuApp, phieuthuBGApp }

class UpdateWebsite extends ConsumerStatefulWidget {
  UpdateWebsite({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  ConsumerState<UpdateWebsite> createState() => _UpdatePhieuThuScreenState();
}

class _UpdatePhieuThuScreenState extends ConsumerState<UpdateWebsite>
    with FormUIMixins {
  HinhThucThanhToan? _httt = HinhThucThanhToan.cod;
  LoaiPhieuThu? _loaiPT = LoaiPhieuThu.phieuthu;
  bool isLoading = true;
  Map<String,TextEditingController> listController = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ['mahopdong','ngaykyweb','ngaybangiao','chucnang','ghichu'].forEach((String item) => listController[item] = TextEditingController());
    Future.delayed(Duration.zero,() async {
      await ref.read(capnhatProvider.notifier).getConstractById(widget.id);
      ContractModel? data = ref.watch(capnhatProvider.select((value) => value.contract));
      listController!['mahopdong']!.text =
          data!.l1_data!.mahopdong.toString();
      listController!['ngaykyweb']!.text =
          Helper.dateFormat(data!.l1_data!.ngaykyhd.toString());
      listController!['ngaybangiao']!.text =
          Helper.dateFormat(data!.webs![0]['ngaybangiao']);
      listController!['chucnang']!.text = data!.webs![0]['chucnang'];
      listController!['ghichu']!.text = data!.l1_data!.ghichu.toString();

    });
  }
  @override
  Widget build(BuildContext context) {



    return SimpleDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(0),
      insetPadding: const EdgeInsets.all(30),
      elevation: 0,
      children: [

        const Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'CẬP NHẬT WEBSITE',
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        const Divider(),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.text_snippet_outlined,
                    color: Color(0xFF105a6c),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Thông tin website'.toUpperCase(),
                    style: const TextStyle(color: Color(0xFF105a6c)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFf5f5f5),
                    border: Border.all(color: const Color(0xFFdcdbdb)),
                  ),
                  child: ResponsiveGridRow(
                    children: [
                      ResponsiveGridCol(
                        lg: 6,
                        xs: 12,
                        child: Container(
                          padding: Helper.padding(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Mã hợp đồng',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextField(
                                controller: listController['mahopdong'],
                                readOnly: true,
                                decoration: Helper().disabledInput(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 6,
                        md: 6,
                        lg: 3,
                        child: Container(
                          padding: Helper.padding(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ngày ký web',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                readOnly: true,
                                controller: listController['ngaykyweb'],
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'Không bỏ trống.'),
                                ]),
                                onTap: () async {
                                  final DateTime? selDate = await Helper.onSelectDate(context,initialDate: Helper.parseDate(listController['ngaykyweb']!.value.text,'dd-MM-yyyy'));
                                  if(selDate!=null){
                                    listController['ngaykyweb']!.text = Helper.dateFormat(selDate);
                                    DateTime date1 = Helper.parseDate(listController['ngaykyweb']!.value.text,'dd-MM-yyyy');
                                    DateTime date2 = Helper.parseDate(listController['ngaybangiao']!.value.text,'dd-MM-yyyy');
                                    if(date1.compareTo(date2) > 0){
                                      listController['ngaybangiao']!.text = Helper.dateFormat(selDate);
                                    }

                                  }
                                },

                              ),
                            ],
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 6,
                        md: 6,
                        lg: 3,
                        child: Container(
                          padding: Helper.padding(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ngày bàn giao',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                readOnly: true,
                                controller: listController['ngaybangiao'],
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'Không bỏ trống.'),
                                ]),
                                onTap: () async {
                                  final DateTime? selDate = await Helper.onSelectDate(context,initialDate: Helper.parseDate(listController['ngaybangiao']!.value.text,'dd-MM-yyyy'),firstDate: Helper.parseDate(listController['ngaykyweb']!.value.text,'dd-MM-yyyy'));
                                  if(selDate!=null){
                                    listController['ngaybangiao']!.text = Helper.dateFormat(selDate);
                                  }
                                },

                              ),
                            ],
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 12,
                        child: Container(
                          padding: Helper.padding(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Chức năng',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: listController['chucnang'],
                                maxLines: 3,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'Không bỏ trống.'),
                                ]),

                              ),
                            ],
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 12,
                        child: Container(
                          padding: Helper.padding(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ghi chú',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: listController['ghichu'],
                                maxLines: 3,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'Không bỏ trống.'),
                                ]),

                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 10,
              ),
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

              const SizedBox(
                height: 10,
              ),
              Data(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
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
            ],
          ),
        ),
      ],
    );
    ;
  }
}

class Data extends ConsumerWidget {
  Data({Key? key}) : super(key: key);

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
