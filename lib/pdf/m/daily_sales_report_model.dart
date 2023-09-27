class DailySaleReportModel {
  String? status;
  List<DailySaleReportData>? data;

  DailySaleReportModel({this.status, this.data});

  DailySaleReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DailySaleReportData>[];
      json['data'].forEach((v) {
        data!.add(DailySaleReportData.fromJson(v));
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

class DailySaleReportData {
  String? date;
  double? cashAmount;
  double? bankAmount;
  double? otherAmount;
  double? partialAmount;
  double? totalAmount;
  double? remainingAmount;
  String? payBackDay;

  DailySaleReportData(
      {this.date,
      this.cashAmount,
      this.bankAmount,
      this.otherAmount,
      this.partialAmount,
      this.totalAmount,
      this.remainingAmount,
      this.payBackDay});

  DailySaleReportData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    cashAmount = json['cashAmount'];
    bankAmount = json['bankAmount'];
    otherAmount = json['otherAmount'];
    partialAmount = json['partialAmount'];
    totalAmount = json['totalAmount'];
    remainingAmount = json['remainingAmount'];
    payBackDay = json['payBackDay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['cashAmount'] = cashAmount;
    data['bankAmount'] = bankAmount;
    data['otherAmount'] = otherAmount;
    data['partialAmount'] = partialAmount;
    data['totalAmount'] = totalAmount;
    data['remainingAmount'] = remainingAmount;
    data['payBackDay'] = payBackDay;
    return data;
  }
}
