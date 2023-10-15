import 'dart:convert';

class BulkUser {
  int id;
  String firstName;
  String lastName;
  int age;
  String image;
  String get fullName => '$firstName $lastName';
  String email;

  BulkUser({
    required this.id,
    required this.firstName,
    required this.email,
    required this.age,
    required this.image,
    required this.lastName,
  });

  factory BulkUser.fromRawJson(String str) =>
      BulkUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BulkUser.fromJson(Map<String, dynamic> json) => BulkUser(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        age: json["age"],
        image: json["image"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "age": age,
        "image": image,
        "email": email,
        "lastName": lastName,
      };
}
