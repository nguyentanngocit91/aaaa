part of 'auth_provider.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  anonymous,
}

class AuthState{
  final AuthStatus authStatus;
  final UserModel? userLogin;
  final String? message;

  AuthState({this.authStatus = AuthStatus.unauthenticated, this.userLogin, this.message});

  copyWith({AuthStatus? authStatus, UserModel? userLogin, String? message}){
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      userLogin: userLogin ?? this.userLogin,
      message: message ?? this.message
    );
  }
}