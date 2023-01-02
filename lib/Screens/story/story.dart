import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:story_app/Screens/story/components/story_appbar.dart';
import 'package:story_app/Screens/story/provider/sroty_provider.dart';
import 'package:story_view/story_view.dart';
import '../../data/models/storyModel.dart';
import 'components/body_story.dart';

class Story extends StatelessWidget {
  Story({super.key, required this.index});
  int index;
  final StoryController controller = StoryController();
  List<StoryItem?> item = [];
  PageController? controler;
  @override
  Widget build(BuildContext context) {
    controler = PageController(initialPage: index);
    return Scaffold(
      body: PageView.builder(
        controller: controler,
        itemCount: context.read<Story_provider>().state.storyList.length,
        itemBuilder: (BuildContext context, int index) {
          final StoryData =
              context.read<Story_provider>().state.storyList[index];
          item.clear();
          StoryData.userStory!.forEach(
            (element) {
              if (element.type == Type.TEXT) {
                item.add(StoryItem.text(
                    title: element.body!, backgroundColor: Colors.black));
              }
              if (element.type == Type.IMAGE) {
                item.add(StoryItem.pageImage(
                    url: element.body!, controller: controller));
              }
            },
          );
          return Stack(
            children: [
              StoryView(
                onComplete: () => controler?.nextPage(
                    duration: Duration(microseconds: 400),
                    curve: Curves.easeIn),
                storyItems: item,
                controller: controller,
              ),
              Positioned(
                  top: 45,
                  left: 14,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(StoryData.userPhoto!),
                    radius: 25,
                  )),
              Positioned(
                child: Text(
                  StoryData.username.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                left: 70,
                top: 55,
              ),
            ],
          );
        },
      ),
    );
  }
}
