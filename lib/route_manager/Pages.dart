import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tecbloc/route_manager/binding.dart';
import 'package:tecbloc/view/splash_screen.dart';

import '../view/articel/manage_articel.dart';
import '../view/articel/single.dart';
import '../view/articel/single_manage_articel.dart';
import '../view/main_screen/main_screen.dart';
import '../view/podcast/single_podcast.dart';
import 'names.dart';

class Pages {
  Pages._();
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: NamedRoute.initialRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: NamedRoute.routeMainScreen,
        page: () => const MainScreen(),
        binding: RegisterBinding()),
    GetPage(
        name: NamedRoute.routeSingleArticle,
        page: () => Single(),
        binding: ArticleBinding()),
    GetPage(
        name: NamedRoute.manageArticel,
        page: () => ManageArticel(),
        binding: ArticleManageBinding()),
    GetPage(
        name: NamedRoute.singleManageArticel,
        page: () => SingleManageArticel(),
        binding: ArticleManageBinding()),
    GetPage(
      name: NamedRoute.singlePodcastArticel,
      page: () => SinglePodcast(),
    ),
  ];
}
