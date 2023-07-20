part of '../khach_hang_moi_layout.dart';


class DienThoaiCoQuanWidget extends ConsumerWidget with FormUIMixins{
  const DienThoaiCoQuanWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Điện thoại cơ quan'),
          TextFormField(),
        ],
      ),
    );
  }
}
