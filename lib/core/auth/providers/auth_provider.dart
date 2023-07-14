import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../repositories/auth_repository.dart';

part 'auth_state.dart';

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});

class AuthNotifier extends Notifier<AuthState> {
  late final AuthRepository _authRepository;

  @override
  build() {
    _authRepository = ref.watch(authRepositoryProvider);
    return AuthState();
  }

  Future<Map> signIn({required Map<String,dynamic> data}) async {
    final Map result = await _authRepository.signIn(data: data);
    if(result['userSignIn']!=null){
      UserModel? user = await getInfoUser();
      if(user!=null){
        state = state.copyWith(authStatus: AuthStatus.authenticated, userLogin: user);
      }else{
        state = state.copyWith(authStatus: AuthStatus.unauthenticated, userLogin: null, message: null);
      }
    }else{
      state = state.copyWith(authStatus: AuthStatus.unauthenticated, userLogin: null, message: result['message']);
    }
    return result;
  }

  Future<UserModel?> getInfoUser() async {
    final UserModel? user = await _authRepository.getInfoUser();
    if(user!=null) startTokenCheck();
    print('token: ${_authRepository.token}');
    return user;
  }

  void checkSignIn() async {
    if(_authRepository.token != null){
      bool tokenIsValid = await _authRepository.tokenIsValid();
      UserModel? user = await getInfoUser();
      if(user!=null && tokenIsValid){
        state = state.copyWith(authStatus: AuthStatus.authenticated, userLogin: user);
      }else{
        state = state.copyWith(authStatus: AuthStatus.unauthenticated, userLogin: null, message: null);
      }
    }else{
      state = state.copyWith(authStatus: AuthStatus.unauthenticated, userLogin: null, message: null);
    }
  }

  void signOut(){
    _authRepository.clearData();
    state = state.copyWith(authStatus: AuthStatus.unauthenticated, userLogin: null, message: null);
  }

  void startTokenCheck() {
    if(_authRepository.token!=null){
      Future.delayed(const Duration(seconds: 7), () async {
        bool tokenIsValid = await _authRepository.tokenIsValid();
        if (tokenIsValid) {
          // Token hợp lệ, tiếp tục kiểm tra
          startTokenCheck();
        } else {
          // Token không hợp lệ thì đăng xuất
          signOut();
        }
      });
    }
  }
}
