import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../phieuthu/widgets/pt_button.dart';

class Data20152019 extends StatefulWidget {
  const Data20152019({Key? key}) : super(key:const Key(pathName));
  static const String pathName = 'data-2015-2019';

  @override
  State<Data20152019> createState() => _Data20152019State();
}

class _Data20152019State extends State<Data20152019> {


  TextEditingController dateInputFrom = TextEditingController();
  TextEditingController dateInputTo = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    dateInputFrom.text=formattedDate;
    dateInputTo.text=formattedDate;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: const Color(0xfff5f5f5),
                  border: Border.all(width: 1, color: const Color(0xffdcdbdb))),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 0,
                      children: [
                        Text(
                          'Từ ngày',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(color: Colors.white),
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
                                print( formattedDate); //formatted date output using intl package =>  2021-03-16
                                dateInputFrom.text =
                                    formattedDate; //set output date to TextField value.
                              } else {}
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 0,
                      children: [
                        Text(
                          'Đến ngày',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(color: Colors.white),
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
                                print( formattedDate); //formatted date output using intl package =>  2021-03-16
                                dateInputTo.text =
                                    formattedDate; //set output date to TextField value.
                              } else {}
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width:10,
                  ),


                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 0,
                      children: [
                        Text(
                          'Mã HĐ',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: TextField(

                            //set it true, so that user will not able to edit text
                            onTap: () async {

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width:10,
                  ),

                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 0,
                      children: [
                        Text(
                          'Mã Số thuế',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: TextField(

                            //set it true, so that user will not able to edit text
                            onTap: () async {

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width:10,
                  ),

                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 0,
                      children: [
                        Text(
                          'Số phiếu thu',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: TextField(

                            //set it true, so that user will not able to edit text
                            onTap: () async {

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width:10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 0,
                      children: [
                        Text(
                          'Tên công ty',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: TextField(

                            //set it true, so that user will not able to edit text
                            onTap: () async {

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width:10,
                  ),

                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 0,
                      children: [
                        Text(
                          'Email',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: TextField(

                            //set it true, so that user will not able to edit text
                            onTap: () async {

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width:10,
                  ),

                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 0,
                      children: [
                        Text(
                          'Domain',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: TextField(

                            //set it true, so that user will not able to edit text
                            onTap: () async {

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width:10,
                  ),

                  Expanded(

                    child: Wrap(
                      runSpacing: 0,
                      children: [
                        Container(
                          margin:const EdgeInsets.only(top:20),
                          child: PtButton(width:150,icon:const Icon(Icons.search,color:Colors.white,),title:"Tìm kiếm", onPressed: (){
                            print("Export");
                          },),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
            SizedBox(height:30,),


          Expanded(
            child: DataTable2(
                columnSpacing: 8,
                horizontalMargin: 8,
                minWidth: 600,
                headingRowColor: MaterialStatePropertyAll(Color(0xff105a6c)),
                headingTextStyle: TextStyle(color: Color(0xffffffff)),

                columns: const [
                  DataColumn2(
                      label: Text('#'),
                      fixedWidth: 50

                  ),
                  DataColumn2(
                    label: Text('Mã HĐ'),
                    fixedWidth:150,

                  ),
                  DataColumn(
                    label: Text('Số phiếu thu'),
                  ),
                  DataColumn2(
                      label: Text('	Cty/Tên khách hàng'),

                  ),
                  DataColumn2(
                      label: Text('Tên khách hàng'),

                  ),
                  DataColumn2(
                    label: Text('	Điện thoại'),

                  ),
                  DataColumn2(
                    label: Text('Email'),

                  ),
                  DataColumn2(
                    label: Text('Ghi chú'),

                  ),
                  DataColumn2(
                    label: Text('Thao tác'),
                    fixedWidth:110
                  ),


                ],
                rows: List<DataRow>.generate(
                    1000,
                        (index) => DataRow(cells: [
                      DataCell(Container(width:50,child:Text((index + 1).toString()),)),
                      DataCell(Text('A11220'+index.toString())),
                      DataCell(Text('A11220'+index.toString())),
                      DataCell(Text('A11220'+index.toString())),
                      DataCell(Text('28/6/2023 ký biên bản cho tặng source cho 1029023W CÔNG TY TNHH THƯƠNG MẠI SẢN XUẤT CAO NGUYÊN MỚI' )),
                      DataCell(Text('A11220'+index.toString())),
                      DataCell(Text('A11220'+index.toString())),
                      DataCell(Text('A11220'+index.toString())),
                      DataCell(
                        PtButton(
                          icon:Icon(Icons.remove_red_eye,color:Colors.white,size:18,),
                          title:"Chi tiết",
                          onPressed:(){
                            print(index.toString());
                          },
                        )
                      ),


                    ]))),
          )
        ],
      ),
    );
  }
}
