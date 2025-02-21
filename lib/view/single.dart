import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecbloc/gen/assets.gen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../component/my_colors.dart';
import '../component/my_component.dart';
import '../controller/Single_article_controller.dart';
import '../controller/home_screen_controller.dart';

class Single extends StatefulWidget {
  Single(
      {super.key,
      required this.size,
      required this.textTheme,
      required this.bodyMargin});
  final homeScreenController = Get.put(HomeScreenController());
  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {
  late final WebViewController _controller;
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());
  var textTheme;
  late double bodyMargin;

  @override
  void initState() {
    super.initState();
    homeScreenController.tagsList;
    singleArticleController.getArticleInfo();
    // تنظیم WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            print('Page loaded: $url');
          },
          onNavigationRequest: (request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadHtmlString(
          singleArticleController.articleInfoModels.value.content!);
  }

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            () => singleArticleController.articleInfoModels.value.title == null
                ? SizedBox(height: Get.height, child: loading())
                : Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: singleArticleController
                                .articleInfoModels.value.image!,
                            imageBuilder: (context, imageProvider) =>
                                Image(image: imageProvider),
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
                                  SizedBox(width: 20),
                                  Icon(Icons.arrow_back,
                                      color: Colors.white, size: 24),
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
                              .articleInfoModels.value.title!,
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
                                  .articleInfoModels.value.author!,
                              style: textTheme.headlineMedium,
                            ),
                            SizedBox(width: 12),
                            Text(
                              singleArticleController
                                  .articleInfoModels.value.createdAt!,
                              style: textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                      // جایگزینی HtmlWidget با WebViewWidget

                      Expanded(
                        child: WebViewWidget(controller: _controller),
                      ),
                      tags(),
                      topVisited()
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget tags() {
    return Obx(
      () => homeScreenController.tagsList.isEmpty
          ? Center(child: Text('هیچ تگی برای نمایش وجود ندارد'))
          : SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeScreenController.tagsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 8, index == 0 ? widget.bodyMargin : 15, 8),
                    child: MainTags(
                      textTheme: widget.textTheme,
                      index: index,
                      text: homeScreenController.tagsList[index].title,
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget topVisited() {
    return Obx(
      () => homeScreenController.topVisitedList.isEmpty
          ? Center(child: Text('هیچ مورد بازدید شده‌ای وجود ندارد'))
          : SizedBox(
              height: widget.size.height / 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeScreenController.topVisitedList.length,
                itemBuilder: (context, index) {
                  final item = homeScreenController.topVisitedList[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        right: index == 0 ? widget.bodyMargin : 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: widget.size.height / 4.1,
                          width: widget.size.width / 2.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
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
                        Text(
                          item.title ?? 'بدون عنوان',
                          style: widget.textTheme.headlineMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'نویسنده: ${item.author ?? 'ناشناس'}',
                          style: widget.textTheme.displayMedium,
                        ),
                        Row(
                          children: [
                            Icon(Icons.remove_red_eye, size: 16),
                            SizedBox(width: 4),
                            Text('${item.view ?? 0} بازدید',
                                style: widget.textTheme.displaySmall),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
