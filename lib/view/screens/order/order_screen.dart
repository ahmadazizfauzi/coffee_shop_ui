import 'package:coffee/model/constant/app_color.dart';
import 'package:coffee/view/widgets/non_reusable/order/amount_order_widget.dart';
import 'package:coffee/view/widgets/non_reusable/order/appbar_order_widget.dart';
import 'package:coffee/view/widgets/non_reusable/order/delivery_order_widget.dart';
import 'package:coffee/view/widgets/non_reusable/order/discount_order_widget.dart';
import 'package:coffee/view/widgets/non_reusable/order/fixed_bottom_order_widget.dart';
import 'package:coffee/view/widgets/non_reusable/order/payment_summary_order_widget.dart';
import 'package:coffee/view/widgets/non_reusable/order/picker_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:coffee/model/data/data_coffee.dart';

class OrderScreen extends StatelessWidget {
  final Coffee coffee;

  const OrderScreen({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color_f9f9f9,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 64),
                  child: Column(
                    children: [
                      const AppbarOrderWidget(),
                      const SizedBox(
                        height: 24,
                      ),
                      const PickerOrderWidget(),
                      const SizedBox(
                        height: 24,
                      ),
                      const DeliveryOrderWidget(),
                      const SizedBox(height: 16),
                      AmountOrderWidget(
                        coffee: coffee,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const DiscountOrderWidget(),
                      const SizedBox(
                        height: 24,
                      ),
                      PaymentSummaryOrderWidget(
                        coffee: coffee,
                      ),
                        const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FixedBottomOrderWidget(
              coffee: coffee,
            )
          ],
        ),
      ),
    );
  }
}
