import 'package:flutter/material.dart';
import 'package:snabb_business/utils/colors.dart';

class ShaduleTransacrtionListtile extends StatelessWidget {
  const ShaduleTransacrtionListtile({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whitecolor,
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "This month",
                style: TextStyle(
                    fontSize: width * 0.04,
                    color: AppColors.blackcolor),
              ),
              Text(
                "0.00 PKR",
                style: TextStyle(
                    fontSize: width * 0.04,
                    color: AppColors.blackcolor),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Next month",
                style: TextStyle(
                    fontSize: width * 0.04,
                    color: AppColors.blackcolor),
              ),
              Text(
                "12,000 PKR",
                style: TextStyle(
                    fontSize: width * 0.04,
                    color: AppColors.greencolor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
