part of '../upgrade.dart';

class FormThongTinWebsiteWidget extends ConsumerStatefulWidget {
  const FormThongTinWebsiteWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinWebsiteWidgetState();
}

class _FormThongTinWebsiteWidgetState
    extends ConsumerState<FormThongTinWebsiteWidget> with FormUIMixins {

  DateTime ngayDangKy = DateTime.now();
  DateTime? ngayBanGiao = null;

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formKhachHangMoiProvider);

    return Column(children: [
      ndGapH40(),
      titleForm(context, title: 'Thông tin Website'),
      bodyForm(
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xl: 6,
              lg: 12,

              child: Container(
                padding: Helper.padding(),
                child: Column(
                  children: [
                    lableTextForm('Mã hợp đồng'),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                      ),
                      readOnly: true,
                      controller: TextEditingController(
                          text: '${ref.read(formKhachHangMoiProvider.notifier).getData(type: _typeData, key: 'mahopdong')}'),
                    ),
                  ],
                ),
              ),
            ),

            ResponsiveGridCol(
              xl: 3,
              lg: 6,
              xs: 6,
              child: Container(
                padding: Helper.padding(),
                child: Column(
                  children: [
                    lableTextForm('Ngày ký web'),
                    TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                          text: ngayDangKy.formatDateTime(
                              formatString: 'dd-MM-yyyy')),
                      onTap: () async {
                        final DateTime? selDate = await Helper.onSelectDate(
                            context,
                            initialDate: ngayDangKy);
                        String txtDate = DateTime.now()
                            .formatDateTime(formatString: 'dd-MM-yyyy');
                        if (selDate != null) {
                          txtDate = selDate.formatDateTime(
                              formatString: 'dd-MM-yyyy');
                        }
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
                            type: _typeData, key: 'ngayky', value: txtDate);
                        setState(() {
                          ngayDangKy = selDate ?? ngayDangKy;
                        });
                        if(ngayBanGiao.toString()!=''){

                        DateTime date1 = Helper.parseDate(
                            ngayDangKy.toString(),
                            'dd-MM-yyyy');
                        DateTime date2 = Helper.parseDate(
                            ngayBanGiao.toString(),
                            'dd-MM-yyyy');
                        if (date1.compareTo(date2) > 0) {
                          setState(() {
                            ngayBanGiao = ngayDangKy;
                          });
                        }

                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            ResponsiveGridCol(
              xl: 3,
              lg: 6,
              xs: 6,
              child: Container(
                padding: Helper.padding(),
                child: Column(
                  children: [
                    lableTextForm('Ngày bàn giao'),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'dd-mm-yyyy'),
                      readOnly: true,
                      controller: TextEditingController(
                          text: (ngayBanGiao != null)
                              ? ngayBanGiao!
                                  .formatDateTime(formatString: 'dd-MM-yyyy')
                              : null),
                      onTap: () async {
                        final DateTime? selDate = await Helper.onSelectDate(
                            context,
                            initialDate: ngayBanGiao);
                        String txtDate = '';
                        if (selDate != null) {
                          txtDate = selDate.formatDateTime(
                              formatString: 'dd-MM-yyyy');
                        }
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
                            type: _typeData,
                            key: 'ngaybangiao',
                            value: txtDate);
                        setState(() {
                          ngayBanGiao = selDate ?? ngayBanGiao;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            ResponsiveGridCol(
              xl: 6,
              xs: 12,
              child: Container(
                padding: Helper.padding(),
                child: Column(
                  children: [
                    lableTextForm('Chức năng'),
                    TextFormField(
                      minLines: 3,
                      maxLines: 3,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
                            type: _typeData, key: 'chucnang', value: value);
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

            ResponsiveGridCol(
              xl: 6,
              xs: 12,
              child: Container(
                padding: Helper.padding(),
                child: Column(
                  children: [
                    lableTextForm('Ghi chú'),
                    TextFormField(
                      minLines: 3,
                      maxLines: 3,
                      onChanged: (value) {
                        ref.read(formKhachHangMoiProvider.notifier).changeData(
                            type: _typeData, key: 'mota', value: value);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
