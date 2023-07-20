part of '../khach_hang_moi_layout.dart';


class TenHopDongWidget extends ConsumerWidget with FormUIMixins{
  const TenHopDongWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Tên hợp đồng'),
          TextFormField(),
        ],
      ),
    );
  }
}
