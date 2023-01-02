import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:story_app/Screens/story/story.dart';
import 'package:story_app/core/app_routes.dart';
import 'package:story_app/data/models/storyModel.dart';
import 'package:story_app/Screens/story/provider/sroty_provider.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:http/http.dart' as http;
import 'package:timeago/timeago.dart' as timeago;
import 'package:provider/provider.dart';
import '../../../core/enum.dart';
import '../items/story_item.dart';

class body_story extends StatelessWidget {
  const body_story({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<Story_provider>().Getdata();

    return Scaffold(
      appBar: AppBar(),
      body: screenBody(),
    );
  }

  screenBody() {
    return Consumer<Story_provider>(builder: (ctx, provider, _) {
      if (provider.state.states == ScreenStates.loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (provider.state.states == ScreenStates.notFound) {
        return Center(
          child: (Text(
            "Not Found ",
            style: TextStyle(fontSize: 30),
          )),
        );
      }

      return Center(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
                itemCount: provider.state.storyList.length,
                itemBuilder: (context, index) {
                  StoryModel item = provider.state.storyList[index];
                  return StoryItem(
                    item: item,
                    onClick: () {
                      Navigator.of(context).pushNamed(
                        App_Routes.story,
                        arguments: index,
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox();
                }),
          ),
        ],
      ));
    });
  }
}
