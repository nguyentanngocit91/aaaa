part of '../khach_hang_moi_layout.dart';

class FormThongTinDomainWidget extends ConsumerStatefulWidget {
  const FormThongTinDomainWidget({super.key});

  @override
  ConsumerState createState() => _FormThongTinDomainWidgetState();
}

class _FormThongTinDomainWidgetState
    extends ConsumerState<FormThongTinDomainWidget> with FormUIMixins {
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formKhachHangMoiProvider);
    return Visibility(
      visible: formState.isHopDongDomain,
      child: Column(
        children: [
          ndGapH40(),
          titleForm(context, title: 'Thông tin Domain'),
          bodyForm(
            child: Wrap(
              runSpacing: 25,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Wrap(
                        children: [
                          lableTextForm('Mã hợp đồng'),
                          TextFormField(),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      flex: 3,
                      child: Wrap(
                        children: [
                          lableTextForm('Ghi chú'),
                          TextFormField(),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      flex: 1,
                      child: Wrap(
                        children: [
                          lableTextForm(' '),
                          FilledButton.icon(
                              icon: const FaIcon(
                                FontAwesomeIcons.plus,
                                size: 15,
                              ),
                              onPressed: () {},
                              label: const Text('Thêm Dmain')),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Wrap(
                        children: [
                          lableTextForm('Domain name'),
                          TextFormField(),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      flex: 2,
                      child: Wrap(
                        children: [
                          lableTextForm('Ngày đăng ký'),
                          TextFormField(),
                        ],
                      ),
                    ),
                    ndGapW16(),
                    Expanded(
                      flex: 2,
                      child: Wrap(
                        children: [
                          lableTextForm('Ngày hết hạn'),
                          TextFormField(),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        children: [
                          lableTextForm('Ghi chú'),
                          TextFormField(
                            minLines: 3,
                            maxLines: 3,
                          ),
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
