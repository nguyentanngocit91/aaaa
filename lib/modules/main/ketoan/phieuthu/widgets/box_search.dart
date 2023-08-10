import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../_shared/thietlap_url.dart';
import '../../../../../_shared/utils/show_ok_alert_dialog.dart';
import '../providers/phieu_thu_provider.dart';
import 'pt_button_download.dart';
import 'pt_button.dart';

class BoxSearchPhieuThu extends ConsumerWidget {
  BoxSearchPhieuThu({
    super.key,
  });

  final TextEditingController soPhieuThuInput = TextEditingController();
  final TextEditingController maHopDongInput = TextEditingController();
  final TextEditingController dateFromInput = TextEditingController();
  final TextEditingController dateToInput = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var soPhieuThu = ref.watch(phieuThuProvider).soPhieuThu;
    if (soPhieuThu != null) soPhieuThuInput.text = soPhieuThu;

    var soHopDong = ref.watch(phieuThuProvider).maHopDong;
    if (soHopDong != null) maHopDongInput.text = soHopDong;

    var tuNgay = ref.watch(phieuThuProvider).tuNgay;
    if (tuNgay != null) dateFromInput.text = tuNgay;

    var denNgay = ref.watch(phieuThuProvider).denNgay;
    if (denNgay != null) dateToInput.text = denNgay;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFf5f5f5),
        border: Border.all(color: const Color(0xFFdcdbdb)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: TextField(
              controller: soPhieuThuInput,
              decoration: const InputDecoration(
                hintText: 'Số phiếu thu',
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 130,
            child: TextField(
              controller: maHopDongInput,
              decoration: const InputDecoration(
                hintText: 'Mã HĐ',
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 130,
            child: TextField(
              controller: dateFromInput,
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
                  dateFromInput.text =
                      formattedDate; //set output date to TextField value.
                }
              },
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 130,
            child: TextField(
              controller: dateToInput,
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
                  dateToInput.text =
                      formattedDate; //set output date to TextField value.
                }
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          PtButton(
            title: 'Tìm kiếm',
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              bool isError = false;
              String soPhieuthu = soPhieuThuInput.text;
              String maHD = maHopDongInput.text;
              String tuNgay = dateFromInput.text;
              String denNgay = dateToInput.text;

              if (tuNgay != '' && denNgay != '') {
                DateTime date1 = DateFormat('dd-MM-yyyy').parse(tuNgay);
                DateTime date2 = DateFormat('dd-MM-yyyy').parse(denNgay);
                if (date1.isAfter(date2)) {
                  isError = true;
                  ShowOkAlertDialog.show(
                      context, 'Thông báo', 'Ngày sau phải lớn hơn ngày trước');
                }
              } else if (tuNgay != '' && denNgay == '') {
                isError = true;
                ShowOkAlertDialog.show(
                    context, 'Thông báo', 'Vui lòng chọn ngày sau');
              } else if (tuNgay == '' && denNgay != '') {
                isError = true;
                ShowOkAlertDialog.show(
                    context, 'Thông báo', 'Vui lòng chọn ngày trước');
              }

              if (soPhieuthu == '' &&
                  maHD == '' &&
                  tuNgay == '' &&
                  denNgay == '') {
                isError = true;
                ShowOkAlertDialog.show(
                    context, 'Thông báo', 'Vui lòng nhập thông tin cần tìm');
              }

              if (isError == false) {
                ref
                    .read(phieuThuProvider.notifier)
                    .setInputSoPhieuThu(soPhieuThu: soPhieuthu);
                ref
                    .read(phieuThuProvider.notifier)
                    .setInputMaHopDong(mahopDong: maHD);
                ref
                    .read(phieuThuProvider.notifier)
                    .setInputTuNgay(tuNgay: tuNgay);
                ref
                    .read(phieuThuProvider.notifier)
                    .setInputDenNgay(denNgay: denNgay);
                ref.read(phieuThuProvider.notifier).actionInputSearch();
              }
            },
          ),
          const SizedBox(
            width: 5,
          ),
           const PTButtonDownload(
            title: 'Export DS Phiếu Thu',
            icon: Icon(
              Icons.download,
              color: Colors.white,
            ),
            urlPath: '${ApiUrl.danhSachPhieuThu}/export?tungay=2023-1-15&denngay=2023-12-29',
            fileName: 'export.xls',
          ),
          const SizedBox(
            width: 5,
          ),
          const PTButtonDownload(
            title: 'Export DS Pending',
            icon: Icon(
              Icons.download,
              color: Colors.white,
            ),
            urlPath: 'http://tools.dauchanviet.com/123.mp4',
            fileName: '111.mp4',
          ),
          const SizedBox(
            width: 5,
          ),
          PtButton(
            title: 'Reset',
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              soPhieuThuInput.text = '';
              maHopDongInput.text = '';
              dateFromInput.text = '';
              dateToInput.text = '';
              ref.read(phieuThuProvider.notifier).resetInputSearch();
            },
          ),
        ],
      ),
    );
  }
}
