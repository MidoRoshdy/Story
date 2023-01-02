import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:story_app/Screens/login/login.dart';
import 'package:story_app/Screens/login/provider/login_state.dart';
import 'package:story_app/data/service/login%20services/ligon_service.dart';
import 'package:story_app/data/service/loginModle.dart';

import '../../../core/app_routes.dart';

class Login_provider extends ChangeNotifier {
  Login_state state = Login_state();

  void onemailchanged(String value) {
    if (value.isEmpty) {
      state.mailerrormessage = "please enter email";
    } else if (EmailValidator.validate(value) == false) {
      state.mailerrormessage = "wrong email";
    } else {
      state.mailerrormessage = null;
    }
    //  value.isEmpty ? state.mailerrormessage = "please enter email" :EmailValidator.validate(value) ? state.mailerrormessage = null :
    state.email = value;
    notifyListeners();
  }

  void ompasswordchanged(String value) {
    if (value.isEmpty) {
      state.passworderrormessage = "please enter Pssword";
    } else {
      state.passworderrormessage = null;
    }
    state.password = value;
    notifyListeners();
  }

  Login(BuildContext context) async {
    if (state.email != null && state.password != null) {
      state.loginModle =
          await LoginServices().Login(state.email!, state.password!);
      if (state.loginModle != null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(App_Routes.home_screen, (route) => false);
      }
      ;
    }
  }
}
