import 'package:coffee/model/constant/app_color.dart';
import 'package:coffee/model/data/data_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarDetailWidget extends StatelessWidget {
  const AppBarDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
        const Text(
          'Detail',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            DataIcon.favorite,
            width: 20,
            height: 20,
          ),
        ),
      ],
    );
  }
}
