import 'package:get/get.dart';
import 'package:tecbloc/view/articel/single.dart';

import '../../Services/dio_service.dart';
import '../../component/api_constant.dart';
import '../../models/article_info_models.dart';
import '../../models/article_models.dart';
import '../../models/fake_data.dart';
import '../../models/tags_model.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(2);
  Rx<ArticleInfoModels> articleInfoModels = ArticleInfoModels().obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> releatedList = RxList();
  getArticleInfo(var id) async {
    articleInfoModels = ArticleInfoModels().obs;
    loading.value = true; // شروع لودینگ
    var userId = "";
    var response = await DioService().getMethod(
        "${ApiUrlConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId");
    if (response.statusCode == 200) {
      // پاک کردن لیست قبل از اضافه کردن داده‌های جدید
      articleInfoModels.value = ArticleInfoModels.fromJson(response.data);
      loading.value = false;
    }
    tagList.clear();
    response.data["tags"].forEach((element) {
      tagsList.add(TagsModel.fromJson(element));
    });
    releatedList.clear();
    response.data["related"].forEach((element) {
      releatedList.add(ArticleModel.fromJson(element));
    });
    Get.to(Single());
  }
}
