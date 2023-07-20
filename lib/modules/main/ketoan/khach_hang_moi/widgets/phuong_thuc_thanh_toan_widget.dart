part of '../khach_hang_moi_layout.dart';

enum HinhThucThanhToan { cod, bank }

class PhuongThucThanhToanWidget extends ConsumerStatefulWidget {
  const PhuongThucThanhToanWidget({super.key});

  @override
  ConsumerState createState() => _PhuongThucThanhToanWidgetState();
}

class _PhuongThucThanhToanWidgetState extends ConsumerState<PhuongThucThanhToanWidget> with FormUIMixins{
  HinhThucThanhToan _httt = HinhThucThanhToan.cod;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Phương thức thanh toán:', style: TextStyle(fontWeight: FontWeight.bold),),
        ndGapW8(),
        Radio<HinhThucThanhToan>(
          value: HinhThucThanhToan.cod,
          groupValue: _httt,
          onChanged: (HinhThucThanhToan? value) {
            setState(() {
              _httt = value!;
            });
          },
        ),
        const Text('Tiền mặt'),
        ndGapW16(),
        Radio<HinhThucThanhToan>(
          value: HinhThucThanhToan.bank,
          groupValue: _httt,
          onChanged: (HinhThucThanhToan? value) {
            setState(() {
              _httt = value!;
            });
          },
        ),
        const Text('Chuyển khoản'),
      ],
    );
  }
}