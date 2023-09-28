import 'package:get/get.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/pdf/m/daily_sales_report_model.dart';
import 'package:snabb_business/pdf/m/expense_report_model.dart';
import 'package:snabb_business/pdf/m/purchase_report_model.dart';
import 'package:snabb_business/pdf/m/supliers_report_model.dart';
import 'package:snabb_business/static_data.dart';

import '../m/company_sales_report_model.dart';

class PdfController extends GetxController {
  static PdfController get to => Get.find();
// list
  List<CompanySaleReportData> compenysaleslist = [];
  List<DailySaleReportData> dailyslaesReportlist = [];
  List<ExpenseReportData> expenseReportList = [];
  List<PurchaseReportData> purchaseReportList = [];
  List<SupplierReportData> supplierReportList = [];

// methods
  Future<List<CompanySaleReportData>> fetchcompenysales() async {
    compenysaleslist.clear();
    CompanySaleReportModel? companySaleReportModel;

    var res = await httpClient().get(StaticValues.getcompanySaleReport);
    companySaleReportModel = CompanySaleReportModel.fromJson(res.data);

    if (companySaleReportModel.data != null) {
      for (var c in companySaleReportModel.data!) {
        compenysaleslist.add(c);
      }
    } else {}
    print("compenysalesdata  ${companySaleReportModel.data!.length} ");
    update();
    return compenysaleslist;
  }

  Future<List<DailySaleReportData>> fetchdailyslaesReport() async {
    dailyslaesReportlist.clear();
    DailySaleReportModel? dailySaleReportModel;

    var res = await httpClient().get(StaticValues.getdailySaleReport);
    dailySaleReportModel = DailySaleReportModel.fromJson(res.data);

    if (dailySaleReportModel.data != null) {
      for (var c in dailySaleReportModel.data!) {
        dailyslaesReportlist.add(c);
      }
    } else {}
    print("dailySaleReportModeldata  ${dailySaleReportModel.data!.length} ");
    update();
    return dailyslaesReportlist;
  }

  Future<List<ExpenseReportData>> fetchexpenseReport() async {
    expenseReportList.clear();
    ExpenseReportModel? expenseReportModel;

    var res = await httpClient().get(StaticValues.getexpenseReport);
    expenseReportModel = ExpenseReportModel.fromJson(res.data);

    if (expenseReportModel.data != null) {
      for (var c in expenseReportModel.data!) {
        expenseReportList.add(c);
      }
    } else {}
    print("expenseReportList  ${expenseReportModel.data!.length} ");
    update();
    return expenseReportList;
  }

  Future<List<PurchaseReportData>> fetchpurchaseReport() async {
    purchaseReportList.clear();
    PurchaseReportModel? purchaseReportModel;

    var res = await httpClient().get(StaticValues.getpurchaseReport);
    purchaseReportModel = PurchaseReportModel.fromJson(res.data);

    if (purchaseReportModel.data != null) {
      for (var c in purchaseReportModel.data!) {
        purchaseReportList.add(c);
      }
    } else {}
    update();
    return purchaseReportList;
  }

  Future<List<SupplierReportData>> fetchsupplierReport(
      String supplierID) async {
    supplierReportList.clear();
    SupplierReportModel? supplierReportModel;

    var res = await httpClient()
        .get('${StaticValues.getsuppliersReport}/$supplierID');
    supplierReportModel = SupplierReportModel.fromJson(res.data);
    if (supplierReportModel.data != null) {
      for (var c in supplierReportModel.data!) {
        supplierReportList.add(c);
      }
    } else {}
    print("supplierReportModel  ${supplierReportModel.data!.length} ");
    update();
    return supplierReportList;
  }
}
