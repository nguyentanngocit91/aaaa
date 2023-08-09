part of '../../screen/them_phieuthu_screen.dart';

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
    return Container(
      padding: EdgeInsets.all(0),
      child: Column(


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
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
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
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
                            type: _typeData,
                            key: 'loaiphieuthu',
                            value: _typeData);
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
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
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
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
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
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
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

          ndGapH24(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    lableTextForm('Ngày nộp'),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Không bỏ trống.'),
                      ]),
                      controller: TextEditingController(
                          text: ngayNop.formatDateTime()),
                      readOnly: true,
                      onTap: () async {
                        final DateTime? selDate = await Helper.onSelectDate(
                            context,
                            initialDate: ngayNop);
                        String txtDate = ngayNop.formatDateTime();
                        if (selDate != null) {
                          txtDate = selDate.formatDateTime();
                          ref.read(formKhachHangMoiProvider.notifier).changeData(
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
                child: Column(
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
                child: Column(
                  children: [
                    lableTextForm('Mã nhân viên (cách nhau dấu ",")'),
                    const _MaNhaVienWidget(),
                  ],
                ),
              ),
              ndGapW16(),
              Expanded(
                child: Column(
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
                child: Column(
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
                child: Column(
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
                child: Column(
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
                            type: _typeData, key: 'tongtien', value: value.toString().replaceAll('.', ''));
                      },
                    ),
                  ],
                ),
              ),
              ndGapW16(),
              Expanded(
                child: Column(
                  children: [
                    lableTextForm('Phí web'),
                    TextFormField(
                      inputFormatters: [
                        CurrencyTextInputFormatter(symbol: ''),
                      ],
                      onChanged: (value) {
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
                            type: _typeData, key: 'phiweb', value: value.toString().replaceAll('.', ''));
                      },
                    ),
                  ],
                ),
              ),
              ndGapW16(),
              Expanded(
                child: Column(
                  children: [
                    lableTextForm('Phí nâng cấp web'),
                    TextFormField(
                      inputFormatters: [
                        CurrencyTextInputFormatter(symbol: ''),
                      ],
                      onChanged: (value) {
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
                            type: _typeData, key: 'phinangcapweb', value: value.toString().replaceAll('.', ''));
                      },
                    ),
                  ],
                ),
              ),
              ndGapW16(),
              Expanded(
                child: Column(
                  children: [
                    lableTextForm('Phí hosting'),
                    TextFormField(
                      inputFormatters: [
                        CurrencyTextInputFormatter(symbol: ''),
                      ],
                      onChanged: (value) {
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
                            type: _typeData, key: 'phihosting', value: value.toString().replaceAll('.', ''));
                      },
                    ),
                  ],
                ),
              ),
              ndGapW16(),
              Expanded(
                child: Column(
                  children: [
                    lableTextForm('Phí nâng cấp hosting'),
                    TextFormField(
                      inputFormatters: [
                        CurrencyTextInputFormatter(symbol: ''),
                      ],
                      onChanged: (value) {
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
                            type: _typeData, key: 'phinangcaphosting', value: value.toString().replaceAll('.', ''));
                      },
                    ),
                  ],
                ),
              ),
              ndGapW16(),
              Expanded(
                child: Column(
                  children: [
                    lableTextForm('Phí tên miền'),
                    TextFormField(
                      inputFormatters: [
                        CurrencyTextInputFormatter(symbol: ''),
                      ],
                      onChanged: (value) {
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
                            type: _typeData, key: 'phitenmien', value: value.toString().replaceAll('.', ''));
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
                child: Column(
                  children: [
                    lableTextForm('Phí App'),
                    TextFormField(
                      inputFormatters: [
                        CurrencyTextInputFormatter(symbol: ''),
                      ],
                      onChanged: (value) {
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
                            type: _typeData, key: 'phiapp', value: value.toString().replaceAll('.', ''));
                      },
                    ),
                  ],
                ),
              ),
              ndGapW16(),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    lableTextForm('Phí VAT'),
                    TextFormField(
                      inputFormatters: [
                        CurrencyTextInputFormatter(symbol: ''),
                      ],
                      onChanged: (value) {
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
                            type: _typeData, key: 'vat', value: value.toString().replaceAll('.', ''));
                      },
                    ),
                  ],
                ),
              ),
              ndGapW16(),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    lableTextForm('Ghi chú'),
                    TextFormField(
                      onChanged: (value) {
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
                            type: _typeData, key: 'ghichu', value: value);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],


      ),
    //  runSpacing: 25,

    );
  }
}


class _MaNhaVienWidget extends ConsumerStatefulWidget {
  const _MaNhaVienWidget({super.key});

  @override
  ConsumerState createState() => _MaNhaVienWidgetState();
}

class _MaNhaVienWidgetState extends ConsumerState<_MaNhaVienWidget> {
  final TextFieldTagsController _textFieldTagsController = TextFieldTagsController();

  @override
  Widget build(BuildContext context) {
    final FormStatus? formStatus = ref.watch(formKhachHangMoiProvider.select((value) => value.formStatus));
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
      errText: (dsNhanvien.isNotEmpty || formStatus == FormStatus.pure) ? null : 'Không để trống',
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
