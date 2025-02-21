import 'package:get/get.dart';

import '../Services/dio_service.dart';
import '../component/api_constant.dart';
import '../models/article_models.dart';
import '../models/podcasts_models.dart';
import '../models/poster_model.dart';
import '../models/tags_model.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastsModels> topPodcasts = RxList();
  RxBool loading = false.obs;
  getHomeItems() async {
    loading.value = true; // شروع لودینگ
    try {
      var response = await DioService().getMethod(ApiUrlConstant.getHomeItems);

      print("API Response: ${response.data}"); // چاپ پاسخ API برای بررسی

      if (response.statusCode == 200) {
        response.data['top_visited'].forEach((element) {
          print("Top Visited Item: $element");
          topVisitedList.add(ArticleModel.fromJson(element));
        });

        response.data['top_podcasts'].forEach((element) {
          print(
              "Top Podcast Item: $element"); // چاپ هر آیتم قبل از تبدیل به مدل
          topPodcasts.add(PodcastsModels.fromJson(element));
        });

        poster.value = PosterModel.fromJson(response.data['poster']);
      }
      response.data['tags'].forEach((element) {
        print("Top Podcast Item: $element"); // چاپ هر آیتم قبل از تبدیل به مدل
        tagsList.add(TagsModel.fromJson(element));
      });
    } catch (e) {
      // مدیریت خطا
      print("Error fetching data: $e");
    } finally {
      loading.value =
          false; // پس از بارگذاری یا وقوع خطا، لودینگ به false تغییر می‌کند
    }
  }
}
