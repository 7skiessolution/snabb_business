import 'package:get/get.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/models/search_summary.dart';
import 'package:snabb_business/pdf/m/cash_flow_model.dart';
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
  List<CashFlowData> cashflowReportList = [];

// methods
  Future<List<CompanySaleReportData>> fetchcompenysales(
      String start, String end) async {
    compenysaleslist.clear();
    CompanySaleReportModel? companySaleReportModel;

    var res = await httpClient().get(
        "${StaticValues.getcompanySaleReport}?StartDate=$start%2000%3A00&EndDate=$end%2000%3A00");
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

  Future<List<DailySaleReportData>> fetchdailyslaesReport(
      String start, String end) async {
    dailyslaesReportlist.clear();
    DailySaleReportModel? dailySaleReportModel;

    var res = await httpClient().get(
        "${StaticValues.getdailySaleReport}?StartDate=$start%2000%3A00&EndDate=$end%2000%3A00");
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

  Future<List<ExpenseReportData>> fetchexpenseReport(
      String start, String end) async {
    expenseReportList.clear();
    ExpenseReportModel? expenseReportModel;

    var res = await httpClient().get(
        "${StaticValues.getexpenseReport}?StartDate=$start%2000%3A00&EndDate=$end%2000%3A00");
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

  Future<List<PurchaseReportData>> fetchpurchaseReport(
      String start, String end) async {
    purchaseReportList.clear();
    PurchaseReportModel? purchaseReportModel;

    var res = await httpClient().get(
        "${StaticValues.getpurchaseReport}?StartDate=$start%2000%3A00&EndDate=$end%2000%3A00");
    purchaseReportModel = PurchaseReportModel.fromJson(res.data);

    if (purchaseReportModel.data != null) {
      for (var c in purchaseReportModel.data!) {
        purchaseReportList.add(c);
      }
    } else {}
    update();
    return purchaseReportList;
  }

  Future<List<CashFlowData>> cashflowReport(String from, String to) async {
    supplierReportList.clear();
    CashFlowReport? cashflow;
    var res = await httpClient().get(
        "${StaticValues.getcashflowReport}?StartDate=$from%2000%3A00&EndDate=$to%2000%3A00");
    print("-------search ${res.data}");
    cashflow = CashFlowReport.fromMap(res.data);
    if (cashflow.data != null) {
      for (var c in cashflow.data!) {
        cashflowReportList.add(c);
      }
    } else {}
    print("cash  ${cashflowReportList.length} ");
    update();
    return cashflowReportList;
  }

  Future<List<SupplierReportData>> fetchsupplierReport(
      String supplierID, String from, String to) async {
    print("supplierr id ${supplierID}");
    supplierReportList.clear();
    SupplierReportModel? supplierReportModel;

    var res = await httpClient().get(
        '${StaticValues.getsuppliersReport}/$supplierID?StartDate=$from%2000%3A00&EndDate=$to%2000%3A00');
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
