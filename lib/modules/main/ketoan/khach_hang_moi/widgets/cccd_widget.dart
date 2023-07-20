part of '../khach_hang_moi_layout.dart';


class CccdWidget extends ConsumerWidget with FormUIMixins{
  const CccdWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('CCCD / CMND'),
          TextFormField(),
        ],
      ),
    );
  }
}
