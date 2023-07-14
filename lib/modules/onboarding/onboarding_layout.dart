import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../_shared/app_config/data_box.dart';
import '../../_shared/thietlap_dieuhuong.dart';
import '../../core/utils/ndgap.dart';

class OnboardingLayout extends StatefulWidget {
  const OnboardingLayout({Key? key}) : super(key: const Key(pathName));

  static const pathName = 'onboarding';

  @override
  State<OnboardingLayout> createState() => _OnboardingLayoutState();
}

class _OnboardingLayoutState extends State<OnboardingLayout> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<Widget> _pages = const [
    OnboardingPage(
      image: 'assets/images/onboarding/web-design.png',
      title: 'DỊCH VỤ THIẾT KẾ WEBSITE',
      description:
          'Xây dựng thương hiệu, nâng cao giá trị uy tín thương hiệu luôn là mục tiêu hàng đầu trong bản kế hoạch marketing của mỗi công ty. NINA luôn đổi mới bằng những công nghệ tiên tiến nhất hiện nay, chúng tôi cam kết mang đến các sản phẩm và dịch vụ với trải nghiệm tốt nhất tới Quý khách hàng.',
    ),
    OnboardingPage(
      image: 'assets/images/onboarding/hosting.png',
      title: 'DỊCH VỤ CUNG CẤP HOSTING',
      description:
          'Hosting là nơi lưu trữ tất cả thông tin và hình ảnh để Website hay Ứng dụng của bạn có thể hoạt động và tiếp cận với khách hàng trên mạng Internet.',
    ),
    OnboardingPage(
      image: 'assets/images/onboarding/domain.png',
      title: 'DỊCH VỤ CUNG CẤP DOMAIN',
      description:
          'Domain là tên để khách hàng có thể tìm kiếm và tiếp cận thông tin, sản phẩm và dịch vụ của Doanh nghiệp bạn trên mạng Internet.',
    ),
    OnboardingPage(
      image: 'assets/images/onboarding/app-design.png',
      title: 'THIẾT KẾ & XÂY DỰNG\nMOBILE APP',
      description:
          'Với tốc độ phát triển công nghệ như ngày nay, việc xây dựng ứng dụng di động cho doanh nghiệp của bạn là giải pháp nên được ưu tiên phát triển.\nĐiều đó giúp Doanh Nghiệp của bạn tiếp cận đến nhiều khách hàng hơn.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return _pages[index];
            },
          ),
          Positioned(
            bottom: 50.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage != 0)
                  TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: const Text('Previous'),
                  ),
                if (_currentPage != _pages.length - 1)
                  TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: const Text('Next'),
                  ),
                if (_currentPage == _pages.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      // Thực hiện hành động khi người dùng hoàn thành onboarding
                      context.go(pathHome);
                      DataBox().boxUpdateOnBoarding(onBoardingLoaded: true);
                    },
                    child: const Text('Get Started'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 200.0,
          ),
          ndGapH24(),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          ndGapH8(),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
