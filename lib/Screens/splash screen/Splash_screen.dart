import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/Screens/login/provider/login_provider.dart';
import 'package:story_app/core/app_routes.dart';
import 'package:story_app/data/service/loginModle.dart';

import '../story/provider/sroty_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleData(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 40, 175),
      body: Center(
        child: Text(
          "Story APP",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future<void> handleData(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences shared = await SharedPreferences.getInstance();
    if (shared.containsKey("Acoontlogin")) {
      var userdata = json.decode(shared.getString("Acoontlogin")!)[0];
      context.read<Login_provider>().state.loginModle =
          LoginModle.fromjson(userdata);

      Navigator.of(context)
          .pushNamedAndRemoveUntil(App_Routes.home_screen, (route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(App_Routes.login, (route) => false);
    }
  }
}
