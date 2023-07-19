import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'dashboard/dashboard_layout.dart';
import 'ketoan/blacklist/screens/danh_sach_blacklist_layout.dart';
import 'ketoan/cap_ma_hd_layout.dart';
import 'upgrade_website/list.dart';

class MenuLayout extends ConsumerWidget {
  const MenuLayout({super.key});

  final Color _textColor = Colors.grey;
  final Color _iconColor = Colors.grey;
  final FaIcon _faIcon = const FaIcon(FontAwesomeIcons.fileContract);
  static const double _fontSize = 14;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).shadowColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 40),
                child: Image.asset(
                  'assets/images/logo_nina.png',
                  height: 80,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [


                itemMenu(
                  icon: const Icon(Icons.dashboard),
                  title: 'Dashboard',
                  onTap: () {
                    context.go('/${DashboardLayout.pathName}');
                  },
                ),
                itemMenu(
                  title: 'Cấp mã HĐ trước',
                  onTap: () {
                    context.go('/${CapMaHDLayout.pathName}');
                  },
                ),
                itemMenu(
                  title: 'Danh sách mã đã cấp',
                  onTap: () {
                  },
                ),
                itemMenu(
                  title: 'Khách hàng mới',
                  onTap: () {
                  },
                ),
                itemMenu(
                  title: 'Danh sách hợp đồng',
                  onTap: () {
                  },
                ),
                itemMenu(
                  title: 'Nâng cấp Website',
                  onTap: () {

                    context.go('/${UpgradeWebListLayout.pathName}');
                  },
                ),
                itemMenu(
                  title: 'Nâng cấp App',
                  onTap: () {
                  },
                ),
                itemMenu(
                  title: 'Nâng cấp Hosting',
                  onTap: () {
                  },
                ),
                itemMenu(
                  title: 'Cập nhật Domain',
                  onTap: () {
                  },
                ),
                itemMenu(
                  title: 'DS mới cập nhật & Pendding',
                  onTap: () {
                  },
                ),
                itemMenu(
                  title: 'Phiếu thu',
                  onTap: () {
                  },
                ),
                itemMenu(
                  title: 'Nhân viên kế toán',
                  onTap: () {
                  },
                ),
                itemMenu(
                  title: 'Sửa đổi thông tin',
                  onTap: () {
                  },
                ),
                itemMenu(
                  title: 'Blacklist',
                  onTap: () {
                    context.go('/${DanhSachBlacklistLayout.pathName}');
                  },
                ),
                itemMenu(
                  title: 'Tìm kiếm thông tin 2015-2019',
                  onTap: () {
                  },
                ),
                itemMenu(
                  title: 'Import data NVKD',
                  onTap: () {
                  },
                ),
                itemMenu(
                  title: 'Bàn giao',
                  onTap: () {
                  },
                ),
                itemMenu(
                  title: 'Thống kê in bàn giao',
                  onTap: () {
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget itemMenu(
      {String? title,
      Widget? icon,
      Color? textColor,
      Color? iconColor,
      required Function() onTap}) {
    return ListTile(
      leading: icon ?? _faIcon,
      title: Text(
        title.toString(),
        style: const TextStyle(fontSize: _fontSize),
      ),
      textColor: textColor ?? _textColor,
      iconColor: iconColor ?? _iconColor,
      onTap: onTap,
    );
  }
}
