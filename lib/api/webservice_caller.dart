import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/json_parser.dart';
import 'package:movie_app/models/category_model.dart';
import 'package:movie_app/models/video_model.dart';

class WebserivceCaller {
  static Future<List<Video>> getNewVideos() async {
    List<Video> videoList = [];
    String url = 'http://androidsupport.ir/pack/aparat/getNewVideos.php';
    Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      videoList = JsonParser.getVideo(response);
    }
    return videoList;
  }

  static Future<List<Category>> getCategoryList() async {
    List<Category> categoryList = [];
    String url = 'http://androidsupport.ir/pack/aparat/getCategory.php';
    Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      categoryList = JsonParser.getCategory(response);
    }
    return categoryList;
  }

  static Future<List<Video>> getBestVideos() async {
    List<Video> videoList = [];
    String url = 'http://androidsupport.ir/pack/aparat/getBestVideos.php';
    Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      videoList = JsonParser.getVideo(response);
    }
    return videoList;
  }
  
  static Future<List<Video>> getSpecialVideos() async {
    List<Video> videoList = [];
    String url = 'http://androidsupport.ir/pack/aparat/getSpecial.php';
    Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      videoList = JsonParser.getVideo(response);
    }
    return videoList;
  }
}
