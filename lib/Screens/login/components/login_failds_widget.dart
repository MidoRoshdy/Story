// ignore_for_file: non_constant_identifier_names
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:story_app/Screens/login/provider/login_provider.dart';

class LoginFaildsWidget extends StatelessWidget {
  const LoginFaildsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 20,
        ),
        const Text(
          "Email",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.normal, color: Colors.black),
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer<Login_provider>(
          builder: (context, Provider, _) => TextField(
            onChanged: context.read<Login_provider>().onemailchanged,
            decoration: InputDecoration(
                //border:BorderRadius.circular(100),
                hintText: "Email",
                errorText: Provider.state.mailerrormessage,
                hintStyle: TextStyle(color: Colors.grey[400])),
          ),
        ),
        const SizedBox(
          height: 0,
        ),
        const Text(
          "Password",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.normal, color: Colors.black),
        ),
        const SizedBox(height: 20),
        Consumer<Login_provider>(
          builder: (context, provider, _) => TextField(
            onChanged: context.read<Login_provider>().ompasswordchanged,
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Password",
                errorText: provider.state.passworderrormessage,
                hintStyle: TextStyle(color: Colors.grey[400])),
          ),
        ),
      ],
    );
  }
}
