import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nn_phanmem/modules/main/ketoan/phieuthu/widgets/pt_button.dart';

class PhieuThuLayout extends StatelessWidget {
  PhieuThuLayout({Key? key}) : super(key: const Key(pathName));

  static const String pathName = 'phieuthu';

  TextEditingController dateInputFrom = TextEditingController();
  TextEditingController dateInputTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.grey,
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
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              PtButton(
                title: 'Export DS Phiếu Thu',
                icon: const Icon(Icons.download),
                onPressed: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              PtButton(
                title: 'Export DS Pending',
                icon: const Icon(Icons.download),
                onPressed: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              PtButton(
                title: 'Reset',
                icon: const Icon(Icons.close),
                onPressed: () {},
              ),
            ],
          ),
        ),
        
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 600,
                  columns: const [
                    DataColumn2(
                      label: Text('#'),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text('Ngày tháng'),
                    ),
                    DataColumn(
                      label: Text('Mã KH'),
                    ),
                    DataColumn(
                      label: Text('Mã HĐ'),
                    ),
                    DataColumn(
                      label: Text('Số PT'),
                    ),
                    DataColumn(
                      label: Text('Mã NV'),
                    ),
                    DataColumn(
                      label: Text('Tên NV'),
                    ),
                    DataColumn(
                      label: Text('Phòng'),
                    ),
                    DataColumn(
                      label: Text('Khu vực'),
                    ),
                    DataColumn(
                      label: Text('HTTT'),
                    ),
                    DataColumn(
                      label: Text('Tổng thu'),
                    ),
                    DataColumn(
                      label: Text('Phí web'),
                    ),
                    DataColumn(
                      label: Text('Phí NC web'),
                    ),
                    DataColumn(
                      label: Text('Phí hosting'),
                    ),
                    DataColumn(
                      label: Text('Phí NC hosting'),
                    ),
                    DataColumn(
                      label: Text('Phí domain'),
                    ),
                    DataColumn(
                      label: Text('Thao tác'),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                      100,
                      (index) => DataRow(cells: [
                        DataCell(Text((index+1).toString())),
                        DataCell(Text('B' * (10 - (index + 5) % 10))),
                        DataCell(Text('C' * (15 - (index + 5) % 10))),
                        DataCell(Text('D' * (15 - (index + 10) % 10))),
                        DataCell(Text('D' * (15 - (index + 10) % 10))),
                        DataCell(Text('D' * (15 - (index + 10) % 10))),
                        DataCell(Text('D' * (15 - (index + 10) % 10))),
                        DataCell(Text('D' * (15 - (index + 10) % 10))),
                        DataCell(Text('D' * (15 - (index + 10) % 10))),
                        DataCell(Text('D' * (15 - (index + 10) % 10))),
                        DataCell(Text('D' * (15 - (index + 10) % 10))),
                        DataCell(Text('D' * (15 - (index + 10) % 10))),
                        DataCell(Text('D' * (15 - (index + 10) % 10))),
                        DataCell(Text('D' * (15 - (index + 10) % 10))),
                        DataCell(Text('D' * (15 - (index + 10) % 10))),
                        DataCell(Text('D' * (15 - (index + 10) % 10))),
                        DataCell(Text(((index + 0.1) * 25.4).toString()))
                          ]))),
            ),
          ),
        )
      ],
    );
  }
}
