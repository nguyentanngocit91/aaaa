part of '../sua_phieu_thu_layout.dart';

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
          .read(formPhieuThuProvider.notifier)
          .changeData(type: _typeData, key: 'mahopdong', value: null);
      ref
          .read(formPhieuThuProvider.notifier)
          .changeData(type: _typeData, key: 'httt', value: 'cod');
      ref
          .read(formPhieuThuProvider.notifier)
          .changeData(type: _typeData, key: 'loaiphieuthu', value: 'phieuthu');
      ref
          .read(formPhieuThuProvider.notifier)
          .changeData(type: _typeData, key: 'is_pending', value: false);
    });
  }

  HinhThucThanhToan getHTTT(String hinhThucThanhToan) {
    HinhThucThanhToan kq = HinhThucThanhToan.cod;
    switch (hinhThucThanhToan) {
      case 'bank':
        kq = HinhThucThanhToan.bank;
      default:
        kq = HinhThucThanhToan.cod;
    }
    return kq;
  }

  LoaiPhieuThu getLoaiPhieuThu(String loaiPhieuThu) {
    LoaiPhieuThu kq = LoaiPhieuThu.phieuthu;
    switch (loaiPhieuThu) {
      case 'phieuthubg':
        kq = LoaiPhieuThu.phieuthuBG;
      case 'phieuthuapp':
        kq = LoaiPhieuThu.phieuthuApp;
      case 'phieuthuappbg':
        kq = LoaiPhieuThu.phieuthuBGApp;
      default:
        kq = LoaiPhieuThu.phieuthu;
    }
    return kq;
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formPhieuThuProvider);
    final dataPhieuThu = formState.dataPhieuThu!;
    // print(dataPhieuThu);
    _httt = getHTTT(dataPhieuThu['httt']);
    _loaiPhieuThu = getLoaiPhieuThu(dataPhieuThu['loaiphieuthu']);
    ngayNop = dataPhieuThu['ngaynopcty'] ?? DateTime.now();

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
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData, key: 'httt', value: 'cod');
                      if (mounted) {
                        setState(() {
                          _httt = value!;
                        });
                      }
                    },
                  ),
                  const Text('Tiền mặt'),
                  ndGapW16(),
                  Radio<HinhThucThanhToan>(
                    value: HinhThucThanhToan.bank,
                    groupValue: _httt,
                    onChanged: (HinhThucThanhToan? value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData, key: 'httt', value: 'bank');
                      if (mounted) {
                        setState(() {
                          _httt = value!;
                        });
                      }
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
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData,
                          key: 'loaiphieuthu',
                          value: 'phieuthu');
                      if (mounted) {
                        setState(() {
                          _loaiPhieuThu = value!;
                        });
                      }
                    },
                  ),
                  const Text('Phiếu thu'),
                  ndGapW16(),
                  Radio<LoaiPhieuThu>(
                    value: LoaiPhieuThu.phieuthuBG,
                    groupValue: _loaiPhieuThu,
                    onChanged: (LoaiPhieuThu? value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData,
                          key: 'loaiphieuthu',
                          value: 'phieuthubg');
                      if (mounted) {
                        setState(() {
                          _loaiPhieuThu = value!;
                        });
                      }
                    },
                  ),
                  const Text('Phiếu thu bàn giao'),
                  ndGapW16(),
                  Radio<LoaiPhieuThu>(
                    value: LoaiPhieuThu.phieuthuApp,
                    groupValue: _loaiPhieuThu,
                    onChanged: (LoaiPhieuThu? value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData,
                          key: 'loaiphieuthu',
                          value: 'phieuthuapp');
                      if (mounted) {
                        setState(() {
                          _loaiPhieuThu = value!;
                        });
                      }
                    },
                  ),
                  const Text('Phiếu thu App'),
                  ndGapW16(),
                  Radio<LoaiPhieuThu>(
                    value: LoaiPhieuThu.phieuthuBGApp,
                    groupValue: _loaiPhieuThu,
                    onChanged: (LoaiPhieuThu? value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData,
                          key: 'loaiphieuthu',
                          value: 'phieuthuappbg');
                      if (mounted) {
                        setState(() {
                          _loaiPhieuThu = value!;
                        });
                      }
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
                    controller: TextEditingController(text: ngayNop.formatDateTime()),
                    readOnly: true,
                    onTap: () async {
                      final DateTime? selDate = await Helper.onSelectDate(
                          context,
                          initialDate: ngayNop);
                      String txtDate = ngayNop.formatDateTime();
                      if (selDate != null) {
                        txtDate = selDate.formatDateTime();
                        ref.read(formPhieuThuProvider.notifier).changeData(
                            type: _typeData, key: 'ngaynopcty', value: selDate);
                      }
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
                    initialValue: dataPhieuThu['maphieuthu'],
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
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
                  lableTextForm('Mã nhân viên (cách nhau dấu ",")'),
                  const _MaNhaVienWidget(),
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
                      ref.watch(nhanVienPhuTrachProvider
                          .select((value) => value.maNhanViens));
                      return TextFormField(
                        autofocus: false,
                        readOnly: true,
                        controller: TextEditingController(
                            text: ref
                                .read(nhanVienPhuTrachProvider.notifier)
                                .showThongTinNhanVienInput(field: 'hoten')),
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
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Khu vực'),
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
                                    field: 'maphongban')),
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
                    initialValue: Helper.numberFormat(
                        double.parse(dataPhieuThu['tongtien'].toString())),
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData,
                          key: 'tongtien',
                          value: value.toString().replaceAll('.', ''));
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
                    initialValue: Helper.numberFormat(
                        double.parse(dataPhieuThu['phiweb'].toString())),
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData,
                          key: 'phiweb',
                          value: value.toString().replaceAll('.', ''));
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
                  TextFormField(
                    inputFormatters: [
                      CurrencyTextInputFormatter(symbol: ''),
                    ],
                    initialValue: Helper.numberFormat(
                        double.parse(dataPhieuThu['phinangcapweb'].toString())),
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData,
                          key: 'phinangcapweb',
                          value: value.toString().replaceAll('.', ''));
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Phí hosting'),
                  TextFormField(
                    inputFormatters: [
                      CurrencyTextInputFormatter(symbol: ''),
                    ],
                    initialValue: Helper.numberFormat(
                        double.parse(dataPhieuThu['phihosting'].toString())),
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData,
                          key: 'phihosting',
                          value: value.toString().replaceAll('.', ''));
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Phí nâng cấp hosting'),
                  TextFormField(
                    inputFormatters: [
                      CurrencyTextInputFormatter(symbol: ''),
                    ],
                    initialValue: Helper.numberFormat(double.parse(
                        dataPhieuThu['phinangcaphosting'].toString())),
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData,
                          key: 'phinangcaphosting',
                          value: value.toString().replaceAll('.', ''));
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Phí tên miền'),
                  TextFormField(
                    inputFormatters: [
                      CurrencyTextInputFormatter(symbol: ''),
                    ],
                    initialValue: Helper.numberFormat(
                        double.parse(dataPhieuThu['phitenmien'].toString())),
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData,
                          key: 'phitenmien',
                          value: value.toString().replaceAll('.', ''));
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
              flex: 1,
              child: Wrap(
                children: [
                  lableTextForm('Phí App'),
                  TextFormField(
                    inputFormatters: [
                      CurrencyTextInputFormatter(symbol: ''),
                    ],
                    initialValue: Helper.numberFormat(
                        double.parse(dataPhieuThu['phiapp'].toString())),
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData,
                          key: 'phiapp',
                          value: value.toString().replaceAll('.', ''));
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
                  lableTextForm('Phí VAT'),
                  TextFormField(
                    inputFormatters: [
                      CurrencyTextInputFormatter(symbol: ''),
                    ],
                    initialValue: Helper.numberFormat(
                        double.parse((dataPhieuThu['vat'] ?? 0).toString())),
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData,
                          key: 'vat',
                          value: value.toString().replaceAll('.', ''));
                    },
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              flex: 4,
              child: Wrap(
                children: [
                  lableTextForm('Ghi chú'),
                  TextFormField(
                    initialValue: dataPhieuThu['ghichu'],
                    onChanged: (value) {
                      ref.read(formPhieuThuProvider.notifier).changeData(
                          type: _typeData, key: 'ghichu', value: value);
                    },
                  ),
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
    final FormPhieuThuState formPhieuThuState = ref.watch(formPhieuThuProvider);

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
              value: formPhieuThuState.isHopDongWebsite,
              onChanged: (bool? value) {
                if (formPhieuThuState.isHopDongWebsite == false) {
                  ref
                      .read(formPhieuThuProvider.notifier)
                      .checkLoaiHopDong(isHopDongWebsite: value ?? false);
                }
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
              value: formPhieuThuState.isHopDongDomain,
              onChanged: (bool? value) {
                if (formPhieuThuState.isHopDongDomain == false) {
                  ref
                      .read(formPhieuThuProvider.notifier)
                      .checkLoaiHopDong(isHopDongDomain: value ?? false);
                }
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
              value: formPhieuThuState.isHopDongHosting,
              onChanged: (bool? value) {
                if (formPhieuThuState.isHopDongHosting == false) {
                  ref
                      .read(formPhieuThuProvider.notifier)
                      .checkLoaiHopDong(isHopDongHosting: value ?? false);
                }
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
              value: formPhieuThuState.isHopDongApp,
              onChanged: (bool? value) {
                if (formPhieuThuState.isHopDongApp == false) {
                  ref
                      .read(formPhieuThuProvider.notifier)
                      .checkLoaiHopDong(isHopDongApp: value ?? false);
                }
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
  ConsumerState createState() => _MaNhaVienWidgetState();
}

class _MaNhaVienWidgetState extends ConsumerState<_MaNhaVienWidget> {
  final TextFieldTagsController _textFieldTagsController =
      TextFieldTagsController();

  @override
  Widget build(BuildContext context) {
    final formStatus =
        ref.watch(formPhieuThuProvider.select((value) => value.formStatus));
    final dsNhanvien = ref.watch(
            nhanVienPhuTrachProvider.select((value) => value.maNhanViens)) ??
        [];

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
      errText: (dsNhanvien.isNotEmpty || formStatus == FormStatus.pure)
          ? null
          : 'Không để trống',
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
                    FilledButton(
                      onPressed: () {
                        context.pop();
                      },
                      autofocus: true,
                      child: const Text('Đâ hiểu'),
                    ),
                  ],
                );
              },
            );
            _textFieldTagsController.removeTag = tag;
            if (dsNhanvien.isEmpty) {
              _textFieldTagsController.setPrefixIcon = false;
            }
          }
        }
      },
      onDelete: (tag) {
        ref.read(nhanVienPhuTrachProvider.notifier).xoaNhanVien(tag);
      },
      initialTags: [for (var nv in dsNhanvien) nv['manhanvien']],
    );
  }
}
