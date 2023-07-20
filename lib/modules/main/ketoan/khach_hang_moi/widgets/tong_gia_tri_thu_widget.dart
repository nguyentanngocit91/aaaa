part of '../khach_hang_moi_layout.dart';


class TongGiaTriThuWidget extends ConsumerWidget with FormUIMixins{
  const TongGiaTriThuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Tổng giá trị thu'),
          TextFormField(),
        ],
      ),
    );
  }
}
