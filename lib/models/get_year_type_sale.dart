// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetSaleYearType {
  String? status;
  List<Data>? data;

  GetSaleYearType({
    this.status,
    this.data,
  });

  

  GetSaleYearType copyWith({
    String? status,
    List<Data>? data,
  }) {
    return GetSaleYearType(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'data': data!.map((x) => x?.toMap()).toList(),
    };
  }

  factory GetSaleYearType.fromMap(Map<String, dynamic> map) {
    return GetSaleYearType(
      status: map['status'] != null ? map['status'] as String : null,
      data: map['data'] != null ? List<Data>.from((map['data'] as List<dynamic>).map<Data?>((x) => Data.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetSaleYearType.fromJson(String source) => GetSaleYearType.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetSaleYearType(status: $status, data: $data)';

  @override
  bool operator ==(covariant GetSaleYearType other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  String? transactionId;
  String? name;
  double? cashAmount;
  double? bankAmount;
  double? otherAmount;
  double? totalAmount;
  String? note;
  int? type;
  String? dateTime;
  Details? details;
  String? currency;
  String? file;
  Data({
    this.transactionId,
    this.name,
    this.cashAmount,
    this.bankAmount,
    this.otherAmount,
    this.totalAmount,
    this.note,
    this.type,
    this.dateTime,
    this.details,
    this.currency,
    this.file,
  });


  Data copyWith({
    String? transactionId,
    String? name,
    double? cashAmount,
    double? bankAmount,
    double? otherAmount,
    double? totalAmount,
    String? note,
    int? type,
    String? dateTime,
    Details? details,
    String? currency,
    String? file,
  }) {
    return Data(
      transactionId: transactionId ?? this.transactionId,
      name: name ?? this.name,
      cashAmount: cashAmount ?? this.cashAmount,
      bankAmount: bankAmount ?? this.bankAmount,
      otherAmount: otherAmount ?? this.otherAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      note: note ?? this.note,
      type: type ?? this.type,
      dateTime: dateTime ?? this.dateTime,
      details: details ?? this.details,
      currency: currency ?? this.currency,
      file: file ?? this.file,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transactionId': transactionId,
      'name': name,
      'cashAmount': cashAmount,
      'bankAmount': bankAmount,
      'otherAmount': otherAmount,
      'totalAmount': totalAmount,
      'note': note,
      'type': type,
      'dateTime': dateTime,
      'details': details?.toMap(),
      'currency': currency,
      'file': file,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      transactionId: map['transactionId'] != null ? map['transactionId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      cashAmount: map['cashAmount'] != null ? map['cashAmount'] as double : null,
      bankAmount: map['bankAmount'] != null ? map['bankAmount'] as double : null,
      otherAmount: map['otherAmount'] != null ? map['otherAmount'] as double : null,
      totalAmount: map['totalAmount'] != null ? map['totalAmount'] as double : null,
      note: map['note'] != null ? map['note'] as String : null,
      type: map['type'] != null ? map['type'] as int : null,
      dateTime: map['dateTime'] != null ? map['dateTime'] as String : null,
      details: map['details'] != null ? Details.fromMap(map['details'] as Map<String,dynamic>) : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      file: map['file'] != null ? map['file'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(transactionId: $transactionId, name: $name, cashAmount: $cashAmount, bankAmount: $bankAmount, otherAmount: $otherAmount, totalAmount: $totalAmount, note: $note, type: $type, dateTime: $dateTime, details: $details, currency: $currency, file: $file)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;
  
    return 
      other.transactionId == transactionId &&
      other.name == name &&
      other.cashAmount == cashAmount &&
      other.bankAmount == bankAmount &&
      other.otherAmount == otherAmount &&
      other.totalAmount == totalAmount &&
      other.note == note &&
      other.type == type &&
      other.dateTime == dateTime &&
      other.details == details &&
      other.currency == currency &&
      other.file == file;
  }

  @override
  int get hashCode {
    return transactionId.hashCode ^
      name.hashCode ^
      cashAmount.hashCode ^
      bankAmount.hashCode ^
      otherAmount.hashCode ^
      totalAmount.hashCode ^
      note.hashCode ^
      type.hashCode ^
      dateTime.hashCode ^
      details.hashCode ^
      currency.hashCode ^
      file.hashCode;
  }
}

class Details {
  int? saleMethod;
  String? payBackDay;
  double? partialAmount;
  double? remainingAmount;
  String? companyId;
  String? name;
  String? email;
  String? telePhone;
  Details({
    this.saleMethod,
    this.payBackDay,
    this.partialAmount,
    this.remainingAmount,
    this.companyId,
    this.name,
    this.email,
    this.telePhone,
  });


  Details copyWith({
    int? saleMethod,
    String? payBackDay,
    double? partialAmount,
    double? remainingAmount,
    String? companyId,
    String? name,
    String? email,
    String? telePhone,
  }) {
    return Details(
      saleMethod: saleMethod ?? this.saleMethod,
      payBackDay: payBackDay ?? this.payBackDay,
      partialAmount: partialAmount ?? this.partialAmount,
      remainingAmount: remainingAmount ?? this.remainingAmount,
      companyId: companyId ?? this.companyId,
      name: name ?? this.name,
      email: email ?? this.email,
      telePhone: telePhone ?? this.telePhone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'saleMethod': saleMethod,
      'payBackDay': payBackDay,
      'partialAmount': partialAmount,
      'remainingAmount': remainingAmount,
      'companyId': companyId,
      'name': name,
      'email': email,
      'telePhone': telePhone,
    };
  }

  factory Details.fromMap(Map<String, dynamic> map) {
    return Details(
      saleMethod: map['saleMethod'] != null ? map['saleMethod'] as int : null,
      payBackDay: map['payBackDay'] != null ? map['payBackDay'] as String : null,
      partialAmount: map['partialAmount'] != null ? map['partialAmount'] as double : null,
      remainingAmount: map['remainingAmount'] != null ? map['remainingAmount'] as double : null,
      companyId: map['companyId'] != null ? map['companyId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      telePhone: map['telePhone'] != null ? map['telePhone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Details.fromJson(String source) => Details.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Details(saleMethod: $saleMethod, payBackDay: $payBackDay, partialAmount: $partialAmount, remainingAmount: $remainingAmount, companyId: $companyId, name: $name, email: $email, telePhone: $telePhone)';
  }

  @override
  bool operator ==(covariant Details other) {
    if (identical(this, other)) return true;
  
    return 
      other.saleMethod == saleMethod &&
      other.payBackDay == payBackDay &&
      other.partialAmount == partialAmount &&
      other.remainingAmount == remainingAmount &&
      other.companyId == companyId &&
      other.name == name &&
      other.email == email &&
      other.telePhone == telePhone;
  }

  @override
  int get hashCode {
    return saleMethod.hashCode ^
      payBackDay.hashCode ^
      partialAmount.hashCode ^
      remainingAmount.hashCode ^
      companyId.hashCode ^
      name.hashCode ^
      email.hashCode ^
      telePhone.hashCode;
  }
}
