
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/file_model.dart';
import '../providers/list_file_provider.dart';


class ListFileOfHopDong extends ConsumerWidget {
  const ListFileOfHopDong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var a = ref.watch(futureListFileProvider('00000001'));
    return Container(
      width: 800,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(

        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Danh sách file'.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Color(0xFF105a6c),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('#',style: TextStyle(color: Colors.white),),
                      ),
                      Expanded(flex: 30, child: Text('Loại file',style: TextStyle(color: Colors.white),),),
                      Expanded(flex: 30, child: Text('Ghi chú',style: TextStyle(color: Colors.white),),),
                      Expanded(flex: 10, child: Text('',style: TextStyle(color: Colors.white),),)
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: a.when(
                    data: (List<FileModel>? data) {
                      if (data != null) {
                        return ListView.builder(
                            padding: const EdgeInsets.all(0),
                            primary: true,
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, index) {
                              return ItemInfoFile(item:data[index],index: index,);
                            });
                      } else {
                        return const Center(
                          child: Text('Data not found'),
                        );
                      }
                    },
                    error: (error, stackTrace) {
                      return const Text('Có lỗi xảy ra');
                    },
                    loading: () => const CircularProgressIndicator(),
                  ),
                ),


                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'Thoát',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemInfoFile extends StatelessWidget {
  const ItemInfoFile({
    super.key, required this.item, required this.index
  });

  final FileModel item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text('${index+1}'),
          ),
          Expanded(
            flex: 30,
            child: (item.loaifile=='hopdong')?Text('Hợp đồng'):Text('Chứng từ khác'),
          ),
          Expanded(
            flex: 30,
            child: Text('${item?.ghichu}'),
          ),
          Expanded(flex: 10, child: Text('Xem file')),
        ],
      ),
    );
  }
}
