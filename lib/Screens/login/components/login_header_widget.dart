import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/assets.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Image.asset(Assets.apple),
        Text(
          "Hello",
          style: TextStyle(
              fontSize: 100, fontWeight: FontWeight.bold, color: Colors.pink),
        ),
        Text(
          "Welcome to my new app ",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 135, 211, 47)),
        ),
      ],
    );
  }
}
