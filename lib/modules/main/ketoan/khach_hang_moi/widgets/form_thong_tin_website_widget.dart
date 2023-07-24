part of '../khach_hang_moi_layout.dart';

class FormThongTinWebsiteWidget extends ConsumerStatefulWidget {
  const FormThongTinWebsiteWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinWebsiteWidgetState();
}

class _FormThongTinWebsiteWidgetState
    extends ConsumerState<FormThongTinWebsiteWidget> with FormUIMixins {
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formKhachHangMoiProvider);
    return Visibility(
      visible: formState.isHopDongWebsite,
      child: Column(
        children: [
          ndGapH40(),
          titleForm(context, title: 'Thông tin Website'),
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              ref
                                  .read(formKhachHangMoiProvider.notifier)
                                  .changeData(type: 'website' ,key: 'chucnang', value: value);
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              ref
                                  .read(formKhachHangMoiProvider.notifier)
                                  .changeData(type: 'website' ,key: 'ngayky', value: value);
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              ref
                                  .read(formKhachHangMoiProvider.notifier)
                                  .changeData(type: 'website' ,key: 'ngaybangiao', value: value);
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
                          TextFormField(

                          ),
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
