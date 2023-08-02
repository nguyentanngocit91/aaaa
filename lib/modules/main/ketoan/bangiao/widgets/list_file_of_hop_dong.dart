import 'package:flutter/material.dart';

import '../../phieuthu/widgets/pt_button.dart';

class ListFileOfHopDong extends StatefulWidget {
  const ListFileOfHopDong({Key? key}) : super(key: key);

  @override
  State<ListFileOfHopDong> createState() => _ListFileOfHopDongState();
}

class _ListFileOfHopDongState extends State<ListFileOfHopDong> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(0),
      insetPadding: const EdgeInsets.all(0),
      elevation: 0,
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.5,
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Danh sách file'.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        const Divider(),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color(0xFF105a6c),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('#'),
                    ),
                    Expanded(flex: 30, child: Text('Tên file')),
                    Expanded(flex: 10, child: Text('')),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: const Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('1'),
                    ),
                    Expanded(
                      flex: 30,
                      child: Text('Hợp đồng'),
                    ),
                    Expanded(flex: 10, child: Text('Xem file')),
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
          ),
        ),
      ],
    );
  }
}
