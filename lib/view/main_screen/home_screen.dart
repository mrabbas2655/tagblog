import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecbloc/controller/home_screen_controller.dart';

import '../../component/my_colors.dart';
import '../../component/my_component.dart';
import '../../component/my_strings.dart';
import '../../gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    homeScreenController.getHomeItems();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Obx(() => Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: homeScreenController.loading.value == false
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            poster(),
                            SizedBox(height: 8),
                            tags(),
                            SizedBox(height: 8),
                            SeeMoreBlog(
                              bodyMargin: widget.bodyMargin,
                              textTheme: widget.textTheme,
                            ),
                            SizedBox(height: 8),
                            topVisited(),
                            SeeMorePodcast(
                              bodyMargin: widget.bodyMargin,
                              textTheme: widget.textTheme,
                            ),
                            SizedBox(height: 8),
                            topPodcasts(),
                            SizedBox(height: 68),
                          ],
                        )
                      : loading(),
                )),
          ),
        ),
      ),
    );
  }

  Widget poster() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: widget.size.width / 1.19,
          height: widget.size.height / 4.2,
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            gradient: LinearGradient(
              colors: GradientColors.homePosterCoverGradiant,
              end: Alignment.bottomCenter,
              begin: Alignment.center,
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image ?? '',
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => loading(),
            errorWidget: (context, url, error) {
              // چاپ خطا برای بررسی
              return Icon(Icons.image_not_supported,
                  size: 50, color: Colors.grey);
            },
          ),
        ),
        Positioned(
          left: 7,
          right: 7,
          bottom: 18,
          child: Column(
            children: [
              Text(
                homeScreenController.poster.value.title ??
                    'Unknown ID', // نمایش یک مقدار پیش‌فرض
                style: widget.textTheme.displayLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tags() {
    return SizedBox(
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
            ),
          );
        },
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: widget.size.height / 3,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topVisitedList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: index == 0 ? widget.bodyMargin : 15),
                  child: CachedNetworkImage(
                    imageUrl:
                        homeScreenController.topVisitedList[index].image ?? '',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) => SpinKitPouringHourGlass(
                      color: SolidColors.primaryColor,
                      size: 35,
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  height: widget.size.height / 4.1,
                  width: widget.size.width / 2.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                      image: NetworkImage(
                        homeScreenController.topVisitedList[index].image ?? '',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    gradient: LinearGradient(
                      colors: GradientColors.blogPost,
                      end: Alignment.center,
                      begin: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  right: 12,
                  bottom: 22,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            homeScreenController.topVisitedList[index].author ??
                                'Unknown Author', // مقدار پیش‌فرض
                            style: widget.textTheme.displayMedium,
                          ),
                          Row(
                            children: [
                              Text(
                                (homeScreenController.topVisitedList[index].view
                                        ?.toString() ??
                                    '0'), // مقدار پیش‌فرض
                                style: widget.textTheme.displayMedium,
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: index == 0 ? widget.bodyMargin : 15),
                  child: SizedBox(
                    width: widget.size.width / 2.1,
                    child: Text(
                      homeScreenController.topVisitedList[index].title ??
                          '', // بررسی null
                      style: widget.textTheme.headlineMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget topPodcasts() {
    return SizedBox(
      height: widget.size.height / 3,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topPodcasts.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: index == 0 ? widget.bodyMargin : 15),
                  child: CachedNetworkImage(
                    imageUrl:
                        homeScreenController.topPodcasts[index].poster ?? '',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => loading(),
                    errorWidget: (context, url, error) {
                      // چاپ خطا برای دیباگ
                      return Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: index == 0 ? widget.bodyMargin : 15),
                  child: SizedBox(
                    width: widget.size.width / 2.1,
                    child: Text(
                      homeScreenController.topPodcasts[index].title ?? '',
                      style: widget.textTheme.headlineMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: bodyMargin,
        bottom: 8,
      ),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(
              Assets.icons.microphon.path,
            ),
            color: SolidColors.seeMore,
          ),
          Text(
            MyStings.viewMoreBlog,
            style: textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: bodyMargin,
        bottom: 8,
      ),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(
              Assets.icons.bluePen.path,
            ),
            color: SolidColors.seeMore,
          ),
          Text(
            MyStings.viewHotestBlog,
            style: textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}
