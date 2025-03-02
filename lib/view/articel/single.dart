import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecbloc/controller/articel/list_article_controller.dart';
import 'package:tecbloc/controller/articel/single_article_controller.dart';
import 'package:tecbloc/gen/assets.gen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../component/dimens.dart';
import '../../component/my_component.dart';
import '../../constant/my_colors.dart';
import '../../controller/home_screen_controller.dart';
import 'articel_list_screen.dart';

class Single extends StatefulWidget {
  Single({
    super.key,
  });
  final homeScreenController = Get.put(HomeScreenController());

  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {
  late final WebViewController _controller;
  var singleArticleController = Get.find<SingleArticleController>();

  var textTheme;

  @override
  void initState() {
    super.initState();
    widget.homeScreenController.tagsList;

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {},
          onNavigationRequest: (request) {
            return NavigationDecision.navigate;
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            () => singleArticleController.articleInfoModels.value.title == null
                ? SizedBox(height: Get.height, child: Loading())
                : Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: singleArticleController
                                    .articleInfoModels.value.image ??
                                '',
                            placeholder: (context, url) =>
                                SpinKitPouringHourGlass(
                              color: SolidColors.primaryColor,
                              size: 35,
                            ),
                            errorWidget: (context, url, error) => Image(
                              image: AssetImage(
                                  Assets.images.singlePlaceHolder.path),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                  colors: GradientColors.singleAppbarGradiant,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(Icons.arrow_back,
                                        color: Colors.white, size: 24),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(Icons.bookmark_border,
                                      color: Colors.white, size: 24),
                                  SizedBox(width: 10),
                                  Icon(Icons.share,
                                      color: Colors.white, size: 24),
                                  SizedBox(width: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                        child: Text(
                          singleArticleController
                                  .articleInfoModels.value.title ??
                              'بدون عنوان',
                          style: textTheme.titleLarge,
                          maxLines: 2,
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage(Assets.images.profileAvatar.path),
                            ),
                            SizedBox(width: 12),
                            Text(
                              singleArticleController
                                      .articleInfoModels.value.author ??
                                  'ناشناس',
                              style: textTheme.headlineMedium,
                            ),
                            SizedBox(width: 12),
                            Text(
                              singleArticleController
                                      .articleInfoModels.value.createdAt ??
                                  'نامشخص',
                              style: textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                      // بررسی null قبل از لود وب‌ویو
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: SizedBox(
                          height: 300,
                          child: singleArticleController
                                      .articleInfoModels.value.content !=
                                  null
                              ? WebViewWidget(
                                  controller: _controller
                                    ..loadHtmlString(
                                      """
                <html>
                <head>
                  <style>
                    body {
                      font-size: 36px; /* سایز بزرگ‌تر متن */
                      font-weight: bold; /* متن بولد */
                      direction: rtl; /* راست به چپ */
                      text-align: right;
                      font-family: Arial, sans-serif;
                      padding: 16px;
                      margin: 0;
                    }
                  </style>
                </head>
                <body>
                  ${singleArticleController.articleInfoModels.value.content ?? "<p>محتوا در دسترس نیست</p>"}
                </body>
                </html>
                """,
                                    ),
                                )
                              : const Center(
                                  child: CircularProgressIndicator()),
                        ),
                      ),
                      SizedBox(height: 6),
                      Tags(),
                      SizedBox(height: 8),
                      topVisited()
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget Tags() {
    return SizedBox(
      height: 45,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: singleArticleController.tagsList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding:
                  EdgeInsets.only(right: index == 0 ? Dimens.bodyMargin : 12),
              child: GestureDetector(
                  onTap: () async {
                    var tagId = singleArticleController.tagsList[index].id!;

                    await Get.find<ListArticleController>()
                        .getArticleListWithTagsId(tagId);

                    // String tagName = singleArticleController.tagsList[index].title!;
                    Get.to(ArticleListScreen());
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Container(
                      height: 80,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          color: Colors.grey),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Text(
                            singleArticleController.tagsList[index].title!,
                            style: TextTheme.of(context).bodyMedium,
                          )),
                    ),
                  )),
            );
          })),
    );
  }

  Widget topVisited() {
    textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Obx(
      () => singleArticleController.releatedList.isEmpty
          ? Center(child: Text('هیچ مورد بازدید شده‌ای وجود ندارد'))
          : SizedBox(
              height: size.height / 2.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: singleArticleController.releatedList.length,
                itemBuilder: (context, index) {
                  final item = singleArticleController.releatedList[index];
                  return GestureDetector(
                    onTap: () {
                      singleArticleController.getArticleInfo(
                          singleArticleController.releatedList[index].id);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: index == 0 ? Dimens.bodyMargin : 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height / 4.1,
                            width: size.width / 2.1,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              image: item.image != null
                                  ? DecorationImage(
                                      image: NetworkImage(item.image!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                              color: Colors.grey[300], // رنگ پیش‌فرض برای خطا
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: size.width / 2.1,
                            child: Text(
                              item.title ?? 'بدون عنوان',
                              style: textTheme.headlineMedium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: true,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.remove_red_eye, size: 16),
                              SizedBox(width: 4),
                              Text('${item.id ?? 0} بازدید',
                                  style: textTheme.displaySmall),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

// class Tags extends StatelessWidget {
//   const Tags({
//     Key? key,
//     required this.singleArticleController,
//   }) : super(key: key);
//
//   final SingleArticleController singleArticleController;
//
//   @override
//   Widget build(BuildContext context) {
//     TextTheme textheme = TextTheme.of(context);
//     return SizedBox(
//       height: 43,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: singleArticleController.tagsList.length,
//           itemBuilder: ((context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GestureDetector(
//                 onTap: () async {
//                   var tagId = singleArticleController.tagsList[index].id!;
//
//                   await Get.find<ListArticleController>()
//                       .getArticleListWithTagsId(tagId);
//
//                   String tagName = singleArticleController.tagsList[index].title!;
//                   Get.to(ArticleListScreen());
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 16),
//                   child: Container(
//                     height: 60,
//                     decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(24)),
//                         color: Colors.grey),
//                     child: Padding(
//                         padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                         child: Text(
//                           singleArticleController.tagsList[index].title!,
//                           style: textheme.displayMedium,
//                         )),
//                   ),
//                 ),
//               ),
//             );
//           })),
//     );
//   }
// }

// class Similar extends StatelessWidget {
//   const Similar({
//     Key? key,
//     required this.singleArticleController,
//     required this.textheme,
//   }) : super(key: key);
//
//   final SingleArticleController singleArticleController;
//   final TextTheme textheme;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: Get.height / 3.5,
//       child: ListView.builder(
//           itemCount: singleArticleController.relatedList.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: ((context, index) {
//             //blog item
//             return GestureDetector(
//               onTap: (() {
//                 singleArticleController.getArticleInfo(
//                     singleArticleController.relatedList[index].id);
//               }),
//               child: Padding(
//                 padding:
//                 EdgeInsets.only(right: index == 0 ? Get.width / 15 : 15),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(Dimens.small),
//                       child: SizedBox(
//                         height: Get.height / 5.3,
//                         width: Get.width / 2.4,
//                         child: Stack(
//                           children: [
//                             CachedNetworkImage(
//                               imageUrl: singleArticleController
//                                   .relatedList[index].image!,
//                               imageBuilder: ((context, imageProvider) =>
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(Dimens.medium)),
//                                       image: DecorationImage(
//                                           image: imageProvider,
//                                           fit: BoxFit.cover),
//                                     ),
//                                     foregroundDecoration: const BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(16)),
//                                         gradient: LinearGradient(
//                                             begin: Alignment.bottomCenter,
//                                             end: Alignment.topCenter,
//                                             colors: GradientColors.blogPost)),
//                                   )),
//                               placeholder: ((context, url) => const Loading()),
//                               errorWidget: ((context, url, error) => Icon(
//                                 Icons.image_not_supported_outlined,
//                                 size: Dimens.xlarge - 14,
//                                 color: SolidColors.greyColor,
//                               )),
//                             ),
//                             Positioned(
//                               bottom: 8,
//                               left: 0,
//                               right: 0,
//                               child: Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     singleArticleController
//                                         .relatedList[index].author!,
//                                     style: textheme.subtitle1,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         singleArticleController
//                                             .relatedList[index].view!,
//                                         style: textheme.subtitle1,
//                                       ),
//                                       SizedBox(
//                                         width: Dimens.small,
//                                       ),
//                                       Icon(
//                                         Icons.remove_red_eye_sharp,
//                                         color: SolidColors.lightIcon,
//                                         size: Dimens.medium,
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                         width: Get.width / 2.4,
//                         child: Text(
//                           singleArticleController.relatedList[index].title!,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 2,
//                         ))
//                   ],
//                 ),
//               ),
//             );
//           })),
//     );
//   }
// }
