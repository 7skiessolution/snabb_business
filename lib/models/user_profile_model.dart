// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserProfileModel {
  String? status;
  Data? data;
  UserProfileModel({
    this.status,
    this.data,
  });

  UserProfileModel copyWith({
    String? status,
    Data? data,
  }) {
    return UserProfileModel(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'data': data?.toMap(),
    };
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      status: map['status'] != null ? map['status'] as String : null,
      data: map['data'] != null
          ? Data.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromJson(String source) =>
      UserProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserProfileModel(status: $status, data: $data)';

  @override
  bool operator ==(covariant UserProfileModel other) {
    if (identical(this, other)) return true;

    return other.status == status && other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  String? userId;
  String? name;
  String? email;
  String? gender;
  String? imageUrl;
  double? expense;
  double? sale;
  double? purchase;
  Data({
    this.userId,
    this.name,
    this.email,
    this.gender,
    this.imageUrl,
    this.expense,
    this.sale,
    this.purchase,
  });

  Data copyWith({
    String? userId,
    String? name,
    String? email,
    String? gender,
    String? imageUrl,
    double? expense,
    double? sale,
    double? purchase,
  }) {
    return Data(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      imageUrl: imageUrl ?? this.imageUrl,
      expense: expense ?? this.expense,
      sale: sale ?? this.sale,
      purchase: purchase ?? this.purchase,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'name': name,
      'email': email,
      'gender': gender,
      'imageUrl': imageUrl,
      'expense': expense,
      'sale': sale,
      'purchase': purchase,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      userId: map['userId'] != null ? map['userId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      expense: map['expense'] != null ? map['expense'] as double : null,
      sale: map['sale'] != null ? map['sale'] as double : null,
      purchase: map['purchase'] != null ? map['purchase'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(userId: $userId, name: $name, email: $email, gender: $gender, imageUrl: $imageUrl, expense: $expense, sale: $sale, purchase: $purchase)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.name == name &&
        other.email == email &&
        other.gender == gender &&
        other.imageUrl == imageUrl &&
        other.expense == expense &&
        other.sale == sale &&
        other.purchase == purchase;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        gender.hashCode ^
        imageUrl.hashCode ^
        expense.hashCode ^
        sale.hashCode ^
        purchase.hashCode;
  }
}
