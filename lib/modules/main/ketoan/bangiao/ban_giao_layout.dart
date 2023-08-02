import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../_shared/utils/form_status.dart';
import 'models/ban_giao_model.dart';
import 'providers/ban_giao_provider.dart';
import 'widgets/header_list_hop_dong.dart';
import 'widgets/box_info_customer.dart';
import 'widgets/row_hop_dong.dart';
import 'widgets/box_search.dart';

class BanGiaoLayout extends ConsumerWidget {
  const BanGiaoLayout({Key? key}) : super(key: const Key(pathName));

  static const String pathName = 'bangiao';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<BanGiaoModel> listHD = ref.watch(banGiaoProvider).listHD;
    var statusForm = ref.watch(banGiaoProvider).status;

    return SingleChildScrollView(
      child: SelectionArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoxSearchBanGiao(),
            const SizedBox(
              height: 20,
            ),
            (listHD.isNotEmpty)
                ? Column(
                    children: [
                      Text(
                        'Thông tin khách hàng'.toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BoxInfoCustomer(
                        tenHD: (listHD[0].tenhopdong != null)
                            ? listHD[0].tenhopdong!
                            : '',
                        maKH: (listHD[0].khachhangId?.makhachhang != null)
                            ? listHD[0].khachhangId!.makhachhang!
                            : '',
                        nguoiDaiDien: (listHD[0].khachhangId?.hoten != null)
                            ? listHD[0].khachhangId!.hoten!
                            : '',
                        dienThoaiDiDong: (listHD[0].khachhangId?.phone != null)
                            ? listHD[0].khachhangId!.phone!
                            : '',
                        dienThoaiCoQuan: '',
                        email: (listHD[0].khachhangId?.email != null)
                            ? listHD[0].khachhangId!.email!
                            : '',
                        emailPhu: '',
                        daiDienMoi: '',
                        maSoThue: (listHD[0].khachhangId?.masothue != null)
                            ? listHD[0].khachhangId!.masothue!
                            : '',
                        cmnd: (listHD[0].khachhangId?.cccd != null)
                            ? listHD[0].khachhangId!.cccd!
                            : '',
                        diaChi: (listHD[0].khachhangId?.diachi != null)
                            ? listHD[0].khachhangId!.diachi!
                            : '',
                        ghiChu: '',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Thông tin hợp đồng'.toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: const Color(0xFFfbdfdf),
                        child: Column(
                          children: [
                            const HeaderListHopDong(),
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: listHD.length,
                                itemBuilder: (context, index) {
                                  return RowHopDong(
                                    index: index + 1,
                                    item: listHD[index],
                                  );
                                })
                          ],
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            (statusForm == FormStatus.submissionInProgress)
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
