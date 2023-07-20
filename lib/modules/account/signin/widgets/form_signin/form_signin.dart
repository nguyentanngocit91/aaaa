import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import '../../../../../_shared/thietlap_dieuhuong.dart';
import '../../../../../_shared/utils/form_status.dart';
import '../../../../../_shared/utils/helper.dart';
import 'provider/signin_provider.dart';

final GlobalKey<FormState> _keyForm = GlobalKey();

class FormSignIn extends ConsumerWidget {
  const FormSignIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(signInProvider, (previous, next) {
      if(previous?.status != next.status){
        if (next.status == FormStatus.submissionInProgress) {
          Loading(context).start();
        }
        if (next.status == FormStatus.submissionSuccess || next.status == FormStatus.submissionCanceled) {
          Loading(context).stop();
          context.go(pathHome);
        }
        if (next.status == FormStatus.submissionFailure) {
          Loading(context).stop();
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: const Text('Thông báo'),
              content: Text(next.errorMessage.toString()),
              actions: [
                FilledButton(onPressed: (){context.pop();}, child: const Text('OK'))
              ],
            );
          },);
          // không thành công
        }
      }
    });
    return Form(
      key: _keyForm,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo_nina.png', height: 100, fit: BoxFit.fitHeight,),
          const SizedBox(height: 35),
          const _UserInput(),
          const SizedBox(height: 20),
          const _PasswordInput(),
          const SizedBox(height: 35),
          const Align(
            child: _BtnLogin(),
          ),
        ],
      ),
    );
  }
}

class _UserInput extends ConsumerWidget {
  const _UserInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Tên đăng nhập',
        prefixIcon: Icon(Icons.person),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'Vui lòng không để trống.'),
      ]),
      onChanged: (value) {
        ref.read(signInProvider.notifier).onUsernameChange(value);
      },
      onFieldSubmitted: (value) {
        _submitForm(ref);
      },
    );
  }
}

class _PasswordInput extends ConsumerStatefulWidget {
  const _PasswordInput({super.key});

  @override
  ConsumerState createState() => __PasswordInputState();
}

class __PasswordInputState extends ConsumerState<_PasswordInput> {
  bool hiddenPass = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Mật khẩu',
          prefixIcon: const Icon(Icons.key),
          suffixIcon: GestureDetector(
            child: Icon(hiddenPass ? Icons.visibility : Icons.visibility_off),
            onTap: (){
              setState(() {
                hiddenPass = !hiddenPass;
              });
            },
          )
      ),
      obscureText: hiddenPass,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'Vui lòng không để trống.'),
      ]),
      onChanged: (value) {
        ref.read(signInProvider.notifier).onPasswordChange(value);
      },
      onFieldSubmitted: (value) {
        _submitForm(ref);
      },
    );
  }
}

class _BtnLogin extends ConsumerWidget {
  const _BtnLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.icon(
      onPressed: () {
        _submitForm(ref);
      },
      icon: const Icon(Icons.login),
      label: const Text('Đăng nhập'),
    );
  }
}

_submitForm(WidgetRef ref){
  if(_keyForm.currentState?.validate()==true){
    ref.read(signInProvider.notifier).signIn();
  }
}