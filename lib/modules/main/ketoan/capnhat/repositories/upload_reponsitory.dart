import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';

class UploadRepository {
  uploadFile(
      {required String sohopdong,
      required String loaifile,
      required String ghichu,
      required PlatformFile file}) async {
    String fileName = file.path!.split('/').last;
    FormData formData = FormData.fromMap({
      "files": [
        await MultipartFile.fromFile(file.path!, filename: fileName),
      ],
      'loaimedia': 'hopdong',
      'sohopdong': sohopdong,
      'loaifile': loaifile,
      'ghichu': ghichu,
    });
    final response =
        await App.dioClient.post("${ApiUrl.uploadFile}", data: formData);
    var result = {"status": false, "message": "Server error"};

    if (response.statusCode == 200) {
      final res = response.data;
      result['status'] = res['success'];
      result['message'] = res['message'];
    }
    return result;
  }
}
