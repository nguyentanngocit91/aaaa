import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/file_model.dart';
import '../repositories/media_repository.dart';

class FileHDModel {
  final String? loaiFile;
  final PlatformFile? fileUpload;
  final String? ghiChu;
  final List<FileModel> danhSachFile;
  final int totalRow;
  final int currentPage;
  final int pageSize;

  FileHDModel(
      {this.totalRow = 0,
        this.currentPage = 1,
        this.pageSize = 100,
        this.loaiFile,
      this.fileUpload,
      this.ghiChu,
      this.danhSachFile = const []});

  copyWith({
    int? totalRow,
    int? currentPage,
    int? pageSize,
    String? loaiFile,
    PlatformFile? fileUpload,
    String? ghiChu,
    List<FileModel>? danhSachFile,
  }) {
    return FileHDModel(
      totalRow: totalRow ?? this.totalRow,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      loaiFile: loaiFile ?? this.loaiFile,
      fileUpload: fileUpload ?? this.fileUpload,
      ghiChu: ghiChu ?? this.ghiChu,
      danhSachFile: danhSachFile ?? this.danhSachFile,
    );
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
  final MediaRepository _mediaRepository = MediaRepository();

  @override
  FileHDModel build() {
    return FileHDModel();
  }

  layDanhSachFile({required String soHopDong}) async{
    final result = await _mediaRepository.layDanhSach(soHopDong: soHopDong, pageSize: state.pageSize);
    if(result['totalRow'] > 0){
      final List<FileModel> data = result['data'];
      state = state.copyWith(
          totalRow: result['totalRow'], danhSachFile: data);
    }else{
      state = state.copyWith(
          totalRow: 0, danhSachFile: []);
    }
  }

  changeLoai(String loai) {
    state = state.copyWith(loaiFile: loai);
  }

  changeGhiChu(String ghichu) {
    state = state.copyWith(ghiChu: ghichu);
  }

  changeFile({required PlatformFile file}) {
    state = state.copyWith(fileUpload: file);
  }

  clear() {
    state = FileHDModel();
  }
}
