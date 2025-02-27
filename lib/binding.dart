import 'package:get/get.dart';
import 'package:tecbloc/controller/articel/list_article_controller.dart';
import 'package:tecbloc/controller/articel/manage_articel_controller.dart';
import 'package:tecbloc/controller/articel/single_article_controller.dart';
import 'package:tecbloc/controller/register_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ListArticleController());
    Get.lazyPut(
      () => SingleArticleController(),
    );
  }
}

class ArticleManageBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    // Get.put(ManageArticelController());
    Get.lazyPut(
      () => ManageArticelController(),
    );
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RegisterController());
  }
}
