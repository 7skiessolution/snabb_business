// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class SupplierModel {
  String? status;
  List<Data>? data;
  SupplierModel({
    this.status,
    this.data,
  });

  SupplierModel copyWith({
    String? status,
    List<Data>? data,
  }) {
    return SupplierModel(
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

  factory SupplierModel.fromMap(Map<String, dynamic> map) {
    return SupplierModel(
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

  factory SupplierModel.fromJson(String source) =>
      SupplierModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SupplierModel(status: $status, data: $data)';

  @override
  bool operator ==(covariant SupplierModel other) {
    if (identical(this, other)) return true;

    return other.status == status && listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  String? name;
  String? supplierId;
  String? email;
  String? telePhone;
  String? address;
  String? companyReg;
  bool? isCompany;
  Data({
    this.name,
    this.supplierId,
    this.email,
    this.telePhone,
    this.address,
    this.companyReg,
    this.isCompany,
  });

  Data copyWith({
    String? name,
    String? supplierId,
    String? email,
    String? telePhone,
    String? address,
    String? companyReg,
    bool? isCompany,
  }) {
    return Data(
      name: name ?? this.name,
      supplierId: supplierId ?? this.supplierId,
      email: email ?? this.email,
      telePhone: telePhone ?? this.telePhone,
      address: address ?? this.address,
      companyReg: companyReg ?? this.companyReg,
      isCompany: isCompany ?? this.isCompany,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'supplierId': supplierId,
      'email': email,
      'telePhone': telePhone,
      'address': address,
      'companyReg': companyReg,
      'isCompany': isCompany,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      name: map['name'] != null ? map['name'] as String : null,
      supplierId:
          map['supplierId'] != null ? map['supplierId'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      telePhone: map['telePhone'] != null ? map['telePhone'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      companyReg:
          map['companyReg'] != null ? map['companyReg'] as String : null,
      isCompany: map['isCompany'] != null ? map['isCompany'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(name: $name, supplierId: $supplierId, email: $email, telePhone: $telePhone, address: $address, companyReg: $companyReg, isCompany: $isCompany)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.supplierId == supplierId &&
        other.email == email &&
        other.telePhone == telePhone &&
        other.address == address &&
        other.companyReg == companyReg &&
        other.isCompany == isCompany;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        supplierId.hashCode ^
        email.hashCode ^
        telePhone.hashCode ^
        address.hashCode ^
        companyReg.hashCode ^
        isCompany.hashCode;
  }
}
