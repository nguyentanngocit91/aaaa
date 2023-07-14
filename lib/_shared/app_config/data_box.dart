import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

import 'appdata_box.dart';

final darkModeProvider = NotifierProvider<DarkModeNotifier, ThemeMode?>(
  () => DarkModeNotifier(),
);
final languageProvider = NotifierProvider<LanguageNotifier, String?>(
  () => LanguageNotifier(),
);

class DataBox {
  static late Box<AppData> appDataBox;

  Future<void> khoiTaoDuLieu() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AppDataAdapter());
    Hive.registerAdapter(DarkModeAdapter());
    appDataBox = await Hive.openBox<AppData>(appDataBoxName);
    if (appDataBox.values.isEmpty) {
      appDataBox.add(AppData("vi", false, DarkMode.light, "", "NINA VN",
          "vn.nina.app.ninavnapp", "v1.0.1"));
    } else {
      appDataBox.values.first.darkMode;
    }
  }

  Future<void> boxUpdateLanguage(String ngonngu) async {
    await appDataBox.putAt(
        0, appDataBox.getAt(0)!.copyWith(defaultLanguage: ngonngu));
  }

  Future<void> boxUpdateOnBoarding({required bool onBoardingLoaded}) async {
    await appDataBox.putAt(
        0, appDataBox.getAt(0)!.copyWith(onboardingLoaded: onBoardingLoaded));
  }

  Future<void> boxUpdateUserLogged(String thongTinTaiKhoan) async {
    await appDataBox.putAt(
        0, appDataBox.getAt(0)!.copyWith(userLogged: thongTinTaiKhoan));
  }

  Future<void> boxUpdateDarkMode(String cheDoSangToi) async {
    switch (cheDoSangToi) {
      case 'dark':
        await appDataBox.putAt(
            0, appDataBox.getAt(0)!.copyWith(darkMode: DarkMode.dark));
        break;
      case 'light':
        await appDataBox.putAt(
            0, appDataBox.getAt(0)!.copyWith(darkMode: DarkMode.light));
        break;
      case 'system':
        await appDataBox.putAt(
            0, appDataBox.getAt(0)!.copyWith(darkMode: DarkMode.system));
        break;
      default:
        await appDataBox.putAt(
            0, appDataBox.getAt(0)!.copyWith(darkMode: DarkMode.system));
        break;
    }
  }
}

class DarkModeNotifier extends Notifier<ThemeMode?> {
  @override
  ThemeMode? build() {
    ThemeMode giaodien;
    switch (DataBox.appDataBox.values.first.darkMode) {
      case DarkMode.dark:
        giaodien = ThemeMode.dark;
        break;
      case DarkMode.light:
        giaodien = ThemeMode.light;
        break;
      case DarkMode.system:
        giaodien = ThemeMode.system;
        break;
      default:
        giaodien = ThemeMode.system;
        break;
    }
    return giaodien;
  }

  Future<void> changeTheme({required String giaodien}) async {
    switch (giaodien) {
      case 'dark':
        state = ThemeMode.dark;
        await DataBox().boxUpdateDarkMode("dark");
        break;
      case 'light':
        state = ThemeMode.light;
        await DataBox().boxUpdateDarkMode("light");
        break;
      case 'system':
        state = ThemeMode.system;
        await DataBox().boxUpdateDarkMode("system");
        break;
      default:
        state = ThemeMode.system;
        await DataBox().boxUpdateDarkMode("system");
        break;
    }
  }
}

class LanguageNotifier extends Notifier<String?> {
  @override
  String? build() {
    return DataBox.appDataBox.values.first.defaultLanguage.toString();
  }

  Future<void> changeLanguage({required String ngonngu}) async {
    state = ngonngu;
    await DataBox().boxUpdateLanguage(ngonngu);
  }
}
