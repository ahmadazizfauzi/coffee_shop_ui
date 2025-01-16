import 'package:coffee/model/data/data_coffee.dart';
import 'package:flutter/material.dart';

class BannerDetailWidget extends StatelessWidget {
  final Coffee coffee;

  const BannerDetailWidget({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        coffee.image,
        width: double.infinity,
        height: 202,
        fit: BoxFit.cover,
      ),
    );
  }
}
