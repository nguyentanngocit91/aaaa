part of '../khach_hang_moi_layout.dart';

class FormThongTinDomainWidget extends ConsumerStatefulWidget {
  const FormThongTinDomainWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinDomainWidgetState();
}

class _FormThongTinDomainWidgetState
    extends ConsumerState<FormThongTinDomainWidget> with FormUIMixins {

  int _index = 1;

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formKhachHangMoiProvider);
    List<DomainModel> listDomain = ref.watch(danhSachDomainProvider);

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
                            controller: TextEditingController(
                                text: '${formState.maHopDong}D'),
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
                                onPressed: () {
                                  _index++;
                                  ref.read(danhSachDomainProvider.notifier).addNewRowDomain(index: _index);
                                },
                                label: const Text('Thêm Domain')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                for (DomainModel item in listDomain) ...[
                  RowDomainWidget(domainModel: item,),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowDomainWidget extends ConsumerStatefulWidget {
  const RowDomainWidget({super.key,required this.domainModel});

  final DomainModel domainModel;

  @override
  ConsumerState createState() => _RowDomainWidgetState();
}

class _RowDomainWidgetState extends ConsumerState<RowDomainWidget>
    with FormUIMixins {

  late final TextEditingController _nameController;
  late final TextEditingController _ghiChuController;
  DateTime? selNgayDangKy;
  DateTime? selNgayHetHan;

  @override
  initState(){
    super.initState();
    _nameController = TextEditingController(text: widget.domainModel.domainName ?? '');
    _ghiChuController = TextEditingController(text: widget.domainModel.ghiChu ?? '');

    _nameController.addListener(() {
      final String text = _nameController.text;
      _nameController.value = _nameController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });

    _ghiChuController.addListener(() {
      final String text = _ghiChuController.text;
      _ghiChuController.value = _ghiChuController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void didUpdateWidget(covariant RowDomainWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    Future.delayed(const Duration(milliseconds: 0),(){
        _nameController.text = widget.domainModel.domainName ?? '';
        _ghiChuController.text = widget.domainModel.ghiChu ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    int rowIndex = widget.domainModel.rowIndex ?? 0;

    selNgayDangKy = widget.domainModel.ngayDangKy;
    selNgayHetHan = widget.domainModel.ngayHetHan;
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 250,
          child: Wrap(
            children: [
              lableTextForm('Domain name',
                  child: (widget.domainModel.defaultRow == false)
                      ? GestureDetector(
                      onTap: () {
                        if(rowIndex > 0){
                          ref.read(danhSachDomainProvider.notifier).removeDomain(rowIndex);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'Xoá',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ))
                      : null),
              TextFormField(
                controller: _nameController,
                autofocus: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  ref.read(danhSachDomainProvider.notifier).updateDomain(rowIndex: rowIndex, newItem: widget.domainModel.copyWith(domainName: value));
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'Không bỏ trống.'),
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
                controller: TextEditingController(
                    text: selNgayDangKy!.formatDateTime('dd-MM-yyyy')),
                onTap: () async {
                  final selDate = await Helper.onSelectDate(context,
                      initialDate: selNgayDangKy);
                  if (selDate != null) {
                    ref.read(danhSachDomainProvider.notifier).updateDomain(rowIndex: rowIndex, newItem: widget.domainModel.copyWith(ngayDangKy: selDate, ngayHetHan: DateTime(
                        selDate.year + 1, selDate.month, selDate.day)));
                    setState(() {
                      selNgayDangKy = selDate;
                      selNgayHetHan = DateTime(
                          selNgayDangKy!.year + 1, selNgayDangKy!.month, selNgayDangKy!.day);
                    });
                  }
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
                controller: TextEditingController(
                    text: selNgayHetHan!.formatDateTime('dd-MM-yyyy')),
                onTap: () async {
                  final selDate = await Helper.onSelectDate(context,
                      initialDate: selNgayHetHan,
                      firstDate:
                      selNgayDangKy!.copyWith(year: selNgayDangKy!.year + 1));
                  if (selDate != null) {
                    ref.read(danhSachDomainProvider.notifier).updateDomain(rowIndex: rowIndex, newItem: widget.domainModel.copyWith(ngayHetHan: selDate));
                    setState(() {
                      selNgayHetHan = selDate;
                    });
                  }
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'Không bỏ trống.'),
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
                controller: _ghiChuController,
                onChanged: (value) {
                  ref
                      .read(danhSachDomainProvider.notifier)
                      .updateDomain(rowIndex: rowIndex, newItem: widget.domainModel.copyWith(ghiChu: value));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
