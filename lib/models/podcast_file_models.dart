import 'package:tecbloc/constant/api_url_constant.dart';

class PodcastFileModels {
  String? id;
  String? podcastId;
  String? file;
  String? title;
  String? length;
  PodcastFileModels();
  PodcastFileModels.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    podcastId = element["podcast_id"];
    file = ApiUrlConstant.hostDlUrl + element["file"];
    title = element["title"];
    length = element["length"];
  }
}
