import 'package:coffee/model/data/data_image.dart';
import 'package:flutter/material.dart';
import '../../../../model/constant/app_color.dart';

class DiscountOrderWidget extends StatelessWidget {
  const DiscountOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColor.color_ededed,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
           
            child: Image.asset(
              DataImage.orderPercent,
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            "1 Discount is Applies",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.chevron_right,
            color: AppColor.color_2a2a2a,
            size: 24,
          ),
        ],
      ),
    );
  }
}
