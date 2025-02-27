import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecbloc/Services/pick_file.dart';
import 'package:tecbloc/component/dimens.dart';
import 'package:tecbloc/controller/articel/list_article_controller.dart';
import 'package:tecbloc/view/articel/html_content_editor.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../component/my_component.dart';
import '../../constant/my_colors.dart';
import '../../controller/articel/manage_articel_controller.dart';
import '../../controller/file_controller.dart';
import '../../controller/home_screen_controller.dart';
import '../../gen/assets.gen.dart';
import 'articel_list_screen.dart';

class SingleManageArticel extends StatefulWidget {
  SingleManageArticel({
    super.key,
  });
  final homeScreenController = Get.put(HomeScreenController());

  @override
  State<SingleManageArticel> createState() => _SingleState();
}

class _SingleState extends State<SingleManageArticel> {
  late final WebViewController _controller;
  var manageArticelController = Get.find<ManageArticelController>();

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

  FilePicKerController filePicKerController = Get.put(FilePicKerController());

  getTitle() {
    Get.defaultDialog(
        title: "عنوان مقاله",
        content: TextField(
          controller: manageArticelController.titleTextEditingController,
          keyboardType: TextInputType.text,
          style: TextStyle(color: SolidColors.textTitle),
          decoration: InputDecoration(hintText: "اینجا بنویس"),
        ),
        backgroundColor: SolidColors.scaffoldBg,
        titleStyle: TextStyle(color: SolidColors.textTitle),
        radius: 8,
        confirm: ElevatedButton(
            onPressed: () {
              manageArticelController.updateTitle();
              Get.back();
            },
            child: Text(
              "ثبت",
              style: TextStyle(color: SolidColors.textTitle),
            )));
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            () => Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: Get.height / 3,
                      child: filePicKerController.file.value.name == "nothing"
                          ? CachedNetworkImage(
                              imageUrl: manageArticelController
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
                                fit: BoxFit.cover,
                              ),
                            )
                          : Image.file(
                              File(filePicKerController.file.value.path!),
                              fit: BoxFit.cover,
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(Icons.arrow_back,
                                    color: Colors.white, size: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              pickFile();
                            },
                            child: Container(
                              height: 30,
                              width: Get.width / 3,
                              decoration: BoxDecoration(
                                color: SolidColors.primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "انتخاب تصویر ",
                                    style: textTheme.titleMedium,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 24),
                GestureDetector(
                  onTap: () => getTitle(),
                  child: SeeMoreBlog(
                    bodyMargin: Dimens.halfBodyMargin,
                    textTheme: textTheme,
                    title: "ویرایش عنوان مقاله",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(Dimens.halfBodyMargin),
                  child: Text(
                    manageArticelController.articleInfoModels.value.title ??
                        'بدون عنوان',
                    style: textTheme.titleLarge,
                    maxLines: 2,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(() => HtmlContentEditor()),
                  child: SeeMoreBlog(
                    bodyMargin: Dimens.halfBodyMargin,
                    textTheme: textTheme,
                    title: "ویرایش متن اصلی مقاله",
                  ),
                ),
                // بررسی null قبل از لود وب‌ویو
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: SizedBox(
                    height: 300,
                    child: manageArticelController
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
                  ${manageArticelController.articleInfoModels.value.content ?? "<p>محتوا در دسترس نیست</p>"}
                </body>
                </html>
                """,
                              ),
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),
                ),
                SizedBox(height: 6),
                GestureDetector(
                  onTap: () => Get.to(ArticleListScreen()),
                  child: SeeMoreBlog(
                    bodyMargin: Dimens.halfBodyMargin,
                    textTheme: textTheme,
                    title: "انتخاب دسته بندی ",
                  ),
                ),
                SizedBox(height: 6),
                tags(),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tags() {
    return SizedBox(
      height: 45,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: manageArticelController.tagsList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding:
                  EdgeInsets.only(right: index == 0 ? Dimens.bodyMargin : 12),
              child: GestureDetector(
                  onTap: () async {
                    var tagId = manageArticelController.tagsList[index].id!;

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
                            manageArticelController.tagsList[index].title!,
                            style: TextTheme.of(context).bodyMedium,
                          )),
                    ),
                  )),
            );
          })),
    );
  }
}
