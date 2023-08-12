part of '../sua_phieu_thu_layout.dart';

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
    final formState = ref.watch(formPhieuThuProvider);
    String soHopDong = formState.soHopDong.toString();

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
                    initialValue: formState.dataHopDong!['tenhopdong'],
                    onChanged: (value) {
                      ref
                          .read(formPhieuThuProvider.notifier)
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
            ndGapW16(),

          ],
        )
      ],
    );
  }
}
