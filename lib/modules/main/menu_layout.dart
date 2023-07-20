import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../_shared/thietlap_media.dart';
import 'dashboard/dashboard_layout.dart';
import 'ketoan/cap_ma_hd_layout.dart';
import 'ketoan/upgrade_website/list.dart';

class MenuLayout extends ConsumerWidget {
  const MenuLayout({super.key});

  final Color _textGroupColor = Colors.white;
  final Color _iconGroupColor = Colors.white;
  final FaIcon _faIconGroup = const FaIcon(
    FontAwesomeIcons.circleArrowRight,
    size: 18,
  );
  static const double _fontSizeGroup = 16;

  final Color _textColor = Colors.grey;
  final Color _iconColor = Colors.grey;
  final FaIcon _faIcon = const FaIcon(
    FontAwesomeIcons.angleRight,
    size: 14,
  );
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
                  MediaAssets.logoMenuLeft,
                  height: 80,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            itemMenu(
                title: 'Dashboard',
                onTap: () {
                  context.go('/${DashboardLayout.pathName}');
                }),
            showMenuGroup(title: 'Kế Toán', children: [
              itemMenuGroup(
                title: 'Cấp mã HĐ trước',
                onTap: () {
                  context.go('/${CapMaHDLayout.pathName}');
                },
              ),
              itemMenuGroup(
                title: 'Danh sách mã đã cấp',
                onTap: () {},
              ),
              itemMenuGroup(
                title: 'Khách hàng mới',
                onTap: () {},
              ),
              itemMenuGroup(
                title: 'Danh sách hợp đồng',
                onTap: () {},
              ),
              itemMenuGroup(
                title: 'Nâng cấp Website',
                onTap: () {
                  context.go('/${UpgradeWebListLayout.pathName}');
                },
              ),
              itemMenuGroup(
                title: 'Nâng cấp App',
                onTap: () {},
              ),
              itemMenuGroup(
                title: 'Nâng cấp Hosting',
                onTap: () {},
              ),
              itemMenuGroup(
                title: 'Cập nhật Domain',
                onTap: () {},
              ),
              itemMenuGroup(
                title: 'DS mới cập nhật & Pendding',
                onTap: () {},
              ),
              itemMenuGroup(
                title: 'Phiếu thu',
                onTap: () {},
              ),
              itemMenuGroup(
                title: 'Nhân viên kế toán',
                onTap: () {},
              ),
              itemMenuGroup(
                title: 'Sửa đổi thông tin',
                onTap: () {},
              ),
              itemMenuGroup(
                title: 'Blacklist',
                onTap: () {},
              ),
              itemMenuGroup(
                title: 'Tìm kiếm thông tin 2015-2019',
                onTap: () {},
              ),
              itemMenuGroup(
                title: 'Import data NVKD',
                onTap: () {},
              ),
              itemMenuGroup(
                title: 'Bàn giao',
                onTap: () {},
              ),
              itemMenuGroup(
                title: 'Thống kê in bàn giao',
                onTap: () {},
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget showMenuGroup(
      {required String title,
      Widget? icon,
      Color? textColor,
      Color? iconColor,
      bool initiallyExpanded = true,
      required List<Widget> children}) {
    return ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        iconColor: iconColor ?? _iconGroupColor,
        leading: icon ?? _faIconGroup,
        collapsedIconColor: iconColor ?? _iconGroupColor,
        title: Text(
          title,
          style: TextStyle(color: textColor ?? _textGroupColor, fontSize: 15),
        ),
        childrenPadding: const EdgeInsets.only(left: 14, bottom: 20),
        shape: const Border.symmetric(
            vertical: BorderSide.none, horizontal: BorderSide.none),
        collapsedShape: const Border.symmetric(
            vertical: BorderSide.none, horizontal: BorderSide.none),
        children: children);
  }

  Widget itemMenu(
      {String? title,
      Widget? icon,
      Color? textColor,
      Color? iconColor,
      required Function() onTap}) {
    return ListTile(
      leading: icon ?? _faIconGroup,
      title: Text(
        title.toString(),
        style: const TextStyle(fontSize: _fontSize),
      ),
      textColor: textColor ?? _textGroupColor,
      iconColor: iconColor ?? _iconGroupColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      onTap: onTap,
    );
  }

  Widget itemMenuGroup(
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
      minLeadingWidth: 10,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      onTap: onTap,
    );
  }
}
