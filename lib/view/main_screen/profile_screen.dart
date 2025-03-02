import 'package:flutter/material.dart';

import '../../component/my_component.dart';
import '../../constant/my_colors.dart';
import '../../constant/my_strings.dart';
import '../../gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required double bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.profileAvatar.path,
              height: 100,
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.icons.bluePen.path,
                  color: SolidColors.seeMore,
                  height: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  MyStrings.imageProfileEdit,
                  style: textTheme.displaySmall,
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              "عباس مرشدی ",
              style: textTheme.headlineMedium!.apply(color: Colors.black),
            ),
            Text(
              "a.morsedi1384@gmail.com ",
              style: textTheme.headlineMedium!.apply(color: Colors.black),
            ),
            const SizedBox(
              height: 40,
            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColors.dividerColor,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavPodcast,
                    style: textTheme.headlineMedium!.apply(color: Colors.black),
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColors.dividerColor,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavBlog,
                    style: textTheme.headlineMedium!.apply(color: Colors.black),
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColors.dividerColor,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.logOut,
                    style: textTheme.headlineMedium!.apply(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 136),
          ],
        ));
  }
}
