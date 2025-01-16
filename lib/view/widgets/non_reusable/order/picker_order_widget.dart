import 'package:coffee/model/constant/app_color.dart';
import 'package:flutter/material.dart';

class PickerOrderWidget extends StatefulWidget {
  const PickerOrderWidget({super.key});

  @override
  State<PickerOrderWidget> createState() => _PickerOrderWidgetState();
}

class _PickerOrderWidgetState extends State<PickerOrderWidget> {
  bool isDelivery = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColor.color_ededed,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => isDelivery = true),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      isDelivery ? AppColor.primaryBrown : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Deliver',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDelivery ? Colors.white : AppColor.color_242424,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => isDelivery = false),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      !isDelivery ? AppColor.primaryBrown : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Pick Up',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: !isDelivery ? Colors.white : AppColor.color_242424,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
