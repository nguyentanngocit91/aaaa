import 'package:flutter/material.dart';

enum HinhThucThanhToan { cod, bank }

enum LoaiPhieuThu { phieuthu, phieuthuBG, phieuthuApp, phieuthuBGApp }

class UpdatePhieuThuScreen extends StatefulWidget {
  const UpdatePhieuThuScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePhieuThuScreen> createState() => _UpdatePhieuThuScreenState();
}

class _UpdatePhieuThuScreenState extends State<UpdatePhieuThuScreen> {
  final TextEditingController txtMaHDInput = TextEditingController();

  final TextEditingController txtTenHDInput = TextEditingController();

  final TextEditingController txtTongGiaTriInput = TextEditingController();

  final TextEditingController txtTongNoInput = TextEditingController();

  HinhThucThanhToan? _httt = HinhThucThanhToan.cod;
  LoaiPhieuThu? _loaiPT = LoaiPhieuThu.phieuthu;

  @override
  Widget build(BuildContext context) {
    txtMaHDInput.text = '2461622';
    txtTenHDInput.text =
        'CÔNG TY TNHH MỘT THÀNH VIÊN THƯƠNG MẠI DỊCH VỤ ÁNH VŨ MINH';
    return SimpleDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(0),
      insetPadding: const EdgeInsets.all(30),
      elevation: 0,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Cập nhật phiếu thu'.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        const Divider(),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.text_snippet_outlined,
                    color: Color(0xFF105a6c),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Thông tin hợp đồng'.toUpperCase(),
                    style: const TextStyle(color: Color(0xFF105a6c)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFf5f5f5),
                  border: Border.all(color: const Color(0xFFdcdbdb)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Mã hợp đồng web/app',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: txtMaHDInput,
                            readOnly: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tên hợp đồng',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: txtTenHDInput,
                          readOnly: true,
                        ),
                      ],
                    ),),

                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tổng giá trị',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: txtTongGiaTriInput,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tổng nợ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: txtTongNoInput,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.text_snippet_outlined,
                    color: Color(0xFF105a6c),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Thông tin phiếu thu'.toUpperCase(),
                    style: const TextStyle(color: Color(0xFF105a6c)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFf5f5f5),
                  border: Border.all(color: const Color(0xFFdcdbdb)),
                ),
                child: (Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFe3e6e6),
                        border: Border.all(color: const Color(0xFFdcdbdb)),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Phương thức thanh toán:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Radio<HinhThucThanhToan>(
                            value: HinhThucThanhToan.cod,
                            groupValue: _httt,
                            onChanged: (HinhThucThanhToan? value) {
                              setState(() {
                                _httt = value;
                              });
                            },
                          ),
                          const Text('Tiền mặt'),
                          Radio<HinhThucThanhToan>(
                            value: HinhThucThanhToan.bank,
                            groupValue: _httt,
                            onChanged: (HinhThucThanhToan? value) {
                              setState(() {
                                _httt = value;
                              });
                            },
                          ),
                          const Text('Chuyển khoản'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Loại phiếu thu:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Radio<LoaiPhieuThu>(
                            value: LoaiPhieuThu.phieuthu,
                            groupValue: _loaiPT,
                            onChanged: (LoaiPhieuThu? value) {
                              setState(() {
                                _loaiPT = value;
                              });
                            },
                          ),
                          const Text('Phiếu thu'),
                          Radio<LoaiPhieuThu>(
                            value: LoaiPhieuThu.phieuthuBG,
                            groupValue: _loaiPT,
                            onChanged: (LoaiPhieuThu? value) {
                              setState(() {
                                _loaiPT = value;
                              });
                            },
                          ),
                          const Text('Phiếu thu bàn giao'),
                          Radio<LoaiPhieuThu>(
                            value: LoaiPhieuThu.phieuthuApp,
                            groupValue: _loaiPT,
                            onChanged: (LoaiPhieuThu? value) {
                              setState(() {
                                _loaiPT = value;
                              });
                            },
                          ),
                          const Text('Phiếu thu APP'),
                          Radio<LoaiPhieuThu>(
                            value: LoaiPhieuThu.phieuthuBGApp,
                            groupValue: _loaiPT,
                            onChanged: (LoaiPhieuThu? value) {
                              setState(() {
                                _loaiPT = value;
                              });
                            },
                          ),
                          const Text('Phiếu thu bàn giao APP'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Ngày nộp',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField()
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Số phiếu thu',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField()
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mã nhân viên',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField()
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nhân viên kinh doanh',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField()
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Phòng',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField()
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Khu vực',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField()
                          ],
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tổng tiền thu',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField()
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Phí web',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField()
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Phí nâng cấp web',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField()
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Phí hosting',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField()
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Phí nâng cấp host',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField()
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Phí tên miền',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField()
                          ],
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Phí App',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField()
                              ],
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'VAT',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField()
                              ],
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Ghi chú',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField()
                              ],
                            )),
                      ],
                    )
                  ],
                )),
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
          ),
        ),
      ],
    );
    ;
  }
}
