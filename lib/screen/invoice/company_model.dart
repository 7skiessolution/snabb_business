// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CompanyModel {
  String? companyName;
  String? city;
  String? state;
  String? address;
  String? country;
  String? postal;
  CompanyModel({
    this.companyName,
    this.city,
    this.state,
    this.address,
    this.country,
    this.postal,
  });

  CompanyModel copyWith({
    String? companyName,
    String? city,
    String? state,
    String? address,
    String? country,
    String? postal,
  }) {
    return CompanyModel(
      companyName: companyName ?? this.companyName,
      city: city ?? this.city,
      state: state ?? this.state,
      address: address ?? this.address,
      country: country ?? this.country,
      postal: postal ?? this.postal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyName': companyName,
      'city': city,
      'state': state,
      'address': address,
      'country': country,
      'postal': postal,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      companyName:
          map['companyName'] != null ? map['companyName'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      postal: map['postal'] != null ? map['postal'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CompanyModel(companyName: $companyName, city: $city, state: $state, address: $address, country: $country, postal: $postal)';
  }

  @override
  bool operator ==(covariant CompanyModel other) {
    if (identical(this, other)) return true;

    return other.companyName == companyName &&
        other.city == city &&
        other.state == state &&
        other.address == address &&
        other.country == country &&
        other.postal == postal;
  }

  @override
  int get hashCode {
    return companyName.hashCode ^
        city.hashCode ^
        state.hashCode ^
        address.hashCode ^
        country.hashCode ^
        postal.hashCode;
  }
}
