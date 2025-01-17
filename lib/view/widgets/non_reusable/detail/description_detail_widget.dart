import 'package:coffee/model/constant/app_color.dart';
import 'package:coffee/controllers/ui/detail/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:coffee/model/data/data_coffee.dart';
import 'package:get/get.dart';

class DescriptionDetailWidget extends StatelessWidget {
  final Coffee coffee;
  final controller = Get.put(DetailController());

  DescriptionDetailWidget({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    final String description = '${coffee.fullDescription.substring(0, 100)}...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          coffee.name,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.color_242424),
        ),
        const SizedBox(height: 8),
        Obx(() => Text(
              controller.isExpanded.value
                  ? coffee.fullDescription
                  : description,
              style: const TextStyle(
                color: AppColor.color_a2a2a2,
                height: 1.5,
              ),
            )),
        GestureDetector(
          onTap: controller.toggleExpanded,
          child: Obx(() => Text(
                controller.isExpanded.value ? 'Read Less' : 'Read More',
                style: TextStyle(
                    color: AppColor.primaryBrown,
                    fontWeight: FontWeight.w800,
                    fontSize: 14),
              )),
        ),
      ],
    );
  }
}
