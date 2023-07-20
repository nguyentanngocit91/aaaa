part of '../khach_hang_moi_layout.dart';


class NguoiDaiDienMoiWidget extends ConsumerWidget with FormUIMixins{
  const NguoiDaiDienMoiWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Người đại diện mới'),
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
