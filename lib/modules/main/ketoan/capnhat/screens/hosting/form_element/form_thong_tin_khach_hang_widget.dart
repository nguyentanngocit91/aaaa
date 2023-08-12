part of '../upgrade.dart';

class FormThongTinKhachHangWidget extends ConsumerStatefulWidget {
  const FormThongTinKhachHangWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinKhachHangWidgetState();
}

class _FormThongTinKhachHangWidgetState
    extends ConsumerState<FormThongTinKhachHangWidget> with FormUIMixins {

  final Debouncer onSearchDebouncer =
      Debouncer(delay: const Duration(seconds: 2));

  final String _typeData = 'khachhang';
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final maKhachHang = ref
        .watch(formKhachHangMoiProvider.select((value) => value.maKhachHang));

    Map thongTinKhachHang = {};
    thongTinKhachHang = ref.watch(kiemTraKhachHangProvider.select((value) => value.data ?? {}));

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

    return Column(

      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
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
              onChanged: (value) {
                ref.read(formKhachHangMoiProvider.notifier).changeData(
                    key: 'email', value: value, type: _typeData);
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




        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Expanded(
        //       flex: 1,
        //       child: Wrap(
        //         children: [
        //           lableTextForm('Email khách hàng (email phụ)'),
        //           TextFormField(
        //             autovalidateMode: AutovalidateMode.onUserInteraction,
        //             readOnly: thongTinKhachHang.isNotEmpty ? true : false,
        //             onChanged: (value) {
        //               ref.read(formKhachHangMoiProvider.notifier).changeData(
        //                   key: 'info',
        //                   value: {"email2": value},
        //                   type: _typeData);
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //     ndGapW16(),
        //     Expanded(
        //       flex: 3,
        //       child: Wrap(
        //         children: [
        //           lableTextForm('Tên Công ty /  Cá Nhân'),
        //           TextFormField(
        //             readOnly: thongTinKhachHang.isNotEmpty ? true : false,
        //             controller: TextEditingController(
        //                 text: thongTinKhachHang['congty']),
        //             onChanged: (value) {
        //               ref.read(formKhachHangMoiProvider.notifier).changeData(
        //                   key: 'congty', value: value, type: _typeData);
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Expanded(
        //       child: Wrap(
        //         children: [
        //           lableTextForm('Người đại diện mới'),
        //           TextFormField(
        //             readOnly: thongTinKhachHang.isNotEmpty ? true : false,
        //             onChanged: (value) {
        //               ref.read(formKhachHangMoiProvider.notifier).changeData(
        //                   key: 'info',
        //                   value: {"nguoidaidienmoi": value},
        //                   type: _typeData);
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //     ndGapW16(),
        //     Expanded(
        //       child: Wrap(
        //         children: [
        //           lableTextForm('Điện thoại cơ quan'),
        //           TextFormField(
        //             readOnly: thongTinKhachHang.isNotEmpty ? true : false,
        //             onChanged: (value) {
        //               ref.read(formKhachHangMoiProvider.notifier).changeData(
        //                   key: 'info',
        //                   value: {"dienthoaicoquan": value},
        //                   type: _typeData);
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //     ndGapW16(),
        //     Expanded(
        //       child: Wrap(
        //         children: [
        //           lableTextForm('Mã số thuế'),
        //           TextFormField(
        //             readOnly: thongTinKhachHang.isNotEmpty ? true : false,
        //             controller: TextEditingController(
        //                 text: thongTinKhachHang['masothue']),
        //             onChanged: (value) {
        //               ref.read(formKhachHangMoiProvider.notifier).changeData(
        //                   key: 'masothue', value: value, type: _typeData);
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //     ndGapW16(),
        //     Expanded(
        //       child: Wrap(
        //         children: [
        //           lableTextForm('CCCD / CMND'),
        //           TextFormField(
        //             readOnly: thongTinKhachHang.isNotEmpty ? true : false,
        //             controller:
        //                 TextEditingController(text: thongTinKhachHang['cccd']),
        //             onChanged: (value) {
        //               ref.read(formKhachHangMoiProvider.notifier).changeData(
        //                   key: 'cccd', value: value, type: _typeData);
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Expanded(
        //       child: Wrap(
        //         children: [
        //           lableTextForm('Địa chỉ'),
        //           TextFormField(
        //             autovalidateMode: AutovalidateMode.onUserInteraction,
        //             controller: TextEditingController(
        //                 text: thongTinKhachHang['diachi']),
        //             readOnly: thongTinKhachHang.isNotEmpty ? true : false,
        //             minLines: 3,
        //             maxLines: 3,
        //             validator: FormBuilderValidators.compose([
        //               FormBuilderValidators.required(
        //                   errorText: 'Không bỏ trống.'),
        //             ]),
        //             onChanged: (value) {
        //               ref.read(formKhachHangMoiProvider.notifier).changeData(
        //                   key: 'diachi', value: value, type: _typeData);
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //     ndGapW16(),
        //     Expanded(
        //       child: Wrap(
        //         children: [
        //           lableTextForm('Ghi chú'),
        //           TextFormField(
        //             readOnly: thongTinKhachHang.isNotEmpty ? true : false,
        //             controller: TextEditingController(
        //                 text: thongTinKhachHang['info']?['ghichu']),
        //             minLines: 3,
        //             maxLines: 3,
        //             onChanged: (value) {
        //               ref.read(formKhachHangMoiProvider.notifier).changeData(
        //                   key: 'info',
        //                   value: {"ghichu": value},
        //                   type: _typeData);
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  @override
  dispose() {
    super.dispose();
    _emailController.dispose();
    ref.invalidate(kiemTraKhachHangProvider);
  }
}
