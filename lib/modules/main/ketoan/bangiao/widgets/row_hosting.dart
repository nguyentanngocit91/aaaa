import 'package:flutter/material.dart';

class RowHosting extends StatelessWidget {
  const RowHosting(
      {Key? key,
      required this.stt,
      required this.dungLuong,
      required this.ngayDangKy,
      required this.ngayHetHan,
      required this.trangThai,
      this.ghiChu = ''})
      : super(key: key);
  final int stt;
  final String dungLuong;
  final String ngayDangKy;
  final String ngayHetHan;
  final String trangThai;
  final String ghiChu;
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
            decoration: const BoxDecoration(color: Color(0xFF345b65)),
            child: const Row(
              children: [
                Expanded(
                    child: Text(
                  'STT',
                  style: TextStyle(color: Colors.white),
                )),
                Expanded(
                    child: Text(
                  'Dung lượng',
                  style: TextStyle(color: Colors.white),
                )),
                Expanded(
                    child: Text(
                  'Ngày đăng ký',
                  style: TextStyle(color: Colors.white),
                )),
                Expanded(
                    child: Text(
                  'Ngày hết hạn',
                  style: TextStyle(color: Colors.white),
                )),
                Expanded(
                    child: Text(
                  'Trạng thái',
                  style: TextStyle(color: Colors.white),
                )),
                Expanded(
                    child: Text(
                  'Ghi chú',
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
                  child: Text('$stt'),
                ),
                Expanded(
                  child: Text(dungLuong),
                ),
                Expanded(
                  child: Text(ngayDangKy),
                ),
                Expanded(
                  child: Text(ngayHetHan),
                ),
                Expanded(
                  child: Text(trangThai),
                ),
                Expanded(
                  child: Text(ghiChu),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
