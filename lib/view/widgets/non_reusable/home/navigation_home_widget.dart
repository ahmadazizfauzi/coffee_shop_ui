import 'package:coffee/model/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:coffee/controllers/ui/home/home_controller.dart';
import 'package:provider/provider.dart';

class NavigationHomeWidget extends StatelessWidget {
  const NavigationHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, _) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: controller.categories.asMap().entries.map((entry) {
            final index = entry.key;
            final category = entry.value.$1;

            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 24 : 12,
                right: index == controller.categories.length - 1 ? 24 : 0,
              ),
              child: NavigationItemWidget(
                title: category,
                isSelected: controller.selectedIndex == index,
                onTap: () => controller.handleTypeSelected(index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class NavigationItemWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const NavigationItemWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryBrown : AppColor.color_ededed,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
