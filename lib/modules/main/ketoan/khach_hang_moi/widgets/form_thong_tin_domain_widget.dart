part of '../khach_hang_moi_layout.dart';

class FormThongTinDomainWidget extends ConsumerStatefulWidget {
  const FormThongTinDomainWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinDomainWidgetState();
}

class _FormThongTinDomainWidgetState
    extends ConsumerState<FormThongTinDomainWidget> with FormUIMixins {
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formKhachHangMoiProvider);
    return Visibility(
      visible: formState.isHopDongDomain,
      child: Column(
        children: [
          ndGapH40(),
          titleForm(context, title: 'Thông tin Domain'),
          bodyForm(
            child: Wrap(
              runSpacing: 25,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      flex: 5,
                      child: Wrap(
                        children: [
                          lableTextForm(' '),
                          SizedBox(
                            height: 45,
                            child: FilledButton.icon(
                                icon: const FaIcon(
                                  FontAwesomeIcons.plus,
                                  size: 15,
                                ),
                                onPressed: () {},
                                label: const Text('Thêm Domain')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      child: Wrap(
                        children: [
                          lableTextForm('Domain name'),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              ref
                                  .read(formKhachHangMoiProvider.notifier)
                                  .changeData(type: 'domain' ,key: 'tenmien', value: value);
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
                          lableTextForm('Ngày đăng ký'),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'dd-mm-yyyy',
                            ),
                            inputFormatters: [
                              MaskInputFormatter(mask: '##-##-####'),
                            ],
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              ref
                                  .read(formKhachHangMoiProvider.notifier)
                                  .changeData(type: 'domail' ,key: 'ngayky', value: value);
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
                          lableTextForm('Ngày hết hạn'),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'dd-mm-yyyy',
                            ),
                            inputFormatters: [
                              MaskInputFormatter(mask: '##-##-####'),
                            ],
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              ref
                                  .read(formKhachHangMoiProvider.notifier)
                                  .changeData(type: 'domain' ,key: 'ngayhethan', value: value);
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
                      flex: 5,
                      child: Wrap(
                        children: [
                          lableTextForm('Ghi chú'),
                          TextFormField(
                            onChanged: (value) {
                              ref
                                  .read(formKhachHangMoiProvider.notifier)
                                  .changeData(type: 'domain' ,key: 'ghichu', value: value);
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
