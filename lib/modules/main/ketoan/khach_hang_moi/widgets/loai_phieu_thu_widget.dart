part of '../khach_hang_moi_layout.dart';

enum LoaiPhieuThu { phieuthu, phieuthuBG, phieuthuApp, phieuthuBGApp }

class LoaiPhieuThuWidget extends ConsumerStatefulWidget {
  const LoaiPhieuThuWidget({super.key});

  @override
  ConsumerState createState() => _LoaiPhieuThuWidgetState();
}

class _LoaiPhieuThuWidgetState extends ConsumerState<LoaiPhieuThuWidget> with FormUIMixins{
  LoaiPhieuThu _loaiPhieuThu = LoaiPhieuThu.phieuthu;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Loại Phiếu thu:', style: TextStyle(fontWeight: FontWeight.bold),),
        ndGapW8(),
        Radio<LoaiPhieuThu>(
          value: LoaiPhieuThu.phieuthu,
          groupValue: _loaiPhieuThu,
          onChanged: (LoaiPhieuThu? value) {
            setState(() {
              _loaiPhieuThu = value!;
            });
          },
        ),
        const Text('Phiếu thu'),
        ndGapW16(),
        Radio<LoaiPhieuThu>(
          value: LoaiPhieuThu.phieuthuBG,
          groupValue: _loaiPhieuThu,
          onChanged: (LoaiPhieuThu? value) {
            setState(() {
              _loaiPhieuThu = value!;
            });
          },
        ),
        const Text('Phiếu thu bàn giao'),
        ndGapW16(),
        Radio<LoaiPhieuThu>(
          value: LoaiPhieuThu.phieuthuApp,
          groupValue: _loaiPhieuThu,
          onChanged: (LoaiPhieuThu? value) {
            setState(() {
              _loaiPhieuThu = value!;
            });
          },
        ),
        const Text('Phiếu thu App'),
        ndGapW16(),
        Radio<LoaiPhieuThu>(
          value: LoaiPhieuThu.phieuthuBGApp,
          groupValue: _loaiPhieuThu,
          onChanged: (LoaiPhieuThu? value) {
            setState(() {
              _loaiPhieuThu = value!;
            });
          },
        ),
        const Text('Phiếu thu bàn giao App'),
      ],
    );
  }
}