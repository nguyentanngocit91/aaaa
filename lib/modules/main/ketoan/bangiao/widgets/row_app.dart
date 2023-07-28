import 'package:flutter/material.dart';

class RowApp extends StatelessWidget {
  const RowApp(
      {Key? key,
        required this.stt,
        required this.chucNang,
        required this.ngayKy})
      : super(key: key);
  final int stt;
  final String chucNang;
  final String ngayKy;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFCCCCCC)),
        color: const Color(0xFFcef0f7),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(color: Color(0xFF1c5a2f)),
            child: const Row(
              children: [
                Expanded(
                    flex: 10,
                    child: Text(
                      'STT',
                      style: TextStyle(color: Colors.white),
                    )),
                Expanded(
                    flex: 80,
                    child: Text(
                      'Chức năng',
                      style: TextStyle(color: Colors.white),
                    )),
                Expanded(
                    flex: 10,
                    child: Text(
                      'Ngày ký',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: Text('$stt'),
                ),
                Expanded(
                  flex: 80,
                  child: Text(chucNang),
                ),
                Expanded(
                  flex: 10,
                  child: Text(ngayKy),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
