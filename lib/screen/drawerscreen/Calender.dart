import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:snabb_business/utils/appbarwidget.dart';

import '../../utils/color.dart';

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
          backgroundColor: backgroundColor,
          body: Column(
            children: [
              Container(
                height: height * 0.1,
                width: width,
                color: darkblue,
                child: AppBarWidgt(text: "Calender"),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: white,
                    child: CellCalendar(
                      todayMarkColor: darkblue,
                      cellCalendarPageController: cellCalendarPageController,
                      daysOfTheWeekBuilder: (dayIndex) {
                        final labels = ["S", "M", "T", "W", "T", "F", "S"];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            labels[dayIndex],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: darkblue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                      monthYearLabelBuilder: (datetime) {
                        final year = datetime!.year.toString();
                        final month = datetime.month.monthName;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              const SizedBox(width: 16),
                              Text(
                                "$month  $year",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: darkblue),
                              ),
                              const Spacer(),
                              IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: darkblue,
                                  size: 20,
                                ),
                                onPressed: () {
                                  cellCalendarPageController.animateToDate(
                                    DateTime.now(),
                                    curve: Curves.linear,
                                    duration: const Duration(milliseconds: 300),
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
                ),
              ),
            ],
          )),
    );
  }
}
