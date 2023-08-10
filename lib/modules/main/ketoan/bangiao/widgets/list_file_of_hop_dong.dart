
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/thietlap_url.dart';
import '../../../../../_shared/utils/helper.dart';
import '../../phieuthu/widgets/pt_button_download.dart';
import '../models/file_model.dart';
import '../providers/list_file_provider.dart';


class ListFileOfHopDong extends ConsumerWidget {
  const ListFileOfHopDong({Key? key,required this.soHopDong}) : super(key: key);

  final String soHopDong;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var a = ref.watch(futureListFileProvider(soHopDong));
    return Container(
      width: MediaQuery.of(context).size.width*0.5,
      height: 380,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
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
                            itemCount: (data.length),
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
            Expanded(flex: 10, child: PTButtonDownload(urlPath: '${ApiUrl.protocol}${ApiUrl.port}/${item.path!}', fileName: item.filename!, title: 'Tải về', icon: const Icon(Icons.download),)),
        ],
      ),
    );
  }
}
