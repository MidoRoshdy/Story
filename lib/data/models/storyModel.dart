import 'dart:convert';

List<StoryModel> storyModelFromJson(String str) =>
    List<StoryModel>.from(json.decode(str).map((x) => StoryModel.fromJson(x)));

String storyModelToJson(List<StoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoryModel {
  StoryModel({
    this.storyTime,
    this.username,
    this.userPhoto,
    this.userStory,
    this.userId,
  });

  DateTime? storyTime;
  String? username;
  String? userPhoto;
  List<UserStory>? userStory;
  String? userId;

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        storyTime: DateTime.parse(json["story_time"]),
        username: json["username"],
        userPhoto: json["user_photo"],
        userStory: List<UserStory>.from(
            json["user_story"].map((x) => UserStory.fromJson(x))),
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "story_time": storyTime!.toIso8601String(),
        "username": username,
        "user_photo": userPhoto,
        "user_story": List<dynamic>.from(userStory!.map((x) => x.toJson())),
        "user_id": userId,
      };
}

class UserStory {
  UserStory({
    this.id,
    this.type,
    this.caption,
    this.body,
    this.bodyColor,
    this.duration,
  });

  int? id;
  Type? type;
  String? caption;
  String? body;
  dynamic bodyColor;
  int? duration;

  factory UserStory.fromJson(Map<String, dynamic> json) => UserStory(
        id: json["id"],
        type: typeValues.map![json["type"]],
        caption: json["caption"],
        body: json["body"],
        bodyColor: json["body_color"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "caption": caption,
        "body": body,
        "body_color": bodyColor,
        "duration": duration,
      };
}

enum Type { IMAGE, TEXT, VIDEO }

final typeValues =
    EnumValues({"image": Type.IMAGE, "text": Type.TEXT, 'video': Type.VIDEO});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
