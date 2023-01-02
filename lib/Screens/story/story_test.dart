import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StoryTest extends StatefulWidget {
  StoryTest({super.key});

  @override
  State<StoryTest> createState() => _StoryTestState();
}

class _StoryTestState extends State<StoryTest> {
  List<int> num = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  Timer? time;
  PageController controler = PageController(initialPage: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time = Timer.periodic(Duration(seconds: 1), (timer) {
      controler.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controler,
            itemCount: num.length,
            itemBuilder: (BuildContext context, int index) {
              final item = num[index];
              return Center(
                child: Container(
                    child: Text(
                  item.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
              );
            },
          ),
          Positioned(
              right: 34,
              bottom: 34,
              child: InkWell(
                onTap: () {
                  if (time == null) {
                    time = Timer.periodic(Duration(seconds: 1), (timer) {
                      controler.nextPage(
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                    });
                  }
                },
                child: Icon(Icons.next_plan),
              )),
          Positioned(
              left: 34,
              bottom: 34,
              child: InkWell(
                onTap: () {
                  time?.cancel();
                  time = null;
                },
                child: Icon(Icons.arrow_back_sharp),
              ))
        ],
      ),
    );
  }
}
