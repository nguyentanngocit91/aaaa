part of '../khach_hang_moi_layout.dart';


class MaKhachHangWidget extends ConsumerWidget with FormUIMixins{
  const MaKhachHangWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Mã khách hàng'),
          TextFormField(
            enabled: true,
            onChanged: (value) {},
            validator: (value) {
              if (value == '') return 'Không bỏ trống  ';
            },
          ),
        ],
      ),
    );
  }
}
