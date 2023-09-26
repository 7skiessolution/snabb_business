// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CatagoryModel {
  String? status;
  List<Data>? data;
  CatagoryModel({
    this.status,
    this.data,
  });

  CatagoryModel copyWith({
    String? status,
    List<Data>? data,
  }) {
    return CatagoryModel(
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

  factory CatagoryModel.fromMap(Map<String, dynamic> map) {
    return CatagoryModel(
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

  factory CatagoryModel.fromJson(String source) =>
      CatagoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CatagoryModel(status: $status, data: $data)';

  @override
  bool operator ==(covariant CatagoryModel other) {
    if (identical(this, other)) return true;

    return other.status == status && listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  String? name;

  String? imageUrl;

  Data({
    this.name,
    this.imageUrl,
  });

  Data copyWith({
    String? name,
    String? imageUrl,
  }) {
    return Data(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      name: map['name'] != null ? map['name'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(name: $name, imageUrl: $imageUrl,)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.name == name && other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^ imageUrl.hashCode;
  }
}
