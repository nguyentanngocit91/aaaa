part of '../khach_hang_moi_layout.dart';


class DienThoaiDiDongWidget extends ConsumerWidget with FormUIMixins{
  const DienThoaiDiDongWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Điện thoại di động'),
          TextFormField(),
        ],
      ),
    );
  }
}
