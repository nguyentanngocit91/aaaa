import 'package:flutter/material.dart';

import '../../_shared/thietlap_dieuhuong.dart';
import 'header_layout.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key, required this.child}) : super(key: const Key(pathName));

  final Widget child;
  static const String pathName = '/';

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: 280,
              height: MediaQuery.of(context).size.height,
              color: Theme.of(context).primaryColor,
              child: MenuLayout(),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const HeaderLayout(),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: widget.child,
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}