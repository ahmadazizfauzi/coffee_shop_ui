import 'package:flutter/material.dart';
import 'package:coffee/model/constant/app_color.dart';
import 'package:coffee/model/data/data_coffee.dart';
import 'package:get/get.dart';
import 'package:coffee/controllers/ui/order/order_controller.dart';

class FixedBottomOrderWidget extends StatelessWidget {
  final Coffee coffee;
  late final OrderController orderController;

  FixedBottomOrderWidget({
    super.key,
    required this.coffee,
  }) {
    orderController = Get.find<OrderController>();
  }

  @override
  Widget build(BuildContext context) {
    const deliveryFee = 1.0;

    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: 64,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPaymentSection(deliveryFee),
          const SizedBox(height: 16),
          _buildOrderButton(),
        ],
      ),
    );
  }

  Widget _buildPaymentSection(double deliveryFee) {
    return Row(
      children: [
        const Icon(
          Icons.account_balance_wallet_outlined,
          color: AppColor.primaryBrown,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cash/Wallet',
              style: TextStyle(
                color: AppColor.color_242424,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Obx(() => Text(
                  '\$ ${(coffee.price * orderController.quantity.value + deliveryFee).toStringAsFixed(2)}',
                  style: TextStyle(
                    color: AppColor.primaryBrown,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildOrderButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Get.offNamed("/delivery");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryBrown,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          'Order',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
