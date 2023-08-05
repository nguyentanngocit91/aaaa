import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../_shared/app_config/data_box.dart';
import '../../_shared/providers/app_provider.dart';
import '../../_shared/thietlap_dieuhuong.dart';
import '../auth/providers/auth_provider.dart';

class AppRouterNotifier extends AsyncNotifier<void> implements Listenable {
  VoidCallback? routerListener;
  bool isConnected = true;
  bool isOffline = false;
  bool isActive = true;
  bool mustLogin = true;
  AuthStatus authStatus = AuthStatus.unauthenticated;

  @override
  Future<void> build() async {
    checkInternetConnection();
    authentication();
    ref.listenSelf((_, __) {
      if (state.isLoading) return;
      routerListener?.call();
    });
  }

  ///Kiểm tra các điều kiện và chuyển hướng người dùng
  Future<String?>? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) return null;
    if (!isConnected && checkConnectInternet) {
      return chuyenDenNoInternet();
    }

    if (isOffline) {
      return chuyenDenOffline();
    }

    final isNoInternet = state.location == patherrorNoInternet;
    if (isNoInternet) {
      return chuyenDenSplash();
    }

    final isSplash = state.location == pathSplash;
    if (isSplash) {
      return thoiGianChoSplashScreen();
    }


    final isOnBoarding = state.location == pathOnboarding;
    if (isOnBoarding) {
      if (DataBox.appDataBox.values.first.onboardingLoaded == true) {
        return chuyenDenHome();
      }
    }

    if (mustLogin==true) {
      if(authStatus==AuthStatus.unauthenticated){
        return chuyenDenDangNhap();
      }
    }


    // updateApp(context,state);
    return null;
  }

  updateApp(BuildContext context, GoRouterState state){
    ref.read(appProvider.notifier).capNhatViTriHienTai(state.location);
  }

  Future authentication() async{
    authStatus = ref.watch(authProvider.select((value) => value.authStatus));
  }


  /// Định tuyên
  Future<String?> thoiGianChoSplashScreen() async {
    await Future.delayed(const Duration(seconds: 3),() async {});
    return pathOnboarding;
  }

  Future<String?> chuyenDenSplash() async {
    return pathSplash;
  }

  Future<String?> chuyenDenHome() async {
    return pathHome;
  }


  Future<String?> chuyenDenNoInternet() async {
    return patherrorNoInternet;
  }

  Future<String?> chuyenDenOffline() async {
    return pathOffline;
  }

  Future<String?> chuyenDenDangNhap() async {
    return pathSignIn;
  }

  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }

  Future<void> checkInternetConnection() async {
    isConnected = ref.watch(internetProvider);
  }

  void setConnected(bool result) {
    isConnected = result;
  }
}

final routerNotifierProvider =
    AsyncNotifierProvider<AppRouterNotifier, void>(() {
  return AppRouterNotifier();
});

final internetProvider = StateNotifierProvider<InternetNotifier, bool>((ref) {
  return InternetNotifier();
});

class InternetNotifier extends StateNotifier<bool> {
  InternetNotifier() : super(true) {
    checkInternetStatus();
    _listenInternetStatus();
  }

  checkInternetStatus() async {
    state = await InternetConnectionChecker().hasConnection;
  }

  _listenInternetStatus() {
    InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        bool isConnected = state;
        switch (status) {
          case InternetConnectionStatus.connected:
            isConnected = true;
            break;
          case InternetConnectionStatus.disconnected:
            isConnected = false;
            break;
        }
        if (isConnected != state) {
          state = isConnected;
        }
      },
    );
  }
}