part of '../sua_phieu_thu_layout.dart';

class FormThongTinKhachHangWidget extends ConsumerStatefulWidget {
  const FormThongTinKhachHangWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinKhachHangWidgetState();
}

class _FormThongTinKhachHangWidgetState
    extends ConsumerState<FormThongTinKhachHangWidget> with FormUIMixins {

  final Debouncer onSearchDebouncer = Debouncer(delay: const Duration(seconds: 2));

  final String _typeData = 'khachhang';

  Map thongTinKhachHang = {};

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formPhieuThuProvider);

    Map thongTinKhachHang = formState.dataKhachHang!;

    // print('Khách hàng: $thongTinKhachHang');

    ref.listen(kiemTraKhachHangProvider.select((value) => value.loading),
        (previous, next) {
      if (next == true) {
        Loading(context).start();
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          Loading(context).stop();
        });
      }
    });

    return Wrap(
      runSpacing: 25,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm(
                    'Email khách hàng',
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                      FormBuilderValidators.email(
                          errorText: 'Email không đúng định dạng.')
                    ]),
                    initialValue: thongTinKhachHang['email'],
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          key: 'email', value: value, type: _typeData);
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
                    initialValue: thongTinKhachHang['makhachhang'],
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
                    initialValue: thongTinKhachHang['hoten'],
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
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
                  TextFormField (
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    initialValue: thongTinKhachHang['phone'],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
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

                    initialValue: thongTinKhachHang['info']?['email_phu'],
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          key: 'info',
                          value: {"email_phu": value},
                          type: _typeData);
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              flex: 1,
              child: Wrap(
                children: [
                  lableTextForm('Loại Khách hàng'),
                  DropdownButtonFormField(
                    value: thongTinKhachHang['type'] ?? 'ca-nhan',
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'ca-nhan',
                        child: Text('Cá Nhân'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'cong-ty',
                        child: Text('Công Ty'),
                      ),
                    ],
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          key: 'type', value: value, type: _typeData);
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              flex: 2,
              child: Wrap(
                children: [
                  lableTextForm('Tên Công ty /  Cá Nhân'),
                  TextFormField(
                    initialValue: thongTinKhachHang['congty'],
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
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
                    initialValue: thongTinKhachHang['info']?['nguoidaidienmoi'],
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          key: 'info',
                          value: {"nguoidaidienmoi": value},
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
                  lableTextForm('Điện thoại cơ quan'),
                  TextFormField(
                    initialValue: thongTinKhachHang['info']?['dienthoaicoquan'],
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          key: 'info',
                          value: {"dienthoaicoquan": value},
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
                  lableTextForm('Mã số thuế'),
                  TextFormField(
                    initialValue: thongTinKhachHang['masothue'],
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          key: 'masothue', value: value, type: _typeData);
                    },
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
                    initialValue: thongTinKhachHang['cccd'],
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          key: 'cccd', value: value, type: _typeData);
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
                  lableTextForm('Địa chỉ'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    initialValue: thongTinKhachHang['diachi'],
                    minLines: 3,
                    maxLines: 3,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          key: 'diachi', value: value, type: _typeData);
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
                    initialValue: thongTinKhachHang['ghichu'],
                    minLines: 3,
                    maxLines: 3,
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          key: 'ghichu', value: value, type: _typeData);
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
