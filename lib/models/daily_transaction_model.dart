// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserDailyTransaction {
  String? status;
  List<Data>? data;
  UserDailyTransaction({
    this.status,
    this.data,
  });

  UserDailyTransaction copyWith({
    String? status,
    List<Data>? data,
  }) {
    return UserDailyTransaction(
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

  factory UserDailyTransaction.fromMap(Map<String, dynamic> map) {
    return UserDailyTransaction(
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

  factory UserDailyTransaction.fromJson(String source) =>
      UserDailyTransaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserDailyTransaction(status: $status, data: $data)';

  @override
  bool operator ==(covariant UserDailyTransaction other) {
    if (identical(this, other)) return true;

    return other.status == status && listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  String? day;
  List<Transactions>? transactions;
  Data({
    this.day,
    this.transactions,
  });

  Data copyWith({
    String? day,
    List<Transactions>? transactions,
  }) {
    return Data(
      day: day ?? this.day,
      transactions: transactions ?? this.transactions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'transactions': transactions!.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      day: map['day'] != null ? map['day'] as String : null,
      transactions: map['transactions'] != null
          ? List<Transactions>.from(
              (map['transactions'] as List<dynamic>).map<Transactions?>(
                (x) => Transactions.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Data(day: $day, transactions: $transactions)';

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.day == day && listEquals(other.transactions, transactions);
  }

  @override
  int get hashCode => day.hashCode ^ transactions.hashCode;
}

class Transactions {
  String? name;
  double? amount;
  String? note;
  String? dateTime;
  int? type;
  String? currency;
  String? imageUrl;
  String? file;
  String? category;
  String? transactionId;
  double? partialAmount;
  Transactions({
    this.name,
    this.amount,
    this.note,
    this.dateTime,
    this.type,
    this.currency,
    this.imageUrl,
    this.file,
    this.category,
    this.transactionId,
    this.partialAmount,
  });

  Transactions copyWith({
    String? name,
    double? amount,
    String? note,
    String? dateTime,
    int? type,
    String? currency,
    String? imageUrl,
    String? file,
    String? category,
    String? transactionId,
    double? partialAmount,
  }) {
    return Transactions(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      dateTime: dateTime ?? this.dateTime,
      type: type ?? this.type,
      currency: currency ?? this.currency,
      imageUrl: imageUrl ?? this.imageUrl,
      file: file ?? this.file,
      category: category ?? this.category,
      transactionId: transactionId ?? this.transactionId,
      partialAmount: partialAmount ?? this.partialAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'amount': amount,
      'note': note,
      'dateTime': dateTime,
      'type': type,
      'currency': currency,
      'imageUrl': imageUrl,
      'file': file,
      'category': category,
      'transactionId': transactionId,
      'partialAmount': partialAmount,
    };
  }

  factory Transactions.fromMap(Map<String, dynamic> map) {
    return Transactions(
      name: map['name'] != null ? map['name'] as String : null,
      amount: map['amount'] != null ? map['amount'] as double : null,
      note: map['note'] != null ? map['note'] as String : null,
      dateTime: map['dateTime'] != null ? map['dateTime'] as String : null,
      type: map['type'] != null ? map['type'] as int : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      file: map['file'] != null ? map['file'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      transactionId:
          map['transactionId'] != null ? map['transactionId'] as String : null,
      partialAmount:
          map['partialAmount'] != null ? map['partialAmount'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transactions.fromJson(String source) =>
      Transactions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Transactions(name: $name, amount: $amount, note: $note, dateTime: $dateTime, type: $type, currency: $currency, imageUrl: $imageUrl, file: $file, category: $category, transactionId: $transactionId, partialAmount: $partialAmount)';
  }

  @override
  bool operator ==(covariant Transactions other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.amount == amount &&
        other.note == note &&
        other.dateTime == dateTime &&
        other.type == type &&
        other.currency == currency &&
        other.imageUrl == imageUrl &&
        other.file == file &&
        other.category == category &&
        other.transactionId == transactionId &&
        other.partialAmount == partialAmount;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        amount.hashCode ^
        note.hashCode ^
        dateTime.hashCode ^
        type.hashCode ^
        currency.hashCode ^
        imageUrl.hashCode ^
        file.hashCode ^
        category.hashCode ^
        transactionId.hashCode ^
        partialAmount.hashCode;
  }
}
