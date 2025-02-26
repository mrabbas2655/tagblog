import 'package:get/get.dart';
import 'package:tecbloc/models/article_models.dart';

import '../../Services/dio_service.dart';
import '../../component/api_constant.dart';

class ManageArticelController extends GetxController {
  RxList<ArticleModel> articleList = <ArticleModel>[].obs;
  RxBool isLoading = true.obs; // 🔥 اضافه شدن isLoading به‌عنوان RxBool

  @override
  void onInit() {
    super.onInit();
    getManageArticel();
  }

  Future<void> getManageArticel() async {
    isLoading.value = true; // 🔥 شروع لودینگ
    try {
      var response =
          await DioService().getMethod(ApiUrlConstant.publishedByMe + "566");

      if (response.statusCode == 200) {
        articleList.clear();
        response.data.forEach((element) {
          articleList.add(ArticleModel.fromJson(element));
        });
        print("تعداد مقالات دریافت شده: ${articleList.length}");
      } else {
        print("خطا در دریافت داده‌ها: ${response.statusCode}");
      }
    } catch (e) {
      print("خطای پیش‌بینی‌نشده: $e");
    } finally {
      articleList.clear();
      isLoading.value = false; // 🔥 پایان لودینگ، حتی در صورت خطا
    }
  }
}
