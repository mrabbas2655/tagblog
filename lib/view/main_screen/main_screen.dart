import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecbloc/component/dimens.dart';
import 'package:tecbloc/controller/register_controller.dart';
import 'package:tecbloc/view/main_screen/profile_screen.dart';
// پکیج share را وارد کنید
import 'package:tecbloc/view/register/register_intro.dart';

import '../../component/my_component.dart';
import '../../constant/my_colors.dart';
import '../../constant/my_strings.dart';
import '../../gen/assets.gen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // تعریف _key برای Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // RxInt برای مدیریت وضعیت
  RxInt selectedPageIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey, // اضافه کردن _scaffoldKey به Scaffold
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBg,
          child: Padding(
            padding: EdgeInsets.only(
                right: Dimens.bodyMargin, left: Dimens.bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                    child: Center(
                        child: Image.asset(
                  Assets.images.logo.path,
                  scale: 3,
                ))),
                ListTile(
                  title: Text(
                    "پرفایل کاربری ",
                    style: textTheme.headlineMedium,
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "درباره تگ بلاگ ",
                    style: textTheme.headlineMedium,
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.headlineMedium,
                  ),
                  onTap: () {
                    // لینک یا متنی که می‌خواهید به اشتراک بگذارید
                    //   String textToShare =
                    //       'Check out my blog: https://example.com';
                    //
                    //   // اشتراک‌گذاری متن یا لینک
                    //   await FlutterShare.share(
                    //     title: 'اشتراک‌گذاری تک بلاگ',
                    //     text: textToShare,
                    //   );
                  },
                ),
                Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "تگ بلاگ در گیت هاب",
                    style: textTheme.headlineMedium,
                  ),
                  onTap: () {
                    myLaunchUrl(MyStrings.techBlogGithubUrl);
                  },
                ),
                Divider(
                  color: SolidColors.dividerColor,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: SolidColors.scaffoldBg,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _scaffoldKey.currentState
                        ?.openDrawer(); // استفاده از _scaffoldKey
                  },
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                Image.asset(
                  Assets.images.logo.path,
                  height: size.height / 13.6,
                ),
                const Icon(
                  Icons.search,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
        body: Stack(children: [
          Center(
            child: Obx(() => IndexedStack(
                  index: selectedPageIndex.value,
                  children: [
                    HomeScreen(
                        size: size,
                        textTheme: textTheme,
                        bodyMargin: Dimens.bodyMargin),
                    ProfileScreen(
                        size: size,
                        textTheme: textTheme,
                        bodyMargin: Dimens.bodyMargin),
                    RegisterIntro(),
                  ],
                )),
          ),
          BottomNavigation(
            size: size,
            bodyMargin: Dimens.bodyMargin,
            changeScreen: (int value) {
              selectedPageIndex.value = value;
            },
          ),
        ]),
      ),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
    required this.size,
    required this.changeScreen,
    required double bodyMargin,
  });

  final Size size;

  final Function(int) changeScreen;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: widget.size.height / 13,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: GradientColors.bottomNavBackground,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimens.bodyMargin, right: Dimens.bodyMargin),
          child: Container(
            height: widget.size.height / 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(
                  colors: GradientColors.bottomNav,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => widget.changeScreen(0),
                  icon: ImageIcon(
                    AssetImage(Assets.icons.home.path),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // TODO
                    Get.find<RegisterController>().toggleLogin();
                    // changeScreen(2);
                  },
                  icon: ImageIcon(
                    AssetImage(Assets.icons.write.path),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () => widget.changeScreen(1),
                  icon: ImageIcon(
                    AssetImage(Assets.icons.user.path),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
