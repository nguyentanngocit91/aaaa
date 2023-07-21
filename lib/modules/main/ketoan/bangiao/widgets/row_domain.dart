import 'package:flutter/material.dart';

final List<Map<String, dynamic>> _domains = [
  {
    "domain": "nina.vn",
    "ngaydangky": "07/06/2023",
    "ngayhethan": '07/06/2024'
  },
  {
    "domain": "nina.com.vn",
    "ngaydangky": "07/06/2023",
    "ngayhethan": '07/06/2024'
  },
  {
    "domain": "ninavietnam.vn",
    "ngaydangky": "07/06/2023",
    "ngayhethan": '07/06/2024'
  },
];


class RowDomain extends StatelessWidget {
  const RowDomain({Key? key, required this.stt, required this.domain, required this.ngayDangKy, required this.ngayHetHan}) : super(key: key);
  final int stt;
  final String domain;
  final String ngayDangKy;
  final String ngayHetHan;
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
            decoration: const BoxDecoration(color: Color(0xFF5a4b1c)),
            child: const Row(
              children: [
                Expanded(
                    flex: 10,
                    child: Text(
                      'STT',
                      style: TextStyle(color: Colors.white),
                    )),
                Expanded(
                    flex: 70,
                    child: Text(
                      'Tên miền',
                      style: TextStyle(color: Colors.white),
                    )),
                Expanded(
                    flex: 10,
                    child: Text(
                      'Ngày đăng ký',
                      style: TextStyle(color: Colors.white),
                    )),
                Expanded(
                    flex: 10,
                    child: Text(
                      'Ngày hết hạn',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
    SizedBox(height: 100,
      child: ListView.builder(

      itemCount: _domains.length,
      itemBuilder: (context, index) {
        return RowInfoDomain(stt: index+1, domain: _domains[index]['domain'], ngayDangKy: _domains[index]['ngaydangky'], ngayHetHan: _domains[index]['ngayhethan']);
      }),
    ),
        ],
      ),
    );
  }
}

class RowInfoDomain extends StatelessWidget {
  const RowInfoDomain({
    super.key,
    required this.stt,
    required this.domain,
    required this.ngayDangKy,
    required this.ngayHetHan,
  });

  final int stt;
  final String domain;
  final String ngayDangKy;
  final String ngayHetHan;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            flex: 70,
            child: Text(domain),
          ),
          Expanded(
            flex: 10,
            child: Text(ngayDangKy),
          ),
          Expanded(
            flex: 10,
            child: Text(ngayHetHan),
          ),
        ],
      ),
    );
  }
}