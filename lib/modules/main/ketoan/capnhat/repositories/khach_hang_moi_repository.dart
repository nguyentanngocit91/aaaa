import 'package:dio/dio.dart';
import 'package:nn_phanmem/modules/main/ketoan/capnhat/repositories/upload_reponsitory.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';
import '../../../../../_shared/utils/helper.dart';
import '../providers/files_hd_provider.dart';

class KhachHangMoiRepository {
  final UploadRepository _uploadRepository = UploadRepository();

  Future<String?> capMaKhachhang() async {
    final Response response = await App.dioClient.get(ApiUrl.capMaKhachHang);

    if (response.statusCode == 200) {
      if (response.data['success'] == true) {
        return response.data['number'].toString();
      }
    }
    return null;
  }

  Future<String?> capSoHopDong() async {
    final Response response = await App.dioClient.get(ApiUrl.capMaHopDong);
    if (response.statusCode == 200) {
      if (response.data['success'] == true) {
        return response.data['number'].toString();
      }
    }
    return null;
  }

  Future<Map?> thongTinKhachHang({required String email, String? type}) async {
    final Response response = await App.dioClient
        .get('${ApiUrl.danhSachKhachHang}?email=$email$type');
    if (response.statusCode == 200) {
      if (response.data['success'] == true) {
        if (response.data['data'] != null) return response.data['data'];
        return null;
      }
    }
    return null;
  }

  Future<Map?> thongTinNhanVien({required String maNhanVien}) async {
    final Response response = await App.dioClient
        .get('${ApiUrl.danhSachNhanVien}?manhanvien=$maNhanVien');
    if (response.statusCode == 200) {
      if (response.data['success'] == true) {
        if ((response.data['data'] as List).isNotEmpty)
          return response.data['data'][0];
        return null;
      }
    }
    return null;
  }

  Future<bool> luuThongTinKhachHang({required Map? data}) async {
    final Response response =
        await App.dioClient.post(ApiUrl.danhSachKhachHang, data: data);
    if (response.statusCode == 200) {
      if (response.data['success'] == true && response.data['data'] != null)
        return true;
    }
    return false;
  }

  nangcapHD({required dynamic data}) async {
    Map resultResponse = {'status': false, 'msg': ''};
    List<String> resultMessenge = [];
    try {
      final customer = await App.dioClient
          .get("${ApiUrl.infoUpdateCustomer}${data['Web']['idkhachhang']}");
      final tmp = data;

      if (customer.statusCode == 200) {
        if (customer.data['success'] == false) {
          resultMessenge.add("Không lấy được thông tin khách hàng");
        } else {
          var customerData = customer.data['data'];

          final dataInsertHD = tmp['Web'];
          dataInsertHD['loaihopdong'] = "web";
          dataInsertHD['makhachhang'] = customerData['makhachhang'];
          dataInsertHD['manhanvien'] = tmp['PhieuThu']['manhanvien'];
          dataInsertHD['tongtien'] = int.tryParse(dataInsertHD['tongtien']
              .toString()
              .replaceAll(RegExp(r'[^0-9]'), ''));

          List uploadList = data['UploadList'];

          final Response response =
              await App.dioClient.post(ApiUrl.infoContract, data: dataInsertHD);
          if (response.statusCode == 200) {
            if (response.data['success'] == true) {
              var dataInsertPT = tmp['PhieuThu'];
              dataInsertPT['tongtien'] = int.tryParse(dataInsertPT['tongtien']
                  .toString()
                  .replaceAll(RegExp(r'[^0-9]'), ''));
              dataInsertPT['phitenmien'] = int.tryParse(dataInsertPT['phitenmien']
                  .toString()
                  .replaceAll(RegExp(r'[^0-9]'), ''));
              dataInsertPT['phiweb'] = int.tryParse(dataInsertPT['phiweb']
                  .toString()
                  .replaceAll(RegExp(r'[^0-9]'), ''));
              dataInsertPT['phivat'] = int.tryParse(dataInsertPT['phivat']
                  .toString()
                  .replaceAll(RegExp(r'[^0-9]'), ''));
              dataInsertPT['phinangcapweb'] = int.tryParse(
                  dataInsertPT['phinangcapweb']
                      .toString()
                      .replaceAll(RegExp(r'[^0-9]'), ''));

              final Response response2 = await App.dioClient.post(
                  '${ApiUrl.phieuThuMoiNC}${response.data['data']['_id']}',
                  data: dataInsertPT);

              if (response2.statusCode == 200) {

                if (response2.data['success'] == true) {
                  if (uploadList != null && uploadList.length > 0) {
                    for (var item in uploadList) {
                      var jsonResult = await _uploadRepository.uploadFile(
                          sohopdong: response.data['data']['sohopdong'],
                          ghichu: item['note'],
                          loaifile: item['type'],
                          file: item['file']);

                      if (jsonResult['success'] == false) {
                        resultMessenge.add(
                            "Lỗi upload file ${item['file'].path!.split('/').last}");
                      }
                    }
                  }
                } else {
                  resultMessenge.add("Không thêm được phiếu thu");
                }
              } else {
                resultMessenge.add("Không thêm được phiếu thu 2");
              }
            } else {
              resultMessenge.add("Không thêm được hợp đồng");
            }
          }
        }
      } else {
        resultMessenge.add("Không lấy được thông tin khách hàng");
      }
      resultResponse['msg'] = resultMessenge;
      resultResponse['status'] = resultMessenge.length > 0 ? false : true;
    } on Exception catch (exception) {
      resultResponse['msg'] = ["Lỗi hệ thống"];
      resultResponse['status'] = false;
    } catch (error) {
      resultResponse['msg'] = ["Lỗi hệ thống ${error.toString()}"];
      resultResponse['status'] = false;
    }
    return resultResponse;
  }

  Future<bool> updateFile(
      {required FileHDModel fileHDModel, required String soHopDong}) async {
    FormData formData = FormData.fromMap({
      "files": [
        await MultipartFile.fromFile(fileHDModel.fileUpload!.path!,
            filename: fileHDModel.fileUpload?.name)
      ],
      "sohopdong": soHopDong,
      "loaifile": fileHDModel.loaiFile ?? 'hopdong',
      "ghichu": fileHDModel.ghiChu,
      'loaimedia': 'khachhang',
    });
    final response =
        await App.dioClient.post(ApiUrl.uploadFile, data: formData);
    if (response.statusCode == 200) {
      if (response.data['success']) return true;
    }
    return false;
  }
}
