part of '../upgrade.dart';

enum HinhThucThanhToan { cod, bank }


class FormThongTinPhieuThuWidget extends ConsumerStatefulWidget {
  const FormThongTinPhieuThuWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinPhieuThuWidgetState();
}

class _FormThongTinPhieuThuWidgetState
    extends ConsumerState<FormThongTinPhieuThuWidget>
    with FormUIMixins {
  final String _typeData = 'phieuthu';
  HinhThucThanhToan _httt = HinhThucThanhToan.cod;
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
    return Column(

        children: [
          Padding(
            padding: Helper.padding(),
            child: bodyForm(
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
                          setState(() {
                            _httt = value!;
                          });
                        },
                      ),
                      const Text('Chuyển khoản'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xl: 2,
                lg: 4,
                sm:6,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lableTextForm('Ngày nộp'),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Không bỏ trống.'),
                        ]),
                        controller: TextEditingController(
                            text: ngayNop.formatDateTime(
                                formatString: 'dd-MM-yyyy')),
                        readOnly: true,
                        onTap: () async {
                          final DateTime? selDate = await Helper.onSelectDate(
                              context,
                              initialDate: ngayNop);
                          String txtDate = ngayNop.formatDateTime(
                              formatString: 'dd-MM-yyyy');
                          if (selDate != null) {
                            txtDate = selDate.formatDateTime(
                                formatString: 'dd-MM-yyyy');
                          }
                          ref.read(formKhachHangMoiProvider.notifier)
                              .changeData(
                              type: _typeData, key: 'ngaynop', value: txtDate);
                          setState(() {
                            ngayNop = selDate ?? ngayNop;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xl: 2,
                lg: 4,
                sm:6,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lableTextForm('Số phiếu thu / CK'),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Không bỏ trống.'),
                        ]),
                        onChanged: (value) {
                          ref.read(formKhachHangMoiProvider.notifier)
                              .changeData(
                              type: _typeData, key: 'maphieuthu', value: value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xl: 2,
                lg: 4,
                sm:6,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lableTextForm('Mã nhân viên'),
                      _MaNhaVienWidget(),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xl: 2,
                lg: 4,
                sm:6,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lableTextForm('Nhân viên kinh doanh'),
                      Consumer(
                        builder: (context, ref, child) {
                          ref.watch(nhanVienPhuTrachProvider.select((value) =>
                          value.maNhanViens));
                          return TextFormField(
                            readOnly: true,
                            controller: TextEditingController(text: ref.read(
                                nhanVienPhuTrachProvider.notifier)
                                .showThongTinNhanVienInput(field: 'hoten')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xl: 2,
                lg: 4,
                sm:6,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lableTextForm('Phòng'),
                      Consumer(
                        builder: (context, ref, child) {
                          ref.watch(nhanVienPhuTrachProvider
                              .select((value) => value.maNhanViens));
                          return TextFormField(
                            readOnly: true,
                            controller: TextEditingController(
                                text: ref
                                    .read(nhanVienPhuTrachProvider.notifier)
                                    .showThongTinNhanVienInput(
                                    field: 'parentId_hoten')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xl: 2,
                lg: 4,
                sm:6,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lableTextForm('Khu vực'),
                      Consumer(
                        builder: (context, ref, child) {
                          ref.watch(nhanVienPhuTrachProvider.select((value) =>
                          value.maNhanViens));
                          return TextFormField(
                            readOnly: true,
                            controller: TextEditingController(text: ref.read(
                                nhanVienPhuTrachProvider.notifier)
                                .showThongTinNhanVienInput(
                                field: 'maphongban')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              ResponsiveGridCol(
                xl: 2,
                lg: 4,
                sm:6,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          ref.read(formKhachHangMoiProvider.notifier)
                              .changeData(
                              type: _typeData, key: 'tongtien', value: value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xl: 2,
                lg: 4,
                sm:6,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lableTextForm('Phí web'),
                      TextFormField(
                        inputFormatters: [
                          CurrencyTextInputFormatter(symbol: ''),
                        ],
                        onChanged: (value) {
                          ref.read(formKhachHangMoiProvider.notifier)
                              .changeData(
                              type: _typeData, key: 'phiweb', value: value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xl: 2,
                lg: 4,
                sm:6,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lableTextForm('Phí nâng cấp web'),
                      TextFormField(
                        inputFormatters: [
                          CurrencyTextInputFormatter(symbol: ''),
                        ],
                        onChanged: (value) {
                          ref.read(formKhachHangMoiProvider.notifier)
                              .changeData(
                              type: _typeData, key: 'phinangcapweb', value: value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xl: 2,
                lg: 4,
                sm:6,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lableTextForm('Phí hosting'),
                      TextFormField(
                        inputFormatters: [
                          CurrencyTextInputFormatter(symbol: ''),
                        ],
                        onChanged: (value) {
                          ref.read(formKhachHangMoiProvider.notifier)
                              .changeData(
                              type: _typeData, key: 'phihosting', value: value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xl: 2,
                lg: 4,
                sm:6,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lableTextForm('Phí nâng cấp hosting'),
                      TextFormField(
                        inputFormatters: [
                          CurrencyTextInputFormatter(symbol: ''),
                        ],
                        onChanged: (value) {
                          ref.read(formKhachHangMoiProvider.notifier)
                              .changeData(
                              type: _typeData, key: 'phinangcaphosting', value: value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xl: 2,
                lg: 4,
                sm:6,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lableTextForm('Phí tên miền'),
                      TextFormField(
                        inputFormatters: [
                          CurrencyTextInputFormatter(symbol: ''),
                        ],
                        onChanged: (value) {
                          ref.read(formKhachHangMoiProvider.notifier)
                              .changeData(
                              type: _typeData, key: 'phitenmien', value: value);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              ResponsiveGridCol(
                xl: 2,
                lg: 4,
                sm:6,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lableTextForm('Phí App'),
                      TextFormField(
                        inputFormatters: [
                          CurrencyTextInputFormatter(symbol: ''),
                        ],
                        onChanged: (value) {
                          ref.read(formKhachHangMoiProvider.notifier)
                              .changeData(
                              type: _typeData, key: 'phiapp', value: value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xl: 2,
                lg: 4,
                sm:6,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lableTextForm('Phí VAT'),
                      TextFormField(
                        inputFormatters: [
                          CurrencyTextInputFormatter(symbol: ''),
                        ],
                        onChanged: (value) {
                          ref.read(formKhachHangMoiProvider.notifier)
                              .changeData(
                              type: _typeData, key: 'phivat', value: value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xl: 8,
                lg: 12,

                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lableTextForm('Ghi chú'),
                      TextFormField(
                        onChanged: (value) {
                          ref.read(formKhachHangMoiProvider.notifier)
                              .changeData(
                              type: _typeData, key: 'ghichu', value: value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ]
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
    final dsNhanvien = ref.watch(
        nhanVienPhuTrachProvider.select((value) => value.maNhanViens)) ?? [];

    if (dsNhanvien == [] || dsNhanvien.isEmpty) {
      _textFieldTagsController.clearTextFieldTags();
    }

    return TagsInputWidget(
      textFieldTagsController: _textFieldTagsController,
      validator: (tag) {
        if (tag.length < 3) {
          return 'Mã nhân viên quá ngắn';
        }
        return null;
      },
      onTag: (tag) async {
        final result = await ref
            .read(nhanVienPhuTrachProvider.notifier)
            .themMaNhanVien(tag);
        if (result == false) {
          if (context.mounted) {
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Thông báo'),
                  content: Text('Không tồn tại nhân viên có mã $tag'),
                  actions: [
                    FilledButton(onPressed: () {
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