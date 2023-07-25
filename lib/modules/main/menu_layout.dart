part of '../../../_shared/thietlap_dieuhuong.dart';


class MenuLayout extends ConsumerWidget {
  const MenuLayout({super.key});

  final Color _textGroupColor = Colors.white;
  final Color _iconGroupColor = Colors.white;
  final FaIcon _faIconGroup = const FaIcon(
    FontAwesomeIcons.circleArrowRight,
    size: 18,
  );
  static const double _fontSizeGroup = 15;

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
            itemMenuGroup(
                title: 'Dashboard',
                onTap: () {
                  context.go('/${DashboardLayout.pathName}');
                }),
            showMenuGroup(title: 'Kế Toán', children: [
              itemMenu(
                title: 'Cấp mã HĐ trước',
                onTap: () {
                  context.go('/${CapMaHDLayout.pathName}');
                },
              ),
              itemMenu(
                title: 'Danh sách mã đã cấp',
                onTap: () {},
              ),
              itemMenu(
                title: 'Khách hàng mới',
                onTap: () {
                  context.go('/${KhachHangMoi.pathName}');
                },
              ),
              itemMenu(
                title: 'Danh sách hợp đồng',
                onTap: () {
                  context.go('/${DanhSachHDLayout.pathName}');
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
                onTap: () {},
              ),
              itemMenu(
                title: 'Nâng cấp Hosting',
                onTap: () {},
              ),
              itemMenu(
                title: 'Cập nhật Domain',
                onTap: () {},
              ),
              itemMenu(
                title: 'DS mới cập nhật & Pendding',
                onTap: () {},
              ),
              itemMenu(
                title: 'Phiếu thu',
                onTap: () {
                  context.go('/${PhieuThuLayout.pathName}');
                },
              ),
              itemMenu(
                title: 'Nhân viên kế toán',
                onTap: () {},
              ),
              itemMenu(
                title: 'Sửa đổi thông tin',
                onTap: () {},
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
                  context.go('/${Data20152019.pathName}');
                },
              ),
              itemMenu(
                title: 'Import data NVKD',
                onTap: () {},
              ),
              itemMenu(
                title: 'Bàn giao',
                onTap: () {
                  context.go('/${BanGiaoLayout.pathName}');
                },
              ),
              itemMenu(
                title: 'Thống kê in bàn giao',
                onTap: () {
                  context.go('/${ThongKeBanGiao.pathName}');
                },
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
          style: TextStyle(
              color: textColor ?? _textGroupColor, fontSize: _fontSizeGroup),
        ),
        childrenPadding: const EdgeInsets.only(left: 14, bottom: 20),
        shape: const Border.symmetric(
            vertical: BorderSide.none, horizontal: BorderSide.none),
        collapsedShape: const Border.symmetric(
            vertical: BorderSide.none, horizontal: BorderSide.none),
        children: children);
  }

  Widget itemMenuGroup(
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
      minLeadingWidth: 10,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      onTap: onTap,
    );
  }
}
