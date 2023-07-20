part of '../khach_hang_moi_layout.dart';


class EmailKhachHangWidget extends ConsumerWidget with FormUIMixins{
  const EmailKhachHangWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Email khách hàng'),
          TextFormField(),
        ],
      ),
    );
  }
}
