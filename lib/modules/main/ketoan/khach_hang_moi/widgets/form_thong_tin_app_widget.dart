part of '../khach_hang_moi_layout.dart';

class FormThongTinAppWidget extends ConsumerStatefulWidget {
  const FormThongTinAppWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinAppWidgetState();
}

class _FormThongTinAppWidgetState extends ConsumerState<FormThongTinAppWidget>
    with FormUIMixins {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Wrap(
                        children: [
                          lableTextForm('Mã hợp đồng'),
                          TextFormField(
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.black12,
                            ),
                            readOnly: true,
                          ),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      flex: 3,
                      child: Wrap(
                        children: [
                          lableTextForm('Chức năng'),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              ref
                                  .read(formKhachHangMoiProvider.notifier)
                                  .changeData(
                                      type: 'app',
                                      key: 'chucnang',
                                      value: value);
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
                      flex: 1,
                      child: Wrap(
                        children: [
                          lableTextForm('Ngày ký'),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'dd-mm-yyyy',
                            ),
                            inputFormatters: [
                              MaskInputFormatter(mask: '##-##-####'),
                            ],
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              // ref
                              //     .read(formKhachHangMoiProvider.notifier)
                              //     .changeData(
                              //     type: 'app',
                              //     key: 'ngayupstore',
                              //     value: value);
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
                      flex: 1,
                      child: Wrap(
                        children: [
                          lableTextForm('Ngày bàn giao'),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'dd-mm-yyyy',
                            ),
                            inputFormatters: [
                              MaskInputFormatter(mask: '##-##-####'),
                            ],
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              ref
                                  .read(formKhachHangMoiProvider.notifier)
                                  .changeData(
                                  type: 'app',
                                  key: 'ngaybangiao',
                                  value: value);
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Wrap(
                        children: [
                          lableTextForm('Ghi chú'),
                          TextFormField(
                            minLines: 3,
                            maxLines: 3,
                            onChanged: (value) {
                              ref
                                  .read(formKhachHangMoiProvider.notifier)
                                  .changeData(
                                  type: 'app',
                                  key: 'ghichu',
                                  value: value);
                            },
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
