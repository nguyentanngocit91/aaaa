part of '../khach_hang_moi_layout.dart';

class FormThongTinAppWidget extends ConsumerStatefulWidget {
  const FormThongTinAppWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinAppWidgetState();
}

class _FormThongTinAppWidgetState
    extends ConsumerState<FormThongTinAppWidget> with FormUIMixins {
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formKhachHangMoiProvider);
    return Visibility(
      visible: formState.isHopDongApp,
      child: Column(
        children: [
          ndGapH40(),
          titleForm(context, title: 'Thông tin App'),
          bodyForm(
            child: Wrap(
              runSpacing: 25,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Wrap(
                        children: [
                          lableTextForm('Mã hợp đồng'),
                          TextFormField(),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      flex: 3,
                      child: Wrap(
                        children: [
                          lableTextForm('Chức năng'),
                          TextFormField(),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      flex: 1,
                      child: Wrap(
                        children: [
                          lableTextForm('Ngày ký'),
                          TextFormField(),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      flex: 1,
                      child: Wrap(
                        children: [
                          lableTextForm('Ngày bàn giao'),
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
                          lableTextForm('Tìm chọn file'),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: FilledButton(
                                onPressed: () {},
                                child: const Text('Tìm chọn File')),
                          ),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      flex: 5,
                      child: Wrap(
                        children: [
                          lableTextForm('Nhập từ khoá cần tìm'),
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
            ),
          ),
        ],
      ),
    );
  }
}
