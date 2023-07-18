import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../_shared/thietlap_ngonngu.dart';

class SplashLayout extends StatefulWidget {
  const SplashLayout({Key? key}) : super(key: const Key(pathName));

  static const pathName = 'splash';

  @override
  State<SplashLayout> createState() => _SplashLayoutState();
}

class _SplashLayoutState extends State<SplashLayout> {
  Timer? _timer;
  double fade = 0;

  _SplashLayoutState() {
    _timer = Timer(const Duration(seconds: 1), () {
      setState(() {
        fade = 1;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(172, 53, 75, 1),
      body: Stack(
        children: [
          const _SplashBGImages(),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1000),
              opacity: fade,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38.withOpacity(0.15),
                      blurRadius: 30.0,
                    ),
                  ],
                ),
                child: SvgPicture.asset('assets/images/logo_nina.svg'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 24.0),
              child: Text(
                ngonngu(context).app_copyright,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SplashBGImages extends StatefulWidget {
  const _SplashBGImages({Key? key}) : super(key: key);

  @override
  State<_SplashBGImages> createState() => _SplashBGImagesState();
}

class _SplashBGImagesState extends State<_SplashBGImages>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 120), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.repeat(reverse: false);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RotationTransition(
          turns: animation,
          child: FittedBox(
              fit: BoxFit.none,
              child: Image.asset(
                'assets/images/imgSplashScreen_TrongDong.png',
                color: Colors.white.withOpacity(0.2),
                colorBlendMode: BlendMode.modulate,
                width: 800,
                height: 800,
              )),
        ));
  }
}
