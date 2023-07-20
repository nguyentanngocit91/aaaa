part of '../khach_hang_moi_layout.dart';


class DiaChiWidget extends ConsumerWidget with FormUIMixins{
  const DiaChiWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Địa chỉ'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
