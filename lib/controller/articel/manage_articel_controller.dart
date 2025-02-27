import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tecbloc/models/article_models.dart';

import '../../Services/dio_service.dart';
import '../../constant/api_constant.dart';
import '../../models/article_info_models.dart';
import '../../models/tags_model.dart';

class ManageArticelController extends GetxController {
  RxList<ArticleModel> articleList = <ArticleModel>[].obs;
  RxList<TagsModel> tagsList = RxList.empty();
  RxBool isLoading = true.obs; // 🔥 اضافه شدن isLoading به‌عنوان RxBool
  Rx<ArticleInfoModels> articleInfoModels = ArticleInfoModels(
          "اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن",
          """من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی""",
          "")
      .obs;
  TextEditingController titleTextEditingController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    getManageArticel();
  }

  Future<void> getManageArticel() async {
    isLoading.value = true; // 🔥 شروع لودینگ
    try {
      var response =
          await DioService().getMethod(ApiUrlConstant.publishedByMe + "1");

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

  updateTitle() {
    articleInfoModels.update(
      (val) {
        val!.title = titleTextEditingController.text;
      },
    );
  }
}
