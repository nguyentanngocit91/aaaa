import 'package:flutter/material.dart';

import '../../../../../../_shared/mixins/mixin_listview_table/title_header.dart';
class Row20152019HeardeWidget extends StatelessWidget {
  const Row20152019HeardeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
        children: [
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"#",),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"Mã HĐ",),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"	Số phiếu thu",),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"	Cty/Tên khách hàng",),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"Tên khách hàng",),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"Điện thoại ",),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"Email",),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"Ghi chú",),
          ),
          Expanded(
            flex:1,
            child:TitleHeader(stringTitle:"	Thao tác",),
          ),

        ],
      ),
    );
  }
}


