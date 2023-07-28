import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/mixins/mixin_listview_table/title_header.dart';
import '../models/danh_sach_blacklist_model.dart';
import '../providers/danh_sach_blacklist_provider.dart';

class ListBlacklist extends ConsumerWidget {
  const ListBlacklist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listBlacklist = ref.watch(futureListBlackListProvider);



    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Color(0xff105a6c)),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TitleHeader(
                    stringTitle: "#",
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TitleHeader(
                    stringTitle: "Mã HĐ",
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: TitleHeader(
                    stringTitle: "Ghi chú",
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TitleHeader(
                    stringTitle: "Người khởi tạo",
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TitleHeader(
                    stringTitle: "Ngày tạo",
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: TitleHeader(stringTitle: "Thao tác"),
                ),
              ],
            ),
          ), // end header

          listBlacklist.when(data: (List<DanhSachBlacklistModel>? data) {
            if (data != null) {

              return ListView.builder(
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, index) {
                    return RowItemBL(
                      itemBl:data[index],
                      index: index,

                    );
                  });
            } else {
              return const Center(
                child: Text('Data not found'),
              );
            }
          }, error: (error, stackTrace) {
            print(stackTrace);
            return const Center(
              child: Text('Không load được dữ liệu!'),
            );
          }, loading: () {
            return Container(
              child: CircularProgressIndicator(),
            );
          }),

          // end header
        ],
      ),
    );
  }
}



class RowItemBL extends StatelessWidget {
  const RowItemBL({Key? key, required this.index,required this.itemBl}) : super(key: key);
  final int index;
  final DanhSachBlacklistModel itemBl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: (index % 2 == 0) ? Color(0xfff5f5f5) : Colors.white,
        border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color(0xffdcdbdb),
            ),
            left: BorderSide(
              width: 1,
              color: Color(0xffdcdbdb),
            ),
            right: BorderSide(width: 1, color: Color(0xffdcdbdb))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: TitleHeader(
              stringTitle: (index + 1).toString(),
              colorTitle: Colors.black,
            ),
          ),
          Expanded(
            flex: 1,
            child: TitleHeader(
              stringTitle:itemBl.sohopdong.toString(),
              colorTitle: Colors.black,
            ),
          ),
          Expanded(
            flex: 10,
            child: TitleHeader(
              stringTitle: itemBl.ghichu.toString(),
              colorTitle: Colors.black,
            ),
          ),
          Expanded(
            flex: 2,
            child: TitleHeader(
              stringTitle:itemBl.lichsuKhoitao!.hoten.toString(),
              colorTitle: Colors.black,
            ),
          ),
          Expanded(
            flex: 2,
            child: TitleHeader(
              stringTitle:"Ngày khoi tạo",
              colorTitle: Colors.black,
            ),
          ),

          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const Text('AlertDialog description'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          print("Cancel");
                          return Navigator.pop(context, 'Cancel');
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          print("remove"+itemBl.id.toString());

                          return Navigator.pop(context, 'OK');
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                child: Icon(Icons.close),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {},
  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content:
        Text("Would you like to continue learning how to use Flutter alerts?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
