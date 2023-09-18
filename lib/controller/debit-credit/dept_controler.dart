import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/utils/color.dart';

class DeptScreenController extends GetxController {
  static DeptScreenController get to => Get.find();
  TextEditingController balanceController = TextEditingController();
  TextEditingController currentDateController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController person = TextEditingController();
  TextEditingController noteController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DateTime currentDate = DateTime.now();
  DateTime dueDate = DateTime.now();
  clearcontroller() {
    balanceController.clear();
    currentDateController.clear();
    dueDateController.clear();
    person.clear();
    noteController.clear();
    nameController.clear();
    amountController.clear();
  }

  // void saveDeptData(
  //     BuildContext context,
  //     String balanceType,
  //     String balance,
  //     DateTime currentDate,
  //     DateTime dueDate,
  //     String person,
  //     String userId,
  //     String imgUrl,
  //     String note,
  //     height,
  //     width) async {
  //   final balanceData = BalanceData(
  //     balanceType: balanceType,
  //     balance: double.parse(balance),
  //     currentDate: currentDate,
  //     dueDate: dueDate,
  //     person: person,
  //     //  status: "unpaid",
  //   );

  //   BalanceController.to.addBalance(balanceData);
  //   showGeneralDialog(
  //     context: context,
  //     pageBuilder: (ctx, a1, a2) {
  //       return Container();
  //     },
  //     transitionBuilder: (ctx, a1, a2, child) {
  //       return Transform.rotate(
  //         angle: math.radians(a1.value * 360),
  //         child: AlertDialog(
  //           elevation: 10,
  //           shadowColor: darkblue!,
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //           content: SizedBox(
  //             height: height * 0.3,
  //             width: width * 0.2,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: [
  //                 Text(
  //                   AppLocalizations.of(context)!.success,
  //                   style: TextStyle(
  //                       fontSize: width * 0.04,
  //                       color: darkblue!,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //                 SizedBox(
  //                   height: height * 0.2,
  //                   width: width * 0.2,
  //                   child: Lottie.asset('assets/lottie_files/success.json'),
  //                 ),
  //                 InkWell(
  //                   onTap: () {
  //                     Navigator.of(context).pushAndRemoveUntil(
  //                         MaterialPageRoute(
  //                             builder: (context) => BalanceScreen()),
  //                         (Route<dynamic> route) => false);
  //                   },
  //                   child: Container(
  //                     height: height * 0.05,
  //                     width: width * 0.2,
  //                     decoration: BoxDecoration(
  //                         color: darkblue!,
  //                         borderRadius: BorderRadius.circular(10)),
  //                     alignment: Alignment.center,
  //                     child: Text(
  //                       AppLocalizations.of(context)!.ok,
  //                       style: TextStyle(
  //                           fontSize: width * 0.04,
  //                           color: Colors.white,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //     transitionDuration: const Duration(milliseconds: 600),
  //   );
  // }

  Future<void> selectDate(BuildContext context,
      TextEditingController controller, DateTime initialDate) async {
    final DateTime? selectedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: darkblue!,
              colorScheme: ColorScheme.light(primary: darkblue!),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!);
      },
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      controller.text = DateFormat.yMMMd().format(selectedDate);
      if (controller == currentDateController) {
        currentDate = selectedDate;
      } else if (controller == dueDateController) {
        dueDate = selectedDate;
      }
    }
    update();
  }
}
