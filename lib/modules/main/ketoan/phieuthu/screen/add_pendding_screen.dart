import 'package:flutter/material.dart';

import '../../../../../_shared/mixins/mixin_listview_table/title_header.dart';

enum SingingCharacter { pendding, openpendding }

class AddPenddingScreen extends StatefulWidget {
  const AddPenddingScreen({Key? key}) : super(key: key);

  @override
  State<AddPenddingScreen> createState() => _AddPenddingScreenState();
}

class _AddPenddingScreenState extends State<AddPenddingScreen> {
  SingingCharacter? _trangthaiPendding = SingingCharacter.pendding;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      insetPadding: const EdgeInsets.all(30),
      elevation: 0,
      children: [
        Container(
          width: 900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Cập nhật danh sách pendding'.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              const Divider(),
              Text(
                "Trạng thái",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
             Container(
               margin:EdgeInsets.only(top:5,bottom:10),
               decoration:BoxDecoration(
                 color:Colors.black12,
                 borderRadius:BorderRadius.circular(3)

               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   Expanded(
                     flex:3,
                     child: ListTile(
                       title: const Text('Pendding'),
                       leading: Radio<SingingCharacter>(
                         value: SingingCharacter.pendding,
                         groupValue: _trangthaiPendding,
                         onChanged: (SingingCharacter? value) {
                           setState(() {
                             _trangthaiPendding = value;
                           });
                         },
                       ),
                     ),
                   ),
                   Expanded(
                     flex:3,
                     child: ListTile(
                       title: const Text('Mở pendding'),
                       leading: Radio<SingingCharacter>(
                         value: SingingCharacter.openpendding,
                         groupValue: _trangthaiPendding,
                         onChanged: (SingingCharacter? value) {
                           setState(() {
                             _trangthaiPendding = value;
                           });
                         },
                       ),
                     ),
                   ),
                   Expanded(
                     flex:6,
                     child:Container(),
                   )
                 ],
               ),
             ),

              Text("Ghi chú",style:TextStyle(fontWeight:FontWeight.bold),),
              SizedBox(height:10,),
              TextField(minLines:5,maxLines:null,),
              SizedBox(height:10,),
             Container(
               padding:EdgeInsets.all(8),
               decoration:BoxDecoration(
                 color:Color(0xFF105A6C),
                 
               ),
               child: Row(
                 children: [
                   Expanded(
                     flex:1,
                     child:TitleHeader(stringTitle:"#",),),
                   Expanded(
                     flex:1,
                     child:TitleHeader(stringTitle:"Ngày tháng",),),
                   Expanded(
                     flex:1,
                     child:TitleHeader(stringTitle:"Trạng thái",),),
                   Expanded(
                     flex:1,
                     child:TitleHeader(stringTitle:"Ghi chú",),),
                 ],
               ),
             )


            ],
          ),
        ),
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
                'Thêm mới',
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
    );
  }
}
