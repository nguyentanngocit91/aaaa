import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/file_model.dart';
import '../repositories/ban_giao_repository.dart';

final BanGiaoRepository _bangiaoRepository = BanGiaoRepository();

final futureListFileProvider = FutureProvider.autoDispose.family<List<FileModel>?, String>((ref, soHD) async {
  final List<FileModel> list = [];
  final response = await _bangiaoRepository.getListFileBySoHD(soHD: soHD);
  print(soHD);
  if (response != null) {
    for (var json in response['data']) {
      list.add(FileModel.fromJson(json));
    }
    return list;
  }
  return list;
});