import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../_shared/app_config/data_box.dart';
import '../../../../_shared/thietlap_ngonngu.dart';
import '../../../../core/utils/helper.dart';
//import '../../../egg/egg_layout.dart';
//import '../../../egg/utils/function_egg.dart';

Column settingWidgetRowAppInfo({required BuildContext context}) {
  return Column(
    children: [
      _rowAppName(context),
      _rowAppVersion(context),
      _rowAppCopyright(context),
    ],
  );
}

Padding _rowAppCopyright(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Align(
              alignment: Alignment.center,
              child: Text(
                      ngonngu(context).app_copyright,
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
              // child: hiddenActionWidget(
              //     solanClick: 5,
              //     timeReset: 5,
              //     context: context,
              //     child: FunctionEgg.hiddenActionWidget(numberPresses: 5, timeReset: 5, context: context, child: Text(
              //       ngonngu(context).app_copyright,
              //       style: const TextStyle(fontSize: 12),
              //       textAlign: TextAlign.center,
              //     ),action: (){context.go('/${Helper.convertName(const EggScreenLayout().key)}');}),
              // ),
          ),
        ),
      ],
    ),
  );
}

Padding _rowAppVersion(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(ngonngu(context).app_version),
          ),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(DataBox.appDataBox.values.first.appVersion),
          ),
        ),
      ],
    ),
  );
}

Padding _rowAppName(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(ngonngu(context).app_name),
          ),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(DataBox.appDataBox.values.first.appName),
          ),
        ),
      ],
    ),
  );
}

GestureDetector hiddenActionWidget(
    {required int solanClick,
    required int timeReset,
    required BuildContext context,
    required Widget child}) {
  int tapCount = 0;
  Timer? tapTimer;
  return GestureDetector(
    onTap: () {
      tapCount++;
      if (tapCount == 1) {
        // Bắt đầu đếm thời gian khi lần đầu tiên nhấn
        tapTimer = Timer(Duration(seconds: timeReset), () {
          // Đặt lại biến đếm về 0 nếu thời gian hết và không đạt đủ 6 lần nhấn
          tapCount = 0;
        });
      }
      if (tapCount == solanClick) {
        // Đủ số lần nhấn
        tapTimer?.cancel(); // Hủy bỏ timer nếu đã đủ 6 lần nhấn
        // print('Bạn đã nhấn liên tục $solanClick lần vào Text');
        DataBox().boxUpdateOnBoarding(onBoardingLoaded: false);
        // run Action
        // Hiển thị thông báo hoặc thực hiện hành động khác tại đây
        tapCount = 0; // Đặt lại biến đếm về 0 để tiếp tục đếm từ đầu
      }
    },
    child: child,
  );
}
