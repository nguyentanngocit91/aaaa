part of '../khach_hang_moi_layout.dart';

class FormThongTinKhachHangWidget extends ConsumerStatefulWidget {
  const FormThongTinKhachHangWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinKhachHangWidgetState();
}

class _FormThongTinKhachHangWidgetState extends ConsumerState<FormThongTinKhachHangWidget> with FormUIMixins {
  @override
  Widget build(BuildContext context) {
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(key: 'makhachhang', value: value);
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Không bỏ trống'),
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(key: 'hoten', value: value);
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Không bỏ trống'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  lableTextForm('Tên Công ty /  Cá Nhân'),
                  TextFormField(),
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
                  lableTextForm('Điện thoại cơ quan'),
                  TextFormField(),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Mã số thuế'),
                  TextFormField(),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('CCCD / CMND'),
                  TextFormField(),
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
