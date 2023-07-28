import 'package:bs_flutter_alert/bs_flutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:responsive_ui/responsive_ui.dart';

import '../../../../../../_shared/app_config/app.dart';
import '../../../../../../_shared/utils/helper.dart';
import '../../../../../../_shared/utils/ndgap.dart';

import '../../models/inforesponse_model.dart';
import '../../models/item_search_result_model.dart';
import '../../providers/capnhat_provider.dart';
import '../../widgets/pagnination.dart';
import 'update.dart';

String searchType = 'web';

class UpgradeWebListLayout extends ConsumerWidget {
  const UpgradeWebListLayout() : super(key: const Key(pathName));

  static const String pathName = 'nang-cap-website';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          Data(),
        ],
      ),
    );
  }
}
class Data extends ConsumerWidget {
  Data({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(capnhatProvider.select((value) => value.result));
    if(data!=null && (data!['info'].page > data!['info'].lastPage && data!['info'].total > 0)){
        ref.read(capnhatProvider.notifier).setPage(data!['info'].lastPage,searchType);
    }


    return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF105A6C),
              ),
              child: const Row(
                children: [
                  Expanded(flex: 1, child: HeaderRowItem(text: '#')),
                  Expanded(
                    flex: 3,
                    child: HeaderRowItem(text: 'Mã KH'),
                  ),
                  Expanded(
                    flex: 3,
                    child: HeaderRowItem(text: 'Mã HĐ'),
                  ),
                  Expanded(
                    flex: 4,
                    child: HeaderRowItem(text: 'Email'),
                  ),
                  Expanded(
                    flex: 3,
                    child: HeaderRowItem(text: 'Ngày ký'),
                  ),
                  Expanded(
                    flex: 5,
                    child: HeaderRowItem(text: 'Chức năng'),
                  ),
                  Expanded(
                    flex: 5,
                    child: HeaderRowItem(text: 'Ghi chú'),
                  ),
                  Expanded(
                    flex: 4,
                    child: HeaderRowItem(text: 'Thao tác'),
                  ),
                ],
              ),
            ),
            if (data != null && data['data'].length > 0) ...[
              ListView.builder(
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  itemCount: data['data'].length,
                  itemBuilder: (BuildContext context, index) {
                    InfoResponseModel info = data['info'];
                    return InfoUpdate(
                        item: data['data'][index],
                        index:
                            info.page! * info.limit! - (info.limit!) + index + 1);
                  }),
              GeneratePagin(data['info']),
            ] else ...[
              const BsAlert(
                closeButton: false,
                margin: EdgeInsets.only(bottom: 10.0),
                style: BsAlertStyle.danger,
                child: Text('Không có dữ liệu', textAlign: TextAlign.center),
              ),
            ],
          ],
        ));
  }
}

class GeneratePagin extends ConsumerStatefulWidget {
  GeneratePagin(this.data);
  final InfoResponseModel data;

  @override
  ConsumerState createState() => _GeneratePaginState();
}

class _GeneratePaginState extends ConsumerState<GeneratePagin> {
  int selectedPage = 1;
  int perPage = 0;

  @override
  Widget build(BuildContext context) {
    selectedPage = widget.data.page!;
    perPage = widget.data.limit!;
    if (selectedPage > widget.data.lastPage! && widget.data.lastPage! > 0) {
      setState(() {
        selectedPage = widget.data.lastPage!;
      });
      ref.read(capnhatProvider.notifier).setPage(selectedPage, searchType);
    //  ref.read(capnhatProvider.notifier).onSearch(searchType);
    }

    return widget.data.lastPage! < 2
        ? Container()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Pagination(
                perPage: widget.data.limit!,
                numOfPages: widget.data.lastPage!,
                selectedPage: selectedPage,
                pagesVisible: 5,
                onPerPageChange: (page) {
                  ref.read(capnhatProvider.notifier).setPerPage(page, searchType);
                  // ref.read(capnhatProvider.notifier).onSearch(searchType);
                  setState(() {
                    perPage = page;
                  });
                },
                onPageChanged: (page) {
                  ref.read(capnhatProvider.notifier).setPage(page, null);
                  ref.read(capnhatProvider.notifier).onSearch(searchType);
                  setState(() {
                    selectedPage = page;
                  });
                },
                activeTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                activeBtnStyle: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                inactiveBtnStyle: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  )),
                ),
                inactiveTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          );
  }
}

class InfoUpdate extends StatelessWidget {
  InfoUpdate({Key? key, required this.item, required this.index})
      : super(key: key);

  final ItemSearchResultModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            flex: 1,
            child: BodyRowItem(Text('$index')),
          ),
          Expanded(
            flex: 3,
            child: BodyRowItem(Text(item.l1_khachhangId!.makhachhang!)),
          ),
          Expanded(
            flex: 3,
            child: BodyRowItem(Text(item.mahopdong!)),
          ),
          Expanded(
            flex: 4,
            child: BodyRowItem(Text(item.l1_khachhangId!.email!)),
          ),
          Expanded(
            flex: 3,
            child: BodyRowItem(Text(Helper.dateFormat(item.ngaykyhd))),
          ),
          Expanded(
            flex: 5,
            child: BodyRowItem(Text(item.l1_info!.chucnang.toString())),
          ),
          Expanded(
            flex: 5,
            child: BodyRowItem(Text(item.ghichu.toString())),
          ),
          Expanded(
              flex: 4,
              child: BodyRowItem(ResponsiveGridRow(children: [
                ResponsiveGridCol(
                  lg: 6,
                  sm:12,
                  xs: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                        child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF105A6C),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 7.0, bottom: 7.0),
                      child: Text(
                        'Nâng cấp',textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                  ),
                ),

                ResponsiveGridCol(
                  lg: 6,
                  sm:12,
                  xs: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                        onTap: () {
                          showDialog<void>(
                            context: context!,
                            barrierDismissible: false,
                            // user must tap button!
                            builder: (BuildContext context) {
                              return UpdateWebsite(id: item.id!);
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          ),
                          padding: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 7.0, bottom: 7.0),
                          child: Text(
                            'Cập nhật',textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                )
              ])


                  )),
        ],
      ),
      const Divider(),
    ]);
  }
}

class filter extends ConsumerWidget {
  const filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        textForm(
                            title: 'Mã khách hàng',
                            onchange: (value) {
                              ref
                                  .read(capnhatProvider.notifier)
                                  .onChangeValue('MAKH', value);
                            }),
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
                        textForm(
                            title: 'Số hợp đồng',
                            onchange: (value) {
                              ref
                                  .read(capnhatProvider.notifier)
                                  .onChangeValue('SOHD', value);
                            }),
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
                        textForm(
                            title: 'Tên hợp đồng',
                            onchange: (value) {
                              ref
                                  .read(capnhatProvider.notifier)
                                  .onChangeValue('TENHD', value);
                            }),
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
                        textForm(
                            title: 'Email',
                            onchange: (value) {
                              ref
                                  .read(capnhatProvider.notifier)
                                  .onChangeValue('EMAIL', value);
                            }),
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
                GestureDetector(
                    child: Container(
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    color: Colors.blue,
                  ),
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                )),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      ref.read(capnhatProvider.notifier).setPage(1, null);
                      ref.read(capnhatProvider.notifier).onSearch(searchType);
                    },
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
}
