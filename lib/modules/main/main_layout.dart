import 'package:flutter/material.dart';

import 'header_layout.dart';
import 'menu_layout.dart';


class MainLayout extends StatefulWidget {
  const MainLayout({Key? key, required this.child}) : super(key: const Key(pathName));

  final Widget child;
  static const String pathName = '/';

  static toggle(){
    _MainLayoutState().toggleMenu();
  }

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  double widthMenu = 280;

  toggleMenu(){
    print('xxx');
    double newWidth = widthMenu;
    if(widthMenu==280){
      newWidth = 0;
    }else{
      newWidth = 280;
    }
    setState(() {
      widthMenu = newWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: widthMenu,
              height: MediaQuery.of(context).size.height,
              color: Theme.of(context).primaryColor,
              child: const MenuLayout(),
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