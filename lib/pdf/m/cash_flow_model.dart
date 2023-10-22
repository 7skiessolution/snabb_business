// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CashFlowReport {
  String? status;
  List<CashFlowData>? data;
  CashFlowReport({
    this.status,
    this.data,
  });

  CashFlowReport copyWith({
    String? status,
    List<CashFlowData>? data,
  }) {
    return CashFlowReport(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'data': data!.map((x) => x.toMap()).toList(),
    };
  }

  factory CashFlowReport.fromMap(Map<String, dynamic> map) {
    return CashFlowReport(
      status: map['status'] != null ? map['status'] as String : null,
      data: map['data'] != null
          ? List<CashFlowData>.from(
              (map['data'] as List<dynamic>).map<CashFlowData?>(
                (x) => CashFlowData.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CashFlowReport.fromJson(String source) =>
      CashFlowReport.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CashFlowReport(status: $status, data: $data)';

  @override
  bool operator ==(covariant CashFlowReport other) {
    if (identical(this, other)) return true;

    return other.status == status && listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class CashFlowData {
  String? date;
  double? expense;
  double? sale;
  double? purchase;
  CashFlowData({
    this.date,
    this.expense,
    this.sale,
    this.purchase,
  });
 

  CashFlowData copyWith({
    String? date,
    double? expense,
    double? sale,
    double? purchase,
  }) {
    return CashFlowData(
      date: date ?? this.date,
      expense: expense ?? this.expense,
      sale: sale ?? this.sale,
      purchase: purchase ?? this.purchase,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'expense': expense,
      'sale': sale,
      'purchase': purchase,
    };
  }

  factory CashFlowData.fromMap(Map<String, dynamic> map) {
    return CashFlowData(
      date: map['date'] != null ? map['date'] as String : null,
      expense: map['expense'] != null ? map['expense'] as double : null,
      sale: map['sale'] != null ? map['sale'] as double : null,
      purchase: map['purchase'] != null ? map['purchase'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CashFlowData.fromJson(String source) => CashFlowData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CashFlowData(date: $date, expense: $expense, sale: $sale, purchase: $purchase)';
  }

  @override
  bool operator ==(covariant CashFlowData other) {
    if (identical(this, other)) return true;
  
    return 
      other.date == date &&
      other.expense == expense &&
      other.sale == sale &&
      other.purchase == purchase;
  }

  @override
  int get hashCode {
    return date.hashCode ^
      expense.hashCode ^
      sale.hashCode ^
      purchase.hashCode;
  }
}
