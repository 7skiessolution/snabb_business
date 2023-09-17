import 'package:flutter/material.dart';
import 'package:snabb_business/utils/colors.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: AppColors.tilebackground,
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("images/expensive.png"),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Expense",
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.bold),
                ),
                Text("-20,000 Rs",
                    style: TextStyle(
                        fontSize: width * 0.03, fontWeight: FontWeight.bold)),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Wallet"),
                Text("0/9/2023",
                    style: TextStyle(
                        fontSize: width * 0.03,
                        color: Colors.grey.withOpacity(0.5))),
              ],
            ),
            trailing: VerticalDivider(
              color: AppColors.blue,
              thickness: 4,
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("images/sale.png"),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sale",
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.bold),
                ),
                Text("-20,000 Rs",
                    style: TextStyle(
                        fontSize: width * 0.03, fontWeight: FontWeight.bold)),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Wallet"),
                Text("0/9/2023",
                    style: TextStyle(
                        fontSize: width * 0.03,
                        color: Colors.grey.withOpacity(0.5))),
              ],
            ),
            trailing: const VerticalDivider(
              color: AppColors.greencolor,
              thickness: 4,
            ),
          ),
        ],
      ),
    );
  }
}
