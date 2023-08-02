import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ViewDetail20152019Screen extends StatelessWidget {
  const ViewDetail20152019Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      //insetPadding: const EdgeInsets.all(30),
      elevation: 0,
      children: [
        Container(
          width: 1000,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(color: Color(0xff105a6c)),
          child: Text(
            'Chi tiết thông tin'.toUpperCase(),
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white),
          ),
        ),
        Container(
          width: 1000,
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                    width: 1,
                    color: Colors.black26,
                  ),
                  right:
                  BorderSide(width: 1, color: Colors.black26),
                  top:
                  BorderSide(width: 1, color: Colors.black26))),
          child: Column(
            children: [
              RowDeltail20152019(
                titleRowHD: "Hợp đồng:",
                valueRowHD: "TNHH DV DL Vận tải Ngày Mới",
              ),
              RowDeltail20152019(
                titleRowHD: "Tên khách hàng:",
                valueRowHD: "Trịnh Đình Quí",
              ),
              RowDeltail20152019(
                titleRowHD: "Địa chỉ cty:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "MST:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "CMND:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Điện thoại:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Điện thoại cơ quan:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Email khách hàng:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Số phiếu thu:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Mã web:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Mã Hosting:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Chức năng:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Kinh doanh:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Tên miền:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Ghi chú:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Ngày ký web:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Ngày nộp web:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Ngày ký hosting:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Ngày ký bàn giao:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Phí web:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Phí nâng cấp:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Phí Hosting:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Phí nâng cấp hosting:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Phí tên miền:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Phí thanh toán web:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Phí thanh toán web2:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Tổng:",
                valueRowHD: "",
              ),
              RowDeltail20152019(
                titleRowHD: "Còn lại:",
                valueRowHD: "",
              ),
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
                  backgroundColor: Colors.blueAccent),
              child: const Text(
                'Cập nhật',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
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
    );
  }
}

class RowDeltail20152019 extends StatelessWidget {
  RowDeltail20152019({Key? key, required this.titleRowHD, this.valueRowHD})
      : super(key: key);

  final String titleRowHD;
  final String? valueRowHD;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black26))),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                titleRowHD,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Text(valueRowHD.toString()),
            ),
          )
        ],
      ),
    );
  }
}
