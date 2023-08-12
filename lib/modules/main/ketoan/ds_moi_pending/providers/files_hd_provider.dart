import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/file_model.dart';
import '../repositories/media_repository.dart';

class FileHDModel {
  final String? loaiFile;
  final PlatformFile? fileUpload;
  final String? ghiChu;

  FileHDModel({
    this.loaiFile,
    this.fileUpload,
    this.ghiChu,
  });

  copyWith({
    String? loaiFile,
    PlatformFile? fileUpload,
    String? ghiChu,
  }) {
    return FileHDModel(
      loaiFile: loaiFile ?? this.loaiFile,
      fileUpload: fileUpload ?? this.fileUpload,
      ghiChu: ghiChu ?? this.ghiChu,
    );
  }

  @override
  String toString() {
    return 'Loại File: $loaiFile - Tên File: ${fileUpload?.name} - path: ${fileUpload?.path} - Ghi chú: $ghiChu';
  }
}

class FileHDState {
  final FileHDModel? fileHDModel;
  final List<FileModel> danhSachFile;
  final int totalRow;
  final int currentPage;
  final int pageSize;
  bool loading;

  FileHDState({
    this.fileHDModel,
    this.danhSachFile = const [],
    this.totalRow = 0,
    this.currentPage = 1,
    this.pageSize = 100,
    this.loading = false,
  });

  FileHDState copyWith({
    FileHDModel? fileHDModel,
    int? totalRow,
    int? currentPage,
    int? pageSize,
    List<FileModel>? danhSachFile,
    bool? loading,
  }) {
    return FileHDState(
      fileHDModel: fileHDModel ?? this.fileHDModel,
      totalRow: totalRow ?? this.totalRow,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      danhSachFile: danhSachFile ?? this.danhSachFile,
      loading: loading ?? this.loading,
    );
  }
}

final danhSachHDProvider = NotifierProvider<FileHDNotifier, FileHDState>(() {
  return FileHDNotifier();
});

class FileHDNotifier extends Notifier<FileHDState> {
  final MediaRepository _mediaRepository = MediaRepository();

  @override
  FileHDState build() {
    return FileHDState(fileHDModel: FileHDModel());
  }

  changeLoai(String loai) {
    final fileHD = state.fileHDModel?.copyWith(loaiFile: loai);
    state = state.copyWith(fileHDModel: fileHD);
  }

  changeGhiChu(String ghichu) {
    final fileHD = state.fileHDModel?.copyWith(ghiChu: ghichu);
    state = state.copyWith(fileHDModel: fileHD);
  }

  changeFile({required PlatformFile file}) {
    final fileHD = state.fileHDModel?.copyWith(fileUpload: file);
    state = state.copyWith(fileHDModel: fileHD);
  }

  layDanhSachFile({required String soHopDong}) async {
    state = state.copyWith(loading: true);
    final result = await _mediaRepository.layDanhSach(
        soHopDong: soHopDong, pageSize: state.pageSize);
    if (result['totalRow'] > 0) {
      final List<FileModel> data = result['data'];
      state = state.copyWith(totalRow: result['totalRow'], danhSachFile: data, loading: false);
    } else {
      state = state.copyWith(totalRow: 0, danhSachFile: [], loading: false);
    }
  }

  luuFile({required String soHopDong}) async {
    final fileHD = state.fileHDModel;
    bool kq = false;
    if (fileHD!=null && fileHD.fileUpload?.path != null) {
      kq = await _mediaRepository.updateFile(
          fileHDModel: fileHD,
          soHopDong: soHopDong);
    }
    layDanhSachFile(soHopDong: soHopDong);
    return kq;
  }

  xoaFile({required String id}){
    final List<FileModel> danhSachMoi= state.danhSachFile.where((element) => element.id.toString()!=id).toList();
    state = state.copyWith(danhSachFile: danhSachMoi);
  }

  clear() {
    state = state.copyWith(fileHDModel: FileHDModel());
  }
}