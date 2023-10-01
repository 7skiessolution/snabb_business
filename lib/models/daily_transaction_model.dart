import 'dart:convert';

import 'package:flutter/foundation.dart';

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// class UserDailyTransaction {
//   String? status;
//   List<Data>? data;
//   UserDailyTransaction({
//     this.status,
//     this.data,
//   });

//   UserDailyTransaction copyWith({
//     String? status,
//     List<Data>? data,
//   }) {
//     return UserDailyTransaction(
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

//   factory UserDailyTransaction.fromMap(Map<String, dynamic> map) {
//     return UserDailyTransaction(
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

//   factory UserDailyTransaction.fromJson(String source) =>
//       UserDailyTransaction.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'UserDailyTransaction(status: $status, data: $data)';

//   @override
//   bool operator ==(covariant UserDailyTransaction other) {
//     if (identical(this, other)) return true;

//     return other.status == status && listEquals(other.data, data);
//   }

//   @override
//   int get hashCode => status.hashCode ^ data.hashCode;
// }

// class Data {
//   String? day;
//   List<Transactions>? transactions;
//   Data({
//     this.day,
//     this.transactions,
//   });

//   Data copyWith({
//     String? day,
//     List<Transactions>? transactions,
//   }) {
//     return Data(
//       day: day ?? this.day,
//       transactions: transactions ?? this.transactions,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'day': day,
//       'transactions': transactions!.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory Data.fromMap(Map<String, dynamic> map) {
//     return Data(
//       day: map['day'] != null ? map['day'] as String : null,
//       transactions: map['transactions'] != null
//           ? List<Transactions>.from(
//               (map['transactions'] as List<dynamic>).map<Transactions?>(
//                 (x) => Transactions.fromMap(x as Map<String, dynamic>),
//               ),
//             )
//           : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Data.fromJson(String source) =>
//       Data.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'Data(day: $day, transactions: $transactions)';

//   @override
//   bool operator ==(covariant Data other) {
//     if (identical(this, other)) return true;

//     return other.day == day && listEquals(other.transactions, transactions);
//   }

//   @override
//   int get hashCode => day.hashCode ^ transactions.hashCode;
// }

// class Transactions {
//   String? name;
//   double? amount;
//   String? note;
//   String? dateTime;
//   int? type;
//   String? currency;
//   String? imageUrl;
//   String? file;
//   String? category;
//   String? transactionId;
//   double? partialAmount;
//   Transactions({
//     this.name,
//     this.amount,
//     this.note,
//     this.dateTime,
//     this.type,
//     this.currency,
//     this.imageUrl,
//     this.file,
//     this.category,
//     this.transactionId,
//     this.partialAmount,
//   });

//   Transactions copyWith({
//     String? name,
//     double? amount,
//     String? note,
//     String? dateTime,
//     int? type,
//     String? currency,
//     String? imageUrl,
//     String? file,
//     String? category,
//     String? transactionId,
//     double? partialAmount,
//   }) {
//     return Transactions(
//       name: name ?? this.name,
//       amount: amount ?? this.amount,
//       note: note ?? this.note,
//       dateTime: dateTime ?? this.dateTime,
//       type: type ?? this.type,
//       currency: currency ?? this.currency,
//       imageUrl: imageUrl ?? this.imageUrl,
//       file: file ?? this.file,
//       category: category ?? this.category,
//       transactionId: transactionId ?? this.transactionId,
//       partialAmount: partialAmount ?? this.partialAmount,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'amount': amount,
//       'note': note,
//       'dateTime': dateTime,
//       'type': type,
//       'currency': currency,
//       'imageUrl': imageUrl,
//       'file': file,
//       'category': category,
//       'transactionId': transactionId,
//       'partialAmount': partialAmount,
//     };
//   }

//   factory Transactions.fromMap(Map<String, dynamic> map) {
//     return Transactions(
//       name: map['name'] != null ? map['name'] as String : null,
//       amount: map['amount'] != null ? map['amount'] as double : null,
//       note: map['note'] != null ? map['note'] as String : null,
//       dateTime: map['dateTime'] != null ? map['dateTime'] as String : null,
//       type: map['type'] != null ? map['type'] as int : null,
//       currency: map['currency'] != null ? map['currency'] as String : null,
//       imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
//       file: map['file'] != null ? map['file'] as String : null,
//       category: map['category'] != null ? map['category'] as String : null,
//       transactionId:
//           map['transactionId'] != null ? map['transactionId'] as String : null,
//       partialAmount:
//           map['partialAmount'] != null ? map['partialAmount'] as double : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Transactions.fromJson(String source) =>
//       Transactions.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'Transactions(name: $name, amount: $amount, note: $note, dateTime: $dateTime, type: $type, currency: $currency, imageUrl: $imageUrl, file: $file, category: $category, transactionId: $transactionId, partialAmount: $partialAmount)';
//   }

//   @override
//   bool operator ==(covariant Transactions other) {
//     if (identical(this, other)) return true;

//     return other.name == name &&
//         other.amount == amount &&
//         other.note == note &&
//         other.dateTime == dateTime &&
//         other.type == type &&
//         other.currency == currency &&
//         other.imageUrl == imageUrl &&
//         other.file == file &&
//         other.category == category &&
//         other.transactionId == transactionId &&
//         other.partialAmount == partialAmount;
//   }

//   @override
//   int get hashCode {
//     return name.hashCode ^
//         amount.hashCode ^
//         note.hashCode ^
//         dateTime.hashCode ^
//         type.hashCode ^
//         currency.hashCode ^
//         imageUrl.hashCode ^
//         file.hashCode ^
//         category.hashCode ^
//         transactionId.hashCode ^
//         partialAmount.hashCode;
//   }
// }
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
  Transactions({
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

  Transactions copyWith({
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
    return Transactions(
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

  factory Transactions.fromMap(Map<String, dynamic> map) {
    return Transactions(
      transactionId:
          map['transactionId'] != null ? map['transactionId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      cashAmount:
          map['cashAmount'] != null ? map['cashAmount'] as double : null,
      bankAmount:
          map['bankAmount'] != null ? map['bankAmount'] as double : null,
      otherAmount:
          map['otherAmount'] != null ? map['otherAmount'] as double : null,
      totalAmount:
          map['totalAmount'] != null ? map['totalAmount'] as double : null,
      note: map['note'] != null ? map['note'] as String : null,
      type: map['type'] != null ? map['type'] as int : null,
      dateTime: map['dateTime'] != null ? map['dateTime'] as String : null,
      details: map['details'] != null
          ? Details.fromMap(map['details'] as Map<String, dynamic>)
          : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      file: map['file'] != null ? map['file'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transactions.fromJson(String source) =>
      Transactions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Transactions(transactionId: $transactionId, name: $name, cashAmount: $cashAmount, bankAmount: $bankAmount, otherAmount: $otherAmount, totalAmount: $totalAmount, note: $note, type: $type, dateTime: $dateTime, details: $details, currency: $currency, file: $file)';
  }

  @override
  bool operator ==(covariant Transactions other) {
    if (identical(this, other)) return true;

    return other.transactionId == transactionId &&
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
  String? imageUrl;
  String? category;
  String? payBackDay;
  double? partialAmount;
  double? remainingAmount;
  String? supplierId;
  String? name;
  String? email;
  String? telePhone;
  String? address;
  String? companyReg;
  bool? isCompany;
  int? saleMethod;
  String? companyId;
  Details({
    this.imageUrl,
    this.category,
    this.payBackDay,
    this.partialAmount,
    this.remainingAmount,
    this.supplierId,
    this.name,
    this.email,
    this.telePhone,
    this.address,
    this.companyReg,
    this.isCompany,
    this.saleMethod,
    this.companyId,
  });

  Details copyWith({
    String? imageUrl,
    String? category,
    String? payBackDay,
    double? partialAmount,
    double? remainingAmount,
    String? supplierId,
    String? name,
    String? email,
    String? telePhone,
    String? address,
    String? companyReg,
    bool? isCompany,
    int? saleMethod,
    String? companyId,
  }) {
    return Details(
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      payBackDay: payBackDay ?? this.payBackDay,
      partialAmount: partialAmount ?? this.partialAmount,
      remainingAmount: remainingAmount ?? this.remainingAmount,
      supplierId: supplierId ?? this.supplierId,
      name: name ?? this.name,
      email: email ?? this.email,
      telePhone: telePhone ?? this.telePhone,
      address: address ?? this.address,
      companyReg: companyReg ?? this.companyReg,
      isCompany: isCompany ?? this.isCompany,
      saleMethod: saleMethod ?? this.saleMethod,
      companyId: companyId ?? this.companyId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'category': category,
      'payBackDay': payBackDay,
      'partialAmount': partialAmount,
      'remainingAmount': remainingAmount,
      'supplierId': supplierId,
      'name': name,
      'email': email,
      'telePhone': telePhone,
      'address': address,
      'companyReg': companyReg,
      'isCompany': isCompany,
      'saleMethod': saleMethod,
      'companyId': companyId,
    };
  }

  factory Details.fromMap(Map<String, dynamic> map) {
    return Details(
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      payBackDay:
          map['payBackDay'] != null ? map['payBackDay'] as String : null,
      partialAmount:
          map['partialAmount'] != null ? map['partialAmount'] as double : null,
      remainingAmount: map['remainingAmount'] != null
          ? map['remainingAmount'] as double
          : null,
      supplierId:
          map['supplierId'] != null ? map['supplierId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      telePhone: map['telePhone'] != null ? map['telePhone'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      companyReg:
          map['companyReg'] != null ? map['companyReg'] as String : null,
      isCompany: map['isCompany'] != null ? map['isCompany'] as bool : null,
      saleMethod: map['saleMethod'] != null ? map['saleMethod'] as int : null,
      companyId: map['companyId'] != null ? map['companyId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Details.fromJson(String source) =>
      Details.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Details(imageUrl: $imageUrl, category: $category, payBackDay: $payBackDay, partialAmount: $partialAmount, remainingAmount: $remainingAmount, supplierId: $supplierId, name: $name, email: $email, telePhone: $telePhone, address: $address, companyReg: $companyReg, isCompany: $isCompany, saleMethod: $saleMethod, companyId: $companyId)';
  }

  @override
  bool operator ==(covariant Details other) {
    if (identical(this, other)) return true;

    return other.imageUrl == imageUrl &&
        other.category == category &&
        other.payBackDay == payBackDay &&
        other.partialAmount == partialAmount &&
        other.remainingAmount == remainingAmount &&
        other.supplierId == supplierId &&
        other.name == name &&
        other.email == email &&
        other.telePhone == telePhone &&
        other.address == address &&
        other.companyReg == companyReg &&
        other.isCompany == isCompany &&
        other.saleMethod == saleMethod &&
        other.companyId == companyId;
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^
        category.hashCode ^
        payBackDay.hashCode ^
        partialAmount.hashCode ^
        remainingAmount.hashCode ^
        supplierId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        telePhone.hashCode ^
        address.hashCode ^
        companyReg.hashCode ^
        isCompany.hashCode ^
        saleMethod.hashCode ^
        companyId.hashCode;
  }
}
