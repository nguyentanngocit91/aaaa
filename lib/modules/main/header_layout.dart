import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../core/auth/providers/auth_provider.dart';
import 'profile/doi_mat_khau/doi_mat_khau_layout.dart';

class HeaderLayout extends ConsumerWidget {
  const HeaderLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      height: 50,
      color: Theme.of(context).secondaryHeaderColor,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){

            },
            child: const Icon(Icons.menu),
          ),
          const SizedBox(width: 20,),
          Expanded(child: Text('Welcome'.toUpperCase(), style: Theme.of(context).textTheme.titleSmall),),
          PopupMenuButton<int>(
            tooltip: '',
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.key, size: 16,),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Đổi mật khẩu")
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 3,
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.rightFromBracket, size: 16,),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Đăng xuất")
                  ],
                ),
              ),
            ],
            offset: const Offset(0, 35),
            onSelected: (value) {
              if(value==1){
                context.go('/${DoiMatKhauLayout.pathName}');
              }
              if(value==3){
                ref.read(authProvider.notifier).signOut();
              }
            },
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.user,size: 16,),
                SizedBox(width: 7,),
                Text('Tài khoản'),
                SizedBox(width: 7,),
                FaIcon(FontAwesomeIcons.angleDown, size: 12,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
