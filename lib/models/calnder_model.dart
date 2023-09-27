import 'dart:convert';

import 'package:flutter/foundation.dart';

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// class GetCalanderData {
//   String? status;
//   List<Data>? data;
//   GetCalanderData({
//     this.status,
//     this.data,
//   });

//   GetCalanderData copyWith({
//     String? status,
//     List<Data>? data,
//   }) {
//     return GetCalanderData(
//       status: status ?? this.status,
//       data: data ?? this.data,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'status': status,
//       'data': data!.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory GetCalanderData.fromMap(Map<String, dynamic> map) {
//     return GetCalanderData(
//       status: map['status'] != null ? map['status'] as String : null,
//       data: map['data'] != null
//           ? List<Data>.from(
//               (map['data'] as List<dynamic>).map<Data?>(
//                 (x) => Data.fromMap(x as Map<String, dynamic>),
//               ),
//             )
//           : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory GetCalanderData.fromJson(String source) =>
//       GetCalanderData.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'GetCalanderData(status: $status, data: $data)';

//   @override
//   bool operator ==(covariant GetCalanderData other) {
//     if (identical(this, other)) return true;

//     return other.status == status && listEquals(other.data, data);
//   }

//   @override
//   int get hashCode => status.hashCode ^ data.hashCode;
// }

// class Data {
//   String? name;
//   String? dateTime;
//   String? currency;
//   double? amount;
//   int? type;
//   double? totalIncome;
//   double? totalExpense;
//   Data({
//     this.name,
//     this.dateTime,
//     this.currency,
//     this.amount,
//     this.type,
//     this.totalIncome,
//     this.totalExpense,
//   });

//   Data copyWith({
//     String? name,
//     String? dateTime,
//     String? currency,
//     double? amount,
//     int? type,
//     double? totalIncome,
//     double? totalExpense,
//   }) {
//     return Data(
//       name: name ?? this.name,
//       dateTime: dateTime ?? this.dateTime,
//       currency: currency ?? this.currency,
//       amount: amount ?? this.amount,
//       type: type ?? this.type,
//       totalIncome: totalIncome ?? this.totalIncome,
//       totalExpense: totalExpense ?? this.totalExpense,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'dateTime': dateTime,
//       'currency': currency,
//       'amount': amount,
//       'type': type,
//       'totalIncome': totalIncome,
//       'totalExpense': totalExpense,
//     };
//   }

//   factory Data.fromMap(Map<String, dynamic> map) {
//     return Data(
//       name: map['name'] != null ? map['name'] as String : null,
//       dateTime: map['dateTime'] != null ? map['dateTime'] as String : null,
//       currency: map['currency'] != null ? map['currency'] as String : null,
//       amount: map['amount'] != null ? map['amount'] as double : null,
//       type: map['type'] != null ? map['type'] as int : null,
//       totalIncome:
//           map['totalIncome'] != null ? map['totalIncome'] as double : null,
//       totalExpense:
//           map['totalExpense'] != null ? map['totalExpense'] as double : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Data.fromJson(String source) =>
//       Data.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'Data(name: $name, dateTime: $dateTime, currency: $currency, amount: $amount, type: $type, totalIncome: $totalIncome, totalExpense: $totalExpense)';
//   }

//   @override
//   bool operator ==(covariant Data other) {
//     if (identical(this, other)) return true;

//     return other.name == name &&
//         other.dateTime == dateTime &&
//         other.currency == currency &&
//         other.amount == amount &&
//         other.type == type &&
//         other.totalIncome == totalIncome &&
//         other.totalExpense == totalExpense;
//   }

//   @override
//   int get hashCode {
//     return name.hashCode ^
//         dateTime.hashCode ^
//         currency.hashCode ^
//         amount.hashCode ^
//         type.hashCode ^
//         totalIncome.hashCode ^
//         totalExpense.hashCode;
//   }
// }
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
  String? transactionId;
  String? name;
  String? dateTime;
  String? currency;
  Details? details;
  double? cashAmount;
  double? bankAmount;
  double? otherAmount;
  double? totalAmount;
  int? type;
  double? totalSale;
  double? totalPurchases;
  double? totalExpenses;
  Data({
    this.transactionId,
    this.name,
    this.dateTime,
    this.currency,
    this.details,
    this.cashAmount,
    this.bankAmount,
    this.otherAmount,
    this.totalAmount,
    this.type,
    this.totalSale,
    this.totalPurchases,
    this.totalExpenses,
  });

  Data copyWith({
    String? transactionId,
    String? name,
    String? dateTime,
    String? currency,
    Details? details,
    double? cashAmount,
    double? bankAmount,
    double? otherAmount,
    double? totalAmount,
    int? type,
    double? totalSale,
    double? totalPurchases,
    double? totalExpenses,
  }) {
    return Data(
      transactionId: transactionId ?? this.transactionId,
      name: name ?? this.name,
      dateTime: dateTime ?? this.dateTime,
      currency: currency ?? this.currency,
      details: details ?? this.details,
      cashAmount: cashAmount ?? this.cashAmount,
      bankAmount: bankAmount ?? this.bankAmount,
      otherAmount: otherAmount ?? this.otherAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      type: type ?? this.type,
      totalSale: totalSale ?? this.totalSale,
      totalPurchases: totalPurchases ?? this.totalPurchases,
      totalExpenses: totalExpenses ?? this.totalExpenses,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transactionId': transactionId,
      'name': name,
      'dateTime': dateTime,
      'currency': currency,
      'details': details?.toMap(),
      'cashAmount': cashAmount,
      'bankAmount': bankAmount,
      'otherAmount': otherAmount,
      'totalAmount': totalAmount,
      'type': type,
      'totalSale': totalSale,
      'totalPurchases': totalPurchases,
      'totalExpenses': totalExpenses,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      transactionId:
          map['transactionId'] != null ? map['transactionId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      dateTime: map['dateTime'] != null ? map['dateTime'] as String : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      details: map['details'] != null
          ? Details.fromMap(map['details'] as Map<String, dynamic>)
          : null,
      cashAmount:
          map['cashAmount'] != null ? map['cashAmount'] as double : null,
      bankAmount:
          map['bankAmount'] != null ? map['bankAmount'] as double : null,
      otherAmount:
          map['otherAmount'] != null ? map['otherAmount'] as double : null,
      totalAmount:
          map['totalAmount'] != null ? map['totalAmount'] as double : null,
      type: map['type'] != null ? map['type'] as int : null,
      totalSale: map['totalSale'] != null ? map['totalSale'] as double : null,
      totalPurchases: map['totalPurchases'] != null
          ? map['totalPurchases'] as double
          : null,
      totalExpenses:
          map['totalExpenses'] != null ? map['totalExpenses'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(transactionId: $transactionId, name: $name, dateTime: $dateTime, currency: $currency, details: $details, cashAmount: $cashAmount, bankAmount: $bankAmount, otherAmount: $otherAmount, totalAmount: $totalAmount, type: $type, totalSale: $totalSale, totalPurchases: $totalPurchases, totalExpenses: $totalExpenses)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.transactionId == transactionId &&
        other.name == name &&
        other.dateTime == dateTime &&
        other.currency == currency &&
        other.details == details &&
        other.cashAmount == cashAmount &&
        other.bankAmount == bankAmount &&
        other.otherAmount == otherAmount &&
        other.totalAmount == totalAmount &&
        other.type == type &&
        other.totalSale == totalSale &&
        other.totalPurchases == totalPurchases &&
        other.totalExpenses == totalExpenses;
  }

  @override
  int get hashCode {
    return transactionId.hashCode ^
        name.hashCode ^
        dateTime.hashCode ^
        currency.hashCode ^
        details.hashCode ^
        cashAmount.hashCode ^
        bankAmount.hashCode ^
        otherAmount.hashCode ^
        totalAmount.hashCode ^
        type.hashCode ^
        totalSale.hashCode ^
        totalPurchases.hashCode ^
        totalExpenses.hashCode;
  }
}

class Details {
  String? imageUrl;
  String? category;
  int? saleMethod;
  String? payBackDay;
  double? partialAmount;
  double? remainingAmount;
  String? companyId;
  String? name;
  String? email;
  String? telePhone;
  Details({
    this.imageUrl,
    this.category,
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
    String? imageUrl,
    String? category,
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
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
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
      'imageUrl': imageUrl,
      'category': category,
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
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      saleMethod: map['saleMethod'] != null ? map['saleMethod'] as int : null,
      payBackDay:
          map['payBackDay'] != null ? map['payBackDay'] as String : null,
      partialAmount:
          map['partialAmount'] != null ? map['partialAmount'] as double : null,
      remainingAmount: map['remainingAmount'] != null
          ? map['remainingAmount'] as double
          : null,
      companyId: map['companyId'] != null ? map['companyId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      telePhone: map['telePhone'] != null ? map['telePhone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Details.fromJson(String source) =>
      Details.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Details(imageUrl: $imageUrl, category: $category, saleMethod: $saleMethod, payBackDay: $payBackDay, partialAmount: $partialAmount, remainingAmount: $remainingAmount, companyId: $companyId, name: $name, email: $email, telePhone: $telePhone)';
  }

  @override
  bool operator ==(covariant Details other) {
    if (identical(this, other)) return true;

    return other.imageUrl == imageUrl &&
        other.category == category &&
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
    return imageUrl.hashCode ^
        category.hashCode ^
        saleMethod.hashCode ^
        payBackDay.hashCode ^
        partialAmount.hashCode ^
        remainingAmount.hashCode ^
        companyId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        telePhone.hashCode;
  }
}
