// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetSalePurhase {
  String? status;
  List<int>? data;
  GetSalePurhase({
    this.status,
    this.data,
  });

  GetSalePurhase copyWith({
    String? status,
    List<int>? data,
  }) {
    return GetSalePurhase(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'data': data,
    };
  }

  factory GetSalePurhase.fromMap(Map<String, dynamic> map) {
    return GetSalePurhase(
      status: map['status'] != null ? map['status'] as String : null,
      data: map['data'] != null
          ? List<int>.from((map['data'] as List<dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetSalePurhase.fromJson(String source) =>
      GetSalePurhase.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetSalePurhase(status: $status, data: $data)';

  @override
  bool operator ==(covariant GetSalePurhase other) {
    if (identical(this, other)) return true;

    return other.status == status && listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}
