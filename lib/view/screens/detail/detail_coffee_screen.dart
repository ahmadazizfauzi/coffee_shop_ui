import 'package:coffee/model/constant/app_color.dart';
import 'package:coffee/model/data/data_coffee.dart';
import 'package:coffee/view/widgets/non_reusable/detail/description_detail_widget.dart';
import 'package:coffee/view/widgets/non_reusable/detail/size_detail_widget.dart';
import 'package:coffee/view/widgets/non_reusable/detail/title_rating_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:coffee/view/widgets/non_reusable/detail/appbar_detail_widget.dart';
import 'package:coffee/view/widgets/non_reusable/detail/banner_detail_widget.dart';
import 'package:coffee/view/widgets/non_reusable/detail/fixed_bottom_detail_widget.dart';

class DetailCoffeeScreen extends StatelessWidget {
  final Coffee coffee;

  const DetailCoffeeScreen({
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
                      const AppBarDetailWidget(),
                      const SizedBox(height: 24),
                      BannerDetailWidget(coffee: coffee),
                      const SizedBox(height: 16),
                      TitleRatingDetailWidget(coffee: coffee),
                      const SizedBox(height: 16),
                      DescriptionDetailWidget(coffee: coffee),
                      const SizedBox(height: 24),
                      const SizeDetailWidget(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
            FixedBottomDetailWidget(coffee: coffee),
          ],
        ),
      ),
    );
  }
}
