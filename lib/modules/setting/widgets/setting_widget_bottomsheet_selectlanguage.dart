import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../_shared/app_config/data_box.dart';
import '../../../../_shared/thietlap_ngonngu.dart';
import '../../../../_shared/utils/ndgap.dart';

InkWell settingWidgetBottomSheetSelectLanguage(
    {required BuildContext context,
    required WidgetRef ref,
    required double chieuCaoHienThi}) {
  final ngonngumacdinh = ref.watch(languageProvider);
  return InkWell(
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return _bottomSheetContent(chieuCaoHienThi, context, ref);
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(ngonngu(context).changelanguage),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: _ngonNguDangChon(selectedLanguage: ngonngumacdinh!),
              ),
            ),
          ],
        ),
      ));
}

Row _ngonNguDangChon({required String selectedLanguage}) {
  Row widgetreturn;

  switch (selectedLanguage) {
    case "vi":
      widgetreturn = Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        SizedBox(
          height: 16,
          width: 16,
          child: Image.asset('assets/images/imgFlagVN.png'),
        ),
        ndGapW8(),
        const Text(
          'Tiếng Việt',
        ),
      ]);
      break;
    case "en":
      widgetreturn = Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        SizedBox(
          height: 16,
          width: 16,
          child: Image.asset('assets/images/imgFlagUSA.png'),
        ),
        ndGapW8(),
        const Text(
          'English',
        ),
      ]);
      break;
    default:
      widgetreturn = Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        SizedBox(
          height: 16,
          width: 16,
          child: Image.asset('assets/images/imgFlagVN.png'),
        ),
        ndGapW8(),
        const Text(
          'Tiếng Việt',
        ),
      ]);
      break;
  }
  return widgetreturn;
}

SizedBox _bottomSheetContent(
    double chieuCaoHienThi, BuildContext context, WidgetRef ref) {
  return SizedBox(
    height: chieuCaoHienThi,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            ngonngu(context).changelanguage.toUpperCase(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          ndGapH8(),
          const Divider(),
          ndGapH16(),
          InkWell(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              ref.read(languageProvider.notifier).changeLanguage(ngonngu: "vi");
            },
            child: Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset('assets/images/imgFlagVN.png'),
                ),
                ndGapW8(),
                const Expanded(
                  flex: 1,
                  child: Text(
                    'Tiếng Việt',
                  ),
                ),
                Consumer(builder: (context, ref, child) {
                  final ngonngumacdinh = ref.watch(languageProvider);
                  return Icon(
                    Icons.check_outlined,
                    color: ngonngumacdinh == "vi"
                        ? Colors.blueAccent
                        : Colors.transparent,
                    size: 24,
                  );
                }),
              ],
            ),
          ),
          ndGapH24(),
          InkWell(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              ref.read(languageProvider.notifier).changeLanguage(ngonngu: "en");
            },
            child: Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset('assets/images/imgFlagUSA.png'),
                ),
                ndGapW8(),
                const Expanded(
                  flex: 1,
                  child: Text(
                    'English',
                  ),
                ),
                Consumer(builder: (context, ref, child) {
                  final ngonngumacdinh = ref.watch(languageProvider);
                  return Icon(
                    Icons.check_outlined,
                    color: ngonngumacdinh == "en"
                        ? Colors.blueAccent
                        : Colors.transparent,
                    size: 24,
                  );
                }),
              ],
            ),
          ),
          ndGapH24(),
        ],
      ),
    ),
  );
}
