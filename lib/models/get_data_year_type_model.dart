// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetDataYearType {
  String? status;
  List<Data>? data;
  GetDataYearType({
    this.status,
    this.data,
  });

  GetDataYearType copyWith({
    String? status,
    List<Data>? data,
  }) {
    return GetDataYearType(
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

  factory GetDataYearType.fromMap(Map<String, dynamic> map) {
    return GetDataYearType(
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

  factory GetDataYearType.fromJson(String source) =>
      GetDataYearType.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetDataYearType(status: $status, data: $data)';

  @override
  bool operator ==(covariant GetDataYearType other) {
    if (identical(this, other)) return true;

    return other.status == status && listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  String? name;
  double? amount;
  String? note;
  String? dateTime;
  String? files;
  double? partialAmount;
  int? type;
  int? paymentType;
  String? category;
  String? currency;
  String? imageUrl;
  Data({
    this.name,
    this.amount,
    this.note,
    this.dateTime,
    this.files,
    this.partialAmount,
    this.type,
    this.paymentType,
    this.category,
    this.currency,
    this.imageUrl,
  });

  Data copyWith({
    String? name,
    double? amount,
    String? note,
    String? dateTime,
    String? files,
    double? partialAmount,
    int? type,
    int? paymentType,
    String? category,
    String? currency,
    String? imageUrl,
  }) {
    return Data(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      dateTime: dateTime ?? this.dateTime,
      files: files ?? this.files,
      partialAmount: partialAmount ?? this.partialAmount,
      type: type ?? this.type,
      paymentType: paymentType ?? this.paymentType,
      category: category ?? this.category,
      currency: currency ?? this.currency,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'amount': amount,
      'note': note,
      'dateTime': dateTime,
      'files': files,
      'partialAmount': partialAmount,
      'type': type,
      'paymentType': paymentType,
      'category': category,
      'currency': currency,
      'imageUrl': imageUrl,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      name: map['name'] != null ? map['name'] as String : null,
      amount: map['amount'] != null ? map['amount'] as double : null,
      note: map['note'] != null ? map['note'] as String : null,
      dateTime: map['dateTime'] != null ? map['dateTime'] as String : null,
      files: map['files'] != null ? map['files'] as String : null,
      partialAmount:
          map['partialAmount'] != null ? map['partialAmount'] as double : null,
      type: map['type'] != null ? map['type'] as int : null,
      paymentType:
          map['paymentType'] != null ? map['paymentType'] as int : null,
      category: map['category'] != null ? map['category'] as String : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(name: $name, amount: $amount, note: $note, dateTime: $dateTime, files: $files, partialAmount: $partialAmount, type: $type, paymentType: $paymentType, category: $category, currency: $currency, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.amount == amount &&
        other.note == note &&
        other.dateTime == dateTime &&
        other.files == files &&
        other.partialAmount == partialAmount &&
        other.type == type &&
        other.paymentType == paymentType &&
        other.category == category &&
        other.currency == currency &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        amount.hashCode ^
        note.hashCode ^
        dateTime.hashCode ^
        files.hashCode ^
        partialAmount.hashCode ^
        type.hashCode ^
        paymentType.hashCode ^
        category.hashCode ^
        currency.hashCode ^
        imageUrl.hashCode;
  }
}
