import 'package:flutter/material.dart';

import '../../../_shared/utils/ndgap.dart';

import 'datatable/datatable2.dart';

class UpgradeWebListLayout extends StatelessWidget {
  const UpgradeWebListLayout() : super(key: const Key(pathName));

  static const String pathName = 'nang-cap-website';

  @override
  Widget build(BuildContext context) {
    double hozSpacingWrap = 30;
    double verSpacingWrap = 20;
    String typeHD = 'web';

    return Scaffold(
      body: ListView(
        children: [
          heading1('TÌM KIẾM THÔNG TIN'),
          ndGapH8(),
          filter(),
          ndGapH8(),
          heading1('TÌM KIẾM WEBSITE'),
          ndGapH8(),
          SizedBox(
            height: 700,
            child: AsyncPaginatedDataTable2Demo(),
          )
        ],
      ),
    );
  }
}

Widget filter() {
  return Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      color: Colors.black.withOpacity(0.1),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      textForm('Mã khách hàng', controller),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      textForm('Mã hợp đồng', controller),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      textForm('Tên hợp đồng', controller),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      textForm('Email', controller),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Wrap(
            runSpacing: 10,
            children: [
              const SizedBox(
                width: 20,
              ),
              // GestureDetector(
              //    child: Container(
              //   padding: EdgeInsets.all(3.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular(3.0)),
              //     color: Colors.blue,
              //   ),
              //   child: Icon(
              //     Icons.refresh,
              //     color: Colors.white,
              //   ),
              // )),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      color: Colors.blue,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ],
    ),
  );
}
