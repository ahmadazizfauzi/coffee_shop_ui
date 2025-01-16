import 'package:flutter/material.dart';
import 'package:coffee/model/constant/app_color.dart';
import 'package:coffee/model/data/data_image.dart';
import 'package:coffee/model/data/data_coffee.dart';

class IconDetailContainer extends StatelessWidget {
  final String imagePath;

  const IconDetailContainer({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.color_ededed.withOpacity(0.35),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(
        imagePath,
        width: 32,
        height: 32,
      ),
    );
  }
}

class TitleRatingDetailWidget extends StatelessWidget {
  final Coffee coffee;

  const TitleRatingDetailWidget({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left side: Title, Ice/Hot, and Rating
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffee.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColor.color_242424,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Ice/Hot',
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor.color_2a2a2a,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 16),
                  // Rating section
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${coffee.rating} ',
                              style: const TextStyle(
                                color: AppColor.blackPudar,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: '(${coffee.buyer.toInt()})',
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Right side: Three icons in vertical arrangement
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconDetailContainer(imagePath: DataImage.detailMotor),
                const SizedBox(width: 12),
                IconDetailContainer(imagePath: DataImage.detailBiji),
                const SizedBox(width: 12),
                IconDetailContainer(imagePath: DataImage.detailMilk),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Simplified divider
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: 2,
          color: AppColor.color_e3e3e3,
        ),
      ],
    );
  }
}
