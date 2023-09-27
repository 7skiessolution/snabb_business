class ExpenseReportModel {
  String? status;
  List<ExpenseReportData>? data;

  ExpenseReportModel({this.status, this.data});

  ExpenseReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ExpenseReportData>[];
      json['data'].forEach((v) {
        data!.add(ExpenseReportData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExpenseReportData {
  String? date;
  double? cashAmount;
  double? bankAmount;
  double? otherAmount;
  String? note;
  double? totalAmount;
  String? name;

  ExpenseReportData(
      {this.date,
      this.cashAmount,
      this.bankAmount,
      this.otherAmount,
      this.note,
      this.totalAmount,
      this.name});

  ExpenseReportData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    cashAmount = json['cashAmount'];
    bankAmount = json['bankAmount'];
    otherAmount = json['otherAmount'];
    note = json['note'];
    totalAmount = json['totalAmount'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['cashAmount'] = cashAmount;
    data['bankAmount'] = bankAmount;
    data['otherAmount'] = otherAmount;
    data['note'] = note;
    data['totalAmount'] = totalAmount;
    data['name'] = name;
    return data;
  }
}
