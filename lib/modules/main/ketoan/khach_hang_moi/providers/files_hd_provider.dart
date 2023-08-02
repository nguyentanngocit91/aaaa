import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoaiFileHD { hopDong, chungTuKhac }

class FileHDModel {
  final LoaiFileHD? loaiFile;
  final String? tenFile;
  final String? pathFile;
  final String? ghiChu;

  FileHDModel({this.loaiFile, this.tenFile, this.pathFile, this.ghiChu});

  copyWith(
      {LoaiFileHD? loaiFile,
      String? tenFile,
      String? pathFile,
      String? ghiChu}) {
    return FileHDModel(
        loaiFile: loaiFile ?? this.loaiFile,
        tenFile: tenFile ?? this.tenFile,
        pathFile: pathFile ?? this.pathFile,
        ghiChu: ghiChu ?? this.ghiChu);
  }

  @override
  String toString() {
    return 'Loại File: $loaiFile - Tên File: $tenFile - path: $pathFile - Ghi chú: $ghiChu';
  }
}

final fileHDProvider = NotifierProvider<FileHDNotifier, List<FileHDModel>>(() {
  return FileHDNotifier();
});

class FileHDNotifier extends Notifier<List<FileHDModel>> {
  @override
  List<FileHDModel> build() {
    return [];
  }

  addFile({required FileHDModel fileHD}) {
    state = [
      for (var file in state)
        if (file.tenFile == fileHD.tenFile) fileHD else file
    ];
  }

  removeFile({required String tenFile}) {
    state = [
      for (var file in state)
        if (file.tenFile != tenFile) file
    ];
  }

  clear() {
    state = [];
  }
}
