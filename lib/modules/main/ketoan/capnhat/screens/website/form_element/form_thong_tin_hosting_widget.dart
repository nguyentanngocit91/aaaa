part of '../upgrade.dart';

enum TrangThaiHosting { kyMoi, phucHoi, nangCap, chuyenDoi }

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
                            controller: TextEditingController(text: '${formState.maHopDong}H'),
                          ),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      flex: 1,
                      child: Wrap(
                        children: [
                          lableTextForm('Dung lượng Hosting (MB) - Tối thiểu 500MB'),
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
                                      key: 'tenhosting',
                                      value: value);
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
                          lableTextForm('Ngày đăng ký'),
                          TextFormField(
                            readOnly: true,
                            controller: TextEditingController(text: ngayDangKy.formatDateTime('dd-MM-yyyy')),
                            onTap: () async {
                              final DateTime? selDate = await Helper.onSelectDate(context, initialDate: ngayDangKy);
                              String txtDate = DateTime.now().formatDateTime('dd-MM-yyyy');
                              if(selDate!=null){
                                txtDate = selDate.formatDateTime('dd-MM-yyyy');
                              }
                              ref.read(formKhachHangMoiProvider.notifier).changeData(
                                  type: _typeData, key: 'ngayky', value: txtDate);
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
                            controller: TextEditingController(text: (ngayHetHan!=null) ? ngayHetHan!.formatDateTime('dd-MM-yyyy') : ''),
                            onTap: () async {
                              final DateTime? selDate = await Helper.onSelectDate(context, initialDate: ngayHetHan);
                              String txtDate = DateTime.now().formatDateTime('dd-MM-yyyy');
                              if(selDate!=null){
                                txtDate = selDate.formatDateTime('dd-MM-yyyy');
                              }
                              ref.read(formKhachHangMoiProvider.notifier).changeData(
                                  type: _typeData, key: 'ngayhethan', value: txtDate);
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

  TrangThaiHosting _trangThaiHosting = TrangThaiHosting.kyMoi;
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
                  Radio<TrangThaiHosting>(
                    value: TrangThaiHosting.kyMoi,
                    groupValue: _trangThaiHosting,
                    onChanged: (TrangThaiHosting? value) {
                      setState(() {
                        _trangThaiHosting = value!;
                      });
                    },
                  ),
                  const Text('Ký mới'),
                  ndGapW16(),
                  Radio<TrangThaiHosting>(
                    value: TrangThaiHosting.phucHoi,
                    groupValue: _trangThaiHosting,
                    onChanged: (TrangThaiHosting? value) {
                      setState(() {
                        _trangThaiHosting = value!;
                      });
                    },
                  ),
                  const Text('Phục hồi'),
                  ndGapW16(),
                  Radio<TrangThaiHosting>(
                    value: TrangThaiHosting.nangCap,
                    groupValue: _trangThaiHosting,
                    onChanged: (TrangThaiHosting? value) {
                      setState(() {
                        _trangThaiHosting = value!;
                      });
                    },
                  ),
                  const Text('Nâng cấp'),
                  ndGapW16(),
                  Radio<TrangThaiHosting>(
                    value: TrangThaiHosting.chuyenDoi,
                    groupValue: _trangThaiHosting,
                    onChanged: (TrangThaiHosting? value) {
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
            visible: (_trangThaiHosting==TrangThaiHosting.chuyenDoi || _trangThaiHosting==TrangThaiHosting.phucHoi) ? true : false,
            child: Wrap(
              children: [
                lableTextForm('Mã hợp đồng cũ'),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    ref.read(formKhachHangMoiProvider.notifier)
                        .changeData(
                        type: 'hopdong',
                        key: 'mahopdongcu',
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
