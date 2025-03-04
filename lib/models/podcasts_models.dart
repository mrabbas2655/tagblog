import '../constant/api_url_constant.dart';

class PodcastsModels {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  PodcastsModels({
    this.id,
    this.title,
    this.poster,
    this.catName,
    this.author,
    this.view,
    this.status,
    this.createdAt,
  });

  PodcastsModels.fromJson(Map<String, dynamic> element) {
    id = element['id'] ?? 'Unknown ID';
    title = element['title'] ?? 'Untitled';
    // ساخت URL تصویر و چاپ آن برای دیباگ
    poster = ApiUrlConstant.hostDlUrl + (element['poster'] ?? '');

    catName = element['cat_name'] ?? 'No Category';
    author = element['author'] ?? 'Unknown Author';
    view = element['view'] ?? '0';
    status = element['status'] ?? 'Inactive';
    createdAt = element['created_at'] ?? 'Unknown';
  }
}
