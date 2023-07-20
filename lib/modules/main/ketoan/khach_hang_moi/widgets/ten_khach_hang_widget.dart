part of '../khach_hang_moi_layout.dart';


class TenKhachHangWidget extends ConsumerWidget with FormUIMixins{
  const TenKhachHangWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Tên khách hàng'),
          TextFormField(),
        ],
      ),
    );
  }
}
