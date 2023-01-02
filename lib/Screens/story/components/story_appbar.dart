import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppBar_Story extends StatelessWidget {
  const AppBar_Story({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Stories",
      ),
      centerTitle: true,
    );
  }
}
