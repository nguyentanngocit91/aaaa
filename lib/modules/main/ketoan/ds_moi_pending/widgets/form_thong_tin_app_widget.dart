part of '../sua_phieu_thu_layout.dart';

class FormThongTinAppWidget extends ConsumerStatefulWidget {
  const FormThongTinAppWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinAppWidgetState();
}

class _FormThongTinAppWidgetState extends ConsumerState<FormThongTinAppWidget>
    with FormUIMixins {
  final String _typeData = 'app';
  DateTime ngayDangKy = DateTime.now();
  DateTime? ngayBanGiao;

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formPhieuThuProvider);
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
                            controller: TextEditingController(
                                text: '${formState.soHopDong}A'),
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
                                  .read(formPhieuThuProvider.notifier)
                                  .changeData(
                                      type: _typeData,
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
                            readOnly: true,
                            controller: TextEditingController(
                                text: ngayDangKy.formatDateTime()),
                            onTap: () async {
                              final DateTime? selDate =
                                  await Helper.onSelectDate(context,
                                      initialDate: ngayDangKy);
                              String txtDate =
                                  DateTime.now().formatDateTime();
                              if (selDate != null) {
                                txtDate = selDate.formatDateTime();
                                ref
                                    .read(formPhieuThuProvider.notifier)
                                    .changeData(
                                    type: _typeData,
                                    key: 'ngaykyhd',
                                    value: selDate);
                              }
                              setState(() {
                                ngayDangKy = selDate ?? ngayDangKy;
                              });
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
                          lableTextForm('Ngày bàn giao'),
                          TextFormField(
                              decoration:
                                  const InputDecoration(hintText: 'dd-mm-yyyy'),
                              readOnly: true,
                              controller: TextEditingController(
                                  text: (ngayBanGiao != null)
                                      ? ngayBanGiao!
                                          .formatDateTime()
                                      : null),
                              onTap: () async {
                                final DateTime? selDate =
                                    await Helper.onSelectDate(context,
                                        initialDate: ngayBanGiao);
                                String txtDate = '';
                                if (selDate != null) {
                                  txtDate =
                                      selDate.formatDateTime();
                                  ref
                                      .read(formPhieuThuProvider.notifier)
                                      .changeData(
                                      type: _typeData,
                                      key: 'ngaybangiao',
                                      value: selDate);
                                }
                                 setState(() {
                                  ngayBanGiao = selDate ?? ngayBanGiao;
                                });
                              }),
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
                                  .read(formPhieuThuProvider.notifier)
                                  .changeData(
                                      type: _typeData,
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
