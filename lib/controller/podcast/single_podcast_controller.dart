import 'dart:async';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tecbloc/Services/dio_service.dart';
import 'package:tecbloc/constant/api_url_constant.dart';
import 'package:tecbloc/models/podcast_file_models.dart';

class SinglePodcastController extends GetxController {
  var id;
  SinglePodcastController({this.id});

  RxBool loading = false.obs;
  Rx<PodcastFileModels> podcastFileModels = PodcastFileModels().obs;
  RxList<PodcastFileModels> podcastFileList = RxList();
  RxBool playState = false.obs;
  RxBool isLoopAll = false.obs;
  RxInt currentFileIndex = 0.obs;
  late var playList;
  Timer? timer;
  final player = AudioPlayer();
  @override
  onInit() async {
    super.onInit();
    playList = ConcatenatingAudioSource(
      useLazyPreparation: true,
      children: [],
    );
    await getPodcastFile();
    await player.setAudioSource(
      playList,
      initialIndex: 0,
      initialPosition: Duration.zero,
    );

    // استفاده از positionStream برای به‌روز رسانی progress bar
    player.positionStream.listen((position) {
      if (player.duration != null && player.duration!.inMilliseconds > 0) {
        progreesValue.value =
            position.inMilliseconds / player.duration!.inMilliseconds;
      }
    });
  }

  getPodcastFile() async {
    loading.value = true;
    var response =
        await DioService().getMethod(ApiUrlConstant.podcastFiles + id);
    if (response.statusCode == 200) {
      for (var element in response.data["files"]) {
        podcastFileList.add(PodcastFileModels.fromJson(element));
        playList.add(AudioSource.uri(
            Uri.parse(PodcastFileModels.fromJson(element).file!)));
      }
      loading.value = false;
    }
  }

  RxDouble progreesValue = 0.0.obs;
  startPodcastFile() async {
    const tick = Duration(seconds: 1);
    int duration = player.duration!.inSeconds;
    var step = 1 / duration;
    timer = Timer.periodic(tick, (timer) {
      progreesValue.value += step;
      if (progreesValue.value >= 1.0) {
        timer.cancel();
      }
    });
  }

  Rx<Duration> progressValue = const Duration(seconds: 0).obs;
  Rx<Duration> bufferedValue = const Duration(seconds: 0).obs;
  startProgress() {
    const tick1 = Duration(seconds: 1);
    int duration1 = player.duration!.inSeconds;
    if (timer != null) {
      if (timer!.isActive) {
        timer!.cancel();
        timer = null;
      }
      timer = Timer.periodic(tick1, (timer) {
        progressValue.value = player.position;
        bufferedValue.value = player.bufferedPosition;
        if (duration1 <= 0) {
          timer.cancel();
          progressValue.value = const Duration(seconds: 0);
          bufferedValue.value = const Duration(seconds: 0);
        }
      });
    }
  }

  setLoopMode() {
    if (isLoopAll.value) {
      isLoopAll.value = false;
      player.setLoopMode(LoopMode.off);
    } else {
      isLoopAll.value = true;
      player.setLoopMode(LoopMode.all);
    }
  }
}
