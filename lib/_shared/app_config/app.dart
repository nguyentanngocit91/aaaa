import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/auth/providers/auth_provider.dart';
import '../../core/auth/repositories/auth_repository.dart';
import '../../core/services/dio_client.dart';
import 'data_box.dart';

class App{
  static final ProviderContainer providerContainer = ProviderContainer();
  static DioClient dioClient = DioClient(Dio());

  static setup() async{
    await DataBox().khoiTaoDuLieu();
    await _initData();
  }

  static _initData() async{
    final String? token = await providerContainer.read(authRepositoryProvider).setup();
    dioClient.initOptions();
    await providerContainer.read(authProvider.notifier).checkSignIn();
  }
}