import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../core/auth/providers/auth_provider.dart';
import 'dashboard/dashboard_layout.dart';
import 'ketoan/cap_ma_hd_layout.dart';

class MenuLayout extends ConsumerWidget {
  const MenuLayout({super.key});

  final Color _textColor = Colors.grey;
  final Color _iconColor = Colors.grey;
  static const double _fontSize = 14;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).shadowColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 40),
                child: Image.asset('assets/images/logo_nina.png', height: 80, fit: BoxFit.fitHeight,),
              ),
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: const Text('Dashboard', style: TextStyle(fontSize: _fontSize),),
                  textColor: _textColor,
                  iconColor: _iconColor,
                  onTap: (){
                    context.go('/${DashboardLayout.pathName}');
                  },
                ),
                ListTile(
                  leading: const FaIcon(FontAwesomeIcons.fileContract),
                  title: const Text('Cấp mã HĐ', style: TextStyle(fontSize: _fontSize),),
                  textColor: _textColor,
                  iconColor: _iconColor,
                  onTap: (){
                    context.go('/${CapMaHDLayout.pathName}');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
