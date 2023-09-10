import 'package:flutter/material.dart';
import 'package:snabb_business/utils/colors.dart';

class CategoryTile extends StatefulWidget {
  const CategoryTile({
    super.key,
  });

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  var width;

  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.all(12),
      color: AppColors.tilebackground,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Total:",
                style: TextStyle(
                    fontSize: width * 0.04, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: width * 0.04,
              ),
              Text(
                "-20,000 PKR",
                style: TextStyle(
                    fontSize: width * 0.04, color: AppColors.redcolor),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("images/expensive.png"),
              ),
              SizedBox(
                width: width * 0.04,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Expense:",
                      style: TextStyle(
                          fontSize: width * 0.04, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "-80,000 PKR:",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: AppColors.redcolor),
                        ),
                        // SizedBox(
                        //   width: width * 0.35,
                        // ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.grey,
                              size: 20,
                            ))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
