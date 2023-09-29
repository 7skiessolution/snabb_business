import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/utils/color.dart';

import '../../utils/appbarwidget.dart';

class CalenderScreen extends StatefulWidget {
  static const routeName = "Calender-Screen";

  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    final cellCalendarPageController = CellCalendarPageController();
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: AppBarWidgt(text: "Calendar")),
          Padding(
            padding: EdgeInsets.only(top: height * 0.1),
            child: SizedBox(
              height: height * 0.12,
              width: width,
              child: Stack(
                children: [
                  Container(
                    height: height * 0.12,
                    width: width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/dollar.jpg"))),
                  ),
                  Container(
                    height: height * 0.12,
                    width: width,
                    color: Colors.blue[900]!.withOpacity(0.9),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                      child: Text(
                        "Calendar",
                        style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: height * 0.17),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                      shadowColor: Colors.blue[900],
                      elevation: 10,
                      child: GetBuilder<TransactionController>(builder: (obj) {
                        return SizedBox(
                          // color: Colors.amber,
                          height: height * 0.75,
                          width: width * 0.9,
                          child: Center(
                            child: CellCalendar(
                              events: obj.calanderEventList,
                              todayMarkColor: darkblue!,
                              cellCalendarPageController:
                                  cellCalendarPageController,
                              daysOfTheWeekBuilder: (dayIndex) {
                                final labels = [
                                  "S",
                                  "M",
                                  "T",
                                  "W",
                                  "T",
                                  "F",
                                  "S"
                                ];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    labels[dayIndex],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              },
                              monthYearLabelBuilder: (datetime) {
                                final year = datetime!.year.toString();
                                final month = datetime.month.monthName;
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 16),
                                      Text(
                                        "$month  $year",
                                        style: TextStyle(
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: const Icon(Icons.calendar_today),
                                        onPressed: () {
                                          cellCalendarPageController
                                              .animateToDate(
                                            DateTime.now(),
                                            curve: Curves.linear,
                                            duration: const Duration(
                                                milliseconds: 300),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                              onCellTapped: (date) {},
                              onPageChanged: (firstDate, lastDate) {
                                /// Called when the page was changed
                                /// Fetch additional events by using the range between [firstDate] and [lastDate] if you want
                              },
                            ),
                          ),
                        );
                      }))))
        ],
      )),
    );
  }
}
