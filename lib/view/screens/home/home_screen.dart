import 'package:coffee/view/widgets/non_reusable/home/list_card_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:coffee/view/widgets/non_reusable/home/top_banner_home_widget.dart';
import 'package:coffee/view/widgets/non_reusable/home/navigation_home_widget.dart';
import 'package:coffee/model/constant/app_color.dart';
import 'package:coffee/controllers/ui/home/home_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: Consumer<HomeController>(
        builder: (context, controller, _) => Scaffold(
          backgroundColor: AppColor.color_f9f9f9,
          body: SingleChildScrollView(
            child: Column(
              children: [
                TopBannerHomeWidget(
                  onSearch: controller.handleSearch,
                ),
                const SizedBox(height: 95),
                NavigationHomeWidget(
                ),
                const SizedBox(height: 16),
                ListCardHomeWidget(
                  coffeeList: controller.coffeeList,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
