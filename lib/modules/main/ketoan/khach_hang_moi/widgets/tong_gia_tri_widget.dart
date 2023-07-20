part of '../khach_hang_moi_layout.dart';


class TongGiaTriWidget extends ConsumerWidget with FormUIMixins{
  const TongGiaTriWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Tổng giá trị'),
          TextFormField(),
        ],
      ),
    );
  }
}
