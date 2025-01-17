import 'package:coffee/model/constant/app_color.dart';
import 'package:coffee/view/screens/cart/cart_screen.dart';
import 'package:coffee/view/screens/favorite/favorite_screen.dart';
import 'package:coffee/view/screens/home/home_screen.dart';
import 'package:coffee/view/screens/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:coffee/model/data/data_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarRoute extends StatefulWidget {
  const BottomBarRoute({super.key});

  @override
  State<BottomBarRoute> createState() => _BottomBarRouteState();
}

class _BottomBarRouteState extends State<BottomBarRoute> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const NotificationScreen(),
  ];

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: 99,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.primaryBrown,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            _buildNavItem(0, DataIcon.home),
            _buildNavItem(1, DataIcon.favorite),
            _buildNavItem(2, DataIcon.cart),
            _buildNavItem(3, DataIcon.notification),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(int index, String icon) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                _selectedIndex == index ? AppColor.primaryBrown : Colors.grey,
                BlendMode.srcIn,
              ),
              height: 24,
            ),
            const SizedBox(height: 4),
            if (_selectedIndex == index)
              SvgPicture.asset(
                DataIcon.dot,
                colorFilter: ColorFilter.mode(
                  AppColor.primaryBrown,
                  BlendMode.srcIn,
                ),
                height: 4,
              ),
          ],
        ),
      ),
      label: '',
    );
  }
}
