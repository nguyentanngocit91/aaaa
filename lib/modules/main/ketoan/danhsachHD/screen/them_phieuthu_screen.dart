import 'package:flutter/material.dart';
class ThemPhieuThuScreen extends StatefulWidget {
  const ThemPhieuThuScreen({super.key});

  @override
  State<ThemPhieuThuScreen> createState() => _ThemPhieuThuScreenState();
}

class _ThemPhieuThuScreenState extends State<ThemPhieuThuScreen> {

  @override
  Widget build(BuildContext context) {
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
                'Thêm Phiếu Thu'.toUpperCase(),
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

            ],),
        ),


      ],

    );


  }



}
