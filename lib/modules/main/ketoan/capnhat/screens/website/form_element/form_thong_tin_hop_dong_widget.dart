part of '../upgrade.dart';

class FormThongTinHopDongWidget extends ConsumerStatefulWidget {
  const FormThongTinHopDongWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinHopDongWidgetState();
}

class _FormThongTinHopDongWidgetState
    extends ConsumerState<FormThongTinHopDongWidget> with FormUIMixins {

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formKhachHangMoiProvider);


    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
          lg: 2,
          xs: 12,
          child: Container(
            padding: Helper.padding(),
            child: Column(
              children: [
                lableTextForm('Số hợp đồng'),
                TextFormField(
                  decoration: Helper().disabledInput(),
                  readOnly: true,
                  controller: TextEditingController(
                      text: '${ref.read(formKhachHangMoiProvider.notifier).getData(type: _typeData, key: 'sohopdong')}'),
                ),
              ],
            ),
          ),
        ),
        ResponsiveGridCol(
          lg: 6,
          xs: 12,
          child: Container(
            padding: Helper.padding(),
            child: Column(
              children: [
                lableTextForm('Tên hợp đồng (Nâng cấp/Phụ lục)'),
                TextFormField(
                  decoration: Helper().disabledInput(),
                  readOnly: true,
                  controller: TextEditingController(
                    text: '${ref.read(formKhachHangMoiProvider.notifier).getData(type: _typeData, key: 'tenhopdong')} '
                  ),
                ),
              ],
            ),
          ),
        ),
        ResponsiveGridCol(
          lg: 2,
          xs: 12,
          child: Container(
            padding: Helper.padding(),
            child: Column(
              children: [
                lableTextForm('Tổng giá trị'),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    CurrencyTextInputFormatter(symbol: ''),
                  ],
                  onChanged: (value) {
                    ref.read(formKhachHangMoiProvider.notifier).changeData(
                        type: _typeData, key: 'tongtien', value: value);
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
          lg: 2,
          xs: 12,
          child: Container(
            padding: Helper.padding(),
            child: Column(
              children: [
                lableTextForm('Tổng nợ'),
                TextFormField(
                  inputFormatters: [
                    CurrencyTextInputFormatter(symbol: ''),
                  ],

                  onChanged: (value) {
                    // ref.read(formKhachHangMoiProvider.notifier).changeData(
                    //     type: _typeData, key: 'tongtien', value: value);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
