import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../phieuthu/widgets/pt_button.dart';
import '../providers/ban_giao_provider.dart';

class BoxSearchBanGiao extends ConsumerWidget {
   BoxSearchBanGiao({
    super.key,
  });

  final TextEditingController soHDController = TextEditingController();
   final TextEditingController tenHDController = TextEditingController();
   final TextEditingController dienThoaiController = TextEditingController();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController domainHDController = TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var soHD = ref.watch(banGiaoProvider).maHD;
    if(soHD!= null ) soHDController.text  = soHD;

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
            width: 200,
            child: TextField(
              controller: soHDController,
              decoration: const InputDecoration(
                hintText: 'Mã HĐ',
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tên HĐ',
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const SizedBox(
            width: 180,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Điện thoại',
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const SizedBox(
            width: 180,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const SizedBox(
            width: 180,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Domain',
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          PtButton(
            title: 'Tìm kiếm',
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              soHD = soHDController.text;
              if(soHD=='') {
                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Thông báo'),
                  content: const Text('Vui lòng nhập nội dung cần tìm kiếm!'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('Đóng'),
                    ),
                  ],
                ),
              );
              }else{
                ref.read(banGiaoProvider.notifier).setInputMaHD(maHD: soHD);
                ref.read(banGiaoProvider.notifier).actionInputSearch();
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
