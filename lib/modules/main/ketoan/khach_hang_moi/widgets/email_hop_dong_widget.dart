part of '../khach_hang_moi_layout.dart';


class EmailHopDongWidget extends ConsumerWidget with FormUIMixins{
  const EmailHopDongWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Email hợp đồng'),
          TextFormField(),
        ],
      ),
    );
  }
}
