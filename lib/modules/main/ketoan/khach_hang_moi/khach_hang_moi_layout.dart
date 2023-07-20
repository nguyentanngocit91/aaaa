import 'package:flutter/material.dart';

import '../../../../_shared/mixins/form_ui_mixins.dart';
import '../../../../_shared/utils/ndgap.dart';

GlobalKey<FormState> _formKey = GlobalKey();

class KhachHangMoi extends StatefulWidget {
  const KhachHangMoi({Key? key}) : super(key: const Key(pathName));

  static const pathName = 'khach-hang-moi';

  @override
  State<KhachHangMoi> createState() => _KhachHangMoiState();
}

class _KhachHangMoiState extends State<KhachHangMoi> with FormUIMixins {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          titleForm(context, title: 'Thông tin khách hàng'),
          bodyForm(
            child: Form(
              key: _formKey,
              child: Wrap(
                runSpacing: 25,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          children: [
                            lableTextForm('Mã khách hàng'),
                            TextFormField(
                              enabled: true,
                              onChanged: (value) {},
                              validator: (value) {
                                if (value == '') return 'Không bỏ trống  ';
                              },
                            ),
                          ],
                        ),
                      ),
                      ndGapW16(),
                      Expanded(
                        child: Wrap(
                          children: [
                            lableTextForm('Tên khách hàng'),
                            TextFormField(),
                          ],
                        ),
                      ),
                      ndGapW16(),
                      Expanded(
                        child: Wrap(
                          children: [
                            lableTextForm('Điện thoại di động'),
                            TextFormField(),
                          ],
                        ),
                      ),
                      ndGapW16(),
                      Expanded(
                        child: Wrap(
                          children: [
                            lableTextForm('Email khách hàng'),
                            TextFormField(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Wrap(
                          children: [
                            lableTextForm('Email khách hàng (email phụ)'),
                            TextFormField(
                              enabled: true,
                              onChanged: (value) {},
                              validator: (value) {
                                if (value == '') return 'Không bỏ trống  ';
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      ndGapW16(),
                      Expanded(
                        flex: 3,
                        child: Wrap(
                          children: [
                            lableTextForm('Tên khách hàng'),
                            TextFormField(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          children: [
                            lableTextForm('Người đại diện mới'),
                            TextFormField(
                              enabled: true,
                              onChanged: (value) {},
                              validator: (value) {
                                if (value == '') return 'Không bỏ trống  ';
                              },
                            ),
                          ],
                        ),
                      ),
                      ndGapW16(),
                      Expanded(
                        child: Wrap(
                          children: [
                            lableTextForm('Tên khách hàng'),
                            TextFormField(),
                          ],
                        ),
                      ),
                      ndGapW16(),
                      Expanded(
                        child: Wrap(
                          children: [
                            lableTextForm('Điện thoại di động'),
                            TextFormField(),
                          ],
                        ),
                      ),
                      ndGapW16(),
                      Expanded(
                        child: Wrap(
                          children: [
                            lableTextForm('Email khách hàng'),
                            TextFormField(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
