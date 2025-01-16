import 'package:coffee/model/constant/app_color.dart';
import 'package:coffee/model/data/data_coffee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FixedBottomDetailWidget extends StatelessWidget {
  final Coffee coffee;

  const FixedBottomDetailWidget({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 20,
          bottom: 50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '\$ ${coffee.price}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryBrown),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/order', arguments: coffee);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryBrown,
                minimumSize: const Size(180, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Buy Now',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
