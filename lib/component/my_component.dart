// درخاست مقدار برای سرور
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecbloc/component/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/my_colors.dart';
import '../controller/home_screen_controller.dart';
import '../gen/assets.gen.dart';

HomeScreenController homeScreenController = Get.put(HomeScreenController());

// خط بین ایتم های پروفایل
class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      thickness: 1.5,
      endIndent: size.width / 6,
    );
  }
}

// تگ ها
class MainTags extends StatelessWidget {
  const MainTags({
    super.key,
    required this.textTheme,
    required this.index,
    this.text, // افزودن پارامتر اختیاری text
  });

  final TextTheme textTheme;
  final int index; // اصلاح نوع index به int
  final String? text; // تعریف پارامتر اختیاری text

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
        gradient: LinearGradient(
          colors: GradientColors.tags,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ImageIcon(
              AssetImage(
                Assets.icons.hashtagicon.path,
              ),
              color: Colors.white,
              size: 14,
            ),
            Text(
              text ??
                  Get.find<HomeScreenController>()
                      .tagsList[index]
                      .title!, // استفاده از پارامتر text در صورت وجود
              style: textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}

// خطای توقف لینک
myLaunchUrl(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    log("ادرس توقف خورده است ${uri.toString()}");
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitPouringHourGlass(
      color: SolidColors.primaryColor,
      size: 35,
    );
  }
}

//آپ بار اصلی پروژه
PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
                child: Text(
              title,
              style: appBarTextStyle,
            )),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: SolidColors.primaryColor.withBlue(100),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
    required this.title,
  });

  final double bodyMargin;
  final TextTheme textTheme;
  final String title;

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
            title,
            style: textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}
