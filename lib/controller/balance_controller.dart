import 'package:get/get.dart';
import 'package:snabb_business/models/balance_model.dart';

class BalanceController extends GetxController {
  static BalanceController get to => Get.find();
  List<BalanceData> balanceList = [];
  double totalBalance = 0;

  void addBalance(BalanceData balanceData) {
    balanceList.add(balanceData);
    calculateTotalBalance();
    update();
  }

  void deleteBalance(int index) {
    BalanceData removedBalance = balanceList.removeAt(index);
    if (removedBalance.balanceType == "Credit") {
      totalBalance -= removedBalance.balance;
    } else if (removedBalance.balanceType == "Debit") {
      totalBalance += removedBalance.balance;
    }
    update();
  }

  // void deleteBalance(int index) {
  //   balanceList.removeAt(index);
  //   calculateTotalBalance();
  //   notifyListeners();
  // }

  void calculateTotalBalance() {
    double total = 0;
    for (var balanceData in balanceList) {
      if (balanceData.balanceType == "Credit") {
        total += balanceData.balance;
      } else if (balanceData.balanceType == "Debit") {
        total -= balanceData.balance;
      }
    }
    totalBalance = total;
  }
}
