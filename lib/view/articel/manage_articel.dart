import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecbloc/component/my_component.dart';

import '../../component/my_strings.dart';
import '../../controller/articel/manage_articel_controller.dart';
import '../../models/article_models.dart';

class ManageArticel extends StatelessWidget {
  ManageArticel({super.key});

  final articelManageController = Get.put(ManageArticelController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: appBar("مدیریت مقاله"),
        body: Obx(() {
          // اگر در حال بارگذاری هستیم، لودینگ نمایش داده شود
          if (articelManageController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          // اگر لیست مقالات خالی بود، Empty State نمایش داده شود
          if (articelManageController.articleList.isEmpty) {
            return articleEmptyState(textTheme);
          }

          // در غیر اینصورت، لیست مقالات نمایش داده شود
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: articelManageController.articleList.length,
              itemBuilder: (context, index) {
                var article = articelManageController.articleList[index];
                return articleItem(article);
              },
            ),
          );
        }),
        // دکمه در پایین صفحه
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(Get.width / 3, 50))),
            onPressed: () {
              // TODO: عملیات رفتن به صفحه نوشتن مقاله
            },
            child: Text(
              "بریم برای نوشتن یه مقاله باحال",
              style: textTheme.displayLarge,
            ),
          ),
        ),
      ),
    );
  }

  // ویجت نمایش آیتم مقاله
  Widget articleItem(ArticleModel article) {
    String imageUrl = article.image ?? "";

    // اطمینان از صحت URL تصویر
    if (!imageUrl.startsWith("https://")) {
      imageUrl = "https://techblog.sasansafari.com$imageUrl";
    }
    imageUrl = imageUrl.replaceAll(RegExp(r'(?<!:)//'), '/');
    print("Fixed Image URL: $imageUrl");

    return GestureDetector(
      onTap: () {
        // TODO: عملیات مورد نظر در زمان کلیک روی مقاله
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // تصویر مقاله
            CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) {
                print("Image load error: $error");
                return Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                    size: 50,
                  ),
                );
              },
            ),
            const SizedBox(width: 16),

            // اطلاعات مقاله
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title ?? "بدون عنوان",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        article.author ?? "نویسنده نامشخص",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${article.view ?? 0} بازدید",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ویجت نمایش Empty State
  Widget articleEmptyState(TextTheme textTheme) {
    return Stack(
      children: [
        // محتوای وسط صفحه (تصویر و متن)
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/tobot_empty.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: MyStrings.articleEmpty,
                  style: textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),

        // دکمه در پایین صفحه
        // Positioned(
        //   bottom: 20,
        //   left: 20,
        //   right: 20,
        //   child: ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //       minimumSize: const Size(double.infinity, 50), // دکمه تمام عرض
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(16),
        //       ),
        //     ),
        //     onPressed: () {
        //       // TODO: عملیات رفتن به صفحه نوشتن مقاله
        //     },
        //     child: Text(
        //       "بریم برای نوشتن یه مقاله باحال",
        //       style: textTheme.displayLarge,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
