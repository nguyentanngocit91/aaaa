import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../_shared/extensions/date_time_extention.dart';
import '../../../../../_shared/utils/form_status.dart';
import '../models/domain_model.dart';
import '../providers/danh_sach_domain_moi_provider.dart';

class DetailDomain extends ConsumerWidget {
  DetailDomain({Key? key, required this.item}) : super(key: key);

  final DomainModel item;
  final TextEditingController ngayDangKyInput = TextEditingController();

  final DateTime selNgayKy = DateTime.now();

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    var statusForm = ref.watch(dsDomainMoiProvider).statusUpdate;
    String? idTenMien = item.sId;
    String? tenMien = item.tenmien;
    int? soNam = item.sonamdangky;
    String? hinhThucKH = item.khachhangId?.type;
    ngayDangKyInput.text = selNgayKy.formatDateTime();
    return SimpleDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(0),
      insetPadding: const EdgeInsets.all(30),
      elevation: 0,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: (tenMien != null)
              ? Text(
                  tenMien.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18),
                )
              : const Text('-'),
        ),
        const Divider(),
        Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(
            minWidth: 800,
            minHeight: 300,
          ),
          child: Stack(
            children: [
              (statusForm == FormStatus.submissionInProgress)
                  ?  const Positioned(child: Padding(

                    padding: EdgeInsets.all(100.0),
                    child: Center(child: CircularProgressIndicator()),
                  ))
                  : const SizedBox(),
              Column(
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
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text('Tên miền: '),
                            ),
                            Expanded(
                              flex: 1,
                              child: (tenMien != null)
                                  ? Text(
                                      tenMien,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  : const Text('-'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text('Số năm đăng ký: '),
                            ),
                            Expanded(
                              flex: 1,
                              child: (soNam != null)
                                  ? Text(
                                      '$soNam',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  : const Text('-'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text('Ngày kích hoạt'),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextField(
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
                              ),
                            ),
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
                        (hinhThucKH!=null && hinhThucKH =='cong-ty')?BoxCongTy(item: item.khachhangId,):BoxCaNhan(item: item.khachhangId),
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
                          if (ngayDangKy != '') {
                              ref.read(dsDomainMoiProvider.notifier).actionUpdateDomain(idDomain: (idTenMien!=null)?idTenMien:'', ngayDangKy: ngayDangKy, soNam: (soNam!=null)?soNam:0);
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
            ],
          ),
        ),
      ],
    );
    ;
  }
}

class BoxCongTy extends StatelessWidget {
  const BoxCongTy({
    super.key,
    required this.item,

  });

  final KhachhangId? item;

  @override
  Widget build(BuildContext context) {


    String? emailChinh = item?.email;
    //String? emailPhu = item.khachhangId.i
    String? tenCongTy = item?.congty;
    String? tenCaNhan = item?.hoten;
    String? maSoThue = item?.masothue;
    String? soCCCD = item?.cccd;
    String? diaChi = item?.diachi;
    String? dienThoai = item?.phone;
    String? dienThoaiCoQuan = item?.info?.dienthoaicoquan;

    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              flex: 1,
              child: Text('Hình thức:'),
            ),
            Expanded(
                child: Text('Công ty')),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('Email chính:'),
            ),
            Expanded(
                child: (emailChinh != null)
                    ? Text(emailChinh)
                    : const Text('-')),
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
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('Tên chủ thể:'),
            ),
            Expanded(
                child: (tenCongTy != null)
                    ? Text(tenCongTy)
                    : const Text('-')),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('Mã số thuế:'),
            ),
            Expanded(
                child: (maSoThue != null)
                    ? Text(maSoThue)
                    : const Text('-')),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('Người đại diện:'),
            ),
            Expanded(
                child: (tenCaNhan != null)
                    ? Text(tenCaNhan)
                    : const Text('-')),
          ],
        ),
        const SizedBox(
          height: 5,
        ),

        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('Địa chỉ:'),
            ),
            Expanded(
                child: (diaChi != null)
                    ? Text(diaChi)
                    : const Text('-')),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('Điện thoại:'),
            ),
            Expanded(
                child: (dienThoai != null)
                    ? Text(dienThoai)
                    : const Text('-')),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class BoxCaNhan extends StatelessWidget {
  const BoxCaNhan({
    super.key,
    required this.item,

  });

  final KhachhangId? item;

  @override
  Widget build(BuildContext context) {

    String? hinhThucKH = item?.type;
    String? emailChinh = item?.email;
    //String? emailPhu = item.khachhangId.i
    String? tenCongTy = item?.congty;
    String? tenCaNhan = item?.hoten;
    String? maSoThue = item?.masothue;
    String? soCCCD = item?.cccd;
    String? diaChi = item?.diachi;
    String? dienThoai = item?.phone;
    String? dienThoaiCoQuan = item?.info?.dienthoaicoquan;

    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              flex: 1,
              child: Text('Hình thức:'),
            ),
            Expanded(
                child: Text('Cá nhân')),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('Email chính:'),
            ),
            Expanded(
                child: (emailChinh != null)
                    ? Text(emailChinh)
                    : const Text('-')),
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
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('Tên chủ thể:'),
            ),
            Expanded(
                child: (tenCaNhan != null)
                    ? Text(tenCaNhan)
                    : const Text('-')),
          ],
        ),

        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('Số CCCD/CMND:'),
            ),
            Expanded(
                child: (soCCCD != null)
                    ? Text(soCCCD)
                    : const Text('-')),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('Địa chỉ:'),
            ),
            Expanded(
                child: (diaChi != null)
                    ? Text(diaChi)
                    : const Text('-')),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('Điện thoại:'),
            ),
            Expanded(
                child: (dienThoai != null)
                    ? Text(dienThoai)
                    : const Text('-')),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
