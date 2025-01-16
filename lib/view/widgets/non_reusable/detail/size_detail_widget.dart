import 'package:coffee/model/constant/app_color.dart';
import 'package:flutter/material.dart';

class SizeDetailWidget extends StatefulWidget {
  const SizeDetailWidget({super.key});

  @override
  State<SizeDetailWidget> createState() => _SizeDetailWidgetState();
}

class _SizeDetailWidgetState extends State<SizeDetailWidget> {
  String selectedSize = 'M'; // Default selected size

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.color_242424,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSizeButton('S'),
            _buildSizeButton('M'),
            _buildSizeButton('L'),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeButton(String size) {
    final isSelected = selectedSize == size;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        height: 43,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryBrown : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColor.primaryBrown : AppColor.color_e3e3e3,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
