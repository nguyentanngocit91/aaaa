part of '../screen/them_hopdong_moi.dart';


class FormThongTinHostingWidget extends ConsumerStatefulWidget {
  const FormThongTinHostingWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinHostingWidgetState();
}

class _FormThongTinHostingWidgetState
    extends ConsumerState<FormThongTinHostingWidget> with FormUIMixins {

  final String _typeData = 'hosting';
  DateTime ngayDangKy = DateTime.now();
  DateTime? ngayHetHan;
  
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formKhachHangMoiProvider);

    return Visibility(
      visible: formState.isHopDongHosting,
      child: Column(
        children: [
          ndGapH40(),
          titleForm(context, title: 'Thông tin Hosting'),
          bodyForm(
            child: Wrap(
              runSpacing: 25,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                            controller: TextEditingController(text: '${formState.soHopDong}H'),
                          ),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      flex: 1,
                      child: Wrap(
                        children: [
                          lableTextForm('Dung lượng Hosting (MB)'),
                          TextFormField(
                            inputFormatters: [
                              CurrencyTextInputFormatter(symbol: 'MB')
                            ],
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              ref
                                  .read(formKhachHangMoiProvider.notifier)
                                  .changeData(
                                      type: _typeData,
                                      key: 'dungluong',
                                      value: value.toString().replaceAll('.', '').replaceAll('MB', '').trim());
                            },
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Không bỏ trống.'),
                              (value) {
                                if(value!=null){
                                  int number = int.parse(value.replaceAll('.','').replaceAll('MB',''));
                                  if (number<500){
                                    return 'Dung lượng phải lớn hơn 500MB';
                                  }
                                }
                              }
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
                            controller: TextEditingController(text: ngayDangKy.formatDateTime()),
                            onTap: () async {
                              final DateTime? selDate = await Helper.onSelectDate(context, initialDate: ngayDangKy);
                              String txtDate = DateTime.now().formatDateTime();
                              if(selDate!=null){
                                txtDate = selDate.formatDateTime();
                                ref.read(formKhachHangMoiProvider.notifier).changeData(
                                    type: _typeData, key: 'ngaykyhd', value: selDate);
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
                          lableTextForm('Ngày hết hạn'),
                          TextFormField(
                            readOnly: true,
                            decoration: const InputDecoration(hintText: 'dd-mm-yyyy'),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Không bỏ trống.'),
                            ]),
                            controller: TextEditingController(text: (ngayHetHan!=null) ? ngayHetHan!.formatDateTime() : ''),
                            onTap: () async {
                              final DateTime? selDate = await Helper.onSelectDate(context, initialDate: ngayHetHan);
                              String txtDate = DateTime.now().formatDateTime();
                              if(selDate!=null){
                                txtDate = selDate.formatDateTime();
                                ref.read(formKhachHangMoiProvider.notifier).changeData(
                                    type: _typeData, key: 'ngayhethan', value: selDate);
                              }
                              setState(() {
                                ngayHetHan = selDate ?? ngayHetHan;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const _TrangThaiHostingWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TrangThaiHostingWidget extends ConsumerStatefulWidget {
  const _TrangThaiHostingWidget({super.key});

  @override
  ConsumerState createState() => _TrangThaiHostingWidgetState();
}

class _TrangThaiHostingWidgetState
    extends ConsumerState<_TrangThaiHostingWidget> with FormUIMixins {

  String _trangThaiHosting = 'kymoi';
  final String _typeData = 'hosting';

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Wrap(
            children: [
              lableTextForm('Trạng thái'),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center ,
                children: [
                  Radio<String>(
                    value: 'kymoi',
                    groupValue: _trangThaiHosting,
                    onChanged: (String? value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(type: 'hopdong', key: 'trangthaihosting', value: value);
                      setState(() {
                        _trangThaiHosting = value!;
                      });
                    },
                  ),
                  const Text('Ký mới'),
                  ndGapW16(),
                  Radio<String>(
                    value: 'phuchoi',
                    groupValue: _trangThaiHosting,
                    onChanged: (String? value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(type: 'hopdong', key: 'trangthaihosting', value: value);
                      setState(() {
                        _trangThaiHosting = value!;
                      });
                    },
                  ),
                  const Text('Phục hồi'),
                  ndGapW16(),
                  Radio<String>(
                    value: 'nangcap',
                    groupValue: _trangThaiHosting,
                    onChanged: (String? value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(type: 'hopdong', key: 'trangthaihosting', value: value);
                      setState(() {
                        _trangThaiHosting = value!;
                      });
                    },
                  ),
                  const Text('Nâng cấp'),
                  ndGapW16(),
                  Radio<String>(
                    value: 'chuyendoi',
                    groupValue: _trangThaiHosting,
                    onChanged: (String? value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(type: 'hopdong', key: 'trangthaihosting', value: value);
                      setState(() {
                        _trangThaiHosting = value!;
                      });
                    },
                  ),
                  const Text('Chuyển đổi'),
                ],
              ),
            ],
          ),
        ),
        ndGapW16(),
        Expanded(
          flex: 1,
          child: Visibility(
            visible: (_trangThaiHosting=='chuyendoi' || _trangThaiHosting=='phuchoi') ? true : false,
            child: Wrap(
              children: [
                lableTextForm('Số hợp đồng cũ'),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    ref.read(formKhachHangMoiProvider.notifier)
                        .changeData(
                        type: 'hopdong',
                        key: 'sohopdongcu',
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
        ),
        ndGapW16(),
        Expanded(
          flex: 3,
          child: Wrap(
            children: [
              lableTextForm('Ghi chú'),
              TextFormField(
                decoration: const InputDecoration(
                  hintText:
                  'Ghi chú nội dung hosting nếu hosting phục hồi ghi mã HĐ và domain cũ',
                ),
                onChanged: (value) {
                  ref
                      .read(formKhachHangMoiProvider.notifier)
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
    );
  }
}
