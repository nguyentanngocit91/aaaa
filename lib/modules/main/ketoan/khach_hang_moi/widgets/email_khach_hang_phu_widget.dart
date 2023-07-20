part of '../khach_hang_moi_layout.dart';


class EmailKhachHangPhuWidget extends ConsumerWidget with FormUIMixins{
  const EmailKhachHangPhuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      flex: 1,
      child: Wrap(
        children: [
          lableTextForm('Email khách hàng (email phụ)'),
          TextFormField(
            enabled: true,
            onChanged: (value) {},
            validator: (value) {
              if (value == '') return 'Không bỏ trống  ';
              return null;
            },
          ),
        ],
      ),
    );
  }
}
