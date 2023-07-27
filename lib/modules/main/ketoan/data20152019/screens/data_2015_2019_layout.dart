import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nn_phanmem/modules/main/ketoan/data20152019/screens/widgets/list_view20152019.dart';

import '../../phieuthu/widgets/pt_button.dart';
import 'widgets/row_2015_2019_widget.dart';

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
          // header
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Color(0xff105a6c)),
              child:Row20152019HeardeWidget(),
            ),// end header
          // body
          // end body
          ListView20152019()
        ],
      ),
    );
  }
}
