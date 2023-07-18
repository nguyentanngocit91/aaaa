import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CapMaHDLayout extends StatelessWidget {
  const CapMaHDLayout() : super(key: const Key(pathName));

  static const String pathName = 'cap-ma-hd11';

  @override
  Widget build(BuildContext context) {
    double hozSpacingWrap = 30;
    double verSpacingWrap = 20;
    String typeHD = 'web';

    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [

             /* Radio<typeHD>(
                value: typeHD.web, groupValue: _typeHD, onChanged: (value) {
                setState(() {
                  _typeHD = value;
                });

              },


              ),
              // Text("HĐ Web"),

              Radio<typeHD>(
                value: typeHD.app, groupValue: _typeHD, onChanged: (value) {
                setState(() {
                  _typeHD=value;
                });
              }, ),*/



              Radio(
                value: 'web', groupValue: typeHD, onChanged: (value) {

              }, ),
              Radio(
                value: 'app', groupValue: typeHD, onChanged: (value) {

              }, ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    Text('Mã hợp đồng 12', style: Theme
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
                    Text('Mã nhân viên', style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.always,
                      validator:FormBuilderValidators.compose([

                        FormBuilderValidators.required(errorText: "Không được để trống!"),
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
