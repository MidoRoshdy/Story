import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/Screens/login/login.dart';
import 'package:story_app/data/service/loginModle.dart';
import '..//API_routes.dart';

class LoginServices {
  Future<LoginModle> Login(String email, String password) async {
    Response response = await http.get(Uri.parse(ApiRoutes.loginUrl));
    List<dynamic> data = json.decode(response.body);
    final Mydata = data[0];
    LoginModle loginModle = LoginModle.fromjson(Mydata);
    log(loginModle.name ?? "not found");

    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString("Acoontlogin", response.body);

    return loginModle;
  }
}
