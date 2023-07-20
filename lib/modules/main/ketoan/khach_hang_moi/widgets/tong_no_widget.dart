part of '../khach_hang_moi_layout.dart';


class TongNoWidget extends ConsumerWidget with FormUIMixins{
  const TongNoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Tổng nợ'),
          TextFormField(),
        ],
      ),
    );
  }
}
