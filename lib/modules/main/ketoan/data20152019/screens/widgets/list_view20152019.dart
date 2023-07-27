import 'package:flutter/material.dart';

import '../../../../../../_shared/mixins/mixin_listview_table/title_header.dart';
import '../../../phieuthu/widgets/pt_button.dart';
import '../view_detail_20152019_screen.dart';

class ListView20152019 extends StatelessWidget {
  const ListView20152019({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, index) {
            return itemRowListView20152019(index:index  ,);
          }),
    );
  }
}

class itemRowListView20152019 extends StatelessWidget {
    itemRowListView20152019({Key? key,required this.index}) : super(key: key);
   final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: (index % 2 == 0) ? Color(0xfff5f5f5) : Colors.white,
        border:const Border(
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
      child:Row(
        children: [
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:(index+1).toString(),colorTitle:Colors.black,),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"Mã HĐ",colorTitle:Colors.black,),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"	Số phiếu thu",colorTitle:Colors.black,),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"	Cty/Tên khách hàng",colorTitle:Colors.black,),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"Tên khách hàng",colorTitle:Colors.black,),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"Điện thoại ",colorTitle:Colors.black,),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"Email",colorTitle:Colors.black,),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"Ghi chú",colorTitle:Colors.black,),
          ),
          Expanded(
            flex:1,
              child:PtButton(width:150,icon:const Icon(Icons.remove_red_eye,color:Colors.white,size:19,),title:"Chi tiết", onPressed: (){
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return ViewDetail20152019Screen();
                  },
                );
              },
              )
          ),

        ],
      ),
    );
  }
}

