part of '../../screen/them_phieuthu_screen.dart';

class FormThongTinHopDongWidget extends ConsumerStatefulWidget {

  const FormThongTinHopDongWidget({Key? key, required this.item}) : super(key: key);

  final SearchCustomerContractModel? item;

  @override
  ConsumerState createState() => _FormThongTinHopDongWidgetState();
}

class _FormThongTinHopDongWidgetState
    extends ConsumerState<FormThongTinHopDongWidget> with FormUIMixins {

  @override
  Widget build(BuildContext context) {

    return Column(
      //runSpacing: 25,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  lableTextForm('Mã hợp đồng'),
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                    ),
                    readOnly: true,
                    controller: TextEditingController(text: widget.item?.mahopdong.toString()),
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  lableTextForm('Tên hợp đồng'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                    ),
                    readOnly: true,
                    controller: TextEditingController(text: widget.item?.tenhopdong.toString()),
                  ),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  lableTextForm('Tổng giá trị'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormatters: [
                      CurrencyTextInputFormatter(symbol: ''),
                    ],

                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                    ),
                    readOnly: true,
                    controller: TextEditingController(text: Helper.numberFormat(double.parse(widget.item!.tongtien.toString()))),


                  ),
                ],
              ),
            ),

          ],
        )
      ],
    );
  }
}

