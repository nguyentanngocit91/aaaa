import 'package:go_router/go_router.dart';

import 'screens/signin_screen.dart';
import 'package:flutter/material.dart';

class SignInLayout extends StatelessWidget {
  const SignInLayout({Key? key}) : super(key: const Key(pathName));

  static const String pathName = 'dang-nhap';

  @override
  Widget build(BuildContext context) {
    return const SignInScreen();
  }
}
