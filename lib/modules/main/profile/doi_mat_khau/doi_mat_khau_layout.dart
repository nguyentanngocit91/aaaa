import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/auth/providers/auth_provider.dart';
import '../../../../_shared/utils/form_status.dart';
import '../../../../_shared/utils/helper.dart';
import 'providers/doi_mat_khau_provider.dart';

final GlobalKey<FormState> _keyForm = GlobalKey();
String _matKhauMoi = '';

class DoiMatKhauLayout extends StatelessWidget {
  const DoiMatKhauLayout() : super(key: const Key(pathName));

  static const String pathName = 'doi-mat-khau';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          constraints: const BoxConstraints(maxWidth: 500),
          child: const _FormDoiMatKhau(),
        ),
      ),
    );
  }
}

class _FormDoiMatKhau extends ConsumerWidget {
  const _FormDoiMatKhau({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(doimatKhauProvider, (previous, next) {
      if (previous?.formStatus != next.formStatus) {
        if (next.formStatus == FormStatus.submissionInProgress) {
          Loading(context).start();
        }
        if (next.formStatus == FormStatus.submissionSuccess) {
          Loading(context).stop();
          _keyForm.currentState?.reset();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Thông Báo'),
                content: const Text('Mật khẩu đã được cập nhật. Vui lòng đăng nhập lại.'),
                actions: [
                  FilledButton(
                      onPressed: () {
                        context.pop();
                        ref.read(authProvider.notifier).signOut();
                      },
                      child: Text('Đã hiểu'))
                ],
              );
            },
          );
        }
        if (next.formStatus == FormStatus.submissionFailure) {
          Loading(context).stop();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Thông Báo'),
                content: Text(next.message.toString()),
                actions: [
                  FilledButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text('OK'))
                ],
              );
            },
          );
        }
      }
    });
    return Form(
      key: _keyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Đổi mật khẩu'.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 25,
          ),
          const _InputMatKhauCu(),
          const SizedBox(
            height: 15,
          ),
          const _InputMatKhauMoi(),
          const SizedBox(
            height: 15,
          ),
          const _InputReMatKhauMoi(),
          const SizedBox(
            height: 25,
          ),
          const _BtnSubmit(),
        ],
      ),
    );
  }
}

class _InputMatKhauCu extends ConsumerStatefulWidget {
  const _InputMatKhauCu({super.key});

  @override
  ConsumerState createState() => __InputMatKhauCuState();
}

class __InputMatKhauCuState extends ConsumerState<_InputMatKhauCu> {
  bool hiddenPass = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Mật khẩu cũ',
          prefixIcon: const Icon(Icons.key),
          suffixIcon: GestureDetector(
            child: Icon(hiddenPass ? Icons.visibility : Icons.visibility_off),
            onTap: () {
              setState(() {
                hiddenPass = !hiddenPass;
              });
            },
          )),
      obscureText: hiddenPass,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'Vui lòng không để trống.'),
      ]),
      onChanged: (value) {
        ref.read(doimatKhauProvider.notifier).capNhatMatKhauCu(value);
      },
      onFieldSubmitted: (value) {
        _submitForm(ref);
      },
    );
  }
}

class _InputMatKhauMoi extends ConsumerStatefulWidget {
  const _InputMatKhauMoi({super.key});

  @override
  ConsumerState createState() => __InputMatKhauMoiState();
}

class __InputMatKhauMoiState extends ConsumerState<_InputMatKhauMoi> {
  bool hiddenPass = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Mật khẩu mới',
          prefixIcon: const Icon(Icons.key),
          suffixIcon: GestureDetector(
            child: Icon(hiddenPass ? Icons.visibility : Icons.visibility_off),
            onTap: () {
              setState(() {
                hiddenPass = !hiddenPass;
              });
            },
          )),
      obscureText: hiddenPass,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'Vui lòng không để trống.'),
      ]),
      onChanged: (value) {
        _matKhauMoi = value;
        ref.read(doimatKhauProvider.notifier).capNhatMatKhauMoi(value);
      },
      onFieldSubmitted: (value) {
        _submitForm(ref);
      },
    );
  }
}

class _InputReMatKhauMoi extends ConsumerStatefulWidget {
  const _InputReMatKhauMoi({super.key});

  @override
  ConsumerState createState() => __InputReMatKhauMoiState();
}

class __InputReMatKhauMoiState extends ConsumerState<_InputReMatKhauMoi> {
  bool hiddenPass = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Nhập lại mật khẩu mới',
          prefixIcon: const Icon(Icons.key),
          suffixIcon: GestureDetector(
            child: Icon(hiddenPass ? Icons.visibility : Icons.visibility_off),
            onTap: () {
              setState(() {
                hiddenPass = !hiddenPass;
              });
            },
          )),
      obscureText: hiddenPass,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'Vui lòng không để trống.'),
        (val) {
          if (val != _matKhauMoi) return 'Nhập lại mật khẩu mới không đúng.';
          return null;
        }
      ]),
      onFieldSubmitted: (value) {
        _submitForm(ref);
      },
    );
  }
}

class _BtnSubmit extends ConsumerWidget {
  const _BtnSubmit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () {
        _submitForm(ref);
      },
      child: const Text('Cập nhật'),
    );
  }
}

_submitForm(WidgetRef ref) {
  if (_keyForm.currentState?.validate() == true) {
    _keyForm.currentState?.save();
    ref.read(doimatKhauProvider.notifier).capNhatLaiMatKhau();
  }
}
