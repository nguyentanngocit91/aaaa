part of '../khach_hang_moi_layout.dart';

final String _typeData = 'khachhang';

class FormThongTinKhachHangWidget extends ConsumerStatefulWidget {
  const FormThongTinKhachHangWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinKhachHangWidgetState();
}

class _FormThongTinKhachHangWidgetState
    extends ConsumerState<FormThongTinKhachHangWidget> with FormUIMixins {
  final Debouncer onSearchDebouncer =
      Debouncer(delay: const Duration(seconds: 1));



  @override
  Widget build(BuildContext context) {
    final Map thongTinKhachHang = ref.watch(kiemTraKhachHangProvider) ?? {};

    return Wrap(
      runSpacing: 25,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Email khách hàng'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                      FormBuilderValidators.email(
                          errorText: 'Email không đúng định dạng.')
                    ]),
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          key: 'email', value: value, type: _typeData);
                      if (value.isEmail()) {
                        onSearchDebouncer.debounce(
                          () {
                            ref
                                .read(kiemTraKhachHangProvider.notifier)
                                .kiemTraThongTinKhachHang(email: value);
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Mã khách hàng'),
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                    ),
                    readOnly: true,
                    controller: TextEditingController(text: thongTinKhachHang['makhachhang']),
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Tên khách hàng'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    readOnly: thongTinKhachHang['hoten'] != null ? true : false,
                    controller: TextEditingController(text: thongTinKhachHang['hoten']),
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          key: 'hoten', value: value, type: _typeData);
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Điện thoại di động'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    readOnly: thongTinKhachHang['phone'] != null ? true : false,
                    controller: TextEditingController(
                        text: thongTinKhachHang['phone'] ?? ''),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          key: 'phone', value: value, type: _typeData);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Wrap(
                children: [
                  lableTextForm('Email khách hàng (email phụ)'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    readOnly: thongTinKhachHang.isNotEmpty ? true : false,
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          key: 'info',
                          value: {"email2": value},
                          type: _typeData);
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
                  lableTextForm('Tên Công ty /  Cá Nhân'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    readOnly: thongTinKhachHang.isNotEmpty ? true : false,
                    controller: TextEditingController(
                        text: thongTinKhachHang['congty']),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          key: 'congty', value: value, type: _typeData);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Người đại diện mới'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    readOnly: thongTinKhachHang.isNotEmpty ? true : false,
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          key: 'info',
                          value: {"nguoidaidienmoi": value},
                          type: _typeData);
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Điện thoại cơ quan'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    readOnly: thongTinKhachHang.isNotEmpty ? true : false,
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          key: 'info',
                          value: {"dienthoaicoquan": value},
                          type: _typeData);
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Mã số thuế'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    readOnly: thongTinKhachHang.isNotEmpty ? true : false,
                    controller: TextEditingController(
                        text: thongTinKhachHang['masothue']),
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          key: 'masothue', value: value, type: _typeData);
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('CCCD / CMND'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    readOnly: thongTinKhachHang.isNotEmpty ? true : false,
                    controller:
                        TextEditingController(text: thongTinKhachHang['cccd']),
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          key: 'cccd', value: value, type: _typeData);
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Địa chỉ'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: TextEditingController(
                        text: thongTinKhachHang['diachi']),
                    readOnly: thongTinKhachHang.isNotEmpty ? true : false,
                    minLines: 3,
                    maxLines: 3,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          key: 'diachi',
                          value: value,
                          type: _typeData);
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Ghi chú'),
                  TextFormField(
                    readOnly: thongTinKhachHang.isNotEmpty ? true : false,
                    controller: TextEditingController(
                        text: thongTinKhachHang['info']?['ghichu']),
                    minLines: 3,
                    maxLines: 3,
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          key: 'info',
                          value: {"ghichu": value},
                          type: _typeData);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }


  @override
  dispose() {
    super.dispose();
    ref.invalidate(kiemTraKhachHangProvider);
  }
}
