import 'dart:convert';

class UserModel {
  final String message;
  final String accessToken;
  final User user;

  UserModel({
    required this.message,
    required this.accessToken,
    required this.user,
  });

  UserModel copyWith({
    String? message,
    String? accessToken,
    User? user,
  }) =>
      UserModel(
        message: message ?? this.message,
        accessToken: accessToken ?? this.accessToken,
        user: user ?? this.user,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        accessToken: json["access_token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "access_token": accessToken,
        "user": user.toJson(),
      };
}

class User {
  final int id;
  final String fname;
  final String lname;
  final String mobile;
  final String email;
  final String address;

  User({
    required this.id,
    required this.fname,
    required this.lname,
    required this.mobile,
    required this.email,
    required this.address,
  });

  User copyWith({
    int? id,
    String? fname,
    String? lname,
    String? mobile,
    String? email,
    String? address,
  }) =>
      User(
        id: id ?? this.id,
        fname: fname ?? this.fname,
        lname: lname ?? this.lname,
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        address: address ?? this.address,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "lname": lname,
        "mobile": mobile,
        "email": email,
        "address": address,
      };
}
