import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../_shared/app_config/appdata_box.dart';
import '../../../../_shared/app_config/data_box.dart';

final optionDarkModeProvider = NotifierProvider<OptionDarkModeNotifier, int?>(
  () => OptionDarkModeNotifier(),
);

class OptionDarkModeNotifier extends Notifier<int?> {
  @override
  int? build() {
    int index;
    switch (DataBox.appDataBox.values.first.darkMode) {
      case DarkMode.dark:
        index = 1;
        break;
      case DarkMode.light:
        index = 2;
        break;
      case DarkMode.system:
        index = 3;
        break;
      default:
        index = 2;
        break;
    }
    return index;
  }

  Future<void> changeIndex({int? tuychon}) async {
    state = tuychon;
  }
}
