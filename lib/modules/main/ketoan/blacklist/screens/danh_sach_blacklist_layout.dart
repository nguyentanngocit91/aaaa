import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../models/danh_sach_blacklist_model.dart';
import '../providers/danh_sach_blacklist_provider.dart';
import '../widgets/list_blacklist.dart';

class DanhSachBlacklistLayout extends ConsumerWidget {
  const DanhSachBlacklistLayout({Key? key}) : super(key: const Key(pathName));
  static const String pathName = 'danh-sach-blacklist';

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Scaffold(
      body: Container(
        child: Column(
          children: [

            Container(
              padding: EdgeInsets.all(10),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Color(0xfff5f5f5),
                  border: Border.all(width: 1, color: Color(0xffdcdbdb))),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 0,
                      children: [
                        Text(
                          'Mã hợp đồng',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(color: Colors.white),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 10, right: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 8,
                    child: Wrap(
                      runSpacing: 0,
                      children: [
                        Text(
                          'Ghi chú',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(color: Colors.white),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 10, right: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      runSpacing: 0,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Lưu thông tin",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Color(0xffff9800)),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Expanded(
              child:ListBlacklist(),
            ),







          ],
        ),
      ),
    );
  }
}

