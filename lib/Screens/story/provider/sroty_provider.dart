import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:story_app/data/models/storyModel.dart';
import 'package:story_app/data/service/story_services/story_sevice.dart';
import 'package:story_app/Screens/story/provider/story_state.dart';
import 'package:story_app/data/service/API_routes.dart';

import '../../../core/enum.dart';

class Story_provider extends ChangeNotifier {
  Story_State state = Story_State();
  Future Getdata() async {
    state.states = ScreenStates.loading;
    state.storyList = await StoryServicies().getStoryList();
    state.states = ScreenStates.done;
    notifyListeners();
  }
}
