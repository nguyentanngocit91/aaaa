part of 'signin_provider.dart';

class SignInState{
  final String? username;
  final String? password;
  final FormStatus status;
  final String? errorMessage;

  const SignInState({
    this.username = '',
    this.password = '',
    this.status = FormStatus.pure,
    this.errorMessage = '',
  });

  SignInState copyWith({
    String? username,
    String? password,
    FormStatus? status,
    String? errorMessage,
  }) {
    return SignInState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
