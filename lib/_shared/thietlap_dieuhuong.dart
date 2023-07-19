/// Lưu ý : Import đường dẫn các module theo Relative
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/utils/helper.dart';
import '../modules/account/signin/signin_layout.dart';
import '../modules/error/error404.dart';
import '../modules/error/error_nointernet.dart';
import '../modules/main/dashboard/dashboard_layout.dart';
import '../modules/main/ketoan/cap_ma_hd_layout.dart';
import '../modules/main/ketoan/phieuthu/phieuthu_layout.dart';
import '../modules/main/main_layout.dart';
import '../modules/main/profile/doi_mat_khau/doi_mat_khau_layout.dart';
import '../modules/main/upgrade_website/list.dart';
import '../modules/offline/offline_screen.dart';
import '../modules/onboarding/onboarding_layout.dart';
import '../modules/setting/setting_layout.dart';
import '../modules/splash/splash_layout.dart';

/// Đây là module mặc định sẽ được load sau khi ứng dụng được khởi chạy
String routeMacDinh = pathSplash;
bool isDebugRoute = true;

/// checkConnectInternet mặc định sẽ là True, đây là tham số để ứng dụng kiểm tra
/// có cần kết nối Internet khi chạy hay không
bool checkConnectInternet = true;

Widget routeError = const Error404Layout();

String pathSplash = '/${SplashLayout.pathName}';
String pathOnboarding = '/${OnboardingLayout.pathName}';
String pathHome = '/${DashboardLayout.pathName}';
String patherrorNoInternet = '/${ErrorNoInternetLayout.pathName}';
String pathOffline = '/${OfflineScreen.pathName}';
String pathSignIn = '/${SignInLayout.pathName}';


/// Đây là Danh sách các module chính sử dụng trong ứng dụng ///
List<RouteBase> danhsachRoute = [
  addGoRouter(const Error404Layout(), isSubModule: false),
  addGoRouter(const ErrorNoInternetLayout(), isSubModule: false),
  addGoRouter(const OfflineScreen(), isSubModule: false),
  addGoRouter(const SplashLayout(), isSubModule: false),
  addGoRouter(const OnboardingLayout(), isSubModule: false),
  addGoRouter(const SignInLayout(), isSubModule: false),


  addShellRouterMain('main'),
  addGoRouter(const SettingLayout(), isSubModule: false),
];

GoRoute addGoRouter(Widget modules,
    {bool isSubModule = true, String? pathParams}) {
  String strName = Helper.convertName(modules.key);
  String strPath = strName;
  if (!isSubModule) strPath = "/$strPath";
  if (pathParams != null) strPath += pathParams;
  return GoRoute(
    name: strName,
    path: strPath,
    pageBuilder: (context, state) => effectTransitionFade(context, state, modules),
  );
}

ShellRoute addShellRouterMain(String strKey) {
  final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: strKey);
  return ShellRoute(
      navigatorKey: shellNavigatorKey,
      pageBuilder: (context, state, child) {
        return effectTransitionFade(context, state, MainLayout(child: child));
      },
      routes: [
        addGoRouter(const DashboardLayout(), isSubModule: false),
        addGoRouter(const CapMaHDLayout(), isSubModule: false),
        //PHIEU THU
        addGoRouter( PhieuThuLayout(), isSubModule: false),

        addGoRouter(const DoiMatKhauLayout(), isSubModule: false),
        addGoRouter(const UpgradeWebListLayout(), isSubModule: false),
      ]);
}

CustomTransitionPage effectTransitionFade(BuildContext context,GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 100),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}
