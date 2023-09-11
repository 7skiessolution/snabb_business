// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Dept {
  String? id;
  String? status;
  int? amount;
  DateTime? date;
  DateTime? backDate;
  String? to;
  int? paidamount;
  String? imgUrl;
  String? note;
  String? type;

  Dept({
    this.id,
    this.status,
    this.amount,
    this.date,
    this.backDate,
    this.to,
    this.paidamount,
    this.imgUrl,
    this.note,
    this.type,
  });

  factory Dept.fromJson(Map<String, dynamic> json) {
    return Dept(
      id: json['id'],
      status: json['status'],
      amount: json['amount'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      backDate:
          json['backDate'] != null ? DateTime.parse(json['backDate']) : null,
      to: json['to'],
      paidamount: json['paidamount'],
      imgUrl: json['imgUrl'],
      note: json['note'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'amount': amount,
      'date': date?.toIso8601String(),
      'backDate': backDate?.toIso8601String(),
      'to': to,
      'paidamount': paidamount,
      'imgUrl': imgUrl,
      'note': note,
      'type': type,
    };
  }
}
