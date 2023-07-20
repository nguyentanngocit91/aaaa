import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/auth/providers/auth_provider.dart';
import '../../../../../../_shared/utils/form_status.dart';
part 'signin_state.dart';

final signInProvider = NotifierProvider<SignInNotifier, SignInState>(() {
  return SignInNotifier();
});

class SignInNotifier extends Notifier<SignInState> {

  @override
  SignInState build() {
    return const SignInState();
  }

  void onUsernameChange(String value) {
    state = state.copyWith(
      username: value,
    );
  }

  void onPasswordChange(String value) {
    state = state.copyWith(
      password: value,
    );
  }

  void signIn() async {
    state = state.copyWith(status: FormStatus.submissionInProgress);
    final jsonResult = await ref.read(authProvider.notifier).signIn(data: {'username':state.username,'password':state.password});
    if(jsonResult['userSignIn']!=null){
      state = state.copyWith(status: FormStatus.submissionSuccess, errorMessage: '');
    }else{
      state = state.copyWith(status: FormStatus.submissionFailure, errorMessage: jsonResult['message']);
    }
  }

}
