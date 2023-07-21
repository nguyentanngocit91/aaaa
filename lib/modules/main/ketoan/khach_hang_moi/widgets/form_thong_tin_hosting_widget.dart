part of '../khach_hang_moi_layout.dart';

class FormThongTinHostingWidget extends ConsumerStatefulWidget {
  const FormThongTinHostingWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinHostingWidgetState();
}

class _FormThongTinHostingWidgetState
    extends ConsumerState<FormThongTinHostingWidget> with FormUIMixins {
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formKhachHangMoiProvider);
    return Visibility(
      visible: formState.isHopDongHosting,
      child: Column(
        children: [
          ndGapH40(),
          titleForm(context, title: 'Thông tin Hosting'),
          bodyForm(
            child: Wrap(
              runSpacing: 25,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Wrap(
                        children: [
                          lableTextForm('Mã hợp đồng'),
                          TextFormField(),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      child: Wrap(
                        children: [
                          lableTextForm('Dung lượng Hosting'),
                          TextFormField(),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      child: Wrap(
                        children: [
                          lableTextForm('Ngày đăng ký'),
                          TextFormField(),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      child: Wrap(
                        children: [
                          lableTextForm('Ngày hết hạn'),
                          TextFormField(),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        children: [
                          lableTextForm('Trạng thái'),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio<TrangThaiHosting>(
                                value: TrangThaiHosting.kyMoi,
                                groupValue: _trangThaiHosting,
                                onChanged: (TrangThaiHosting? value) {
                                  setState(() {
                                    _trangThaiHosting = value!;
                                  });
                                },
                              ),
                              const Text('Ký mới'),
                              ndGapW16(),
                              Radio<TrangThaiHosting>(
                                value: TrangThaiHosting.phucHoi,
                                groupValue: _trangThaiHosting,
                                onChanged: (TrangThaiHosting? value) {
                                  setState(() {
                                    _trangThaiHosting = value!;
                                  });
                                },
                              ),
                              const Text('Phục hồi'),
                              ndGapW16(),
                              Radio<TrangThaiHosting>(
                                value: TrangThaiHosting.nangCap,
                                groupValue: _trangThaiHosting,
                                onChanged: (TrangThaiHosting? value) {
                                  setState(() {
                                    _trangThaiHosting = value!;
                                  });
                                },
                              ),
                              const Text('Nâng cấp'),
                              ndGapW16(),
                              Radio<TrangThaiHosting>(
                                value: TrangThaiHosting.chuyenDoi,
                                groupValue: _trangThaiHosting,
                                onChanged: (TrangThaiHosting? value) {
                                  setState(() {
                                    _trangThaiHosting = value!;
                                  });
                                },
                              ),
                              const Text('Chuyển đổi'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      child: Wrap(
                        children: [
                          lableTextForm('Ghi chú'),
                          TextFormField(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
