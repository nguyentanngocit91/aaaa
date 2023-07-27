import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nn_phanmem/modules/main/ketoan/phieuthu/widgets/pt_button_download.dart';
import 'pt_button.dart';
class BoxSearchPhieuThu extends StatelessWidget {
  BoxSearchPhieuThu({
    super.key,
  });

  TextEditingController dateInputFrom = TextEditingController();
  TextEditingController dateInputTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFf5f5f5),
        border: Border.all(color: const Color(0xFFdcdbdb)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Số phiếu thu',
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const SizedBox(
            width: 130,
            child: TextField(
              decoration: InputDecoration(
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
              controller: dateInputFrom,
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
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                  DateFormat('dd-MM-yyyy').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  dateInputFrom.text =
                      formattedDate; //set output date to TextField value.
                } else {}
              },
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 130,
            child: TextField(
              controller: dateInputTo,
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
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                  DateFormat('dd-MM-yyyy').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  dateInputTo.text =
                      formattedDate; //set output date to TextField value.
                } else {}
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
            onPressed: () {},
          ),
          const SizedBox(
            width: 5,
          ),
          const PTButtonDownload(
            title: 'Export DS Phiếu Thu',
            icon: Icon(
              Icons.download,
              color: Colors.white,
            ), urlPath: 'http://tools.dauchanviet.com/123.mp4', fileName: '111.mp4',
          ),
          const SizedBox(
            width: 5,
          ),
          const PTButtonDownload(
            title: 'Export DS Pending',
            icon: Icon(
              Icons.download,
              color: Colors.white,
            ), urlPath: 'http://tools.dauchanviet.com/123.mp4', fileName: '111.mp4',
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}