// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `en`
  String get _locale {
    return Intl.message(
      'en',
      name: '_locale',
      desc: '',
      args: [],
    );
  }

  /// `App Name`
  String get app_name {
    return Intl.message(
      'App Name',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `App Version`
  String get app_version {
    return Intl.message(
      'App Version',
      name: 'app_version',
      desc: '',
      args: [],
    );
  }

  /// `©2023 NINA Co,. Ltd. All rights reserved.`
  String get app_copyright {
    return Intl.message(
      '©2023 NINA Co,. Ltd. All rights reserved.',
      name: 'app_copyright',
      desc: '',
      args: [],
    );
  }

  /// `Security Clearance Policy`
  String get app_policy {
    return Intl.message(
      'Security Clearance Policy',
      name: 'app_policy',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get langname {
    return Intl.message(
      'English',
      name: 'langname',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get changelanguage {
    return Intl.message(
      'Change language',
      name: 'changelanguage',
      desc: '',
      args: [],
    );
  }

  /// `Processing...`
  String get vuilongdoi {
    return Intl.message(
      'Processing...',
      name: 'vuilongdoi',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get product {
    return Intl.message(
      'Product',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Hosting`
  String get hosting {
    return Intl.message(
      'Hosting',
      name: 'hosting',
      desc: '',
      args: [],
    );
  }

  /// `Domain`
  String get domain {
    return Intl.message(
      'Domain',
      name: 'domain',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get designWeb {
    return Intl.message(
      'Website',
      name: 'designWeb',
      desc: '',
      args: [],
    );
  }

  /// `App Mobile`
  String get designApp {
    return Intl.message(
      'App Mobile',
      name: 'designApp',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get service {
    return Intl.message(
      'Services',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Customer support`
  String get support {
    return Intl.message(
      'Customer support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get kythuat {
    return Intl.message(
      'Support',
      name: 'kythuat',
      desc: '',
      args: [],
    );
  }

  /// `Recruitment`
  String get recruitment {
    return Intl.message(
      'Recruitment',
      name: 'recruitment',
      desc: '',
      args: [],
    );
  }

  /// `Templates`
  String get templates {
    return Intl.message(
      'Templates',
      name: 'templates',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `THEME MODE`
  String get theme_title {
    return Intl.message(
      'THEME MODE',
      name: 'theme_title',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get theme_darkmode {
    return Intl.message(
      'Dark Mode',
      name: 'theme_darkmode',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get theme_lightmode {
    return Intl.message(
      'Light Mode',
      name: 'theme_lightmode',
      desc: '',
      args: [],
    );
  }

  /// `Auto Mode`
  String get theme_systemmode {
    return Intl.message(
      'Auto Mode',
      name: 'theme_systemmode',
      desc: '',
      args: [],
    );
  }

  /// `Job Recruitment Information`
  String get content_thongtintuyendung {
    return Intl.message(
      'Job Recruitment Information',
      name: 'content_thongtintuyendung',
      desc: '',
      args: [],
    );
  }

  /// `UNFORTUNATELY, this page doesn't exist.`
  String get error404_str_title {
    return Intl.message(
      'UNFORTUNATELY, this page doesn\'t exist.',
      name: 'error404_str_title',
      desc: '',
      args: [],
    );
  }

  /// `Restart App`
  String get error404_str_btn {
    return Intl.message(
      'Restart App',
      name: 'error404_str_btn',
      desc: '',
      args: [],
    );
  }

  /// `NO INTERNET CONNECTION`
  String get nointernet_str_title {
    return Intl.message(
      'NO INTERNET CONNECTION',
      name: 'nointernet_str_title',
      desc: '',
      args: [],
    );
  }

  /// `Please connect to the internet and try again.`
  String get nointernet_str_message {
    return Intl.message(
      'Please connect to the internet and try again.',
      name: 'nointernet_str_message',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get nointernet_str_btn {
    return Intl.message(
      'Try Again',
      name: 'nointernet_str_btn',
      desc: '',
      args: [],
    );
  }

  /// `Update success`
  String get updateHDSuccess {
    return Intl.message(
      'Update success',
      name: 'updateHDSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Update error`
  String get updateHDFail {
    return Intl.message(
      'Update error',
      name: 'updateHDFail',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
