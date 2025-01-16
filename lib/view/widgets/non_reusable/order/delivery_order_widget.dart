import 'package:coffee/model/constant/app_color.dart';
import 'package:coffee/model/data/data_image.dart';
import 'package:flutter/material.dart';

class DeliveryOrderWidget extends StatelessWidget {
  const DeliveryOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildAddressDetails(),
          const SizedBox(height: 16),
          _buildActionButtons(),
          const SizedBox(height: 16),
          const Line(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Text(
      'Delivery Address',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColor.color_242424,
      ),
    );
  }

  Widget _buildAddressDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Jl. Kpg Sutoyo',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColor.color_242424,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
          style: TextStyle(
              fontSize: 12,
              color: AppColor.color_2a2a2a,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        _buildButton(
          imageAsset: DataImage.orderEdit,
          label: 'Edit Address',
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        _buildButton(
          imageAsset: DataImage.orderNote,
          label: 'Add Note',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildButton({
    required String label,
    required VoidCallback onPressed,
    required String imageAsset,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Image.asset(
        imageAsset,
        width: 20,
        height: 20,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        side: BorderSide(color: AppColor.color_2a2a2a),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
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
      width: MediaQuery.of(context).size.width * 0.75,
      height: 2,
      color: AppColor.color_e3e3e3,
    ),
            );
  }
}
