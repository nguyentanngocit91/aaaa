part of '../upgrade.dart';

class FormThongTinHostingWidget extends ConsumerStatefulWidget {
  const FormThongTinHostingWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinHostingWidgetState();
}

class _FormThongTinHostingWidgetState
    extends ConsumerState<FormThongTinHostingWidget> with FormUIMixins {

  DateTime ngayDangKy = DateTime.now();
  DateTime? ngayBanGiao = null;


  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formKhachHangMoiProvider);
    return Column(children: [
      ndGapH40(),
      titleForm(context, title: 'Thông tin Hosting'),
      bodyForm(
        child: ResponsiveGridRow(
          rowSegments: 10,
          children: [
            ResponsiveGridCol(
              xl: 2,
              lg: 5,

              child: Container(
                padding: Helper.padding(),
                child: Column(
                  children: [
                    lableTextForm('Mã hợp đồng'),
                    TextFormField(
    decoration: Helper().disabledInput(),
                      readOnly: true,
                      controller: TextEditingController(
                          text: '${ref.read(formKhachHangMoiProvider.notifier).getData(type: _typeData, key: 'mahopdong')}'),
                    ),
                  ],
                ),
              ),
            ),


            ResponsiveGridCol(
              xl: 2,
              lg: 5,

              child: Container(
                padding: Helper.padding(),
                child: Column(
                  children: [
                    lableTextForm('Dung lượng hosting cũ'),
                    TextFormField(
            decoration: Helper().disabledInput(),
                      readOnly: true,
                      controller: TextEditingController(
                          text: '${ref.read(formKhachHangMoiProvider.notifier).getData(type: _typeData, key: 'dungluongcu')}'),
                    ),
                  ],
                ),
              ),
            ),


            ResponsiveGridCol(
              xl: 2,
              lg: 5,

              child: Container(
                padding: Helper.padding(),
                child: Column(
                  children: [
                    lableTextForm('Dung lượng hosting mới'),
                    TextFormField(
                      textAlign: TextAlign.left,


                      controller: TextEditingController(
                        text: '${ref.read(formKhachHangMoiProvider.notifier).getData(type: _typeData, key: 'dungluong')}'
                      ),
                      onChanged: (value) {


                        ref.read(formKhachHangMoiProvider.notifier).changeData(
                            type: _typeData, key: 'dungluong', value: value);
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
              xl: 2,

              xs: 5,
              child: Container(
                padding: Helper.padding(),
                child: Column(
                  children: [
                    lableTextForm('Ngày đăng ký'),
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
                            type: _typeData, key: 'ngaydangky', value: txtDate);
                        setState(() {
                          ngayDangKy = selDate ?? ngayDangKy;
                        });

                      },
                    ),
                  ],
                ),
              ),
            ),
            ResponsiveGridCol(
              xl: 2,

              xs: 5,
              child: Container(
                padding: Helper.padding(),
                child: Column(
                  children: [
                    lableTextForm('Ngày hết hạn'),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'dd-mm-yyyy'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Không bỏ trống.'),
                      ]),
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
                            key: 'ngayhethan',
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
              xl: 10,

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
                            type: _typeData, key: 'ghichu', value: value);
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
