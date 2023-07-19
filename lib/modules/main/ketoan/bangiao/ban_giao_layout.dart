import 'package:flutter/material.dart';

import '../phieuthu/widgets/pt_button.dart';

class BanGiaoLayout extends StatelessWidget {
  const BanGiaoLayout({Key? key}) : super(key: const Key(pathName));

  static const String pathName = 'bangiao';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                    hintText: 'Mã HĐ',
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
                    hintText: 'Tên HĐ',
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 130,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Điện thoại',
                  ),

                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 130,
                child: TextField(

                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),

                ),
              ),
              SizedBox(
                width: 130,
                child: TextField(

                  decoration: InputDecoration(
                    hintText: 'Domain',
                  ),

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
        const SizedBox(height: 20,),
      ],
    );
  }
}