import 'package:flutter/cupertino.dart';

class LoginModle {
  DateTime? createdat;
  String? name;
  String? avatar;
  String? username;
  String? mail;
  ProfileModle? profile;
  String? id;
  LoginModle.fromjson(Map<String, dynamic> json) {
    createdat = DateTime.parse(json["createdAt"]);
    name = json["name"];
    avatar = json["avatar"];
    username = json["username"];
    mail = json["email"];
    profile = ProfileModle.fromjson(json["profile"]);
    id = json["id"];
  }
}

class ProfileModle {
  String? firstname;
  String? lastname;
  String? photo;
  List<dynamic>? favorites;
  ProfileModle.fromjson(Map<String, dynamic> json) {
    firstname = json["firstName"];
    lastname = json["lastName"];
    photo = json["photo"];
    favorites = json["favorites"];
  }
}
