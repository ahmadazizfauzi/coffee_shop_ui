import 'package:coffee/model/constant/app_color.dart';
import 'package:flutter/material.dart';

class AppbarOrderWidget extends StatelessWidget {
  const AppbarOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Centered text
        Center(
          child: const Text(
            'Order',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: AppColor.color_2a2a2a,
            ),
          ),
        ),
      ],
    );
  }
}
