import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FileHDModel {
  final String? loaiFile;
  final PlatformFile? fileUpload;
  final String? ghiChu;

  FileHDModel({this.loaiFile, this.fileUpload, this.ghiChu});

  copyWith(
      {String? loaiFile,
        PlatformFile? fileUpload,
      String? ghiChu}) {
    return FileHDModel(
        loaiFile: loaiFile ?? this.loaiFile,
        fileUpload: fileUpload ?? this.fileUpload,
        ghiChu: ghiChu ?? this.ghiChu);
  }

  @override
  String toString() {
    return 'Loại File: $loaiFile - Tên File: ${fileUpload?.name} - path: ${fileUpload?.path} - Ghi chú: $ghiChu';
  }
}

final fileHDProvider = NotifierProvider<FileHDNotifier, FileHDModel>(() {
  return FileHDNotifier();
});

class FileHDNotifier extends Notifier<FileHDModel> {
  @override
  FileHDModel build() {
    return FileHDModel();
  }

  changeLoai(String loai){
    state = state.copyWith(loaiFile: loai);
  }

  changeGhiChu(String ghichu){
    state = state.copyWith(ghiChu: ghichu);
  }

  changeFile({required PlatformFile file}){
    state = state.copyWith(fileUpload: file);
  }

  clear(){
    state = FileHDModel();
  }
}
