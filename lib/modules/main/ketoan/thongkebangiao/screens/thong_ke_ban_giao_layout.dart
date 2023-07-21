import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../phieuthu/widgets/pt_button.dart';

class ThongKeBanGiao extends StatefulWidget {
   const ThongKeBanGiao({Key? key}) : super(key:const Key(pathName));
  static const String pathName = 'thong-ke-ban-giao';

  @override
  State<ThongKeBanGiao> createState() => _ThongKeBanGiaoState();
}

class _ThongKeBanGiaoState extends State<ThongKeBanGiao> {

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
      body:Container(
        child: Container(
          padding: EdgeInsets.all(10),
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Color(0xfff5f5f5),
              border: Border.all(width: 1, color: Color(0xffdcdbdb))),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Wrap(
                  runSpacing: 0,
                  children: [
                    Text(
                      'Từ ngày',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(color: Colors.white),
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
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Wrap(
                  runSpacing: 0,
                  children: [
                    Text(
                      'Đến ngày',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(color: Colors.white),
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
              SizedBox(
                width:10,
              ),
              Expanded(child:Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 0,
                      children: [
                        Container(
                          margin:EdgeInsets.only(top:20),
                          child: PtButton(width:150,icon:Icon(Icons.cloud_download,color:Colors.white,),title:"Export file", onPressed: (){
                            print("Export");
                          },),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    width:10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 0,
                      children: [
                        Container(
                          margin:EdgeInsets.only(top:20),
                          child: PtButton(icon:Icon(Icons.refresh,color:Colors.white,),title:"Reset", onPressed: (){
                            print("Reset");
                          },),
                        )
                      ],
                    ),
                  ),

                ],
              )),

            ],
          ),
        ),
      ),
    );
  }
}
