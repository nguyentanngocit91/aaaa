import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../_shared/thietlap_ngonngu.dart';
import 'providers/setting_provider_option_darkmode.dart';
import 'widgets/setting_widget_bottomsheet_selectlanguage.dart';
import 'widgets/setting_widget_row_appinfo.dart';
import 'widgets/setting_widget_row_thememode.dart';

class SettingLayout extends ConsumerWidget {
  const SettingLayout({Key? key}) : super(key: const Key(pathName));
  static const String pathName = 'setting';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexDarkMode = ref.watch(optionDarkModeProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          ngonngu(context).setting.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          settingWidgetRowTitle(title: ngonngu(context).theme_title.toUpperCase()),
          settingWidgetRowThemeMode(context: context, indexDarkMode: indexDarkMode, ref: ref),
          const Divider(
            endIndent: 16,
            indent: 16,
          ),
          settingWidgetRowTitle(title: ngonngu(context).language.toUpperCase()),
          settingWidgetBottomSheetSelectLanguage(context: context, ref: ref, chieuCaoHienThi: 220),
          const Divider(
            endIndent: 16,
            indent: 16,
          ),
          settingWidgetRowTitle(title: 'APP INFO'.toUpperCase()),
          settingWidgetRowAppInfo(context: context),
        ],
      ),
    );
  }

  Padding settingWidgetRowTitle({required String title}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
