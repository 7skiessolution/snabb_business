// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetCalanderData {
  String? status;
  List<Data>? data;
  GetCalanderData({
    this.status,
    this.data,
  });

  GetCalanderData copyWith({
    String? status,
    List<Data>? data,
  }) {
    return GetCalanderData(
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

  factory GetCalanderData.fromMap(Map<String, dynamic> map) {
    return GetCalanderData(
      status: map['status'] != null ? map['status'] as String : null,
      data: map['data'] != null
          ? List<Data>.from(
              (map['data'] as List<dynamic>).map<Data?>(
                (x) => Data.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCalanderData.fromJson(String source) =>
      GetCalanderData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetCalanderData(status: $status, data: $data)';

  @override
  bool operator ==(covariant GetCalanderData other) {
    if (identical(this, other)) return true;

    return other.status == status && listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  String? name;
  String? dateTime;
  String? currency;
  double? amount;
  int? type;
  double? totalIncome;
  double? totalExpense;
  Data({
    this.name,
    this.dateTime,
    this.currency,
    this.amount,
    this.type,
    this.totalIncome,
    this.totalExpense,
  });

  Data copyWith({
    String? name,
    String? dateTime,
    String? currency,
    double? amount,
    int? type,
    double? totalIncome,
    double? totalExpense,
  }) {
    return Data(
      name: name ?? this.name,
      dateTime: dateTime ?? this.dateTime,
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      totalIncome: totalIncome ?? this.totalIncome,
      totalExpense: totalExpense ?? this.totalExpense,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'dateTime': dateTime,
      'currency': currency,
      'amount': amount,
      'type': type,
      'totalIncome': totalIncome,
      'totalExpense': totalExpense,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      name: map['name'] != null ? map['name'] as String : null,
      dateTime: map['dateTime'] != null ? map['dateTime'] as String : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      amount: map['amount'] != null ? map['amount'] as double : null,
      type: map['type'] != null ? map['type'] as int : null,
      totalIncome:
          map['totalIncome'] != null ? map['totalIncome'] as double : null,
      totalExpense:
          map['totalExpense'] != null ? map['totalExpense'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(name: $name, dateTime: $dateTime, currency: $currency, amount: $amount, type: $type, totalIncome: $totalIncome, totalExpense: $totalExpense)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.dateTime == dateTime &&
        other.currency == currency &&
        other.amount == amount &&
        other.type == type &&
        other.totalIncome == totalIncome &&
        other.totalExpense == totalExpense;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        dateTime.hashCode ^
        currency.hashCode ^
        amount.hashCode ^
        type.hashCode ^
        totalIncome.hashCode ^
        totalExpense.hashCode;
  }
}
