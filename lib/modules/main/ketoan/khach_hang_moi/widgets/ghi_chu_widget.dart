part of '../khach_hang_moi_layout.dart';


class GhiChuWidget extends ConsumerWidget with FormUIMixins{
  const GhiChuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Ghi chú'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
