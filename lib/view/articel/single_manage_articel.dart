import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecbloc/Services/pick_file.dart';
import 'package:tecbloc/component/dimens.dart';
import 'package:tecbloc/view/articel/articel_content_editor.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../component/my_component.dart';
import '../../constant/my_colors.dart';
import '../../controller/articel/manage_article_controller.dart';
import '../../controller/file_controller.dart';
import '../../controller/home_screen_controller.dart';
import '../../gen/assets.gen.dart';

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
          style: const TextStyle(color: SolidColors.textTitle),
          decoration: const InputDecoration(hintText: "اینجا بنویس"),
        ),
        backgroundColor: SolidColors.scaffoldBg,
        titleStyle: const TextStyle(color: SolidColors.textTitle),
        radius: 8,
        confirm: ElevatedButton(
            onPressed: () {
              manageArticelController.updateTitle();
              Get.back();
            },
            child: const Text(
              "ثبت",
              style: TextStyle(color: SolidColors.textTitle),
            )));
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                                  const SpinKitPouringHourGlass(
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
                        decoration: const BoxDecoration(
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
                                child: const Icon(Icons.arrow_back,
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
                              decoration: const BoxDecoration(
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
                                  const Icon(
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
                const SizedBox(height: 24),
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
                  onTap: () => Get.to(() => ArticelContentEditor()),
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
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () {
                    chooseCatsBottomSheet(textTheme);
                  },
                  child: SeeMoreBlog(
                    bodyMargin: Dimens.halfBodyMargin,
                    textTheme: textTheme,
                    title: "انتخاب دسته بندی ",
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: EdgeInsets.all(Dimens.halfBodyMargin),
                  child: Text(
                    manageArticelController.articleInfoModels.value.catName ==
                            null
                        ? 'بدون عنوان'
                        : manageArticelController
                            .articleInfoModels.value.catName!,
                    style: textTheme.titleLarge,
                    maxLines: 2,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                    onPressed: () async =>
                        await manageArticelController.storeArticle(),
                    child: Text(
                      manageArticelController.isLoading.value
                          ? "صبر کنید..."
                          : "تموم شد",
                      style: textTheme.displayMedium,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cats() {
    var homeScreenController = Get.find<HomeScreenController>();
    return SizedBox(
      height: Get.height / 1.6,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: homeScreenController.tagsList.length > 10
            ? 10
            : homeScreenController.tagsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              manageArticelController.articleInfoModels.value.catId =
                  homeScreenController.tagsList[index].id!;

              manageArticelController.articleInfoModels.update(
                (val) {
                  val?.catId = homeScreenController.tagsList[index].id!;
                  val?.catName = homeScreenController.tagsList[index].title!;
                },
              );
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Container(
                height: 20,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: SolidColors.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                  child: Center(
                    child: Text(
                      homeScreenController.tagsList[index].title!,
                      style: TextTheme.of(context).displayLarge,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }

  chooseCatsBottomSheet(TextTheme textTheme) {
    Get.bottomSheet(
        Container(
          height: Get.height / 1.7,
          width: Get.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("انتخاب دسته بندی"),
                SizedBox(height: Dimens.small),
                Expanded(child: cats()),
              ],
            ),
          ),
        ),
        isScrollControlled: true,
        persistent: true);
  }
}
