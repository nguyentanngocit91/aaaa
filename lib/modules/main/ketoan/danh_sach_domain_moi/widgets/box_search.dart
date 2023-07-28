import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../_shared/utils/show_ok_alert_dialog.dart';
import '../../phieuthu/widgets/pt_button.dart';


class BoxSearchDomain extends ConsumerWidget {
  BoxSearchDomain({
    super.key,
  });

  final TextEditingController domainInput = TextEditingController();


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // var soPhieuThu = ref.watch(phieuThuProvider).soPhieuThu;
    // if (soPhieuThu != null) soPhieuThuInput.text = soPhieuThu;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFf5f5f5),
        border: Border.all(color: const Color(0xFFdcdbdb)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            child: TextField(
              controller: domainInput,
              decoration: const InputDecoration(
                hintText: 'Domain',
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),



          PtButton(
            title: 'Tìm kiếm',
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              bool isError = false;
              String domain = domainInput.text;

              if (domain == '') {
                isError = true;
                ShowOkAlertDialog.show(
                    context, 'Thông báo', 'Vui lòng nhập thông tin cần tìm');
              }

              if (isError == false) {

                // ref
                //     .read(phieuThuProvider.notifier)
                //     .setInputDenNgay(denNgay: denNgay);
                // ref.read(phieuThuProvider.notifier).actionInputSearch();
              }
            },
          ),
          const SizedBox(
            width: 5,
          ),
          PtButton(
            title: 'Reset',
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              domainInput.text = '';

              //ref.read(phieuThuProvider.notifier).resetInputSearch();
            },
          ),
        ],
      ),
    );
  }
}
