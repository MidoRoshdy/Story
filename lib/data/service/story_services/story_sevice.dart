import 'package:http/http.dart';
import 'package:story_app/data/models/storyModel.dart';
import '../API_routes.dart';
import 'package:http/http.dart' as http;

class StoryServicies {
  Future<List<StoryModel>> getStoryList() async {
    Response response = await http.get(Uri.parse(ApiRoutes.storyUrl));
    List<StoryModel> storyList = storyModelFromJson(response.body);
    return storyList;
  }
}
