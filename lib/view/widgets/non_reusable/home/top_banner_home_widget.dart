import 'package:coffee/model/data/data_icon.dart';
import 'package:coffee/model/data/data_image.dart';
import 'package:coffee/model/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBannerHomeWidget extends StatelessWidget {
  final Function(String) onSearch;

  const TopBannerHomeWidget({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 280,
          padding: const EdgeInsets.only(left: 24, right: 24, top: 68),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColor.blackPudar,
                AppColor.color_313131,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Location',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Text(
                    'Bilzen, Tanjungbalai',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.graySearch,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        onChanged: onSearch,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          border: InputBorder.none,
                          hintText: 'Search coffee',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColor.primaryBrown,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      DataIcon.filter,
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 24,
          right: 24,
          bottom: -70,
          child: Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColor.primaryBrown,
              image: DecorationImage(
                  image: AssetImage(DataImage.homeBanner),
                  alignment: Alignment.centerRight,
                  fit: BoxFit.cover),
            ),
            padding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
