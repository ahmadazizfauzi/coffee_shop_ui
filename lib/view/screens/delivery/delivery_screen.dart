import 'package:coffee/model/constant/app_color.dart';
import 'package:coffee/view/widgets/non_reusable/delivery/fixed_bottom_delivery_widget.dart';
import 'package:coffee/view/widgets/non_reusable/delivery/map_delivery_widget.dart';
import 'package:flutter/material.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final DraggableScrollableController _scrollController =
      DraggableScrollableController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color_f9f9f9,
      body: SafeArea(
        child: Stack(
          children: [
            const MapDeliveryWidget(),
            DraggableScrollableSheet(
              controller: _scrollController,
              initialChildSize: 0.4,
              minChildSize: 0,
              maxChildSize: 0.4,
              builder: (context, scrollController) => FixedBottomDeliveryWidget(
                scrollController: scrollController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
