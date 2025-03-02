import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecbloc/constant/api_key_constant.dart';
import 'package:tecbloc/constant/commands.dart';
import 'package:tecbloc/constant/storage_const.dart';
import 'package:tecbloc/models/article_models.dart';

import '../../Services/dio_service.dart';
import '../../constant/api_url_constant.dart';
import '../../models/article_info_models.dart';
import '../../models/tags_model.dart';
import '../file_controller.dart';

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
    isLoading.value = true; // شروع لودینگ
    try {
      var response =
          await DioService().getMethod("${ApiUrlConstant.publishedByMe}1");

      if (response.statusCode == 200) {
        articleList.clear();
        response.data.forEach((element) {
          articleList.add(ArticleModel.fromJson(element));
        });
        debugPrint("تعداد مقالات دریافت شده: ${articleList.length}");

        // به‌روزرسانی articleInfoModels با اولین مقاله دریافتی (در صورت وجود)
        if (articleList.isNotEmpty) {
          // فرض کنید ArticleModel دارای خصوصیات title, content و image است.
          articleInfoModels.value = ArticleInfoModels(
            articleList[0].title,
            articleList[0].content,
            articleList[0].image,
          );
        }
      } else {
        debugPrint("خطا در دریافت داده‌ها: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("خطای پیش‌بینی‌نشده: $e");
    } finally {
      // حذف articleList.clear() از بلوک finally تا لیست دریافتی پاک نشود
      isLoading.value = false; // پایان لودینگ، حتی در صورت خطا
    }
  }

  updateTitle() {
    articleInfoModels.update(
      (val) {
        val!.title = titleTextEditingController.text;
      },
    );
  }

  storeArticle() async {
    var fileController = Get.find<FilePicKerController>();
    isLoading.value = true;

    try {
      debugPrint("📢 Debugging Values:");
      debugPrint("📌 Title: ${articleInfoModels.value.title}");
      debugPrint("📌 Content: ${articleInfoModels.value.content}");
      debugPrint("📌 CatId: ${articleInfoModels.value.catId}");
      debugPrint("📌 File Path: ${fileController.file.value.path}");
      debugPrint("📌 User ID: ${GetStorage().read(StorageKey.userId)}");

      // بررسی مقادیر ضروری
      if (articleInfoModels.value.title == null ||
          articleInfoModels.value.content == null ||
          articleInfoModels.value.catId == null) {
        debugPrint("❌ خطا: یکی از مقادیر Title، Content یا CatId مقدار ندارد!");
        isLoading.value = false;
        return;
      }

      // بررسی مسیر فایل
      var filePath = fileController.file.value.path;
      if (filePath == null || filePath.isEmpty) {
        debugPrint("❌ خطا: مسیر فایل مقدار ندارد.");
        // در اینجا می‌توانید یا به کاربر هشدار دهید که ابتدا تصویر انتخاب کند
        // یا در صورت لزوم مقدار پیش‌فرضی برای تصویر ارسال کنید.
        isLoading.value = false;
        return;
      }

      var file = File(filePath);
      if (!file.existsSync()) {
        debugPrint("❌ خطا: فایل در مسیر $filePath وجود ندارد.");
        isLoading.value = false;
        return;
      }

      var userId = GetStorage().read(StorageKey.userId);
      if (userId == null) {
        debugPrint("❌ خطا: userId مقدار ندارد.");
        isLoading.value = false;
        return;
      }

      Map<String, dynamic> map = {
        ApiArticleKeyConstant.title: articleInfoModels.value.title,
        ApiArticleKeyConstant.content: articleInfoModels.value.content,
        ApiArticleKeyConstant.catId: articleInfoModels.value.catId,
        ApiArticleKeyConstant.userId: userId,
        ApiArticleKeyConstant.image: await dio.MultipartFile.fromFile(filePath),
        ApiArticleKeyConstant.command: Commands.store,
        ApiArticleKeyConstant.tagList: [],
      };

      var response =
          await DioService().postMethod(map, ApiUrlConstant.articlePost);

      if (response.statusCode == 200) {
        debugPrint("✅ مقاله با موفقیت ذخیره شد");
      } else {
        debugPrint("❌ خطا در ارسال مقاله: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("❌ خطای غیرمنتظره در ذخیره مقاله: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
