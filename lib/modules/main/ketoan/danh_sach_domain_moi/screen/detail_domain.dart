import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../_shared/extensions/date_time_extention.dart';

class DetailDomain extends StatelessWidget {
   DetailDomain({Key? key}) : super(key: key);

  final TextEditingController ngayDangKyInput = TextEditingController();

  final DateTime selNgayKy = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ngayDangKyInput.text = selNgayKy.formatDateTime();
    return SimpleDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(0),
      insetPadding: const EdgeInsets.all(30),
      elevation: 0,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'nina.vn'.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        const Divider(),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SelectionArea(
                child: Column(
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
                          'Thông tin tên miền'.toUpperCase(),
                          style: const TextStyle(color: Color(0xFF105a6c)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Tên miền: '),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'nina.vn',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Số năm đăng ký: '),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '1',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Expanded(flex:1,child: Text('Ngày kích hoạt'),),
                        Expanded(flex:1,child: TextField(
                          controller: ngayDangKyInput,
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));
                            if (pickedDate != null) {
                              //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                              //formatted date output using intl package =>  2021-03-16
                              ngayDangKyInput.text =
                                  formattedDate; //set output date to TextField value.
                            }
                          },
                        ),),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                          'Thông tin khách hàng'.toUpperCase(),
                          style: const TextStyle(color: Color(0xFF105a6c)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Hình thức:'),
                        ),
                        Expanded(child: Text('Cá nhân')),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Email chính:'),
                        ),
                        Expanded(child: Text('nina@nina.vn')),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Email phụ:'),
                        ),
                        Expanded(child: Text('')),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Tên chủ thể:'),
                        ),
                        Expanded(child: Text('Nguyễn Xuân Linh')),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Mã số thuế:'),
                        ),
                        Expanded(child: Text('03678696876')),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Người đại diện:'),
                        ),
                        Expanded(child: Text('Nguyễn Xuân Linh')),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Số CCCD/CMND:'),
                        ),
                        Expanded(child: Text('112123117')),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Địa chỉ:'),
                        ),
                        Expanded(
                            child: Text(
                                '1 Tô ký, Phường Tân Chánh Hiệp, Quận 12, TP.HCM')),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Điện thoại:'),
                        ),
                        Expanded(child: Text('0932129225')),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      String ngayDangKy = ngayDangKyInput.text;
                      if(ngayDangKy!='') {


                        Navigator.of(context).pop();
                      }
                    },
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.blueAccent),
                    child: const Text(
                      'Cập nhật đăng ký',
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
