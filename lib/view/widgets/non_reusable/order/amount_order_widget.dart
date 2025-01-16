import 'package:coffee/model/data/data_coffee.dart';
import 'package:flutter/material.dart';
import 'package:coffee/model/constant/app_color.dart';
import 'package:get/get.dart';
import 'package:coffee/controllers/ui/order/order_controller.dart';

class AmountOrderWidget extends StatelessWidget {
  final Coffee coffee;
  late final OrderController orderController;

  AmountOrderWidget({
    super.key,
    required this.coffee,
  }) {
    // Initialize controller with the specific coffee
    orderController = Get.put(OrderController(coffee: coffee));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              coffee.image,
              width: 64,
              height: 64,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffee.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.color_242424,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    coffee.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                _buildButton(
                  icon: Icons.remove,
                  onTap: orderController.decrementQuantity,
                ),
                const SizedBox(width: 16),
                Obx(() => Text(
                      '${orderController.quantity.value}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.color_242424,
                      ),
                    )),
                const SizedBox(width: 16),
                _buildButton(
                  icon: Icons.add,
                  onTap: orderController.incrementQuantity,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Line()
      ],
    );
  }

  Widget _buildButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColor.color_white,
          borderRadius: BorderRadius.circular(90),
        ),
        child: Icon(
          icon,
          color: AppColor.color_242424,
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 4,
        color: AppColor.color_f9f2ed,
      ),
    );
  }
}
