import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecbloc/controller/Single_article_controller.dart';
import 'package:tecbloc/controller/list_article_controller.dart';

import '../component/my_component.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({super.key});

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  // کنترلر مقاله را به درستی استفاده کنید
  ListArticleController listArticleController =
      Get.put(ListArticleController());

  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar("مقالات جدید"),
        // فرض کنید در کنترلر شما یک RxList داریم
        body: Obx(() {
          if (listArticleController.loading.value) {
            return Center(
                child: CircularProgressIndicator()); // نمایش حالت بارگذاری
          }

          if (listArticleController.articleList.isEmpty) {
            return Center(
                child: Text("هیچ مقاله‌ای یافت نشد.")); // پیام خالی بودن لیست
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              // به صورت پیش‌فرض لیست عمودی است
              itemCount: listArticleController.articleList.length,
              itemBuilder: (context, index) {
                var article = listArticleController.articleList[index];
                return GestureDetector(
                  onTap: () {
                    singleArticleController.id.value =
                        int.parse(article.id.toString());
                    singleArticleController.getArticleInfo(
                        listArticleController.articleList[index].id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0), // فاصله بین آیتم‌ها
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // تصویر مقاله
                        CachedNetworkImage(
                          imageUrl: article.image!,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              width: 100, // عرض تصویر
                              height: 100, // ارتفاع تصویر
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          placeholder: (context, url) => loading(),
                          errorWidget: (context, url, error) => Container(
                            height: Get.height / 6,
                            width: Get.width / 3,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.grey,
                              size: 50,
                            ),
                          ),
                        ),
                        SizedBox(width: 16), // فاصله بین تصویر و متن
                        // اطلاعات مقاله
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8), // فاصله بین متن‌ها
                              Row(
                                children: [
                                  Text(
                                    article.author!,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                      width: 8), // فاصله بین نویسنده و بازدید
                                  Text(
                                    "${article.view!} بازدید",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
// return Padding(
// padding: const EdgeInsets.all(8.0),
// child: ListView.builder(
// // به صورت پیش‌فرض لیست عمودی است
// itemCount: listArticleController.articleList.length,
// itemBuilder: (context, index) {
// var article = listArticleController.articleList[index];
// return GestureDetector(
// onTap: () {
// singleArticleController.id.value =
// int.parse(article.id.toString());
// Get.to(
// Single(
// size: size,
// textTheme: textTheme,
// bodyMargin: bodyMargin),
// // arguments: [article.id],
// );
// }, صفحه single میره ولی تو صفحه سینگل نال بودن میده

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controller/Single_article_controller.dart';
// import '../controller/list_article_controller.dart';
//
// // ignore: must_be_immutable
// class ArticleListScreen extends StatelessWidget {
//   String title;
//   ArticleListScreen({required this.title, Key? key}) : super(key: key);
//
//   ListArticleController listArticleController =
//       Get.put(ListArticleController());
//   SingleArticleController singleArticleController =
//       Get.put(SingleArticleController());
//   @override
//   Widget build(BuildContext context) {
//     var textTheme = Theme.of(context).textTheme;
//
//     return SafeArea(
//       child: Scaffold(
//         appBar: appBar(title),
//         body: Padding(
//           padding: EdgeInsets.all(Dimens.small),
//           child: SizedBox(
//             child: Obx(
//               () => !singleArticleController.loading.value
//                   ? ListView.builder(
//                       scrollDirection: Axis.vertical,
//                       itemCount: listArticleController.articleList.length,
//                       itemBuilder: ((context, index) {
//                         return GestureDetector(
//                           onTap: (() async {
//                             await singleArticleController.getArticleInfo(
//                                 listArticleController.articleList[index].id);
//                             Get.toNamed(NamedRoute.routeSingleArticle);
//                           }),
//                           child: Padding(
//                             padding: EdgeInsets.all(Dimens.small),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height: Get.height / 6,
//                                   width: Get.width / 3,
//                                   child: CachedNetworkImage(
//                                     imageUrl: listArticleController
//                                         .articleList[index].image!,
//                                     imageBuilder: (((context, imageProvider) {
//                                       return Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(Dimens.medium)),
//                                             image: DecorationImage(
//                                                 image: imageProvider,
//                                                 fit: BoxFit.cover)),
//                                       );
//                                     })),
//                                     placeholder: ((context, url) {
//                                       return const Loading();
//                                     }),
//                                     errorWidget: ((context, url, error) {
//                                       return Icon(
//                                           Icons.image_not_supported_outlined,
//                                           size: Dimens.xlarge - 14,
//                                           color: SolidColors.greyColor);
//                                     }),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: Dimens.medium,
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     SizedBox(
//                                       width: Get.width / 2,
//                                       child: Text(
//                                         listArticleController
//                                             .articleList[index].title!,
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 2,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: Dimens.medium,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           listArticleController
//                                               .articleList[index].author!,
//                                           style: textTheme.bodySmall,
//                                         ),
//                                         SizedBox(
//                                           width: Dimens.medium + 4,
//                                         ),
//                                         Text(
//                                           listArticleController
//                                                   .articleList[index].view! +
//                                               MyStrings.visit,
//                                           style: textTheme.bodySmall,
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         );
//                       }),
//                     )
//                   : const Loading(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
