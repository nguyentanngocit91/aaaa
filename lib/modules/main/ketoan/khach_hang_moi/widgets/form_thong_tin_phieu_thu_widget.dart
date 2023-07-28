part of '../khach_hang_moi_layout.dart';

enum HinhThucThanhToan { cod, bank }

enum LoaiPhieuThu { phieuthu, phieuthuBG, phieuthuApp, phieuthuBGApp }

class FormThongTinPhieuThuWidget extends ConsumerStatefulWidget {
  const FormThongTinPhieuThuWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinPhieuThuWidgetState();
}

class _FormThongTinPhieuThuWidgetState
    extends ConsumerState<FormThongTinPhieuThuWidget> with FormUIMixins {
  final String _typeData = 'phieuthu';
  HinhThucThanhToan _httt = HinhThucThanhToan.cod;
  LoaiPhieuThu _loaiPhieuThu = LoaiPhieuThu.phieuthu;
  DateTime ngayNop = DateTime.now();

  @override
  initState() {
    super.initState();
    // set dữ liệu mặt định
    Future.delayed(const Duration(milliseconds: 100), () {
      ref
          .read(formKhachHangMoiProvider.notifier)
          .changeData(type: _typeData, key: 'mahopdong', value: null);
      ref
          .read(formKhachHangMoiProvider.notifier)
          .changeData(type: _typeData, key: 'httt', value: 'cod');
      ref
          .read(formKhachHangMoiProvider.notifier)
          .changeData(type: _typeData, key: 'loaiphieuthu', value: 'phieuthu');
      ref
          .read(formKhachHangMoiProvider.notifier)
          .changeData(type: _typeData, key: 'is_pending', value: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 25,
      children: [
        bodyForm(
          backgroundColor: Colors.grey.shade300,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Phương thức thanh toán:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ndGapW8(),
                  Radio<HinhThucThanhToan>(
                    value: HinhThucThanhToan.cod,
                    groupValue: _httt,
                    onChanged: (HinhThucThanhToan? value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          type: _typeData, key: 'httt', value: 'cod');
                      setState(() {
                        _httt = value!;
                      });
                    },
                  ),
                  const Text('Tiền mặt'),
                  ndGapW16(),
                  Radio<HinhThucThanhToan>(
                    value: HinhThucThanhToan.bank,
                    groupValue: _httt,
                    onChanged: (HinhThucThanhToan? value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          type: _typeData, key: 'httt', value: 'bank');
                      setState(() {
                        _httt = value!;
                      });
                    },
                  ),
                  const Text('Chuyển khoản'),
                ],
              ),
              ndGapW48(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Loại Phiếu thu:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ndGapW8(),
                  Radio<LoaiPhieuThu>(
                    value: LoaiPhieuThu.phieuthu,
                    groupValue: _loaiPhieuThu,
                    onChanged: (LoaiPhieuThu? value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          type: _typeData,
                          key: 'loaiphieuthu',
                          value: _typeData);
                      setState(() {
                        _loaiPhieuThu = value!;
                      });
                    },
                  ),
                  const Text('Phiếu thu'),
                  ndGapW16(),
                  Radio<LoaiPhieuThu>(
                    value: LoaiPhieuThu.phieuthuBG,
                    groupValue: _loaiPhieuThu,
                    onChanged: (LoaiPhieuThu? value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          type: _typeData,
                          key: 'loaiphieuthu',
                          value: 'phieuthubg');
                      setState(() {
                        _loaiPhieuThu = value!;
                      });
                    },
                  ),
                  const Text('Phiếu thu bàn giao'),
                  ndGapW16(),
                  Radio<LoaiPhieuThu>(
                    value: LoaiPhieuThu.phieuthuApp,
                    groupValue: _loaiPhieuThu,
                    onChanged: (LoaiPhieuThu? value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          type: _typeData,
                          key: 'loaiphieuthu',
                          value: 'phieuthuapp');
                      setState(() {
                        _loaiPhieuThu = value!;
                      });
                    },
                  ),
                  const Text('Phiếu thu App'),
                  ndGapW16(),
                  Radio<LoaiPhieuThu>(
                    value: LoaiPhieuThu.phieuthuBGApp,
                    groupValue: _loaiPhieuThu,
                    onChanged: (LoaiPhieuThu? value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          type: _typeData,
                          key: 'loaiphieuthu',
                          value: 'phieuthuappbg');
                      setState(() {
                        _loaiPhieuThu = value!;
                      });
                    },
                  ),
                  const Text('Phiếu thu bàn giao App'),
                ],
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Ngày nộp'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                    controller: TextEditingController(
                        text: ngayNop.formatDateTime('dd-MM-yyyy')),
                    readOnly: true,
                    onTap: () async {
                      final DateTime? selDate = await Helper.onSelectDate(
                          context,
                          initialDate: ngayNop);
                      String txtDate = ngayNop.formatDateTime('dd-MM-yyyy');
                      if (selDate != null) {
                        txtDate = selDate.formatDateTime('dd-MM-yyyy');
                      }
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          type: _typeData, key: 'ngaynop', value: txtDate);
                      setState(() {
                        ngayNop = selDate ?? ngayNop;
                      });
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Số phiếu thu / CK'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          type: _typeData, key: 'maphieuthu', value: value);
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Mã nhân viên'),
                  _MaNhaVienWidget(),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Nhân viên kinh doanh'),
                  Consumer(
                    builder: (context, ref, child) {
                      ref.watch(nhanVienPhuTrachProvider.select((value) => value.maNhanViens));
                      return TextFormField(
                        readOnly: true,
                        controller: TextEditingController(text: ref.read(nhanVienPhuTrachProvider.notifier).showThongTinNhanVienInput(field: 'hoten')),
                      );
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Phòng'),
                  Consumer(
                    builder: (context, ref, child) {
                      ref.watch(nhanVienPhuTrachProvider.select((value) => value.maNhanViens));
                      return TextFormField(
                        readOnly: true,
                      );
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Khu vực'),
                  Consumer(
                    builder: (context, ref, child) {
                      ref.watch(nhanVienPhuTrachProvider.select((value) => value.maNhanViens));
                      return TextFormField(
                        readOnly: true,
                        controller: TextEditingController(text: ref.read(nhanVienPhuTrachProvider.notifier).showThongTinNhanVienInput(field: 'maphongban')),
                      );
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
                  lableTextForm('Tổng tiền thu'),
                  TextFormField(
                    inputFormatters: [
                      CurrencyTextInputFormatter(symbol: ''),
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          type: _typeData, key: 'tongtien', value: value);
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Phí web'),
                  TextFormField(
                    inputFormatters: [
                      CurrencyTextInputFormatter(symbol: ''),
                    ],
                    onChanged: (value) {
                      ref.read(formKhachHangMoiProvider.notifier).changeData(
                          type: _typeData, key: 'manhanvien', value: value);
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Phí nâng cấp web'),
                  TextFormField(),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Phí hosting'),
                  TextFormField(),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Phí nâng cấp hosting'),
                  TextFormField(),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Phí tên miền'),
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
                  lableTextForm('Phí App'),
                  TextFormField(),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              flex: 1,
              child: Wrap(
                children: [
                  lableTextForm('Phí VAT'),
                  TextFormField(),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              flex: 4,
              child: Wrap(
                children: [
                  lableTextForm('Ghi chú'),
                  TextFormField(),
                ],
              ),
            ),
          ],
        ),
        const LoaiHopDongWidget(),
      ],
    );
  }
}

class LoaiHopDongWidget extends ConsumerWidget {
  const LoaiHopDongWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FormKhachHangMoiState formKhachHangMoiState =
        ref.watch(formKhachHangMoiProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Chọn loại hợp đồng:'),
        ndGapW32(),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Checkbox(
              value: formKhachHangMoiState.isHopDongWebsite,
              onChanged: (bool? value) {
                ref
                    .read(formKhachHangMoiProvider.notifier)
                    .checkLoaiHopDong(isHopDongWebsite: value ?? false);
              },
            ),
            const Text("Website"),
          ],
        ),
        ndGapW16(),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Checkbox(
              value: formKhachHangMoiState.isHopDongDomain,
              onChanged: (bool? value) {
                ref
                    .read(formKhachHangMoiProvider.notifier)
                    .checkLoaiHopDong(isHopDongDomain: value ?? false);
              },
            ),
            const Text("Domain"),
          ],
        ),
        ndGapW16(),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Checkbox(
              value: formKhachHangMoiState.isHopDongHosting,
              onChanged: (bool? value) {
                ref
                    .read(formKhachHangMoiProvider.notifier)
                    .checkLoaiHopDong(isHopDongHosting: value ?? false);
              },
            ),
            const Text("Hosting"),
          ],
        ),
        ndGapW16(),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Checkbox(
              value: formKhachHangMoiState.isHopDongApp,
              onChanged: (bool? value) {
                ref
                    .read(formKhachHangMoiProvider.notifier)
                    .checkLoaiHopDong(isHopDongApp: value ?? false);
              },
            ),
            const Text("App"),
          ],
        ),
      ],
    );
  }
}

class _MaNhaVienWidget extends ConsumerStatefulWidget {
  const _MaNhaVienWidget({super.key});

  @override
  ConsumerState createState() => __MaNhaVienWidgetState();
}

class __MaNhaVienWidgetState extends ConsumerState<_MaNhaVienWidget> {

  late final TextFieldTagsController _textFieldTagsController;

  @override
  void initState() {
    super.initState();
    _textFieldTagsController = TextFieldTagsController();
  }

  @override
  Widget build(BuildContext context) {
    final dsNhanvien = ref.watch(nhanVienPhuTrachProvider.select((value) => value.maNhanViens)) ?? [];

    if(dsNhanvien==[] || dsNhanvien.isEmpty){
      _textFieldTagsController.clearTextFieldTags();
    }

    return TagsInputWidget(
      textFieldTagsController: _textFieldTagsController,
      validator: (tag) {
        if(tag.length<3){ return 'Mã nhân viên quá ngắn'; }
        return null;
      },
      onTag: (tag) async {
        final result = await ref
            .read(nhanVienPhuTrachProvider.notifier)
            .themMaNhanVien(tag);
        if (result == false) {
          if (context.mounted){
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Thông báo'),
                  content: Text('Không tồn tại nhân viên có mã $tag'),
                  actions: [
                    FilledButton(onPressed: (){
                      context.pop();
                    }, child: Text('Đâ hiểu')),
                  ],
                );
              },
            );
            _textFieldTagsController.removeTag = tag;
          }
        }
      },
      onDelete: (tag) {
        ref.read(nhanVienPhuTrachProvider.notifier).xoaNhanVien(tag);
      },
      initialTags: [
        for (var nv in dsNhanvien) nv['manhanvien']
      ],
    );
  }
}