// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:snabb_business/screen/invoice/company_model.dart';
import 'package:snabb_business/screen/invoice/items_model.dart';

class InvoiceModel {
  CompanyModel? companyModel;
  CompanyModel? tocompanyModel;
  String? invoidDate;
  String? dueDate;
  List<ItemsModel>? productList;
  String? invoiceNumber;
  String? note;
  String? terms;
  InvoiceModel({
    this.companyModel,
    this.tocompanyModel,
    this.invoidDate,
    this.dueDate,
    this.productList,
    this.invoiceNumber,
    this.note,
    this.terms,
  });

  InvoiceModel copyWith({
    CompanyModel? companyModel,
    CompanyModel? tocompanyModel,
    String? invoidDate,
    String? dueDate,
    List<ItemsModel>? productList,
    String? invoiceNumber,
    String? note,
    String? terms,
  }) {
    return InvoiceModel(
      companyModel: companyModel ?? this.companyModel,
      tocompanyModel: tocompanyModel ?? this.tocompanyModel,
      invoidDate: invoidDate ?? this.invoidDate,
      dueDate: dueDate ?? this.dueDate,
      productList: productList ?? this.productList,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      note: note ?? this.note,
      terms: terms ?? this.terms,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyModel': companyModel?.toMap(),
      'tocompanyModel': tocompanyModel?.toMap(),
      'invoidDate': invoidDate,
      'dueDate': dueDate,
      'productList': productList!.map((x) => x.toMap()).toList(),
      'invoiceNumber': invoiceNumber,
      'note': note,
      'terms': terms,
    };
  }

  factory InvoiceModel.fromMap(Map<String, dynamic> map) {
    return InvoiceModel(
      companyModel: map['companyModel'] != null
          ? CompanyModel.fromMap(map['companyModel'] as Map<String, dynamic>)
          : null,
      tocompanyModel: map['tocompanyModel'] != null
          ? CompanyModel.fromMap(map['tocompanyModel'] as Map<String, dynamic>)
          : null,
      invoidDate:
          map['invoidDate'] != null ? map['invoidDate'] as String : null,
      dueDate: map['dueDate'] != null ? map['dueDate'] as String : null,
      productList: map['productList'] != null
          ? List<ItemsModel>.from(
              (map['productList'] as List<int>).map<ItemsModel?>(
                (x) => ItemsModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      invoiceNumber:
          map['invoiceNumber'] != null ? map['invoiceNumber'] as String : null,
      note: map['note'] != null ? map['note'] as String : null,
      terms: map['terms'] != null ? map['terms'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceModel.fromJson(String source) =>
      InvoiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InvoiceModel(companyModel: $companyModel, tocompanyModel: $tocompanyModel, invoidDate: $invoidDate, dueDate: $dueDate, productList: $productList, invoiceNumber: $invoiceNumber, note: $note, terms: $terms)';
  }

  @override
  bool operator ==(covariant InvoiceModel other) {
    if (identical(this, other)) return true;

    return other.companyModel == companyModel &&
        other.tocompanyModel == tocompanyModel &&
        other.invoidDate == invoidDate &&
        other.dueDate == dueDate &&
        listEquals(other.productList, productList) &&
        other.invoiceNumber == invoiceNumber &&
        other.note == note &&
        other.terms == terms;
  }

  @override
  int get hashCode {
    return companyModel.hashCode ^
        tocompanyModel.hashCode ^
        invoidDate.hashCode ^
        dueDate.hashCode ^
        productList.hashCode ^
        invoiceNumber.hashCode ^
        note.hashCode ^
        terms.hashCode;
  }
}
