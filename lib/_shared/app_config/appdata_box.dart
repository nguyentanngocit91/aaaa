import 'package:hive_flutter/adapters.dart';

part 'appdata_box.g.dart';

const String appDataBoxName = "AppData";

@HiveType(typeId: 1)
enum DarkMode {
  @HiveField(0)
  dark,
  @HiveField(1)
  light,
  @HiveField(2)
  system,
}

@HiveType(typeId: 0)
class AppData {
  @HiveField(0)
  String defaultLanguage;
  @HiveField(1)
  bool onboardingLoaded;
  @HiveField(2)
  DarkMode darkMode;
  @HiveField(3)
  String userLogged;
  @HiveField(4)
  String appName;
  @HiveField(5)
  String appPackageName;
  @HiveField(6)
  String appVersion;

  AppData(this.defaultLanguage, this.onboardingLoaded, this.darkMode,
      this.userLogged, this.appName, this.appPackageName, this.appVersion);

  AppData copyWith({
    String? defaultLanguage,
    bool? onboardingLoaded,
    DarkMode? darkMode,
    String? userLogged,
    String? appName,
    String? appPackageName,
    String? appVersion,
  }) {
    return AppData(
      defaultLanguage ?? this.defaultLanguage,
      onboardingLoaded ?? this.onboardingLoaded,
      darkMode ?? this.darkMode,
      userLogged ?? this.userLogged,
      appName ?? this.appName,
      appPackageName ?? this.appPackageName,
      appVersion ?? this.appVersion,
    );
  }

  @override
  String toString() {
    return 'Dữ liệu (defaultLanguage: $defaultLanguage, onboardingLoaded: $onboardingLoaded, ThemeMode: $darkMode, userLogged: $userLogged, appName: $appName, appPackageName: $appPackageName, appVersion: $appVersion)';
  }
}
