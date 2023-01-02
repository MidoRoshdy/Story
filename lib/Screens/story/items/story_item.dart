import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../data/models/storyModel.dart';
import 'package:timeago/timeago.dart' as timeago;

class StoryItem extends StatelessWidget {
  StoryItem({super.key, required this.item, required this.onClick});
  StoryModel item;
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        margin: EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          height: 70,
          child: Row(
            children: [
              Container(
                height: 100,
                width: 70,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(item.userPhoto!),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                height: 100,
                width: 200,
                alignment: Alignment.topLeft,
                child: Column(children: [
                  Text(
                    item.username!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              Container(
                height: 100,
                width: 60,
                alignment: Alignment.topRight,
                child: Column(children: [
                  Text(
                    timeago.format(item.storyTime!),
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
