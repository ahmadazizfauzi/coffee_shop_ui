import 'package:coffee/model/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:coffee/model/data/data_coffee.dart';

class DescriptionDetailWidget extends StatefulWidget {
  final Coffee coffee;

  const DescriptionDetailWidget({
    super.key,
    required this.coffee,
  });

  @override
  State<DescriptionDetailWidget> createState() =>
      _DescriptionDetailWidgetState();
}

class _DescriptionDetailWidgetState extends State<DescriptionDetailWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final String description =
        '${widget.coffee.fullDescription.substring(0, 100)}...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.coffee.name,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.color_242424),
        ),
        const SizedBox(height: 8),
        Text(
          isExpanded ? widget.coffee.fullDescription : description,
          style: const TextStyle(
            color: Colors.grey,
            height: 1.5,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? 'Read Less' : 'Read More',
            style: TextStyle(
                color: AppColor.primaryBrown,
                fontWeight: FontWeight.w800,
                fontSize: 14),
          ),
        ),
      ],
    );
  }
}
