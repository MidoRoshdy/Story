import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:provider/provider.dart';
import 'package:story_app/Screens/home%20screen/home_screen.dart';
import 'package:story_app/Screens/login/provider/login_provider.dart';
import 'package:story_app/core/app_routes.dart';
import 'package:story_app/core/assets.dart';

import 'components/login_failds_widget.dart';
import 'components/login_header_widget.dart';

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          // Header
          const LoginHeaderWidget(),

          // Failds
          const LoginFaildsWidget(),

          // login Btn
          InkWell(
            onTap: () => context.read<Login_provider>().Login(context),
            borderRadius: BorderRadius.circular(150),
            focusColor: Colors.blue[200],
            splashColor: Colors.blue[800],
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 50, left: 50),
              padding: const EdgeInsets.all(10),
              child: const Text("login",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.black)),
            ),
          )
        ]),
      ),
    );
  }
}
