part of '../khach_hang_moi_layout.dart';

class FormThongTinHopDongWidget extends ConsumerStatefulWidget {
  const FormThongTinHopDongWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinHopDongWidgetState();
}

class _FormThongTinHopDongWidgetState
    extends ConsumerState<FormThongTinHopDongWidget> with FormUIMixins {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 25,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Mã hợp đồng Web/App'),
                  TextFormField(),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Tên hợp đồng'),
                  TextFormField(),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Email hợp đồng'),
                  TextFormField(),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Tổng giá trị'),
                  TextFormField(),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Tổng giá trị thu'),
                  TextFormField(),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              child: Wrap(
                children: [
                  lableTextForm('Tổng nợ'),
                  TextFormField(),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
