part of '../khach_hang_moi_layout.dart';

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
  dispose(){
    super.dispose();
    ref.invalidate(kiemTraKhachHangProvider);
  }

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
                  lableTextForm('Mã khách hàng'),
                  TextFormField(
                    controller: TextEditingController(text: thongTinKhachHang['makhachhang'] ?? ''),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      ref
                          .read(formKhachHangMoiProvider.notifier)
                          .changeData(key: 'makhachhang', value: value);
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống'),
                    ]),
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
                    controller: TextEditingController(text: thongTinKhachHang['hoten'] ?? ''),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      ref
                          .read(formKhachHangMoiProvider.notifier)
                          .changeData(key: 'hoten', value: value);
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
                    controller: TextEditingController(text: thongTinKhachHang['phone'] ?? ''),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                    onChanged: (value) {
                      ref
                          .read(formKhachHangMoiProvider.notifier)
                          .changeData(key: 'phone', value: value);
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
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
                      ref
                          .read(formKhachHangMoiProvider.notifier)
                          .changeData(key: 'email', value: value);
                      if (value.isEmail()) {
                        onSearchDebouncer.debounce(
                          () {
                            ref.read(kiemTraKhachHangProvider.notifier).kiemTraThongTinKhachHang(email: value);
                          },
                        );
                      }
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
                    onChanged: (value) {
                      ref
                          .read(formKhachHangMoiProvider.notifier)
                          .changeData(key: 'info', value: {"email2": value});
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                      FormBuilderValidators.email(
                          errorText: 'Email không đúng định dạng.')
                    ]),
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
                    controller: TextEditingController(text: thongTinKhachHang['congty']),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                    onChanged: (value) {
                      ref
                          .read(formKhachHangMoiProvider.notifier)
                          .changeData(key: 'congty', value: value);
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
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          key: 'info', value: {"nguoidaidienmoi": value});
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          key: 'info', value: {"dienthoaicoquan": value});
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    controller: TextEditingController(text: thongTinKhachHang['masothue']),
                    onChanged: (value) {
                      ref
                          .read(formKhachHangMoiProvider.notifier)
                          .changeData(key: 'masothue', value: value);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    controller: TextEditingController(text: thongTinKhachHang['cccd']),
                    onChanged: (value) {
                      ref
                          .read(formKhachHangMoiProvider.notifier)
                          .changeData(key: 'cccd', value: value);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    minLines: 3,
                    maxLines: 3,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                    onChanged: (value) {
                      ref
                          .read(formKhachHangMoiProvider.notifier)
                          .changeData(key: 'info', value: {"diachi": value});
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
                    minLines: 3,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
