// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignupModel {
  String? name;
  String? email;
  String? password;
  String? gender;
  SignupModel({
    this.name,
    this.email,
    this.password,
    this.gender,
  });

  SignupModel copyWith({
    String? name,
    String? email,
    String? password,
    String? gender,
  }) {
    return SignupModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
    };
  }

  factory SignupModel.fromMap(Map<String, dynamic> map) {
    return SignupModel(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupModel.fromJson(String source) =>
      SignupModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignupModel(name: $name, email: $email, password: $password, gender: $gender)';
  }

  @override
  bool operator ==(covariant SignupModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ password.hashCode ^ gender.hashCode;
  }
}
