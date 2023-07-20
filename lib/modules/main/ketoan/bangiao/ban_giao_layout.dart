import 'package:flutter/material.dart';

import '../../../../_shared/utils/ndgap.dart';
import '../phieuthu/widgets/pt_button.dart';

class BanGiaoLayout extends StatelessWidget {
  const BanGiaoLayout({Key? key}) : super(key: const Key(pathName));

  static const String pathName = 'bangiao';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Tên HĐ',
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                width: 180,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Điện thoại',
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                width: 180,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                width: 180,
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
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              PtButton(
                title: 'Reset',
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Thông tin khách hàng'.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFdcdbdb)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Color(0xFFdcdbdb),
                          ),
                          bottom: BorderSide(
                            color: Color(0xFFdcdbdb),
                          ),
                        ),
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'Tên Cty/Cá nhân: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: 'Nguyễn Văn Lộc'),
                            TextSpan(text: ' - '),
                            TextSpan(
                                text: 'Mã khách hàng: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: 'NN1088523'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFdcdbdb),
                        ),
                      ),
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Tên khách hàng: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'Nguyễn Văn Lộc'),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              const RowInfo(
                titleLeft: 'Điện thoại',
                titleRight: 'Cơ quan',
                contentLeft: '0935937789',
                contentRight: '',
              ),
              const RowInfo(
                titleLeft: 'Email',
                titleRight: 'Email phụ',
                contentLeft: 'nguyenvanloc031098@gmail.com',
                contentRight: '',
              ),
              const RowInfo(
                titleLeft: 'Người đại diện mới',
                titleRight: 'Mã số thuế',
                contentLeft: '',
                contentRight: '',
              ),
              const RowInfo(
                titleLeft: 'Mã số thuế',
                titleRight: 'CMND',
                contentLeft: '',
                contentRight: '241745980',
              ),
              const RowInfo(
                titleLeft: 'Địa chỉ',
                titleRight: 'Ghi chú',
                contentLeft:
                    '62/2 Trương Văn Thành, Phường Hiệp Phú, Thành phố Thủ Đức, Thành phố Hồ Chí Minh ',
                contentRight: '',
                lastEnd: true,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Thông tin hợp đồng'.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          color: const Color(0xFFfbdfdf),
          child: Column(
            children: [
              Container(
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
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color(0xFF8a0607),
                ),
                child: const Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child:
                            Text('1', style: TextStyle(color: Colors.white))),
                    Expanded(
                      flex: 10,
                      child: Text('NN0818023',
                          style: TextStyle(color: Colors.white)),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        '0833023',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: Text(
                          'CÔNG TY TNHH ĐẦU TƯ BẤT ĐỘNG SẢN AN MINH PHÚC',
                          style: TextStyle(color: Colors.white)),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text('5.189.900đ',
                          style: TextStyle(color: Colors.white)),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text('0đ', style: TextStyle(color: Colors.white)),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text('0đ', style: TextStyle(color: Colors.white)),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text('07/06/2023',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 5),
                            decoration: const BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Color(0xffff9800), width: 3))),
                            child: const Text(
                              'THÔNG TIN HỢP ĐỒNG',
                              style: TextStyle(
                                  color: Color(0xFFe41d09),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF03a9f4)),
                          child: const Text(
                            'Xem file HĐ',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    ndGapH8(),
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
                      decoration: const BoxDecoration(
                        color: Color(0xFFcef0f7),
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text('1'),
                          ),
                          Expanded(
                            child: Text('5GB'),
                          ),
                          Expanded(
                            child: Text('07/06/2023'),
                          ),
                          Expanded(
                            child: Text('07/06/2024'),
                          ),
                          Expanded(
                            child: Text('Ký mới'),
                          ),
                          Expanded(
                            child: Text(''),
                          ),
                        ],
                      ),
                    ),
                    ndGapH8(),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 5),
                            decoration: const BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Color(0xffff9800), width: 3))),
                            child: const Text(
                              'DANH SÁCH PHIẾU THU',
                              style: TextStyle(
                                  color: Color(0xFFe41d09),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ndGapH8(),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFCCCCCC)),
                      ),
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ItemRowInfo(
                                  child: RichTextInfo(
                                    title: 'Số PT',
                                    content: '2360660',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ItemRowInfo(
                                  child: RichTextInfo(
                                    title: 'Mã HĐ',
                                    content: '0833023',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ItemRowInfo(
                                  child: RichTextInfo(
                                    title: 'Mã KH',
                                    content: 'NN0818023',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ItemRowInfo(
                                  child: RichTextInfo(
                                    title: 'Ngày nộp',
                                    content: '07-06-2023',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ItemRowInfo(
                                  lastColum: true,
                                  child: RichTextInfo(
                                    title: 'Loại phiếu',
                                    content: 'Phiếu thu',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ItemRowInfo(
                                  colorBG: Colors.white,
                                  child: RichTextInfo(
                                    title: 'Phí web',
                                    content: '0đ',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ItemRowInfo(
                                  colorBG: Colors.white,
                                  child: RichTextInfo(
                                    title: 'Phí NC web',
                                    content: '0đ',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ItemRowInfo(
                                  colorBG: Colors.white,
                                  child: RichTextInfo(
                                    title: 'Phí hosting',
                                    content: '4.872.000đ',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ItemRowInfo(
                                  colorBG: Colors.white,
                                  child: RichTextInfo(
                                    title: 'Phí NC hosting',
                                    content: '0đ',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ItemRowInfo(
                                  colorBG: Colors.white,
                                  lastColum: true,
                                  child: RichTextInfo(
                                    title: 'Phí domain',
                                    content: '289.000đ',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ItemRowInfo(
                                  child: RichTextInfo(
                                    title: 'Phí App',
                                    content: '0đ',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ItemRowInfo(
                                  child: RichTextInfo(
                                    title: 'Mã HĐ',
                                    content: '0833023',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ItemRowInfo(
                                  child: RichTextInfo(
                                    title: 'PT Thanh toán',
                                    content: 'Tiền mặt ',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ItemRowInfo(
                                  child: RichTextInfo(
                                    title: 'Tổng thu',
                                    content: '5.189.900đ',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ItemRowInfo(
                                  lastColum: true,
                                  child: RichTextInfo(
                                    title: 'Ghi chú',
                                    content: '',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class ItemRowInfo extends StatelessWidget {
  const ItemRowInfo(
      {super.key,
      required this.child,
      this.colorBG = const Color(0xFFF2F2F2),
      this.lastColum = false});
  final Widget child;
  final Color colorBG;
  final bool lastColum;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: colorBG,
          border: Border(
              right: (!lastColum)
                  ? const BorderSide(
                      color: Color(0xFFCCCCCC),
                    )
                  : BorderSide.none,
              bottom: const BorderSide(
                color: Color(0xFFCCCCCC),
              ))),
      child: child,
    );
  }
}

class RichTextInfo extends StatelessWidget {
  const RichTextInfo({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: '$title: ',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: content),
        ],
      ),
    );
  }
}

class RowInfo extends StatelessWidget {
  const RowInfo({
    super.key,
    required this.titleLeft,
    required this.titleRight,
    required this.contentLeft,
    required this.contentRight,
    this.lastEnd = false,
  });

  final String titleLeft;
  final String titleRight;
  final String contentLeft;
  final String contentRight;
  final bool lastEnd;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                right: const BorderSide(
                  color: Color(0xFFdcdbdb),
                ),
                bottom: (!lastEnd)
                    ? const BorderSide(
                        color: Color(0xFFdcdbdb),
                      )
                    : BorderSide.none,
              ),
            ),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: '$titleLeft: ',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: contentLeft),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(
              bottom: (!lastEnd)
                  ? const BorderSide(
                      color: Color(0xFFdcdbdb),
                    )
                  : BorderSide.none,
            ),
          ),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: '$titleRight: ',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: contentRight),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
