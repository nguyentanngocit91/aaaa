import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState{
  final String? viTriHienTai;

  AppState({this.viTriHienTai});

  copyWith({String? tenViTriHienTai, String? viTriHienTai}){
    return AppState(
      viTriHienTai: viTriHienTai ?? this.viTriHienTai
    );
  }
}

final appProvider = NotifierProvider<AppNotifier, AppState>(() {
  return AppNotifier();
});


class AppNotifier extends Notifier<AppState> {
  @override
  AppState build() {
    return AppState();
  }

  capNhatViTriHienTai(String vitri){
    state = state.copyWith(viTriHienTai: vitri);
  }
}