import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../_shared/app_config/data_box.dart';
import '../../../../_shared/thietlap_ngonngu.dart';
import '../../../../_shared/utils/ndgap.dart';
import '../providers/setting_provider_option_darkmode.dart';

Row settingWidgetRowThemeMode(
    {required BuildContext context,
    int? indexDarkMode,
    required WidgetRef ref}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ndGapH48(),
      Expanded(
          flex: 1,
          child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                ref
                    .read(optionDarkModeProvider.notifier)
                    .changeIndex(tuychon: 1);
                ref
                    .read(darkModeProvider.notifier)
                    .changeTheme(giaodien: "dark");
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    width: 100,
                    child: Image.asset('assets/images/imgThemeMode_Dark.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Radio(
                            value: 1,
                            groupValue: indexDarkMode,
                            onChanged: (value) {},
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Text(ngonngu(context).theme_darkmode)),
                      ],
                    ),
                  )
                ],
              ))),
      Expanded(
          flex: 1,
          child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                ref
                    .read(optionDarkModeProvider.notifier)
                    .changeIndex(tuychon: 2);
                ref
                    .read(darkModeProvider.notifier)
                    .changeTheme(giaodien: "light");
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    width: 100,
                    child: Image.asset('assets/images/imgThemeMode_Light.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Radio(
                            value: 2,
                            groupValue: indexDarkMode,
                            onChanged: (value) {},
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Text(ngonngu(context).theme_lightmode)),
                      ],
                    ),
                  )
                ],
              ))),
      Expanded(
          flex: 1,
          child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                ref
                    .read(optionDarkModeProvider.notifier)
                    .changeIndex(tuychon: 3);
                ref
                    .read(darkModeProvider.notifier)
                    .changeTheme(giaodien: "system");
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    width: 100,
                    child: Image.asset('assets/images/imgThemeMode_Auto.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Radio(
                            value: 3,
                            groupValue: indexDarkMode,
                            onChanged: (value) {},
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Text(ngonngu(context).theme_systemmode)),
                      ],
                    ),
                  )
                ],
              ))),
    ],
  );
}
