
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl/intl.dart';


import '../../../../../../_shared/app_config/app.dart';
import '../../../../../../_shared/utils/helper.dart';
import '../../../../../../_shared/utils/ndgap.dart';

import '../../models/inforesponse_model.dart';
import '../../models/item_search_result_model.dart';
import '../../providers/capnhat_provider.dart';
import '../../widgets/pagnination.dart';
import 'update.dart';


int _rowsPerPage = 10;
bool _sortAscending = true;
String searchType = 'web';
int? _sortColumnIndex;


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
  Widget build(BuildContext context,WidgetRef ref) {
    var data = ref.watch(capnhatProvider.select((value) => value.result));
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF105A6C),
            ),
            child: const Row(
              children: [
                Expanded(
                    flex:1,
                    child: HeaderRowItem(text: '#')),
                Expanded(
                  flex:3,
                  child: HeaderRowItem(text: 'Mã KH'),
                ),

                Expanded(
                  flex:3,
                  child: HeaderRowItem(text: 'Mã HĐ'),
                ),
                Expanded(
                  flex:6,
                  child: HeaderRowItem(text: 'Email'),
                ),
                Expanded(
                  flex:3,
                  child: HeaderRowItem(text: 'Ngày ký'),
                ),
                Expanded(
                  flex:7,
                  child: HeaderRowItem(text: 'Chức năng'),
                ),
                Expanded(
                  flex:7,
                  child: HeaderRowItem(text: 'Ghi chú'),
                ),
                Expanded(
                  flex:4,
                  child: HeaderRowItem(text: 'Thao tác'),
                ),

              ],
            ),
          ),
          if(data!=null)...[

              ListView.builder(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: true,
              itemCount: data['data'].length,
              itemBuilder: (BuildContext context, index) {
                return InfoUpdate(item: data['data'][index], index: index+1,);
              }),
              GeneratePagin(data['info']),
          ],
         
          // data.when(
          //   data: (List<PhieuThuModel>? data) {
          //     if (data != null) {
          //       return ListView.builder(
          //           padding: const EdgeInsets.all(0),
          //           physics: const NeverScrollableScrollPhysics(),
          //           shrinkWrap: true,
          //           primary: true,
          //           itemCount: data.length,
          //           itemBuilder: (BuildContext context, index) {
          //             return RowInfoPhieuThu(item: data[index], index: index+1,);
          //           });
          //     } else {
          //       return const Center(
          //         child: Text('Data not found'),
          //       );
          //     }
          //   },
          //   error: (error, stackTrace) {
          //     return const Center(child: Text('Không load được dữ liệu!'),);
          //   },
          //   loading: () => const CircularProgressIndicator(),
          // ),

        ],
      ),
    );
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
  setSelectedPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Pagination(
          numOfPages: widget.data.lastPage!,
          selectedPage: selectedPage,
          pagesVisible: 5,

          onPageChanged: (page) {
            setState(() {
              selectedPage = page;
            });
          },
          nextIcon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.blue,
            size: 14,
          ),
          firstIcon: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
            size: 14,
          ),
          lastIcon: const Icon(
            Icons.arrow_forward,
            color: Colors.blue,
            size: 14,
          ),
          previousIcon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
            size: 14,
          ),
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
   InfoUpdate({Key? key, required this.item, required this.index}) : super(key: key);

  final ItemSearchResultModel item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            Expanded(
              flex:1,
              child:  BodyRowItem(Text('$index')),
            ),
            Expanded(
              flex:3,
              child: BodyRowItem(Text(item.l1_khachhangId!.makhachhang!)),
            ),
            Expanded(
              flex:3,
              child: BodyRowItem(Text(item.mahopdong!)),
            ),
            Expanded(
              flex:6,
              child: BodyRowItem(Text(item.l1_khachhangId!.email!)),
            ),
            Expanded(
              flex:3,
              child: BodyRowItem(Text(Helper.dateFormat(item.ngaykyhd))),
            ),
            Expanded(
              flex:7,
              child: BodyRowItem(Text(item.l1_info!.chucnang.toString())),
            ),
            Expanded(
              flex:7,
              child: BodyRowItem(Text(item.ghichu.toString())),
            ),
             Expanded(
              flex:4,
              child: BodyRowItem(Row(
              children: [
                GestureDetector(
                child: Container(
                decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
                padding: EdgeInsets.all(3.0),
                child: Text(
                'Nâng cấp',
                style: TextStyle(color: Colors.white),
                ),
                )),
                SizedBox(
                width: 5.0,
                ),
                GestureDetector(
                onTap: () {
                showDialog<void>(
                context: context!,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                return UpdateWebsite(id: item.id!);
                },
                );
                },
                child: Container(
                decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
                padding: EdgeInsets.all(3.0),
                child: Text(
                'Cập nhật',
                style: TextStyle(color: Colors.white),
                ),
                )),
    ],
    ),
            )),


          ],
        ),
        const Divider(),
    ]
    );


  }
}

class HeaderRowItem extends StatelessWidget {
  const HeaderRowItem({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Color(0xFF105A6C),
      ),
      child: Text(text,style: const TextStyle(color: Colors.white),),
    );
  }
}
class BodyRowItem extends StatelessWidget {
  const BodyRowItem(this.text);
  final Widget text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:7.0,bottom:7.0,left:15.0,right:15.0),
      decoration: const BoxDecoration(

      ),
      child: this.text,
    );
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
                            title: 'Mã hợp đồng',
                            onchange: (value) {
                              ref
                                  .read(capnhatProvider.notifier)
                                  .onChangeValue('MAHD', value);
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
                      ref.read(capnhatProvider.notifier).setPage(1,null);
                      ref.read(capnhatProvider.notifier).onSearch( searchType);

                      print("Search");
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

