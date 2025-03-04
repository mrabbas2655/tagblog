import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecbloc/component/decorations.dart';
import 'package:tecbloc/component/dimens.dart';
import 'package:tecbloc/controller/podcast/single_podcast_controller.dart';
import 'package:tecbloc/models/podcasts_models.dart';

import '../../constant/my_colors.dart';
import '../../gen/assets.gen.dart';

class SinglePodcast extends StatelessWidget {
  late SinglePodcastController controller;
  late PodcastsModels podcastsModels;
  SinglePodcast() {
    podcastsModels = Get.arguments;
    controller = Get.put(SinglePodcastController(id: podcastsModels.id));
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        height: Get.height / 3,
                        width: double.infinity,
                        imageUrl: podcastsModels.poster!.isNotEmpty
                            ? podcastsModels.poster!
                            : 'https://your-default-image.com/default.jpg',
                        placeholder: (context, url) =>
                            const SpinKitPouringHourGlass(
                          color: SolidColors.primaryColor,
                          size: 35,
                        ),
                        errorWidget: (context, url, error) => Image(
                          image:
                              AssetImage(Assets.images.singlePlaceHolder.path),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 70,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                              colors: GradientColors.singleAppbarGradiant,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 22, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await controller.player.stop();
                                    Get.back();
                                  },
                                  child: const Icon(Icons.arrow_back,
                                      color: Colors.white, size: 24),
                                ),
                                const Expanded(child: SizedBox()),
                                const SizedBox(width: 10),
                                const Icon(Icons.share,
                                    color: Colors.white, size: 24),
                                const SizedBox(width: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        podcastsModels.title ?? 'پادکست عنوان',
                        style: textTheme.titleLarge,
                        maxLines: 2,
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                      ),
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
                        const SizedBox(width: 12),
                        Text(
                          podcastsModels.author ?? 'بدون نام یا خطا:403',
                          style: textTheme.headlineMedium,
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            controller.podcastFileList.length, // مقدار مشخص
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              await controller.player
                                  .seek(Duration.zero, index: index);
                              controller.currentFileIndex.value =
                                  controller.player.currentIndex!;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ImageIcon(
                                        AssetImage(Assets.icons.microphon.path),
                                        size: 24, // اندازه منطقی‌تر
                                        color: SolidColors.seeMore,
                                      ),
                                      SizedBox(width: 8),
                                      SizedBox(
                                        width: Get.width / 1.5,
                                        child: Obx(
                                          () => Text(
                                            controller
                                                .podcastFileList[index].title!,
                                            style:
                                                controller.currentFileIndex ==
                                                        index
                                                    ? textTheme.displaySmall
                                                    : textTheme.headlineMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                      "${controller.podcastFileList[index].length!}:00"),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            right: Dimens.bodyMargin,
            left: Dimens.bodyMargin,
            child: Container(
              height: Get.height / 7,
              decoration: MyDecorations.mainGradient,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(
                      () => ProgressBar(
                        timeLabelTextStyle: textTheme.displayMedium,
                        thumbColor: SolidColors.yelowColor,
                        progressBarColor: SolidColors.selectedPodCast,
                        baseBarColor: SolidColors.scaffoldBg,
                        progress: controller.progressValue.value,
                        buffered: controller.bufferedValue.value,
                        total:
                            controller.player.duration ?? Duration(seconds: 0),
                        onSeek: (position) {
                          controller.player.seek(position);
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await controller.player.seekToNext();
                            controller.currentFileIndex.value =
                                controller.player.currentIndex!;
                          },
                          child: Icon(
                            Icons.skip_next,
                            color: Colors.white,
                          ),
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () async {
                              if (controller.player.playing) {
                                await controller.player.pause();
                                controller.playState.value = false;
                                controller.startProgress();
                              } else {
                                controller.playState.value =
                                    true; // آیکون پلی به استاپ تغییر کند
                                controller.loading.value =
                                    true; // نمایش لودینگ برای لحظه‌ای
                                await controller.player.play();
                                controller.loading.value =
                                    false; // بعد از شروع پخش، لودینگ خاموش شود
                              }
                              controller.currentFileIndex.value =
                                  controller.player.currentIndex!;
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  controller.playState.value
                                      ? Icons.pause_circle_filled
                                      : Icons.play_circle_fill,
                                  size: 52,
                                  color: Colors.white,
                                ),
                                if (controller.loading
                                    .value) // فقط برای لحظه‌ای لودینگ نمایش داده شود
                                  SizedBox(
                                    width: 52,
                                    height: 52,
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await controller.player.seekToPrevious();
                            controller.currentFileIndex.value =
                                controller.player.currentIndex!;
                          },
                          child: Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 18),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.setLoopMode();
                            },
                            child: Icon(
                              Icons.repeat,
                              color: controller.isLoopAll.value
                                  ? Colors.blue
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
