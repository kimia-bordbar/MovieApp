import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/models/category_model.dart';
import 'package:movie_app/models/video_model.dart';

class JsonParser {
  static List<Video> getVideo(Response response) {
    List<Video> videoList = [];
    List<dynamic> body = jsonDecode(response.body);
    for (var element in body) {
      Map item = element;
      String id = item['id'];
      String catId = item['cat_id'];
      String title = item['title'];
      String icon = item['icon'];
      String creator = item['creator'];
      String description = item['description'];
      String link = item['link'];
      String view = item['view'];
      String time = item['time'];
      String special = item['special'];
      videoList.add(Video(id, catId, title, icon, creator, description, link,
          view, time, special));
    }
    return videoList;
  }

  static List<Category> getCategory(Response response) {
    List<Category> categoryList = [];
    List<dynamic> body = json.decode(response.body);
    for (var element in body) {
      Map item = element;
      String id = item['id'];
      String title = item['title'];
      String icon = item['icon'];
      String description = item['description'];
      categoryList.add(Category(id,title,icon,description));
    }
    return categoryList;
  }
}
