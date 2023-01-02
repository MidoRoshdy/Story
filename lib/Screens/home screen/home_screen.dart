import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:story_app/core/app_routes.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    App_Routes.login, (route) => false);
              },
              child: Icon(Icons.reset_tv),
            )
          ],
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Center(child: Text("data"))
      ]),
    );
  }
}
