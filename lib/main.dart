import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/Screens/home%20screen/home_screen.dart';
import 'package:story_app/Screens/login/login.dart';
import 'package:story_app/Screens/login/provider/login_provider.dart';
import 'package:story_app/Screens/splash%20screen/Splash_screen.dart';
import 'package:story_app/Screens/story/provider/sroty_provider.dart';
import 'package:story_app/Screens/story/story.dart';
import 'package:story_app/Screens/story/story_test.dart';
import 'package:story_app/core/app_routes.dart';
import 'package:story_app/data/models/storyModel.dart';

import 'Screens/story/components/body_story.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<Login_provider>(create: (_) => Login_provider()),
        ListenableProvider<Story_provider>(create: (_) => Story_provider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sroty App',
        theme: ThemeData.light(),
        routes: {
          App_Routes.splach: (context) => SplashScreen(),
          App_Routes.login: (context) => Login(),
          App_Routes.home_screen: (context) => body_story(),
          App_Routes.story: (context) => Story(
                index: ModalRoute.of(context)!.settings.arguments as int,
              ),
        },
      ),
    );
  }
}
