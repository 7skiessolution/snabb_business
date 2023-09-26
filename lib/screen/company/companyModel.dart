// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CompanyModel {
  String? status;
  List<Data>? data;
  CompanyModel({
    this.status,
    this.data,
  });

  CompanyModel copyWith({
    String? status,
    List<Data>? data,
  }) {
    return CompanyModel(
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

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
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

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CompanyModel(status: $status, data: $data)';

  @override
  bool operator ==(covariant CompanyModel other) {
    if (identical(this, other)) return true;

    return other.status == status && listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  String? name;
  String? companyId;
  String? email;
  String? telePhone;
  Data({
    this.name,
    this.companyId,
    this.email,
    this.telePhone,
  });

  Data copyWith({
    String? name,
    String? companyId,
    String? email,
    String? telePhone,
  }) {
    return Data(
      name: name ?? this.name,
      companyId: companyId ?? this.companyId,
      email: email ?? this.email,
      telePhone: telePhone ?? this.telePhone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'companyId': companyId,
      'email': email,
      'telePhone': telePhone,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      name: map['name'] != null ? map['name'] as String : null,
      companyId: map['companyId'] != null ? map['companyId'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      telePhone: map['telePhone'] != null ? map['telePhone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(name: $name, companyId: $companyId, email: $email, telePhone: $telePhone)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.companyId == companyId &&
        other.email == email &&
        other.telePhone == telePhone;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        companyId.hashCode ^
        email.hashCode ^
        telePhone.hashCode;
  }
}
