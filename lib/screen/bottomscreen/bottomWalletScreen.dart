import 'package:flutter/material.dart';
import 'package:snabb_business/utils/color.dart';

class BottomWallet extends StatefulWidget {
  const BottomWallet({super.key});

  @override
  State<BottomWallet> createState() => _BottomWalletState();
}

class _BottomWalletState extends State<BottomWallet> {
  var width;

  var height;

  var total = "546,000";
  var waltototal = "70,000";
  var isTure = true;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height * 0.15,
              color: topcard,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    "Total : ${total.toString()} Rs",
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.04),
                  ),
                ]),
              ),
            ),
            Positioned(
              top: height * 0.12,
              right: width * 0.015,
              left: width * 0.015,
              child: Container(
                width: width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: Colors.white,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Wallet : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.04),
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Text(
                            "${waltototal.toString()} Rs",
                            style: TextStyle(
                                color: Colors.green, fontSize: width * 0.04),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Normal",
                                style: TextStyle(fontSize: width * 0.03),
                              ),
                              Transform.scale(
                                  scale: 0.5,
                                  child: Switch(
                                    onChanged: (val) {
                                      isTure = val;
                                      setState(() {});
                                    },
                                    value: isTure,
                                    activeColor: Colors.grey,
                                    activeTrackColor:
                                        Colors.grey.withOpacity(0.4),
                                    inactiveThumbColor: Colors.grey,
                                    inactiveTrackColor:
                                        Colors.grey.withOpacity(0.4),
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.22,
                          ),
                          SizedBox(
                            height: 50,
                            width: width * 0.25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    color: Colors.grey.withOpacity(0.4),
                                    width: 18,
                                    height: 18,
                                    child: const Icon(
                                      Icons.transform,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    color: Colors.grey.withOpacity(0.4),
                                    width: 18,
                                    height: 18,
                                    child: const Icon(
                                      Icons.remove_red_eye,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    color: Colors.grey.withOpacity(0.4),
                                    width: 18,
                                    height: 18,
                                    child: const Icon(
                                      Icons.more_vert,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
