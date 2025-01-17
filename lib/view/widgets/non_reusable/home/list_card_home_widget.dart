import 'package:coffee/view/screens/detail/detail_coffee_screen.dart';
import 'package:flutter/material.dart';
import 'package:coffee/model/constant/app_color.dart';
import 'package:coffee/model/data/data_coffee.dart';
import 'package:get/get.dart';

class ListCardHomeWidget extends StatelessWidget {
  final List<Coffee> coffeeList;

  const ListCardHomeWidget({
    super.key,
    required this.coffeeList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 8,
          mainAxisSpacing: 24,
        ),
        itemCount: coffeeList.length,
        itemBuilder: (context, index) =>
            CoffeeCardWidget(coffee: coffeeList[index]),
      ),
    );
  }
}

class CoffeeCardWidget extends StatelessWidget {
  final Coffee coffee;

  const CoffeeCardWidget({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        '/detail_coffee',
        arguments: coffee,
      ),
      child: Hero(
        tag: coffee.image,
        child: Container(
          height: 300,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCoffeeImage(),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildCoffeeDetails(),
                    const SizedBox(height: 8),
                    _buildPriceRow(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoffeeImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Stack(
        children: [
          Image.asset(
            coffee.image,
            height: 128,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          _buildRatingBadge(),
        ],
      ),
    );
  }

  Widget _buildRatingBadge() {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColor.color_313131.withOpacity(0.3),
              AppColor.blackPudar.withOpacity(0.3),
            ],
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star,
              color: AppColor.color_FBBE21,
              size: 14,
            ),
            const SizedBox(width: 2),
            Text(
              coffee.rating.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoffeeDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          coffee.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.color_313131,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          coffee.description,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColor.color_313131.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$ ${coffee.price}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: AppColor.primaryBrown,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }
}
