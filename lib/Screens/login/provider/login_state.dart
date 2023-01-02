import 'package:flutter/cupertino.dart';
import 'package:story_app/data/service/loginModle.dart';

class Login_state {
  String? email;
  String? password;
  String? mailerrormessage;
  String? passworderrormessage;
  TextEditingController mailcontroler = TextEditingController(text: "hello");
  LoginModle? loginModle;
}
