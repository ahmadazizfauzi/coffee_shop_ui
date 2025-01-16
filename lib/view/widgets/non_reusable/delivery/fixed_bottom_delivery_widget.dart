import 'package:coffee/model/constant/app_color.dart';
import 'package:coffee/model/data/data_image.dart';
import 'package:flutter/material.dart';

class FixedBottomDeliveryWidget extends StatelessWidget {
  final ScrollController scrollController;

  const FixedBottomDeliveryWidget({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 12),
      decoration: const BoxDecoration(
        color: AppColor.color_white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildMiniLine(),
            _buildTimeLeftText(),
            const SizedBox(height: 2),
            _buildDeliveryAddress(),
            const SizedBox(height: 25),
            _buildProgressIndicator(),
            const SizedBox(height: 16),
            _buildDeliveryCard(),
            const SizedBox(height: 14),
            _buildCourierProfile(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeLeftText() {
    return const Center(
      child: Text(
        '10 minutes left',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColor.color_242424,
        ),
      ),
    );
  }

  Widget _buildDeliveryAddress() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Delivery to ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColor.color_a2a2a2,
            ),
          ),
          Text(
            'Jl. Kpg Sutoyo',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColor.color_2a2a2a,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Row(
      children: [
        _buildProgressSegment(isCompleted: true),
        const SizedBox(width: 4),
        _buildProgressSegment(isCompleted: true),
        const SizedBox(width: 4),
        _buildProgressSegment(isCompleted: true),
        const SizedBox(width: 4),
        _buildProgressSegment(isCompleted: false),
      ],
    );
  }

  Widget _buildProgressSegment({required bool isCompleted}) {
    return Expanded(
      flex: 3,
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          color: isCompleted ? AppColor.color_36C07E : AppColor.color_e3e3e3,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildDeliveryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.color_e3e3e3),
        color: AppColor.color_white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 40,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 62,
            height: 62,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.color_f9f9f9,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              DataImage.detailMotor,
              width: 44,
              height: 44,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Delivered your order',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColor.color_242424,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'We will deliver your goods to you in\nthe shortes possible time.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: AppColor.color_a2a2a2,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourierProfile() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.color_white,
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(DataImage.orderFace),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Brooklyn Simmons',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColor.color_242424,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Personal Courier',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.color_a2a2a2,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColor.color_e3e3e3),
            ),
            child: Center(
              child: Image.asset(DataImage.orderCall),
            ),
          ),
        ],
      ),
    );
  }
}

class _buildMiniLine extends StatelessWidget {
  const _buildMiniLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColor.color_e3e3e3,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
