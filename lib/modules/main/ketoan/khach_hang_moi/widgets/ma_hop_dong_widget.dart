part of '../khach_hang_moi_layout.dart';


class MaHopDongWidget extends ConsumerWidget with FormUIMixins{
  const MaHopDongWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Mã hợp đồng Web/App'),
          TextFormField(),
        ],
      ),
    );
  }
}
