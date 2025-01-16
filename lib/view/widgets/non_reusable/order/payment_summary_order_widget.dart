import 'package:coffee/model/constant/app_color.dart';
import 'package:coffee/model/data/data_coffee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coffee/controllers/ui/order/order_controller.dart';

class PaymentSummaryOrderWidget extends StatelessWidget {
  final Coffee coffee;
  late final OrderController orderController;

  PaymentSummaryOrderWidget({
    super.key,
    required this.coffee,
  }) {
    orderController = Get.find<OrderController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment Summary',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.color_242424,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.color_313131,
                ),
              ),
              Obx(() => Text(
                    '\$ ${(coffee.price * orderController.quantity.value).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.color_242424,
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Delivery Fee',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.color_313131,
                ),
              ),
              Row(
                children: [
                  Text(
                    '\$ 2.0',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.color_2a2a2a,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '\$ 1.0',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.color_242424,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
