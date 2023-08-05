part of '../../../_shared/thietlap_dieuhuong.dart';

const Color _textGroupColor = Colors.white;
const Color _iconGroupColor = Colors.white;
const FaIcon _faIconGroup = FaIcon(
  FontAwesomeIcons.circleArrowRight,
  size: 18,
);
const double _fontSizeGroup = 15;

const Color _textColor = Colors.grey;
const Color _iconColor = Colors.grey;
const Widget _faIcon = FaIcon(
  FontAwesomeIcons.angleRight,
  size: 12,
);
const double _fontSize = 14;

class MenuLayout extends ConsumerWidget {
  const MenuLayout({super.key});

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
            _ItemMenuGroup(
                title: 'Dashboard',
                onTap: () {
                  context.go('/${DashboardLayout.pathName}');
                }),
            showMenuGroup(
              title: 'Kế Toán',
              children: [
                const _ItemMenu(
                  title: 'Cấp mã HĐ trước',
                  pathName: CapMaHDLayout.pathName,
                ),
                const _ItemMenu(
                  title: 'Danh sách mã đã cấp',
                ),
                const _ItemMenu(
                  title: 'Khách hàng mới',
                  pathName: KhachHangMoi.pathName,
                ),
                const _ItemMenu(
                  title: 'Danh sách hợp đồng',
                  pathName: DanhSachHDLayout.pathName,
                ),
                const _ItemMenu(
                  title: 'Nâng cấp Website',
                  pathName: UpgradeWebListLayout.pathName,
                ),
                const _ItemMenu(
                  title: 'Nâng cấp App',
                  pathName: UpgradeAppListLayout.pathName,
                ),
                const _ItemMenu(
                  title: 'Nâng cấp Hosting',
                  pathName: UpgradeHostingListLayout.pathName,
                ),
                const _ItemMenu(
                  title: 'Cập nhật Domain',
                  pathName: UpgradeDomainListLayout.pathName,
                ),
                const _ItemMenu(
                  title: 'DS mới cập nhật & Pending',
                  pathName: DanhSachMoiPendingLayout.pathName,
                ),
                const _ItemMenu(
                  title: 'Danh sách Domain mới ký',
                  pathName: DanhSachDomainMoiKy.pathName,
                ),
                const _ItemMenu(
                  title: 'Phiếu thu',
                  pathName: PhieuThuLayout.pathName,
                ),
                const _ItemMenu(
                  title: 'Nhân viên kế toán',
                ),
                const _ItemMenu(
                  title: 'Sửa đổi thông tin',
                ),
                const _ItemMenu(
                  title: 'Blacklist',
                  pathName: DanhSachBlacklistLayout.pathName,
                ),
                const _ItemMenu(
                  title: 'Tìm kiếm thông tin 2015-2019',
                  pathName: Data20152019.pathName,
                ),
                const _ItemMenu(
                  title: 'Import data NVKD',
                ),
                const _ItemMenu(
                  title: 'Bàn giao',
                  pathName: BanGiaoLayout.pathName,
                ),
                const _ItemMenu(
                  title: 'Thống kê in bàn giao',
                  pathName: ThongKeBanGiao.pathName,
                ),
              ],
            ),
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
}

class _ItemMenuGroup extends ConsumerWidget {
  const _ItemMenuGroup(
      {super.key,
      this.title,
      this.icon,
      this.textColor,
      this.iconColor,
      required this.onTap});

  final String? title;
  final Widget? icon;
  final Color? textColor;
  final Color? iconColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
}

class _ItemMenu extends ConsumerWidget {
  const _ItemMenu(
      {super.key,
      this.title,
      this.icon,
      this.textColor,
      this.iconColor,
      this.pathName});

  final String? title;
  final Widget? icon;
  final Color? textColor;
  final Color? iconColor;
  final String? pathName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String viTri = GoRouterState.of(context).location;
    return ListTile(
      dense: true,
      leading: icon ?? _faIcon,
      title: Text(
        title.toString(),
        style:
            const TextStyle(fontSize: _fontSize, fontWeight: FontWeight.normal),
      ),
      textColor: (viTri == '/$pathName') ? Colors.red : textColor ?? _textColor,
      iconColor: (viTri == '/$pathName') ? Colors.red : iconColor ?? _iconColor,
      minLeadingWidth: 8,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      onTap: () {
        if (pathName != null) context.go('/$pathName');
      },
    );
  }
}
