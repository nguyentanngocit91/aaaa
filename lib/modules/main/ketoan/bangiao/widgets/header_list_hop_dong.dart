import 'package:flutter/material.dart';
class HeaderListHopDong extends StatelessWidget {
  const HeaderListHopDong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Color(0xFF105a6c),
          border: Border(
              bottom: BorderSide(
                  color: Color(
                    0xFFFFC107,
                  ),
                  width: 2))),
      child: const Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '#',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
              flex: 10,
              child: Text(
                'Mã KH',
                style: TextStyle(color: Colors.white),
              )),
          Expanded(
              flex: 10,
              child: Text(
                'Mã HĐ',
                style: TextStyle(color: Colors.white),
              )),
          Expanded(
              flex: 50,
              child: Text(
                'Tên HĐ',
                style: TextStyle(color: Colors.white),
              )),
          Expanded(
              flex: 10,
              child: Text(
                'Giá trị',
                style: TextStyle(color: Colors.white),
              )),
          Expanded(
              flex: 10,
              child: Text(
                'Giá trị website',
                style: TextStyle(color: Colors.white),
              )),
          Expanded(
              flex: 10,
              child: Text(
                'Công nợ',
                style: TextStyle(color: Colors.white),
              )),
          Expanded(
              flex: 10,
              child: Text(
                'Ngày khởi tạo',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}