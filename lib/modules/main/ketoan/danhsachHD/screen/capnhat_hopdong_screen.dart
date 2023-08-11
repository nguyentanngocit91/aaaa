
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../_shared/mixins/form_ui_mixins.dart';
import '../../../../../_shared/utils/currency_text_input_formatter.dart';
import '../../../../../_shared/utils/helper.dart';
import '../../../../../_shared/utils/ndgap.dart';
import '../../../../../_shared/utils/show_ok_alert_dialog.dart';
import '../models/searchcustomercontract_model.dart';
import '../providers/ds_hd_provider.dart';




class UpdateThongTinHopDongWidget extends ConsumerWidget with FormUIMixins {
  const UpdateThongTinHopDongWidget({Key? key,required this.item}) : super(key: key);

  final SearchCustomerContractModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
                  'Cập nhật hợp đồng'.toUpperCase(),
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
          padding: const EdgeInsets.all(20),
          child: Column(
          children: [


            titleForm(context, title: 'Thông tin hợp đồng'),
            bodyForm(
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        lableTextForm('Mã hợp đồng Web/App'),
                        TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                          ),
                          controller: TextEditingController(text: item.mahopdong.toString()),
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                  ndGapW16(),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        lableTextForm('Tên hợp đồng'),
                        TextFormField(
                          controller: controllerTenHD,
                          decoration: InputDecoration(
                            label: Text(item.tenhopdong.toString()),
                            filled: true,
                            //fillColor: Colors.black12,
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,

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
                    flex: 1,
                    child: Column(
                      children: [
                        lableTextForm('Tổng giá trị'),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            label:Text(Helper.numberFormat(double.parse(item.tongtien.toString()))),
                            hintText:Helper.numberFormat(double.parse(item.tongtien.toString())),
                           // labelText: item.tongtien.toString(),
                            filled: true,
                          ),
                          controller: controllerTongTIEN,
                          inputFormatters: [
                            CurrencyTextInputFormatter(symbol: ''),
                          ],
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
            ),

            ndGapH24(),


            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [



                TextButton(
                  onPressed: () {

                    bool isError = false;
                    String tenHD = controllerTenHD.text;
                    String tongTien = controllerTongTIEN.text;

                    if (tenHD == '' && tongTien == '' ) {
                      isError = true;
                      ShowOkAlertDialog.show(
                          context, 'Thông báo', 'Vui lòng nhập thông tin');
                    }

                    if (isError == false) {
                      ref.read(dshdProvider.notifier).updateContractById(item.id.toString(),tenHD,tongTien.toString().replaceAll('.', ''));
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
