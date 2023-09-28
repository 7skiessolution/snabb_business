class CompanySaleReportModel {
  String? status;
  List<CompanySaleReportData>? data;

  CompanySaleReportModel({this.status, this.data});

  CompanySaleReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CompanySaleReportData>[];
      json['data'].forEach((v) {
        data!.add(CompanySaleReportData.fromJson(v));
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

class CompanySaleReportData {
  String? date;
  double? cashAmount;
  double? bankAmount;
  double? otherAmount;
  double? partialAmount;
  double? totalAmount;
  double? remainingAmount;
  String? payBackDay;
  String? name;
  String? email;
  String? telePhone;

  CompanySaleReportData(
      {this.date,
      this.cashAmount,
      this.bankAmount,
      this.otherAmount,
      this.partialAmount,
      this.totalAmount,
      this.remainingAmount,
      this.payBackDay,
      this.name,
      this.email,
      this.telePhone});

  CompanySaleReportData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    cashAmount = json['cashAmount'];
    bankAmount = json['bankAmount'];
    otherAmount = json['otherAmount'];
    partialAmount = json['partialAmount'];
    totalAmount = json['totalAmount'];
    remainingAmount = json['remainingAmount'];
    payBackDay = json['payBackDay'];
    name = json['name'];
    email = json['email'];
    telePhone = json['telePhone'];
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
    data['name'] = name;
    data['email'] = email;
    data['telePhone'] = telePhone;
    return data;
  }
}
