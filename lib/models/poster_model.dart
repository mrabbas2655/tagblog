import 'package:flutter/cupertino.dart';

import '../constant/api_constant.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
    this.id,
    this.title,
    this.image,
  });

  PosterModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    // ساخت URL تصویر و چاپ آن برای دیباگ
    image = element['image'] != null
        ? ApiUrlConstant.hostDlUrl + element['image']!
        : 'https://example.com/default_image.jpg'; // مقدار پیش‌فرض معتبر
    debugPrint('Image URL: $image'); // چاپ آدرس تصویر برای بررسی
  }
}
