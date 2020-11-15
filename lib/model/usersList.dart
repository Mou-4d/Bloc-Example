import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.name,
    this.age,
    this.city,
  });

  String name;
  int age;
  String city;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        name: json["name"],
        age: json["age"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "city": city,
      };
}
