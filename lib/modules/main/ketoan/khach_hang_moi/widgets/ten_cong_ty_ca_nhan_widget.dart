part of '../khach_hang_moi_layout.dart';


class TenCongTyCaNhanWidget extends ConsumerWidget with FormUIMixins{
  const TenCongTyCaNhanWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      flex: 3,
      child: Wrap(
        children: [
          lableTextForm('Tên Công ty /  Cá Nhân'),
          TextFormField(),
        ],
      ),
    );
  }
}
