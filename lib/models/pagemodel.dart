import 'package:flutter/material.dart';

class Pages {
  String? title;
  IconData? icon;
  VoidCallback ontap;
  Pages({required this.title, required this.icon, required this.ontap});
}

List<Pages> list = [
  Pages(
    icon: Icons.bar_chart_sharp,
    title: "New transactions",
    ontap: () {},
  ),
  Pages(
    icon: Icons.note,
    title: "Summary",
    ontap: () {},
  ),
  Pages(
    icon: Icons.attach_money,
    title: "Trasactions",
    ontap: () {},
  ),
  Pages(
    icon: Icons.pie_chart_outline,
    title: "Budget",
    ontap: () {},
  ),
  Pages(
    icon: Icons.calendar_month,
    title: "Calender",
    ontap: () {},
  ),
];
