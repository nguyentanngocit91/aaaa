import 'package:flutter/material.dart';
import '../../../../_shared/utils/ndgap.dart';
import 'models/domain_model.dart';
import 'widgets/box_search.dart';

class DanhSachDomainMoiKy extends StatelessWidget {
  const DanhSachDomainMoiKy({Key? key}) : super(key: const Key(pathName));
  static const String pathName = 'danhsachdomainmoi';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BoxSearchDomain(),
          ndGapH12(),
          Container(
            padding: const EdgeInsets.only(top: 5,bottom: 5),
            decoration: const BoxDecoration(
              color: Color(0xFF105A6C),
              border: Border(bottom: BorderSide(color: Color(0xFFFFC107),width: 2))
            ),
            child: const Row(
              children: [
                Expanded(flex: 3, child: HeaderRowItem(text: '#')),
                Expanded(
                  flex: 10,
                  child: HeaderRowItem(text: 'Số hợp đồng'),
                ),
                Expanded(
                  flex: 57,
                  child: HeaderRowItem(text: 'Domain'),
                ),
                Expanded(
                  flex: 10,
                  child: HeaderRowItem(text: 'Ngày ký'),
                ),
                Expanded(
                  flex: 10,
                  child: HeaderRowItem(text: 'Số năm'),
                ),
                Expanded(
                  flex: 10,
                  child: HeaderRowItem(text: 'Thao tác'),
                ),
              ],
            ),
          ),

          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context,index){
            return RowInfoDomain(index: index+1, item: DomainModel(sohopdong:'0001',tenmien: 'nina.com',ngaydangky: '28-07-2023',sonamdangky: 2 ),);
          })
        ],
      ),
    );
  }
}


class RowInfoDomain extends StatelessWidget {
  const RowInfoDomain({Key? key,  required this.index,required this.item}) : super(key: key);

  final int index;
  final DomainModel item;

  @override
  Widget build(BuildContext context) {
    String? domain = item.tenmien;
    int? soNam = item.sonamdangky;
    String? soHD  = item.sohopdong;
    String? ngayKy = item.ngaydangky;
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      decoration:  BoxDecoration(
        border: const Border(bottom: BorderSide(color: Color(0xFFdee2e6))),
        color: (index%2==0)?Colors.transparent:Colors.black.withOpacity(0.05),
      ),
      child: Row(
         children: [
           Expanded(flex:3,child: Text('$index',textAlign:TextAlign.center,),),
           Expanded(flex:10,child: (soHD!=null)?Text(soHD,textAlign:TextAlign.center,):const Text('-',textAlign:TextAlign.center,),),
           Expanded(flex:57,child: Container(child: (domain!=null)?Text(domain,textAlign:TextAlign.center,):const Text('-',textAlign:TextAlign.center,),),),
           Expanded(flex:10,child: (ngayKy!=null)?Text(ngayKy,textAlign:TextAlign.center,):const Text('-',textAlign:TextAlign.center,),),
           Expanded(flex:10,child: (soNam!=null)?Text('$soNam',textAlign:TextAlign.center,):const Text('-',textAlign:TextAlign.center,),),
            Expanded(flex:10,child: Row(
             children: [
               FilledButton.icon(
                 onPressed: () {

                 },
                 style: TextButton.styleFrom(
                   backgroundColor: Colors.green
                 ),
                 icon: const Icon(Icons.app_registration),
                 label: const Text('Đăng ký'),
               ),
             ],
           ))

         ],
      ),
    );
  }
}

class HeaderRowItem extends StatelessWidget {
  const HeaderRowItem({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Color(0xFF105A6C),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),textAlign:TextAlign.center,
      ),
    );
  }
}
