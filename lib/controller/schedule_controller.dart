import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/models/scheduled_transaction.dart';
import 'package:snabb_business/static_data.dart';

class ScheduleController extends GetxController {
  static ScheduleController get to => Get.find();

  List<ScheduleTransactionData> transactions = [];
  int thisMonth = 0;
  int nextMonth = 0;
  ScheduleTransactionModel? schedulemodel;
  Future<ScheduleTransactionModel> fetchTransactions() async {
    transactions.clear();
    var result = await httpClient().get(StaticValues.getscheduleTransaction);
    schedulemodel = ScheduleTransactionModel.fromJson(result.data);

    for (var document in schedulemodel!.data!) {
      transactions.add(document);
    }

    calculateTotalAmount(transactions);
    update();
    return schedulemodel!;
  }

  void calculateTotalAmount(List<ScheduleTransactionData> transactions) {
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;
    int nextmonth = currentMonth + 1;
    int localThisMonth = 0;
    int localNextMonth = 0;

    for (ScheduleTransactionData transaction in transactions) {
      DateTime date = DateFormat("dd-MM-yyyy").parse(transaction.dateTime!);
      int amount = transaction.amount!.truncate();

      if (date.year == currentYear && date.month == currentMonth) {
        if (transaction.type == 0) {
          localThisMonth -= amount;
        } else {
          localThisMonth += amount;
        }
      }
      if (date.year == currentYear && date.month == nextmonth) {
        if (transaction.type == 0) {
          localNextMonth -= amount;
        } else {
          localNextMonth += amount;
        }
      }
    }

    thisMonth = localThisMonth;
    nextMonth = localNextMonth;
    update();
  }
}
