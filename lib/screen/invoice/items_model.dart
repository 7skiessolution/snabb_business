// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemsModel {
  int? qty;
  String? name;
  double? amount;
  double? tax;
  ItemsModel({
    this.qty,
    this.name,
    this.amount,
    this.tax,
  });

  ItemsModel copyWith({
    int? qty,
    String? name,
    double? amount,
    double? tax,
  }) {
    return ItemsModel(
      qty: qty ?? this.qty,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      tax: tax ?? this.tax,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'qty': qty,
      'name': name,
      'amount': amount,
      'tax': tax,
    };
  }

  factory ItemsModel.fromMap(Map<String, dynamic> map) {
    return ItemsModel(
      qty: map['qty'] != null ? map['qty'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      amount: map['amount'] != null ? map['amount'] as double : null,
      tax: map['tax'] != null ? map['tax'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemsModel.fromJson(String source) =>
      ItemsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemsModel(qty: $qty, name: $name, amount: $amount, tax: $tax)';
  }

  @override
  bool operator ==(covariant ItemsModel other) {
    if (identical(this, other)) return true;

    return other.qty == qty &&
        other.name == name &&
        other.amount == amount &&
        other.tax == tax;
  }

  @override
  int get hashCode {
    return qty.hashCode ^ name.hashCode ^ amount.hashCode ^ tax.hashCode;
  }
}
