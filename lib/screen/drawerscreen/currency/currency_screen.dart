import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/models/currency_model.dart';
import 'package:snabb_business/utils/color.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(builder: (obj) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.clear,
                  color: blue,
                  size: size.width * 0.07,
                ),
              ),
            ),
            Center(
              child: Text(
                AppLocalizations.of(context)!.chooseyourcurrency,
                style: TextStyle(
                    fontSize: size.width * 0.035,
                    fontWeight: FontWeight.bold,
                    color: blue),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: ListView.builder(
                  itemCount: CurrencyModell.currencyList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Radio(
                          value: CurrencyModell.currencyList[index].value!,
                          activeColor: blue,
                          groupValue: obj.curency,
                          onChanged: (value) {
                            obj.changeCurrency(value.toString(), context);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
