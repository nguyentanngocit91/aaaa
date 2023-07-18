import 'package:flutter/material.dart';

class UpgradeWebListLayout extends StatelessWidget {
  const UpgradeWebListLayout() : super(key: const Key(pathName));

  static const String pathName = 'nang-cap-website';

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
                    Text('Mã hợp đồng', style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,),
                    TextFormField(

                    ),
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
                    TextFormField(),
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
