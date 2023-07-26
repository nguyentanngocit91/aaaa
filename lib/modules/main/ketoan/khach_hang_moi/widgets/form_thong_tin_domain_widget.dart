part of '../khach_hang_moi_layout.dart';

class FormThongTinDomainWidget extends ConsumerStatefulWidget {
  const FormThongTinDomainWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinDomainWidgetState();
}

class _FormThongTinDomainWidgetState
    extends ConsumerState<FormThongTinDomainWidget> with FormUIMixins {
  final RowDomainWidget itemDomain =
      const RowDomainWidget(defaultRow: true, rowIndex: 0);

  int _index = 1;

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100),(){
      ref.read(danhSachDomainProvider.notifier).addRowDomain(itemDomain);
    });
  }


  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formKhachHangMoiProvider);

    List<RowDomainWidget> listDomain = ref.watch(danhSachDomainProvider);

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
                                  RowDomainWidget newItem = RowDomainWidget(defaultRow: false, rowIndex: _index);
                                  _index++;
                                  ref.read(danhSachDomainProvider.notifier).addRowDomain(newItem);
                                },
                                label: const Text('Thêm Domain')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                for (RowDomainWidget item in listDomain) ...[
                  item,
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
  const RowDomainWidget({super.key, required this.defaultRow,required this.rowIndex});

  final bool defaultRow;
  final int rowIndex;

  @override
  ConsumerState createState() => _RowDomainWidgetState();
}

class _RowDomainWidgetState extends ConsumerState<RowDomainWidget>
    with FormUIMixins {
  final String _typeData = 'domain';
  DateTime ngayDangKy = DateTime.now();
  DateTime? ngayHetHan;

  @override
  initState() {
    super.initState();
    ngayHetHan = ngayDangKy.copyWith(year: ngayDangKy.year + 1);
  }

  @override
  Widget build(BuildContext context) {
    print('index(${widget.rowIndex.toString()}) ${ngayDangKy.formatDateTime('dd-MM-yyyy')}');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 250,
          child: Wrap(
            children: [
              lableTextForm('Domain name',
                  child: (widget.defaultRow == false)
                      ? GestureDetector(
                          onTap: () {
                            // ref.read(danhSachDomainProvider.notifier).removeDomain(widget.index ?? 0);
                            if(widget.rowIndex>0){
                              print(widget.rowIndex);
                              ref.read(danhSachDomainProvider).remove(widget.rowIndex);
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  ref.read(formKhachHangMoiProvider.notifier).changeData(
                      type: _typeData, key: 'tenmien', value: value);
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
                    text: ngayDangKy.formatDateTime('dd-MM-yyyy')),
                onTap: () async {
                  final DateTime? selDate = await Helper.onSelectDate(context,
                      initialDate: ngayDangKy);
                  String txtDate = DateTime.now().formatDateTime('dd-MM-yyyy');
                  if (selDate != null) {
                    txtDate = selDate.formatDateTime('dd-MM-yyyy');
                  }
                  ref.read(formKhachHangMoiProvider.notifier).changeData(
                      type: _typeData, key: 'ngaydangky', value: txtDate);

                  setState(() {
                    ngayDangKy = selDate ?? ngayDangKy;
                    ngayHetHan = DateTime(
                        ngayDangKy.year + 1, ngayDangKy.month, ngayDangKy.day);
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
                controller: TextEditingController(
                    text: (ngayHetHan != null)
                        ? ngayHetHan!.formatDateTime('dd-MM-yyyy')
                        : ''),
                onTap: () async {
                  final DateTime? selDate = await Helper.onSelectDate(context,
                      initialDate: ngayHetHan,
                      firstDate:
                          ngayDangKy.copyWith(year: ngayDangKy.year + 1));
                  String txtDate = DateTime.now().formatDateTime('dd-MM-yyyy');
                  if (selDate != null) {
                    txtDate = selDate.formatDateTime('dd-MM-yyyy');
                  }
                  ref.read(formKhachHangMoiProvider.notifier).changeData(
                      type: _typeData, key: 'ngayhethan', value: txtDate);
                  setState(() {
                    ngayHetHan = selDate ?? ngayHetHan;
                  });
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
                controller: TextEditingController(text: widget.rowIndex.toString()),
                onChanged: (value) {
                  ref
                      .read(formKhachHangMoiProvider.notifier)
                      .changeData(type: _typeData, key: 'ghichu', value: value);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
