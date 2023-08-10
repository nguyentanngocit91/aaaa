part of '../khach_hang_moi_layout.dart';

class FormThongTinHopDongWidget extends ConsumerStatefulWidget {
  const FormThongTinHopDongWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinHopDongWidgetState();
}

class _FormThongTinHopDongWidgetState
    extends ConsumerState<FormThongTinHopDongWidget> with FormUIMixins {
  
  final String _typeData = 'hopdong';
  
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formKhachHangMoiProvider);
    String soHopDong = formState.soHopDong.toString();
    if(formState.isHopDongApp){
      soHopDong = '${soHopDong}A';
    }
    return Wrap(
      runSpacing: 25,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Wrap(
                children: [
                  lableTextForm('Số hợp đồng Web/App'),
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                    ),
                    readOnly: true,
                    controller: TextEditingController(text: soHopDong),
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              flex: 4,
              child: Wrap(
                children: [
                  lableTextForm('Tên hợp đồng'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      ref
                          .read(formKhachHangMoiProvider.notifier)
                          .changeData(type: _typeData ,key: 'tenhopdong', value: value);
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Không bỏ trống.'),
                    ]),
                  ),
                ],
              ),
            ),
            // ndGapW16(),
            // Expanded(
            //   flex: 1,
            //   child: Wrap(
            //     children: [
            //       lableTextForm('Tổng giá trị'),
            //       TextFormField(
            //         autovalidateMode: AutovalidateMode.onUserInteraction,
            //         inputFormatters: [
            //           CurrencyTextInputFormatter(symbol: ''),
            //         ],
            //         onChanged: (value) {
            //           ref
            //               .read(formKhachHangMoiProvider.notifier)
            //               .changeData(type: _typeData ,key: 'tongtien', value: value.toString().replaceAll('.', ''));
            //         },
            //         validator: FormBuilderValidators.compose([
            //           FormBuilderValidators.required(
            //               errorText: 'Không bỏ trống.'),
            //         ]),
            //       ),
            //     ],
            //   ),
            // ),
            // ndGapW16(),
            // Expanded(
            //   flex: 1,
            //   child: Wrap(
            //     children: [
            //       lableTextForm('Tổng giá trị thu'),
            //       TextFormField(
            //         inputFormatters: [
            //           CurrencyTextInputFormatter(symbol: ''),
            //         ],
            //         onChanged: (value) {
            //           ref
            //               .read(formKhachHangMoiProvider.notifier)
            //               .changeData(type: _typeData ,key: 'tongtien', value: value);
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            // ndGapW16(),
            // Expanded(
            //   flex: 1,
            //   child: Wrap(
            //     children: [
            //       lableTextForm('Tổng nợ'),
            //       TextFormField(
            //         inputFormatters: [
            //           CurrencyTextInputFormatter(symbol: ''),
            //         ],
            //         onChanged: (value) {
            //           ref
            //               .read(formKhachHangMoiProvider.notifier)
            //               .changeData(type: _typeData ,key: 'tongtien', value: value);
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        )
      ],
    );
  }
}
