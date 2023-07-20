import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CapMaHDLayoutNew extends StatefulWidget {
  const CapMaHDLayoutNew():super(key: const Key(pathName));
  static const String pathName = 'cap-ma-hd';
  @override
  State<CapMaHDLayoutNew> createState() => _CapMaHDLayoutState();

}
enum typeHD { web, app }

class _CapMaHDLayoutState extends State<CapMaHDLayoutNew> {

  typeHD? _typeHD = typeHD.web;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  _typeHD=typeHD.web;
                }),
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  color: Colors.cyan ,
                  child: Row(
                    children: [
                     Icon(_typeHD == typeHD.web ? Icons.radio_button_checked:Icons.radio_button_unchecked,color: _typeHD == typeHD.web ? Colors.black:Colors.black,),
                      SizedBox(width: 10,),
                      const Text("HĐ WEB",style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: () => setState(() {
                  _typeHD=typeHD.app;
                }),
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),

                  color: Colors.pinkAccent,

                  child:Row(
                    children: [
                      Icon(_typeHD == typeHD.app ? Icons.radio_button_checked:Icons.radio_button_unchecked),
                      SizedBox(width: 10,),
                      const Text("HĐ App",style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),


            ],
          ),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    Text('Mã hợp đồng', style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black)),
                    TextFormField(
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 17),
                        contentPadding:
                        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Mã hợp đồng",),
                      autovalidateMode: AutovalidateMode.always,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30,),
              Expanded(
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    Text('Mã nhân viên', style:TextStyle(fontWeight: FontWeight.w900,color: Colors.black)),
                    TextFormField(
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 17),
                        contentPadding:
                        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Mã nhân viên",),
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.always,
                      validator:FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30,),
              Expanded(
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    Text('Nhân viên kinh doanh', style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,),
                    TextFormField(),
                  ],
                ),
              ),
              const SizedBox(width: 30,),
              Expanded(
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    Text('Phòng', style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,),
                    TextFormField(),
                  ],
                ),
              ),
              const SizedBox(width: 30,),
              Expanded(
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    Text('Khu vực', style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,),
                    TextFormField(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );


  }
}
