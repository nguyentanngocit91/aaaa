part of '../khach_hang_moi_layout.dart';


class MaSoThueWidget extends ConsumerWidget with FormUIMixins{
  const MaSoThueWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Wrap(
        children: [
          lableTextForm('Mã số thuế'),
          TextFormField(),
        ],
      ),
    );
  }
}
