import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  static String token;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.picturePath,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  dynamic picturePath;
  String address;
  String houseNumber;
  String phoneNumber;
  String city;
  String role;
  int createdAt;
  int updatedAt;

  User copyWith({
    int id,
    String name,
    String email,
    dynamic emailVerifiedAt,
    dynamic picturePath,
    String address,
    String houseNumber,
    String phoneNumber,
    String city,
    String role,
    String createdAt,
    String updatedAt,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        picturePath: picturePath ?? this.picturePath,
        address: address ?? this.address,
        houseNumber: houseNumber ?? this.houseNumber,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        city: city ?? this.city,
        role: role ?? this.role,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        picturePath: json["picturePath"],
        address: json["address"],
        houseNumber: json["houseNumber"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
        role: json["role"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "picturePath": picturePath,
        "address": address,
        "houseNumber": houseNumber,
        "phoneNumber": phoneNumber,
        "city": city,
        "role": role,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
