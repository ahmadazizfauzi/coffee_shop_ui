import 'package:coffee/view/bottom_bar/bottom_bar_route.dart';
import 'package:coffee/view/screens/delivery/delivery_screen.dart';
import 'package:coffee/view/screens/detail/detail_coffee_screen.dart';
import 'package:coffee/view/screens/order/order_screen.dart';
import 'package:coffee/view/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee/model/data/data_coffee.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Coffee',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.soraTextTheme(),
        primaryTextTheme: GoogleFonts.soraTextTheme(),
      ),
      initialRoute: '/welcome',
      defaultTransition: Transition.leftToRight,
      popGesture: true,
      getPages: [
        GetPage(
          name: '/bottombar',
          page: () => const BottomBarRoute(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/welcome',
          page: () => const WelcomeScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/detail_coffee',
          page: () => DetailCoffeeScreen(
            coffee: Get.arguments as Coffee,
          ),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/order',
          page: () => OrderScreen(
            coffee: Get.arguments as Coffee,
          ),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/delivery',
          page: () => const DeliveryScreen(),
          transition: Transition.downToUp,
          transitionDuration: const Duration(milliseconds: 500),
        ),
      ],
    );
  }
}
